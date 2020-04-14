package com.webapp.mall.controller;

import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.UserVO;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
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
    public String logout(HttpSession session, UserVO userVO) throws IOException {

        String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost postRequest = new HttpPost(RequestUrl); //POST 메소드 URL
        postRequest.addHeader("Authorization", (String)session.getAttribute("token"));
        HttpResponse response = client.execute(postRequest);
        try {
            int responseCode = response.getStatusLine().getStatusCode();
            if (responseCode == 200) {
                ResponseHandler<String> handler = new BasicResponseHandler();
                handler.handleResponse(response);

            }
            userVO.setLog_type("logout");
            userVO.setEmail((String)session.getAttribute("email"));
            userDAO.insertUserHistory(userVO);
        }catch (Exception e){
            e.printStackTrace();
        }

        session.invalidate(); // 세션 초기화
        return "redirect:/sign/login"; // 로그아웃 후 로그인화면으로 이동
    }
    @RequestMapping(value = "/sign/login", method = RequestMethod.GET, produces = "application/json")
    public String mallLogin(@RequestParam HashMap params, ModelMap model,HttpServletRequest request) throws Exception {
        String returnString ="mall/login";
        Device device = DeviceUtils.getCurrentDevice(request);

        try{
            Object siteUrl = request.getRequestURL().toString()
                    .replaceAll(" " , "")
                    .replace(request.getRequestURI(),"");
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("login");
            if ( obj != null ){
                returnString = "redirect:/";
            }
            model.addAttribute("siteUrl", siteUrl);
        }catch(Exception e){
            e.printStackTrace();
        }
        if(device.isMobile()){
            returnString = "mobile/login";
        }
        model.addAttribute("style", "login");
        return returnString;
    }
    @RequestMapping(value = "/sign/signup")
    public String mallSignup(@RequestParam HashMap params, ModelMap model, HttpServletRequest request) throws Exception {
//        List<Map<String, Object>> userList = null;
//        Map<String, String> param = new HashMap<String, String>();

        try{
            //
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "joinform");
        model.addAttribute("postUrl","/sign/signupProc");

        Device device = DeviceUtils.getCurrentDevice(request);
        if(device.isMobile()){
            return "mobile/join";
        } else {
            return "mall/signup";
        }
    }
    @RequestMapping(value = "/mobile/signup")
    public String mobilejoinform(@RequestParam HashMap params, ModelMap model, HttpServletRequest request) throws Exception {
        try{
            //
        }catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("style", "joinform");
        model.addAttribute("postUrl","/sign/signupProc");

        return "mobile/joinform";
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
        Device device = DeviceUtils.getCurrentDevice(request);
        model.addAttribute("style", "mem-com");
        if(device.isMobile()){
            return "mobile/mem-com";
        } else {
            return "mall/signUpDone";
        }
    }
}
