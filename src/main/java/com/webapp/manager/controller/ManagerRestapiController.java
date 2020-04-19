package com.webapp.manager.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;

import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.*;
import com.webapp.mall.vo.*;
import com.webapp.manager.dao.*;
import com.webapp.manager.vo.*;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.springframework.util.CollectionUtils.isEmpty;

@RestController
public class ManagerRestapiController {

    @Autowired
    MessageSource messageSource;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private MgCommonDAO mgCommonDAO;
    @Autowired
    private MgProductDAO mgProductDAO;
    @Autowired
    private MgGiveawayDAO mgGiveawayDAO;
    @Autowired
    CategoryDAO categoryDAO;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private ConfigDAO configDAO;
    @Autowired
    private MgStoreDAO mgStoreDAO;
    @Autowired
    private DeliveryDAO deliveryDAO;
    @Autowired
    PaymentDAO paymentDAO;
    @Autowired
    RefundDAO refundDAO;
    @Autowired
    private MgUserDAO mgUserDAO;
    @Autowired
    private MgPointDAO mgPointDAO;
    @Autowired
    private MgUserGrantDAO mgUserGrantDAO;
    @Autowired
    MgBrandDAO mgBrandDAO;
    @Autowired
    private MgOptionDAO mgOptionDAO;
    @Value("${downloadPath}")
    private String downloadPath;
    @Value("${downloadEditorPath}")
    private String downloadEditorPath;

    // 포인트 관리 포인트 추가 및 환수
    @RequestMapping(value = "/Manager/MgPointAdd", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> MgPointAdd(@RequestParam HashMap params, MgUserVO mgUserVO, MgPointVO mgPointVO) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
//            if(mgPointVO.getPoint_add()
//            if(mgPointVO.getPoint_add()==null){
//                error.put(messageSource.getMessage("point_add","ko"),messageSource.getMessage("error.required","ko"));
//            }
            Integer getPointAmount = mgPointDAO.getMgPointAmount(mgPointVO);

            //지급과 환수를 동시에 할수 없습니다.

            //환수할 포인트가 없습니다.

            if(mgPointVO.getPoint_paid_memo().isEmpty()){
                error.put(messageSource.getMessage("point_paid_memo","ko"),messageSource.getMessage("error.required","ko"));
            }
            if(mgPointVO.getPoint_use()!=null){
                if(getPointAmount <= 0 ){
                    error.put("Error",messageSource.getMessage("error.pointExchangeFail","ko"));
                }
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{

                if(mgPointVO.getPoint_use()==null){
                    mgPointVO.setPoint_amount(getPointAmount+ mgPointVO.getPoint_add());
                }
                if(mgPointVO.getPoint_add()==null){
                    mgPointVO.setPoint_amount(getPointAmount - mgPointVO.getPoint_use());
                }
                mgPointVO.setPoint_paid_type("A");
                mgPointDAO.insertMgPoint(mgPointVO);
                resultMap.put("success",true);
                resultMap.put("redirectUrl","/Manager/member-management");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
    //회원등급설정 사용자,매니저,관리자
    @Transactional
    @RequestMapping(value = "/Manager/MgUserLevelUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> MgUserLevelUpdate(@RequestParam HashMap params, MgUserVO mgUserVO, MgPointVO mgPointVO) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {
        	mgUserDAO.userLevelUpdate(params);
    		resultMap.put("success",true);
            resultMap.put("redirectUrl","/Manager/member-management");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
  //매니저,관리자 사용메뉴설정
    @Transactional
    @RequestMapping(value = "/Manager/MgUserEnableMenuUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> MgUserEnableMenuUpdate(@RequestParam HashMap params, MgUserVO mgUserVO, MgPointVO mgPointVO) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        System.out.println(params);
        if(params.get("enable_menu") == null || ((String)params.get("enable_menu")).equals("")) {
        	error.put(messageSource.getMessage("mg_enable_menu","ko"),messageSource.getMessage("error.required","ko"));
        }
        try {
        	 if(!isEmpty(error)){
                 resultMap.put("validateError",error);
             }else{
	        	mgUserDAO.userEnableMenuUpdate(params);
	    		resultMap.put("success",true);
	            resultMap.put("redirectUrl","/Manager/member-management");
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }
    //회원 상세보기
    @RequestMapping(value = "/Manager/memberViewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerMeberViewDetail(@RequestParam HashMap params, MgUserVO mgUserVO) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgUserDAO.getUserDetail(mgUserVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
        return resultMap;
    }
    //로그인 처리 1
    @RequestMapping(value = "/Manager/ManagerSign/ManagerLoginProc", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> ManagerLoginProc(@RequestParam HashMap params, HttpSession session, UserVO userVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            String email = (String)params.get("email");
            String password = (String)params.get("password");
            params.put("password",null);//패스워드 초기화
            //관리자레벨
            params.put("level",10);
            //Spring Security 5 단방향 암호화 패스워드 일치 확인 을 위해 이메일로 사용자정보를 가져온후 처리
            Map<String,Object> loginUserList = userDAO.getLoginUserList(params);
            //기본 Valitaion
            if(email==null || email.isEmpty()){
                error.put("Email", messageSource.getMessage("error.required","ko"));
            }
            if(password==null || password.isEmpty()){
                error.put("Password", messageSource.getMessage("error.required","ko"));
            }else{
                if(!isEmpty(loginUserList)){
                    if(passwordEncoder.matches(password,(String)loginUserList.get("password"))){
                        if ( session.getAttribute("adminLogin") != null ){
                            // 기존에 login이란 세션 값이 존재한다면
                            session.removeAttribute("adminLogin"); // 기존값을 제거해 준다.
                        }
                        session.setAttribute("email",email);
                        if((Integer)loginUserList.get("level") == 10) session.setAttribute("adminLogin", "admin");
                        else 										  session.setAttribute("adminLogin", "manager");
                        session.setAttribute("menuList", Arrays.asList(((String)loginUserList.get("enable_mg_menu_id")).split("\\|")));
                        //로그인 기록 저장
                        userVO.setLog_type("adminlogin");
                        userDAO.insertUserHistory(userVO);
                        resultMap.put("redirectUrl", "/Manager/ManagerMain");
                    }else{
                        error.put("Error", messageSource.getMessage("error.notUsrInfo","ko"));
                    }
                }else{
                    error.put("Error", messageSource.getMessage("error.notUsrInfo","ko"));
                }
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //공통 리스트삭제
    @RequestMapping(value = "/Manager/ListDelete", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> ListUpdate(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            //테이블명 table
            //pk 필드명 pk
            //삭제할 배열 chk

            if(mgCommonVO.getPk().equals(null) || mgCommonVO.getPk().equals("")){
                error.put("Pk name", messageSource.getMessage("error.required","ko"));
            }
            if(mgCommonVO.getTable_name().equals(null) || mgCommonVO.getTable_name().equals("")){
                error.put("Table", messageSource.getMessage("error.required","ko"));
            }
//            if(mgCommonVO.getChk().size() <= 0){
//                error.put("check box selector", messageSource.getMessage("error.required","ko"));
//            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgCommonDAO.ListDelete(mgCommonVO);
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //교환 환불 취소
    @RequestMapping(value = "/Manager/refundCancel", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> refundCancel(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                deliveryInfoVO.setMerchant_uid(deliveryInfoVO.getOrder_no());
                deliveryDAO.updateDelivery(deliveryInfoVO);
                paymentDAO.updatePayment(deliveryInfoVO);
                resultMap.put("success",messageSource.getMessage("success.done","ko"));
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //교환신청 선택
    @RequestMapping(value = "/Manager/selectDeliveryRefund", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> selectDeliveryRefund(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            Map<String,Object> list = refundDAO.getDeliveryRefundDetail(deliveryInfoVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("deliveryInfoVO",deliveryInfoVO);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //주문내역 선택
    @RequestMapping(value = "/Manager/selectPayment", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerSelectPayment(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            Map<String,Object> list = paymentDAO.getPaymentDetail(params);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("deliveryInfoVO",deliveryInfoVO);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //주문상태 일괄 처리
    @RequestMapping(value = "/Manager/paymentStatusUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> paymentStatusUpdate(@RequestParam HashMap params, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            mgCommonVO.setTable_name("payment");
            mgCommonVO.setColumn("payment_status");
            mgCommonVO.setPk("order_no");
            mgCommonVO.setUpdate_value((String)params.get("payment_status"));
            if(mgCommonVO.getChk() ==null){
                error.put("Error", messageSource.getMessage("error.selectModify","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgCommonDAO.listUpdate(mgCommonVO);
                resultMap.put("redirectUrl","/Manager/order");
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //배송처리
    @RequestMapping(value = "/Manager/SaveDelivery", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerSaveDelivery(@RequestParam HashMap params, DeliveryInfoVO deliveryInfoVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try {
            if(deliveryInfoVO.getDelivery_t_invoice().isEmpty()){
                error.put(messageSource.getMessage("delivery_t_invoice","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(deliveryInfoVO.getDelivery_t_code().isEmpty()){
                error.put(messageSource.getMessage("delivery_t_code","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{

                deliveryDAO.updateDeliveryManager(deliveryInfoVO);
                paymentDAO.updatePaymentManger(deliveryInfoVO);
                resultMap.put("success",messageSource.getMessage("success.done","ko"));
//                resultMap.put("list",list);
//                resultMap.put("deliveryInfoVO",deliveryInfoVO);
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //상품상세보기
    @RequestMapping(value = "/Manager/viewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerViewDetail(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgProductDAO.getProductViewDetail(params);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //경품상세보기
    @RequestMapping(value = "/Manager/giveawayViewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerGiveawayViewDetail(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgGiveawayDAO.getGiveawayViewDetail(params);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //경품등록
    @RequestMapping(value = "/Manager/GiveawayAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerGiveawayAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, GiveawayVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"giveaway");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/giveaway/"+ft.format(new Date())+"/");
            //
            String product_cd = "G"+numberGender.numberGen(7,2);
            productVO.setGiveaway_cd(product_cd);


//            if(productVO.getProduct_name().isEmpty()){
//                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().is){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_company_payment() == null){
//                error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_payment() == null){
//                error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getGiveaway_cd());
                mgGiveawayDAO.insertProductFile(filelist,fileVO);
                mgGiveawayDAO.insertGiveaway(productVO);
                resultMap.put("redirectUrl","/Manager/GiveawayAdd");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //경품 업데이트
    @RequestMapping(value = "/Manager/GiveawayUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerGiveawayUpdateProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, GiveawayVO giveawayVO,ProductVO productVO,BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"giveaway");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/giveaway/"+ft.format(new Date())+"/");
            //
//            String product_cd = "P"+numberGender.numberGen(7,2);
//            productVO.setProduct_cd(product_cd);


//            if(productVO.getProduct_name().isEmpty()){
//                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().is){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_company_payment() == null){
//                error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_payment() == null){
//                error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(giveawayVO.getGiveaway_cd());
                if(!isEmpty(filelist)){
                    mgProductDAO.deleteProductFile(productVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }

//                mgProductDAO.insertProduct(productVO);
//                mgProductDAO.updateProduct();
                mgGiveawayDAO.updateGiveaway(giveawayVO);
//                mgProductDAO.updasteProduct(productVO);
                resultMap.put("redirectUrl","/Manager/Giveaway");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상푼분류
    @RequestMapping(value = "/Manager/productCategoryList", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> productCategoryList(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {

            List<Map<String,Object>> list = categoryDAO.getCategoryList(params);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //상푼분류 업데이트
    @RequestMapping(value = "/Manager/productCategoryUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCategoryUpdateProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"category");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/category/"+ft.format(new Date())+"/");

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getProduct_cd());
                if(!isEmpty(filelist)){
//                    mgProductDAO.deleteProductFile(productVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }

//                mgProductDAO.insertProduct(productVO);
//                mgProductDAO.updateProduct();
                mgProductDAO.updateProduct(productVO);
//                mgProductDAO.updasteProduct(productVO);
                resultMap.put("redirectUrl","/Manager/Category");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품분류 추가
    @RequestMapping(value = "/Manager/productCategoryAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCategoryAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            if(params.get("pd_category_name_add")==""){
                error.put("카테고리 명", messageSource.getMessage("error.required","ko"));
            }
            if(isEmpty(error)){
                categoryDAO.insertCategory(params);
                resultMap.put("redirectUrl","/Manager/Category");

            }else{
                resultMap.put("validateError",error);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품분류 삭제
    @RequestMapping(value = "/Manager/productCategoryDeleteProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCategoryDeleteProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            if(params.get("pd_category_id")==""){
                error.put("카테로리 선택", messageSource.getMessage("error.required","ko"));
            }
            if(isEmpty(error)){
                categoryDAO.deleteCategory(params);
                resultMap.put("redirectUrl","/Manager/Category");

            }else{
                resultMap.put("validateError",error);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 분류 선택
    @RequestMapping(value = "/Manager/productCategorySelect", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> productCategorySelect(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request, SearchVO searchVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> categorySelect = categoryDAO.getCategoryDetail(searchVO);
            resultMap.put("categorySelect",categorySelect);
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //상품분류 디스플레이 관리
    @RequestMapping(value = "/Manager/productCategoryDisplayProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCategoryDisplayProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"category");
            List<FileVO> filelist2 = fs.saveAllFiles(boardInfo.getUploadfile2(),downloadPath+"category");
            List<FileVO> filelist3 = fs.saveAllFiles(boardInfo.getUploadfile3(),downloadPath+"category");
            List<FileVO> filelist4 = fs.saveAllFiles(boardInfo.getUploadfile4(),downloadPath+"category");
            List<FileVO> filelist5 = fs.saveAllFiles(boardInfo.getUploadfile5(),downloadPath+"category");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/category/"+ft.format(new Date())+"/");

            if(params.get("pd_category_id")==""){
                error.put("카테고리 선택", messageSource.getMessage("error.required","ko"));
            }
            if(isEmpty(error)){
                fileVO.setParentPK((String)params.get("pd_category_id"));
                categoryDAO.updateCategory(params);
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    categoryDAO.deleteCategoryFile(filelist,fileVO);
                    categoryDAO.insertCategoryFile(filelist,fileVO);
                }
                //기획전 상단
                if(!isEmpty(filelist3)){
                    fileVO.setFileorder(3);
                    categoryDAO.deleteCategoryFile(filelist3,fileVO);
                    categoryDAO.insertCategoryFile(filelist3,fileVO);
                }
                //매인베너
                if(!isEmpty(filelist2)){
                    fileVO.setFileorder(2);
                    categoryDAO.deleteCategoryFile(filelist2,fileVO);
                    categoryDAO.insertCategoryFile(filelist2,fileVO);
                }
                //이벤트 목록
                if(!isEmpty(filelist4)){
                    fileVO.setFileorder(4);
                    categoryDAO.deleteCategoryFile(filelist4,fileVO);
                    categoryDAO.insertCategoryFile(filelist4,fileVO);
                }
                //이벤트 상단
                if(!isEmpty(filelist5)){
                    fileVO.setFileorder(5);
                    categoryDAO.deleteCategoryFile(filelist5,fileVO);
                    categoryDAO.insertCategoryFile(filelist5,fileVO);
                }

                categoryDAO.insertCategoryEvent(params);
                resultMap.put("redirectUrl","/Manager/Category");

            }else{
                resultMap.put("validateError",error);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 업데이트
    @RequestMapping(value = "/Manager/productUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductUpdateProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"product");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/product/"+ft.format(new Date())+"/");
            //
//            String product_cd = "P"+numberGender.numberGen(7,2);
//            productVO.setProduct_cd(product_cd);


//            if(productVO.getProduct_name().isEmpty()){
//                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().is){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_company_payment() == null){
//                error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_payment() == null){
//                error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getProduct_cd());
                if(!isEmpty(filelist)){
                    mgProductDAO.deleteProductFile(productVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }

//                mgProductDAO.insertProduct(productVO);
//                mgProductDAO.updateProduct();
                mgProductDAO.updateProduct(productVO);
//                mgProductDAO.updasteProduct(productVO);
                String Referer =request.getHeader("Referer");
                resultMap.put("redirectUrl",Referer+"?page="+params.get("page"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품등록 에디터 이미지 업로드
    @RequestMapping(value="/Manager/uploadSummernoteImageFile", method = RequestMethod.POST, produces = "application/json")
//    @ResponseBody
    public HashMap<String, Object> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception{
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        JsonObject jsonObject = new JsonObject();

        String fileRoot = downloadEditorPath;	//저장될 외부 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

        String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명

        File targetFile = new File(fileRoot + savedFileName);

        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
            resultMap.put("url", "/product/editorUploads/"+savedFileName);
            resultMap.put("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
            resultMap.put("responseCode", "error");
            e.printStackTrace();
        }

        return resultMap;
    }
    //상품등록
    @RequestMapping(value = "/Manager/productAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"product");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/product/"+ft.format(new Date())+"/");
            //
            String product_cd = "P"+numberGender.numberGen(7,2);
            productVO.setProduct_cd(product_cd);


            if(productVO.getProduct_name().isEmpty()){
                error.put(messageSource.getMessage("product_name","ko"), messageSource.getMessage("error.required","ko"));
            }
//            if(productVO.getProduct_name_en().isEmpty()){
//                error.put(messageSource.getMessage("product_name_en","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_summary_memo().isEmpty()){
//                error.put(messageSource.getMessage("product_summary_memo","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_user_payment().is){
//                error.put(messageSource.getMessage("product_user_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
//            if(productVO.getProduct_company_payment() == null){
//                error.put(messageSource.getMessage("product_company_payment","ko"), messageSource.getMessage("error.required","ko"));
//            }
            if(productVO.getProduct_payment() == null){
                error.put(messageSource.getMessage("product_payment","ko"), messageSource.getMessage("error.required","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(productVO.getProduct_cd());
                mgProductDAO.insertProductFile(filelist,fileVO);
                mgProductDAO.insertProduct(productVO);
                resultMap.put("redirectUrl","/Manager/Product");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //상품 복사 등록
    @RequestMapping(value = "/Manager/productCopyProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductCopyProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            String product_cd = "P"+numberGender.numberGen(7,2);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                //등록될 키는 다시 만들어준다
                params.put("product_cd",product_cd);
                mgProductDAO.insertProductCopy(params);
                mgProductDAO.insertProductFileCopy(params);
                resultMap.put("redirectUrl","/Manager/Product");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //입점업체 등록
    @RequestMapping(value = "/Manager/storeAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreAddProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, StoreVO storeVO, BoardVO boardInfo, FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

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
                error.put("Password", messageSource.getMessage("error.required","ko"));
            }
            if(storeVO.getStore_passwordCf()==null || storeVO.getStore_passwordCf().isEmpty()){
                error.put("PasswordCf", messageSource.getMessage("error.required","ko"));
            }
            if(!storeVO.getStore_password().equals(storeVO.getStore_passwordCf())){
                error.put("PasswordCf", messageSource.getMessage("error.inpPwdCfm", "ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                storeVO.setStore_approval_status("W");
                fileVO.setParentPK(storeVO.getStore_id());
                mgProductDAO.insertProductFile(filelist,fileVO);
                mgStoreDAO.insertStore(storeVO);
                Object obj = session.getAttribute("adminLogin");
                if ( obj == null ){
                    resultMap.put("redirectUrl","/");
                }else{
                    resultMap.put("redirectUrl","/Manager/company-app");
                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //입점업체 선택
    @RequestMapping(value = "/Manager/storeViewDetail", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerStoreViewDetail(@RequestParam HashMap params,StoreVO storeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgStoreDAO.getStoreDetail(storeVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //입점업체 승인
    @RequestMapping(value = "/Manager/storeApproval", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> managerStoreApproval(@RequestParam HashMap params,StoreVO storeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                storeVO.setStore_approval_status("T");
                mgStoreDAO.updateStoreApproval(storeVO);
                resultMap.put("redirectUrl","/Manager/company-app");
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //입점업체 업데이트
    @RequestMapping(value = "/Manager/storeUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreUpdateProc(BoardVO boardInfo,FileVO fileVO,StoreVO storeVO,ProductVO productVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),downloadPath+"product");
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/fileupload/product/"+ft.format(new Date())+"/");


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                fileVO.setParentPK(storeVO.getStore_id());
                if(!isEmpty(filelist)){
                    productVO.setProduct_cd(storeVO.getStore_id());
                    mgStoreDAO.deleteProductFile(productVO);
                    mgProductDAO.insertProductFile(filelist,fileVO);
                }

                mgStoreDAO.updateStore(storeVO);
                resultMap.put("redirectUrl","/Manager/company-app");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

    //입점업체 아이디 중복체크
    @RequestMapping(value = "/Manager/storeIdDupCheck", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreIdDupCheck(StoreVO storeVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            Map<String,Object> soterInfo = mgStoreDAO.getStoreDetail(storeVO);

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
    @RequestMapping(value = "/Manager/storeRegDupCheck", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerStoreRegDupCheck(StoreVO storeVO){
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
    //환경설정 저장
    @RequestMapping(value = "/Manager/config-proc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerConfigProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{
            configDAO.insertConfig(params);
            resultMap.put("redirectUrl",request.getHeader("Referer"));
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //회원 등급 선택
    @RequestMapping(value = "/Manager/selectUserGrant", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> selectUserGrant(@RequestParam HashMap params,MgUserVO mgUserVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgUserGrantDAO.getUserGrant(mgUserVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //회원 등급 추가
    @RequestMapping(value = "/Manager/userGrantAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerConfigProc(@RequestParam HashMap params,MgUserVO mgUserVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(mgUserVO.getPayment_limit()==null){
                error.put(messageSource.getMessage("payment_limit","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgUserVO.getPayment_event_amount()==null){
                error.put(messageSource.getMessage("payment_event_amount","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgUserVO.getPayment_point_limit()==null){
                error.put(messageSource.getMessage("payment_point_limit","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgUserVO.getEvent_point()==null){
                error.put(messageSource.getMessage("event_point","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgUserVO.getUser_grant_name().isEmpty()){
                error.put(messageSource.getMessage("user_grant_name","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgUserGrantDAO.insertUserGrant(mgUserVO);
                resultMap.put("success",true);
                resultMap.put("redirectUrl","/Manager/member-management");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //회원 등급 변경
    @RequestMapping(value = "/Manager/userGrantListUpdate", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> userGrantListUpdate(@RequestParam HashMap params, HttpSession session,MgUserVO mgUserVO, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {


            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgUserGrantDAO.userGrantListUpdate(mgUserVO);
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //브랜드 등록
    @RequestMapping(value = "/Manager/brandAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> brandAddProc(@RequestParam HashMap params,MgBrandVO mgBrandVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(mgBrandVO.getProduct_brand_name().isEmpty()) {
                mgBrandVO.setProduct_brand("B"+numberGender.numberGen(7,2));
            }
            if(mgBrandVO.getProduct_brand_name().isEmpty()){
                error.put(messageSource.getMessage("product_brand_name","ko"), messageSource.getMessage("error.required","ko"));
            }

            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgBrandDAO.insertBrand(mgBrandVO);
                resultMap.put("success",true);
                resultMap.put("redirectUrl","/Manager/option-brand");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //브랜드 선택
    @RequestMapping(value = "/Manager/selectBrand", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> selectBrand(@RequestParam HashMap params,MgBrandVO mgBrandVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgBrandDAO.getBrand(mgBrandVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //옵션 등록
    @RequestMapping(value = "/Manager/optionAddProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> optionAddProc(@RequestParam HashMap params,MgOptionVO mgOptionVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();

        try{
            if(mgOptionVO.getProduct_option_code().isEmpty()){
                mgOptionVO.setProduct_option_code("PD-OPTION-"+numberGender.numberGen(6,1));
            }
            if(mgOptionVO.getProduct_option_input().isEmpty()){
                error.put(messageSource.getMessage("product_option_input","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgOptionVO.getProduct_option_color().isEmpty()){
                error.put(messageSource.getMessage("product_option_color","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgOptionVO.getProduct_option_set_name().isEmpty()){
                error.put(messageSource.getMessage("product_option_set_name","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(mgOptionVO.getProduct_option_style().isEmpty()){
                error.put(messageSource.getMessage("product_option_style","ko"), messageSource.getMessage("error.required","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                mgOptionDAO.insertOption(mgOptionVO);
                resultMap.put("success",true);
                resultMap.put("redirectUrl","/Manager/option-product");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }
    //옵션 선택
    @RequestMapping(value = "/Manager/selectOption", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> selectOption(@RequestParam HashMap params,MgOptionVO mgOptionVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            Map<String,Object> list = mgOptionDAO.getOption(mgOptionVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",list);
//                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
    //옵션 목록
    @RequestMapping(value = "/Manager/listOption", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> listOption(@RequestParam HashMap params,MgOptionVO mgOptionVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
            mgOptionVO.setDisplayRowCount(10);
            mgOptionVO.pageCalculate(mgOptionDAO.getOptionListCount(mgOptionVO));
            List<Map<String, Object>> optionList = mgOptionDAO.getOptionList(mgOptionVO);
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                resultMap.put("list",optionList);
            }
        } catch (Exception e) {

            resultMap.put("e", e);
        }
        return resultMap;
    }
}
