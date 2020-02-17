package com.webapp.common.support;

import autovalue.shaded.com.google$.common.collect.$ForwardingObject;
import jdk.nashorn.internal.codegen.MapCreator;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;


@Component("curlPost")
public class CurlPost {

    public static Map<String,Object> curlPostFn(String url, String Accept, String ContentType,String Method ) throws IOException {

        HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
        Map<String, Object> responBody = null;
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



        return responBody;
    }

}
