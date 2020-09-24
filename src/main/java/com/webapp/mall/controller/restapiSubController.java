package com.webapp.mall.controller;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.Payment;
import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.*;
import com.webapp.mall.vo.CartPaymentVO;
import com.webapp.mall.vo.CommonVO;
import com.webapp.mall.vo.UserVO;
import com.webapp.manager.dao.MgProductDAO;
import com.webapp.manager.dao.MgStoreDAO;
import com.webapp.manager.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.springframework.util.CollectionUtils.isEmpty;

@RestController
public class restapiSubController {
    @Autowired
    MessageSource messageSource;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private CurlPost curlPost;
    @Autowired
    private PointDAO pointDAO;
    @Autowired
    private GiveawayDAO giveawayDAO;
    @Autowired
    private DeliveryDAO deliveryDAO;
    @Autowired
    private PaymentDAO paymentDAO;
    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private CommonDAO commonDAO;
    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private MgStoreDAO mgStoreDAO;
    @Autowired
    private MgProductDAO mgProductDAO;
    @Autowired
    private MainPageDAO mainPageDAO;
    IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;
    @Value("${downloadPath}")
    private String downloadPath;


    //폼의 메서드가 GET인지 POST 인지 꼭 확인
    @RequestMapping(value = "/sign/passcheck", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> passCheck(@RequestParam HashMap params, UserVO userVO, HttpSession session) throws Exception{
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            //이메일 필수 체크
            if(userVO.getPassword().isEmpty()){
                error.put("password", "패스워드를 확인하세요.");
            } else {
                params.put("email", session.getAttribute("email"));
                params.put("password", null);
                Map<String, Object> userData= userDAO.getLoginUserList(params);
                if (isEmpty(userData)) {
                    error.put("Error", "계정정보가 일치하지 않습니다.");
                }
                if(!passwordEncoder.matches(userVO.getPassword(),(String)userData.get("password"))){
                    error.put("Error", "계정정보가 일치하지 않습니다.");
                }
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("redirectUrl","/MyPage/mypage-12-1");
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;
    }


    //회원정보 수정
    @RequestMapping(value = "/sign/modifyuser", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> modifyUser(@RequestParam HashMap params, UserVO userVO, HttpSession session) throws Exception{
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            userVO.setEmail((String)session.getAttribute("email"));
            Map<String,String> map = new HashMap<>();
            map.put("email",(String)session.getAttribute("email"));
            Map<String, Object> userData= userDAO.getLoginUserList(map);
            if (isEmpty(userData)) {
                error.put("email", "등록된 이메일이 없습니다.");
            }

            if(userVO.getUser_privacy_policy() == null){
                userVO.setUser_privacy_policy("N");
            }
            if(userVO.getEmail_privacy_policy() == null){
                userVO.setEmail_privacy_policy("N");
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
            	if(userVO.getNewpassword() != null && !userVO.getNewpassword().equals("")) {
            		userVO.setNewpassword(passwordEncoder.encode(userVO.getNewpassword()));
            	}
                userDAO.updatePasswordChangeMember(userVO);
                resultMap.put("success", true);
                resultMap.put("redirectUrl","/MyPage/mypage-12-1");
            }
        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;

    }

    //주문상세 - 비회원
    @RequestMapping(value="/OrderDetailGuestChk", method = {RequestMethod.POST, RequestMethod.GET}, produces = "application/json")
    public HashMap<String, Object> myPageOrderAndDeliveryDetailGuestChk(HttpServletRequest request, CartPaymentVO cartPaymentVO, Model model, @RequestParam HashMap params){
        HashMap<String, Object> error = new HashMap<String, Object>();
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try{
            params.put("imp_uid", cartPaymentVO.getImp_uid());
            Map<String,Object> paymentData = paymentDAO.getPaymentListChk(params);
            if(isEmpty(paymentData)){
                error.put("Error", "주문정보가 일치하지 않습니다.");
            } else if(!cartPaymentVO.getPassword().equals(paymentData.get("password"))){
                error.put("Error", "주문 비밀번호가 일치하지 않습니다.");
            }

            if(!isEmpty(error)){
                resultMap.put("validateError", error);
            } else {
                resultMap.put("redirectUrl", "/mypage/OrderAndDeliveryDetail");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

    //입점업체 신청
    @RequestMapping(value = "/layout/modalStoreAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> modalStoreAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, StoreVO storeVO, BoardVO boardInfo, FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        if(params.get("storIdDupCheck") == null || params.get("storIdDupCheck").equals("")){
            error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.overlapCheck", "ko"));
        }
        if(params.get("storRegDupCheck") == null || params.get("storRegDupCheck").equals("")){
            error.put(messageSource.getMessage("store_reg","ko"), messageSource.getMessage("error.overlapCheck", "ko"));
        }
        try{
        	storeVO.setSupplier_cd("S"+numberGender.numberGen(6, 1));
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"store");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/store/"+ft.format(new Date())+"/");
            //

            if(storeVO.getStore_id().isEmpty()){
                error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.required","ko"));
            }
            Map<String,Object> soterInfo = mgStoreDAO.getStoreDetail(storeVO);

            if(!isEmpty(soterInfo)){
                error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.chkDplcId","ko"));
            }
            if(storeVO.getStore_password()==null || storeVO.getStore_password().isEmpty()){
                error.put(messageSource.getMessage("pswd","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(storeVO.getStore_passwordCf()==null || storeVO.getStore_passwordCf().isEmpty()){
                error.put(messageSource.getMessage("pswdCfm","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!storeVO.getStore_password().equals(storeVO.getStore_passwordCf())){
                error.put(messageSource.getMessage("pswd","ko"), messageSource.getMessage("error.inpPwdCfm", "ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                storeVO.setStore_approval_status("W");
                storeVO.setLevel(9);
                fileVO.setParentPK(storeVO.getStore_id());
                fileVO.setFileorder(1);
                mgProductDAO.insertProductFile(filelist,fileVO);
                storeVO.setStore_password(passwordEncoder.encode((String)params.get("store_password")));
                storeVO.setStore_creator_yn((String) params.get("store_creator_yn"));
               storeVO.setStore_pur_com((String) params.get("store_pur_com"));
                storeVO.setEnable_mg_menu_id((String) params.get("enable_menu"));
                mgStoreDAO.insertStore(storeVO);

                resultMap.put("redirectUrl","/");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

	/*
	 * //이메일 중복체크
	 * 
	 * @RequestMapping(value = "/layout/modalstoreIdDupCheck", method =
	 * RequestMethod.POST, produces = "application/json") public HashMap<String,
	 * Object> modalstoreIdDupCheck(StoreVO storeVO){ HashMap<String, Object>
	 * resultMap = new HashMap<String, Object>(); HashMap<String, Object> error =
	 * new HashMap<String, Object>(); try{ Map<String,Object> soterInfo =
	 * mgStoreDAO.getMgUserList(storeVO);
	 * 
	 * if(storeVO.getStore_id().isEmpty()){
	 * error.put(messageSource.getMessage("store_id","ko"),
	 * messageSource.getMessage("error.required","ko")); } if(!isEmpty(soterInfo)){
	 * error.put(messageSource.getMessage("store_id","ko"),
	 * messageSource.getMessage("error.chkDplcId","ko")); } if(!isEmpty(error)){
	 * resultMap.put("validateError",error); }else{ resultMap.put("status",true); }
	 * }catch (Exception e){ e.printStackTrace(); } return resultMap; }
	 */
    //입점업체 아이디 중복체크
    @RequestMapping(value = "/layout/modalstoreIdDupCheck", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> modalstoreIdDupCheck(StoreVO storeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            Map<String,Object> soterInfo = mgStoreDAO.getMgUserList(storeVO);

            if(storeVO.getStore_id().isEmpty()){
                error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(soterInfo)){
                error.put(messageSource.getMessage("store_id","ko"), messageSource.getMessage("error.chkDplcId","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("status",true);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //사업자 중복체크
    @RequestMapping(value = "/layout/modalstoreRegDupCheck", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> modalstoreRegDupCheck(StoreVO storeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            Map<String,Object> soterInfo = mgStoreDAO.getStoreRegDetail(storeVO);

            if(storeVO.getStore_reg().isEmpty()){
                error.put(messageSource.getMessage("store_reg","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(soterInfo)){
                error.put(messageSource.getMessage("store_reg","ko"), messageSource.getMessage("error.chkDplcBsReg","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("status",true);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

    //sns 공유
    @RequestMapping(value = "/layout/sns_share", method = RequestMethod.POST, produces = "application/json")
	public HashMap<String, Object> insertSnsShare(@RequestParam HashMap params, HttpSession session)  {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
		    params.put("email",session.getAttribute("email"));
            //로그인 확인
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){
                params.put("usr_id", session.getAttribute("nonMembersUserId"));
            }else{
                params.put("usr_id",userInfo.get("usr_id"));
            }
            String product_cd = (String) params.get("product_cd");
            if(product_cd.length() == 8){
                Map<String,Object> list = productDAO.getProductViewDetail(params);
                params.put("product_name", list.get("product_name"));
            } else{
                params.put("giveaway_id", product_cd);
                Map<String,Object> list = giveawayDAO.getGiveawayDetail(params);
                params.put("product_name", list.get("giveaway_name"));
                params.put("giveaway_id", list.get("giveaway_id"));
                params.put("product_cd", null);
            }
            mainPageDAO.insertSnsShare(params);

			resultMap.put("redirectUrl", "/");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}
}
