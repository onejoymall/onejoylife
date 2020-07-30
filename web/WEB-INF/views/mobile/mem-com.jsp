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
        <header class="header">
            <div class="top-inner">
                <button class="back-arr"><i class="back-ic"></i></button>
                
            <span class="header-tit">${afn:getMessage("join",sessionScope.locale)}</span>
            </div>
        </header>
        <div class="mo-main complete-main clearfix">
            <div class="mo-logo"><a href="">onejoy life</a></div>
            <p class="join-tit">${afn:getMessage("successJoin",sessionScope.locale)}</p>
            <p class="join-txt"><span></span>ONEJOYlife ${afn:getMessage("msg.signupDone.joinCong",sessionScope.locale)}<br>${afn:getMessage("msg.signupDone.enjoyMsg",sessionScope.locale)}</p>
            <a href="<c:url value="/sign/login"/>" class="btn-login">${afn:getMessage("login",sessionScope.locale)}</a>
        </div>
        <div class="mo-footer">

        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".back-arr").click(function(){
                history.back();
            });
        });
    </script>
</body>
</html>