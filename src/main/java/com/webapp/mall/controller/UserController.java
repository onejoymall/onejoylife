package com.webapp.mall.controller;

import com.webapp.common.support.CurlPost;
import com.webapp.common.support.MailSender;
import com.webapp.common.support.MessageSource;
import com.webapp.common.support.NumberGender;
import com.webapp.mall.dao.CartDAO;
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
import org.springframework.web.bind.annotation.SessionAttribute;

import static org.springframework.util.CollectionUtils.isEmpty;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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
    @Autowired
    CartDAO cartDAO;
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
    public String mallLogin(@RequestParam HashMap params, ModelMap model, HttpServletRequest request, HttpSession session) throws Exception {
        String returnString ="mall/login";
        Device device = DeviceUtils.getCurrentDevice(request);

        try{
        	Object RefererUrl=session.getAttribute("RefererUrl");
        	if(RefererUrl==null) {
        		 session.setAttribute("RefererUrl",request.getHeader("Referer"));
        	}else {
        		 session.setAttribute("RefererUrl",RefererUrl);
        	}
          
            Object siteUrl = request.getRequestURL().toString()
                    .replaceAll(" " , "")
                    .replace(request.getRequestURI(),"");

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
    @RequestMapping(value = "/sign/kcpcert_proc_req")
    public String kcpcertProcReq(@RequestParam HashMap params, ModelMap model, HttpServletRequest request) throws Exception {
    	return "mall/kcpcert_proc_req";
    }
    @RequestMapping(value = "/sign/kcpcert_proc_res")
    public String kcpcertProcRes(@RequestParam HashMap params, ModelMap model, HttpServletRequest request) throws Exception {
    	return "mall/kcpcert_proc_res";
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
        Device device = DeviceUtils.getCurrentDevice(request);
        model.addAttribute("style", "for-1");
        if(device.isMobile()){
            return "mobile/for-1";
        } else {
            return "mall/findUserInfo";
        }

    }
    @RequestMapping(value = "/sign/changePassword")
    public String changePassword(ModelMap model, HttpServletResponse res, HttpServletRequest request, @RequestParam HashMap params)throws Exception{
        Device device = DeviceUtils.getCurrentDevice(request);
        String redirectUrl ="mall/changePassword";
        PrintWriter out = res.getWriter();
        res.setContentType("text/html; charset=UTF-8");
        try{
            String email = (String)params.get("email");
            String password_change_code = (String)params.get("password_change_code");
            Map<String,Object> userInfo = userDAO.getEmailAuthList(params);

            if(isEmpty(params)){
                redirectUrl = "redirect:/sign/findUserInfo";
            } else if(isEmpty(userInfo)){
//                redirectUrl = "redirect:/";
                out.println("<script>alert('" + messageSource.getMessage("error.changePwd.invalidPage", "ko") + "'); location.href='/';</script>");
                out.flush();
            } else {
                model.addAttribute("email",email);
                model.addAttribute("style", "for-2");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        if(device.isMobile()){
            redirectUrl = "mobile/for-2";
            return redirectUrl;
        } else{
            return redirectUrl;
        }
    }
    @RequestMapping(value = "/sign/changePasswordDone")
    public String changePasswordDone( ModelMap model,HttpServletRequest request,@RequestParam HashMap params)throws Exception{
        Device device = DeviceUtils.getCurrentDevice(request);
        model.addAttribute("style", "for-3");
        if(params.get("email") != null && !params.get("email").equals("")) {
        	model.addAttribute("id", params.get("email"));
        }
        if(device.isMobile()){
            return "mobile/for-3";
        } else{
            return "mall/changePasswordDone";
        }
    }
    @RequestMapping(value = "/sign/signUpDone")
    public String signUpDone( ModelMap model,HttpServletRequest request,@RequestParam HashMap params, HttpSession session)throws Exception{
        Device device = DeviceUtils.getCurrentDevice(request);
        Object RefererUrl=session.getAttribute("RefererUrl");
        if(RefererUrl==null) {
        		session.setAttribute("RefererUrl",request.getHeader("Referer"));
		   	}else {
		   		session.setAttribute("RefererUrl",RefererUrl);
		   }
        model.addAttribute("style", "mem-com");
        if(device.isMobile()){
            return "mobile/mem-com";
        } else {
            return "mall/signUpDone";
        }
    }
}
