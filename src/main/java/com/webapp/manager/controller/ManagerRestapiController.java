package com.webapp.manager.controller;

import com.webapp.common.security.model.UserInfo;

import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.UserDAO;
import com.webapp.manager.dao.CategoryDAO;
import com.webapp.manager.dao.MgCommonDAO;
import com.webapp.manager.dao.MgProductDAO;
import com.webapp.manager.vo.MgCommonVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
}
