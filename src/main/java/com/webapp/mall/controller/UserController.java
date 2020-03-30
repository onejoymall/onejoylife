package com.webapp.mall.controller;

import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.UserDAO;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import static org.springframework.util.CollectionUtils.isEmpty;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@Controller
public class UserController {
    @Autowired
    MessageSource messageSource;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private NumberGender numberGender;
    @Autowired
    private UserDAO userDAO;
    // 로그아웃 하는 부분
    @RequestMapping(value="/sign/logout")
    public String logout(HttpSession session) throws IOException {

        String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet httpGet = new HttpGet(RequestUrl);
        httpGet.addHeader("Authorization", (String)session.getAttribute("token"));
        HttpResponse response = client.execute(httpGet);
        try {
            int responseCode = response.getStatusLine().getStatusCode();
            if (responseCode == 200) {

            }
        }catch (Exception e){
            e.printStackTrace();
        }

        session.invalidate(); // 세션 초기화
        return "redirect:/sign/login"; // 로그아웃 후 로그인화면으로 이동
    }
    @RequestMapping(value = "/sign/login", method = RequestMethod.GET, produces = "application/json")
    public String mallLogin(@RequestParam HashMap params, ModelMap model,HttpServletRequest request) throws Exception {
        String returnString ="mall/login";
        try{
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("login");
            if ( obj != null ){
                returnString ="redirect:/";
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "login");

        return returnString;
    }
    @RequestMapping(value = "/sign/signup")
    public String mallSignup(@RequestParam HashMap params, ModelMap model) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();

        try{
            //
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "joinform");

        return "mall/signup";
    }
    @RequestMapping(value = "/sign/findUserInfo")
    public String findUserInfo( ModelMap model,HttpServletRequest request)throws Exception{
        model.addAttribute("style", "for-1");
        return "mall/findUserInfo";
    }
    @RequestMapping(value = "/sign/changePassword")
    public String changePassword( ModelMap model,HttpServletRequest request,@RequestParam HashMap params)throws Exception{

        String redirectUrl ="mall/changePassword";
        try{
            String email = (String)params.get("email");
            String password_change_code = (String)params.get("password_change_code");
//            Map<String,Object> userInfo = userDAO.getEmailAuthList(params);
            if(isEmpty(params)){
                redirectUrl = "redirect:/sign/findUserInfo";
            }
            model.addAttribute("email",email);
            model.addAttribute("style", "for-2");
        }catch (Exception e){
            e.printStackTrace();
        }

        return redirectUrl;
    }
    @RequestMapping(value = "/sign/changePasswordDone")
    public String changePasswordDone( ModelMap model,HttpServletRequest request,@RequestParam HashMap params)throws Exception{
        model.addAttribute("style", "for-3");
        return "mall/changePasswordDone";
    }
    @RequestMapping(value = "/sign/signUpDone")
    public String signUpDone( ModelMap model,HttpServletRequest request,@RequestParam HashMap params)throws Exception{
        model.addAttribute("style", "mem-com");
        return "mall/signUpDone";
    }
}
