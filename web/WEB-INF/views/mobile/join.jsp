<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>onejoy life</title>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <link href="<c:url value="/assets/css/reset.css" />" rel="stylesheet" type="text/css">
        <link href="<c:url value="/assets/css/mobile/common-mobile.css" />" rel="stylesheet" type="text/css">
        <link href="<c:url value="/assets/css/mobile/commonSub.css" />"rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
        <link href="<c:url value="/assets/css/jquery.bxslider.css" />"rel="stylesheet" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        <script src="<c:url value="/assets/js/jquery.bxslider.min.js" />"></script>
        <script src="<c:url value="/assets/js/common-mobile.js" />"></script>
    </head>
<body>

    <div class="wrap">
        <header class="header clearfix">
            <div class="top-inner">
                <button class="back-arr"><i class="back-ic"></i></button>
                <span class="header-tit">${afn:getMessage("join",sessionScope.locale)}</span>
            </div>
        </header>
        <div class="mo-main join-main clearfix">
            <div class="mo-logo clearfix"><a href="/">onejoy life</a></div>
            <a href="<c:url value="/mobile/signup"/>" class="btn-join">${afn:getMessage("join",sessionScope.locale)}</a>
            <div class="line-box">
                <span class="line"></span>
                <span class="ttl">${afn:getMessage("msg.sign.orSocialSign",sessionScope.locale)}</span>
                <span class="line"></span>
            </div>
            <a href="" class="btn-kakao-login"><i class="kakao-icon"></i>${afn:getMessage("msg.sign.kakao",sessionScope.locale)}</a>
            <a href="" class="btn-nv-login"><i class="nv-icon"></i>네이버 계정으로 회원가입</a>
            <a href="" class="btn-fb-login"><i class="fb-icon"></i>페이스북 계정으로 회원가입</a>
            <a href="" class="btn-ln-login"><i class="ln-icon"></i>LINE 계정으로 회원가입</a>
        </div>
        <div class="mo-footer">

        </div>
    </div>
    <script type="text/javascript">
        // $(document).ready(function(){
        //     $(".back-arr").click(function(){
        //         history.back();
        //     });
        // });

        $('.btn-kakao-login').click(function () {
            window.open('https://kauth.kakao.com/oauth/authorize?client_id=edae5e01f6d81723613c9cd06f550593&redirect_uri=<c:out value="${siteUrl}"/>/Popup/kakao&response_type=code','_blank','width=750, height=900');
        });
    </script>
</body>
</html>