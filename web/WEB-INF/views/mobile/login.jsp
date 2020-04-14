<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
            <div class="mo-logo"><a href="">onejoy life</a></div>
            <div class="mo-login-form">
                <form name="defaultLoginForm" id="defaultLoginForm">
                    <input type="text" for="id-input" name="email" class="id-la" placeholder="아이디(이메일)">
                    <input type="password" for="pw-input" name="password" class="id-la" placeholder="비밀번호">
                    <span class="error" id="loginCheckError">회원 아이디 또는 비밀번호가 일치하지 않습니다.</span>
                    <div class="check-save">
                        <input type="checkbox" id="id-save" class="save-ck">
                        <label for="id-save"><span class="ck-img"></span> 아이디 저장</label>
                        <input type="checkbox" id="auto-login" class="save-ck">
                        <label for="auto-login"><span class="ck-img"></span>자동 로그인</label>
                    </div>
                    <button type="button" title="login" class="btn-login">로그인</button>
                </form>
                <button type="button" class="btn-kakao-login"><i class="kakao-icon"></i>kakao 계정으로 로그인</button>
                <div class="login-search">
                    <a href="<c:url value="/sign/signup"/>" class="link-a">회원가입</a>
                    <span class="bar"></span>
                    <a href="">아이디 찾기</a>
                    <span class="bar"></span>
                    <a href="">비밀번호 찾기</a>
                </div>
            </div>
        </div>
        <div class="mo-footer">

        </div>
    </div>

    <script>
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
</body>
</html>