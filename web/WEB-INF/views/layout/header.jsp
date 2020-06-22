<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <meta property="og:url" content="http://onejoy-life.com/" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="원조이라이프" />
    <meta property="og:description" content="" />
    <meta property="og:image" content="http://onejoy-life.com/fileupload/banner/2020/202005180644214820.jpg" />
    <meta property="og:image:width" content="1100" />
    <meta property="og:image:height" content="265" />
    <!--    <meta name="viewport" content="user-scalable=yes, width=1200, target-densitydpi=medium-dpi" />-->
    <link href="<c:url value="/assets/css/reset.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/common.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/jquery.bxslider.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/header.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/footer.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/${style}.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&display=swap&subset=korean" rel="stylesheet">

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

    <link rel='stylesheet' href='<c:url value="/assets/css/common/common.css"/>'/>
    <!-- Toastr -->
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
    <link href="<c:url value="/assets/css/toastr.css"/>" rel="stylesheet" type="text/css">
    <!-- timepicker -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

    <!--modal-->
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />--%>
    <!--
    [if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]
-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="<c:url value="/assets/js/jquery.bxslider.min.js"/>"></script>
    <!-- timepicker -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script type="text/javascript" src="http://test-pay.naver.com/customer/js/mobile/naverPayButton.js" charset="UTF-8"></script>
    <script>
    //전역변수
    <c:if test="${not empty postUrl}">
        var postUrl = '<c:url value="${postUrl}"/> ';
    </c:if>
    var isLogin ='<c:out value="${sessionScope.login}"/>';
    </script>
</head>
<body>
<header class="header">
    <div class="usermenu-section">
        <div class="usermenu-inner">
            <ul class="usermenu">
    <c:if test="${!sessionScope.login}">

        <li><a href="/sign/signup">회원가입</a></li>
        <li><a href="/sign/login">로그인</a></li>
        <li><a href="/MyPage/ShoppingBasket">장바구니</a></li>
        <li><a href="/MyPage/OrderAndDelivery">주문배송</a></li>
        <li><a href="/Help/csinfo">고객센터</a></li>
        <li class="language-nav"><a href="">국가선택</a>
            <ul>
                <li><a href="">한국</a></li>
                <li><a href="">미국</a></li>
                <li><a href="">중국</a></li>
                <li><a href="">일본</a></li>
            </ul>
        </li>

    </c:if>
    <c:if test="${sessionScope.login}">
        <li><a href="/MyPage/ShoppingBasket">장바구니</a></li>
        <li><a href="/MyPage/OrderAndDelivery">주문배송</a></li>
        <li><a href="/MyPage/DashBoard">MyPage</a></li>
        <li><a href="/Help/csinfo">고객센터</a></li>
        <li><a href="/sign/logout" class="logoutBtn">로그아웃</a></li>
        <!-- <li><a href="https://kauth.kakao.com/oauth/logout?client_id=edae5e01f6d81723613c9cd06f550593&logout_redirect_uri=http://onejoy-life.com/sign/logout&state=?">로그아웃</a></li> -->
        <li class="language-nav"><a href="">국가선택</a>
            <ul>
                <li><a href="">한국</a></li>
                <li><a href="">미국</a></li>
                <li><a href="">중국</a></li>
                <li><a href="">일본</a></li>
            </ul>
        </li>
    </c:if>

            </ul>
        </div>
    </div>
    <div class="header-logo">
        <div class="header-logo-inner">
            <a href="/"><h1>onejoylife</h1></a>
        </div>
    </div>
    <c:import url="/layout/mainTopNav"/>
    <script>
    $('.logoutBtn').click(function (e) {
    	if('${sessionScope.token}'){
    		e.preventDefault();
	        location.href='https://kauth.kakao.com/oauth/logout?client_id=edae5e01f6d81723613c9cd06f550593&logout_redirect_uri=http://onejoy-life.com/sign/logout';
	    }
    });

    </script>
</header>
