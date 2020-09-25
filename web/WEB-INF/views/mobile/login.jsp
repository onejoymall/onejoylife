<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link href="../../assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/common-mobile.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/commonSub.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
    <div class="wrap">
        <div class="mo-main login-main clearfix">
            <a href="/"><div class="mo-logo"></div></a>
            <div class="mo-login-form">
                <form name="defaultLoginForm" id="defaultLoginForm">
                    <input type="text" for="id-input" name="email" class="id-la" placeholder="${afn:getMessage('idEmail',sessionScope.locale)}">
                    <input type="password" for="pw-input" name="password" class="id-la" placeholder="${afn:getMessage('pwd',sessionScope.locale)}">
                    <span class="error" id="loginCheckError"></span>
                    <div class="check-save">
                        <input type="checkbox" id="saveid" class="save-ck">
                        <label for="saveid"><span class="ck-img"></span> ${afn:getMessage("idSave",sessionScope.locale)}</label>
                        <!-- <input type="checkbox" id="auto-login" class="save-ck">
                        <label for="auto-login"><span class="ck-img"></span>자동 로그인</label> -->
                    </div>
                    <button type="button" title="login" class="btn-login">${afn:getMessage("login",sessionScope.locale)}</button>
                </form>
                <button type="button" class="btn-kakao-login"><i class="kakao-icon"></i>${afn:getMessage("msg.login.kakao",sessionScope.locale)}</button>
                 <a href="" class="btn-nv-login"><i class="nv-icon"></i>네이버 계정으로 로그인</a>
                <a href="" class="btn-fb-login"><i class="fb-icon"></i>페이스북 계정으로 로그인</a>
                <a href="" class="btn-ln-login"><i class="ln-icon"></i>LINE 계정으로 로그인</a>
                <div class="login-search">
                    <a href="<c:url value="/sign/signup"/>" class="link-a">${afn:getMessage("join",sessionScope.locale)}</a>
                    <span class="bar"></span>
                    <a href="/sign/findUserInfo">${afn:getMessage("idPwdFind",sessionScope.locale)}</a>

                </div>
                <!-- 비회원 주문조회 -->
                <div class="ttl-line"></div>
                <div class="link-nonmem">
                    <button type="button" class="nonmem-btn">${afn:getMessage("nmemOrder",sessionScope.locale)}</button>
                </div>
                <div class="nonmem">
                    <form name="orderForm" id="orderForm" method="post">
                        <div>
                            <input type="text" name="imp_uid" class="non-num" placeholder="${afn:getMessage('msg.login.impOrderNum',sessionScope.locale)}">
                            <input type="password" name="password" class="non-num" placeholder="${afn:getMessage('msg.login.paymentPwd',sessionScope.locale)}">
                        </div>
                        <button type="button" id="orderDetailGuestBtn">${afn:getMessage("lookup",sessionScope.locale)}</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="mo-footer">

        </div>
    </div>

    <script>
	    $(document).ready(function(){
	        // 비회원주문조회
	        $(".nonmem-btn").click(function() {
	            $(".nonmem").toggle(); 
	        });
	    });
	    
        $('.btn-kakao-login').click(function () {
            window.open('https://kauth.kakao.com/oauth/authorize?client_id=edae5e01f6d81723613c9cd06f550593&redirect_uri=<c:out value="${siteUrl}"/>/Popup/kakao&response_type=code','_blank','width=750, height=900');
        });

        $('.btn-login').on("click",function () {
        
            var formData = $('#defaultLoginForm').serialize();
            var email = $('#email').val();
            var password = $('#password').val();

            jQuery.ajax({
                type:"GET",
                // contentType: 'application/json',
                url:"/sign/loginProc",
                // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
                data:formData,
                success : function(data) {
                    // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                    // TODO

                    if(data.message) {
                        // $('#loginCheckError').removeClass('er');
                        $('#loginCheckError').addClass('error-on');
                        $('#loginCheckError').empty();
                        $('#loginCheckError').html('* ' + data.message);
                    }else{
                        // loginAuth(data.access_token);
                        location.href=data.redirectUrl;
                    }
                },

                complete : function(data) {
                    // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                    // TODO
                },
                error : function(xhr, status, error) {
                    alert("error");
                }
            });
        })
    </script>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>
</body>
</html>