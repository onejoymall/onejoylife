<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-04-15
  Time: 오전 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
    <script>
        //전역변수
        <c:if test="${not empty postUrl}">
            var postUrl = '<c:url value="${postUrl}"/> ';
        </c:if>
        var isLogin ='<c:out value="${sessionScope.login}"/>';
    </script>
<body class="pt-83">
    <header class="h-main">
        <div class="top-inner">
            <h1 class="main-logo"><a href="/">원조이몰</a></h1>
            <form name="search" action="" class="src-form">
                <div class="src-inner">
                    <input type="text" class="src-input" name="src-input">
                    <button type="button" class="src-btn"><span>검색</span></button>
                </div>
            </form>
            <div class="h-cart">
                <a href="/MyPage/ShoppingBasket" class="cart-inner">
                    <i class="cart"></i>
                    <span class="cart-num">${searchVO.totRow}</span>
                </a>
            </div>
        </div>
        <ul class="submenu">
            <li class="active"><a href="/mall/today">오늘의 특가</a></li>
            <li><a href="/giveaway">경품</a></li>
            <li><a href="javascript:void(0);" class="ready">특판</a></li>
            <li><a href="avascript:void(0);" class="ready">여행</a></li>
            <li><a href="http://onejoymcm.com">라이브 쇼핑</a></li>
        </ul>
    </header>