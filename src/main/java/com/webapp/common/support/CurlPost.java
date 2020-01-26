package com.webapp.common.support;

import autovalue.shaded.com.google$.common.collect.$ForwardingObject;
import jdk.nashorn.internal.codegen.MapCreator;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;


@Component("curlPost")
public class CurlPost {

    public static Map<String,Object> curlPostFn(String url, String Accept, String ContentType ) throws IOException {

        HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
        HttpPost postRequest = new HttpPost(url); //POST 메소드 URL
        postRequest.setHeader("Accept", Accept);
//            postRequest.setHeader("Connection", "keep-alive");
        postRequest.setHeader("Content-Type", ContentType);
//            postRequest.addHeader("x-api-key", RestTestCommon.API_KEY); //KEY 입력
//            postRequest.addHeader("Authorization", token); // token 이용시
        HttpResponse response = client.execute(postRequest);
        Map<String, Object> responBody = null;
        if (response.getStatusLine().getStatusCode() == 200) {
            ResponseHandler<String> handler = new BasicResponseHandler();
            String body = handler.handleResponse(response);
//                JSONObject jsonObject = new JSONObject(handler.handleResponse(response));
            responBody = new ObjectMapper().readValue(body,Map.class);
        } else {
            responBody.put("status","fail");
        }
        return responBody;
    }

}
