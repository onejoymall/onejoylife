package com.webapp.mall.controller;

import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.*;
import com.webapp.mall.vo.CommonVO;
import com.webapp.mall.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
            //params.put("password", passwordEncoder.encode((String)params.get("password")));
            params.put("email", session.getAttribute("email"));

            if(userVO.getNewpassword().isEmpty()) {
                error.put("신규 비밀번호", "(는) 필수 입력값 입니다.");
            }
            if(userVO.getRenewpassword().isEmpty()) {
                error.put("신규 비밀번호 확인", "(는) 필수 입력값 입니다.");
            }
            if(userVO.getPassword().isEmpty()){
                error.put("password", "현재 비밀번호를 입력해주세요.");
            } else {
                if(!userVO.getNewpassword().equals(userVO.getRenewpassword())){
                    error.put("신규 비밀번호와 비밀번호 확인", "(는) 일치하지 않습니다.");
                }
                params.put("password", null);
                Map<String, Object> userData= userDAO.getLoginUserList(params);
                if (isEmpty(userData)) {
                    error.put("email", "등록된 이메일이 없습니다.");
                } else {

                    //데이터베이스에 저장된 패스워드 일치 확인
                    if(!passwordEncoder.matches(userVO.getPassword(),(String)userData.get("password"))) {
                        error.put("password", "계정정보가 일치하지 않습니다.");
                    }
                }

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
                userVO.setNewpassword(passwordEncoder.encode(userVO.getNewpassword()));
                userDAO.updatePasswordChangeMember(userVO);
                resultMap.put("success", true);
                resultMap.put("redirectUrl","/MyPage/mypage-12-1");
            }


        } catch (Exception e) {
            resultMap.put("e", e);
        }
        return resultMap;

    }

    //장바구니 전체 등록
    @RequestMapping(value = "/cart/addAllCart", method = RequestMethod.POST, produces = "application/json")
    public HashMap<String, Object> addAllShoppingBasket(@RequestParam HashMap params, HttpSession session, HttpServletRequest request){
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try{

            //카트번호
            params.put("cart_cd","CR"+numberGender.numberGen(6,1));
            //사용자 아이디 확인 후 전달
            params.put("email",session.getAttribute("email"));
            Map<String,Object> userInfo = userDAO.getLoginUserList(params);
            if(isEmpty(userInfo)){
                String cart_user_id = numberGender.numberGen(6,1);
                params.put("member_yn","N");

                if ( session.getAttribute("nonMembersUserId") == null ){
                    session.setAttribute("nonMembersUserId",cart_user_id);
                    params.put("cart_user_id",cart_user_id);
                }else{
                    params.put("cart_user_id",session.getAttribute("nonMembersUserId"));
                }
            }else{
                params.put("member_yn","Y");
                params.put("cart_user_id",userInfo.get("usr_id"));
            }
            //카트 중복조회
            if(cartDAO.getCartListCount(params) > 0){
                error.put("Error", messageSource.getMessage("error.duplicateCart","ko"));
            }
            if(!isEmpty(error)){
                resultMap.put("validateError",error);
            }else{
                cartDAO.addAllCart(params);
                resultMap.put("redirectUrl",request.getHeader("Referer"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultMap;
    }

}
