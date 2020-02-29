package com.webapp.manager.controller;

import com.webapp.board.app.BoardVO;
import com.webapp.board.common.FileUtil;
import com.webapp.board.common.FileVO;
import com.webapp.common.security.model.UserInfo;

import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.DeliveryInfoVO;
import com.webapp.mall.vo.GiveawayVO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.MgCommonDAO;
import com.webapp.manager.dao.MgProductDAO;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
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
    CategoryDAO categoryDAO;
    @Autowired
    private NumberGender numberGender;
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
    //상품 업데이트
    @RequestMapping(value = "/Manager/productUpdateProc", method = RequestMethod.POST, produces = "application/json")
    public  HashMap<String, Object> managerProductUpdateProc(@RequestParam HashMap params, HttpServletRequest request, HttpSession session, ProductVO productVO, BoardVO boardInfo,FileVO fileVO){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            FileUtil fs = new FileUtil();
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),"D:\\localWork\\onejoylife\\target\\onejoylife-1.0-SNAPSHOT\\assets\\fileupload\\product");
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
            List<FileVO> filelist = fs.saveAllFiles(boardInfo.getUploadfile(),"D:\\localWork\\onejoylife\\target\\onejoylife-1.0-SNAPSHOT\\assets\\fileupload\\product");
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
}
