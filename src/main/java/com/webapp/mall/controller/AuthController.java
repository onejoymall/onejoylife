package com.webapp.mall.controller;

import com.siot.IamportRestClient.IamportClient;
import com.webapp.common.support.CurlPost;
import com.webapp.mall.dao.DeliveryDAO;
import com.webapp.mall.dao.PaymentDAO;
import com.webapp.mall.dao.ReviewDAO;
import com.webapp.mall.dao.UserDAO;
import com.webapp.mall.vo.UserVO;
import com.webapp.manager.dao.QnaDAO;
import org.apache.http.client.ResponseHandler;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import static org.springframework.util.CollectionUtils.isEmpty;

@Controller
public class AuthController {
    @Value("${t_key}")
    private String t_key;
    @Value("${t_url}")
    private String t_url;
    @Value("${kakaoClientId}")
    private String kakaoClientId;
    @Value("${kakaoRedirectUri}")
    private String kakaoRedirectUri;
    @Value("${naverClientId}")
    private String naverClientId;
    @Value("${naverClientSecret}")
    private String naverClientSecret;
    @Autowired
    UserDAO userDAO;
    @Autowired
    DeliveryDAO deliveryDAO;
    @Autowired
    PaymentDAO paymentDAO;
    @Autowired
    ReviewDAO reviewDAO;
    @Autowired
    QnaDAO qnaDAO;

    IamportClient client;
    @Value("${api_key}")
    private String apiKey;
    @Value("${api_secret}")
    private String apiSecret;

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/sign/naverLogin")
	public String login(Model model, HttpSession session,HttpServletRequest httpServletRequest) throws Exception{
        String base_url = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName();
        String clientId = naverClientId;//애플리케이션 클라이언트 아이디값";
        String redirectURI = URLEncoder.encode(base_url+"/sign/naverCallBack", "UTF-8");
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        apiURL += "&client_id=" + clientId;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&state=" + state;
        session.setAttribute("state", state);
        try {

        }catch (Exception e){
            e.printStackTrace();
        }
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		return "redirect:"+apiURL;
	}

    @RequestMapping(value = "/sign/naverCallBack")
    public String authNaver(@RequestParam("code") String code, HttpServletRequest request, HttpSession session, Map params, UserVO userVO) throws Exception{
        Map<String, String> requestHeaders = new HashMap<>();
        Object siteUrl = request.getRequestURL().toString().replace(request.getRequestURI(),"");
        String base_url = request.getScheme()+"://"+request.getServerName();
//        Map<String, Object> kakaoMap = CurlPost.getAccessToken(code,siteUrl,kakaoClientId,kakaoRedirectUri);
        String clientId = naverClientId;//애플리케이션 클라이언트 아이디값";
        String clientSecret = naverClientSecret;//애플리케이션 클라이언트 시크릿값";
        String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode(base_url+"/sign/naverCallBack", "UTF-8");
        String apiURL;
        apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
        apiURL += "client_id=" + clientId;
        apiURL += "&client_secret=" + clientSecret;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&code=" + code;
        apiURL += "&state=" + state;

//        String access_token = "";
//        String refresh_token = "";
        Map<String, Object> responBody = null;
        //토큰 생성
        responBody = new ObjectMapper().readValue(get(apiURL,requestHeaders),Map.class);
        try {
                //
            String header = "Bearer "+responBody.get("access_token"); // Bearer 다음에 공백 추가
            String apiURLnidMe = "https://openapi.naver.com/v1/nid/me";
            requestHeaders.put("Authorization", header);
            //프로필 요청
            responBody = new ObjectMapper().readValue(get(apiURLnidMe,requestHeaders),Map.class);
            if (responBody.get("resultcode").equals("00")) {
                if ( session.getAttribute("login")!=null){
                    // 기존에 login이란 세션 값이 존재한다면
                    session.removeAttribute("login"); // 기존값을 제거해 준다.
                    //기존 로그인 세션을 로그아웃후 다시 sns 로그인 할지여부 협의
                    //로그인 기록 저장
                    userVO.setEmail((String)session.getAttribute("email"));
                    userVO.setLog_type("snslogin");
                    userDAO.insertUserHistory(userVO);
                }
                session.setAttribute("login", true);
                //로그인 사용자 정보 획득
                Map<String,Object> snsLoginUserMap = (Map<String, Object>) responBody.get("response");
                session.setAttribute("email", snsLoginUserMap.get("email"));
                params.put("username", snsLoginUserMap.get("name"));
                params.put("email", snsLoginUserMap.get("email"));
                userDAO.insertSnsUser(params);
                //로그인 기록 저장
                userVO.setLog_type("snslogin");
                userVO.setEmail((String)snsLoginUserMap.get("email"));
                userDAO.insertUserHistory(userVO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
       return "snslogin/snslogin";
    }
    public static void naverNidMemain(String[] args) throws Exception{
        String token = "YOUR_ACCESS_TOKEN"; // 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가

        String apiURL = "https://openapi.naver.com/v1/nid/me";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);
        String responseBody = get(apiURL,requestHeaders);

        System.out.println(responseBody);
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders) throws Exception{
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (Exception e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl) throws Exception{
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (Exception e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body) throws Exception{
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (Exception e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
