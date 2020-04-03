package com.webapp.mall.controller;

import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.*;
import com.webapp.mall.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
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

}
