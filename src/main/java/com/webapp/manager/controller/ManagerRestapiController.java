package com.webapp.manager.controller;

import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.board.common.SearchVO;
import com.webapp.common.security.model.UserInfo;

import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.GiveawayDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.mall.vo.PaymentVO;
import com.webapp.manager.dao.*;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.ProductVO;
import com.webapp.manager.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    PaymentDAO paymentDAO;
    @Value("${downloadPath}")
    private String downloadPath;
    //로그인 처리 1
    @RequestMapping(value = "/Manager/ManagerSign/ManagerLoginProc", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> ManagerLoginProc(@RequestParam HashMap params,HttpSession session){
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
                        session.setAttribute("adminLogin", true); //
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
    public HashMap<String, Object> ListDelete(@RequestParam HashMap params, HttpSession session, MgCommonVO mgCommonVO, HttpServletRequest request){
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


    //상품상세보기
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
            fileVO.setFilepath("/assets/fileupload/giveaway/"+ft.format(new Date())+"/");
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
            fileVO.setFilepath("/assets/fileupload/giveaway/"+ft.format(new Date())+"/");
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
            fileVO.setFilepath("/assets/fileupload/category/"+ft.format(new Date())+"/");

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
            SimpleDateFormat ft = new SimpleDateFormat("yyyy");
            fileVO.setFilepath("/assets/fileupload/category/"+ft.format(new Date())+"/");

            if(params.get("pd_category_id")==""){
                error.put("카테고리 선택", messageSource.getMessage("error.required","ko"));
            }
            if(isEmpty(error)){
                fileVO.setParentPK((String)params.get("pd_category_id"));
                categoryDAO.updateCategory(params);
                if(!isEmpty(filelist)){
                    fileVO.setFileorder(1);
                    params.put("file_order",1);
                    categoryDAO.deleteCategoryFile(params);
                    categoryDAO.insertCategoryFile(filelist,fileVO);
                }
                if(!isEmpty(filelist2)){
                    fileVO.setFileorder(2);
                    params.put("file_order",2);
                    categoryDAO.deleteCategoryFile(params);
                    categoryDAO.insertCategoryFile(filelist2,fileVO);
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
            fileVO.setFilepath("/assets/fileupload/product/"+ft.format(new Date())+"/");
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
                resultMap.put("redirectUrl","/Manager/Product");
            }
        }catch (Exception e){
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
            fileVO.setFilepath("/assets/fileupload/product/"+ft.format(new Date())+"/");
            //
            String product_cd = "P"+numberGender.numberGen(7,2);
            productVO.setProduct_cd(product_cd);


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
            fileVO.setFilepath("/assets/fileupload/store/"+ft.format(new Date())+"/");
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
            fileVO.setFilepath("/assets/fileupload/product/"+ft.format(new Date())+"/");


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

}
