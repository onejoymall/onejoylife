package com.webapp.common.support;


import org.apache.http.HttpResponse;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import static org.springframework.util.CollectionUtils.isEmpty;
import com.fasterxml.jackson.databind.JsonNode;

@Component("curlPost")
public class CurlPost {

    public static Map<String,Object> curlPostFn(String url, String Accept, String ContentType,String Method) throws IOException {

        HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
        Map<String, Object> responBody = null;
//        List<NameValuePair> nvps = new ArrayList >NameValuePair>();
        try{
            if(Method.equals("post")){
                HttpPost postRequest = new HttpPost(url); //POST 메소드 URL
                if(!Accept.isEmpty()) {
                    postRequest.setHeader("Accept", Accept);
                }
//            postRequest.setHeader("Connection", "keep-alive");
                if(!ContentType.isEmpty()) {
                    postRequest.setHeader("Content-Type", ContentType);
                }
                HttpResponse response = client.execute(postRequest);
                if (response.getStatusLine().getStatusCode() == 200) {
                    ResponseHandler<String> handler = new BasicResponseHandler();
                    String body = handler.handleResponse(response);
//                JSONObject jsonObject = new JSONObject(handler.handleResponse(response));
                    responBody = new ObjectMapper().readValue(body,Map.class);
                } else {
                    responBody.put("status","fail");
                }
            }
            if(Method.equals("get")){
                HttpGet getRequest = new HttpGet(url);
                if(!Accept.isEmpty()) {
                    getRequest.setHeader("Accept", Accept);
                }
//            postRequest.setHeader("Connection", "keep-alive");
                if(!ContentType.isEmpty()) {
                    getRequest.setHeader("Content-Type", ContentType);
                }
                HttpResponse response = client.execute(getRequest);
                if (response.getStatusLine().getStatusCode() == 200) {
                    ResponseHandler<String> handler = new BasicResponseHandler();
                    String body = handler.handleResponse(response);
//                JSONObject jsonObject = new JSONObject(handler.handleResponse(response));
                    responBody = new ObjectMapper().readValue(body,Map.class);
                } else {
                    responBody.put("status","fail");
                }
            }

//            postRequest.addHeader("x-api-key", RestTestCommon.API_KEY); //KEY 입력
//            postRequest.addHeader("Authorization", token); // token 이용시

        }catch (Exception e){
            e.printStackTrace();
        }
        return responBody;
    }

    public static Map<String, Object> sendGet(String GET_URL, String ContentType,String token) throws ClientProtocolException, IOException {
        //http client 생성
        HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
//        CloseableHttpClient httpClient = HttpClients.createDefault();
        Map<String, Object> responBody = null;
        try{
            //get 메서드와 URL 설정
            HttpGet httpGet = new HttpGet(GET_URL);

            //agent 정보 설정
//        httpGet.addHeader("User-Agent", USER_AGENT);
            httpGet.addHeader("Content-type", ContentType);
            httpGet.addHeader("Authorization", token);
            //get 요청
//            CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
            HttpResponse response = client.execute(httpGet);
            String json = EntityUtils.toString(response.getEntity(), "UTF-8");

            if (response.getStatusLine().getStatusCode() == 200) {
                ResponseHandler<String> handler = new BasicResponseHandler();
                String body = handler.handleResponse(response);
//                JSONObject jsonObject = new JSONObject(handler.handleResponse(response));
                responBody = new ObjectMapper().readValue(body,Map.class);
            } else {
                responBody.put("status","fail");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return responBody;
    }

    public static Map<String, Object> getAccessToken(String autorize_code) throws Exception{

        final String RequestUrl = "https://kauth.kakao.com/oauth/token";

        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", "edae5e01f6d81723613c9cd06f550593")); // REST API KEY
        postParams.add(new BasicNameValuePair("redirect_uri", "http://210.178.80.160:8080/sign/kakaoLogin")); // 리다이렉트 URI
        postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값

        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        Map<String, Object> responBody = null;

        try {
            post.setEntity(new UrlEncodedFormEntity(postParams));
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();


            if (responseCode == 200) {
                ResponseHandler<String> handler = new BasicResponseHandler();
                String body = handler.handleResponse(response);
                responBody = new ObjectMapper().readValue(body,Map.class);
            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }

        return responBody;

    }

}
