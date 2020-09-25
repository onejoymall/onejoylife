<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<!DOCTYPE html>
<html>
<head>
    <title>${afn:getMessage('onejoylife',sessionScope.locale)}</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <meta property="og:url" content="http://onejoy-life.com/" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="${afn:getMessage('ojl_prize',sessionScope.locale)}" />
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="<c:url value="/assets/js/jquery.bxslider.min.js"/>"></script>
    <!-- timepicker -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script type="text/javascript" src="https://pay.naver.com/customer/js/mobile/naverPayButton.js" charset="UTF-8"></script>
    <script>
    //전역변수
    <c:if test="${not empty postUrl}">
        var postUrl = '<c:url value="${postUrl}"/> ';
    </c:if>
    var isLogin ='<c:out value="${sessionScope.login}"/>';
    </script>
    <script type='text/javascript' src='https://wcs.naver.net/wcslog.js'></script>

	<script type='text/javascript'> 
	
	if(!wcs_add) var wcs_add = {};
	
	wcs_add['wa'] = 's_1e285b9b3844';
	
	wcs.inflow('onejoy-life.com');
	
	</script>
</head>
<body>
<div id="sharePop">
   <div class="bg"></div>
   <div class="md-content">
       <ul class="clearfix">
            <li>
                <a href="" onclick="snsSubmit('fackbook', '');">
                  <div class="fbic"></div>
                   ${afn:getMessage('facebook',sessionScope.locale)}
                </a>
            </li>
<!--
            <li>
                <a href="">
                   <div class="ktic"></div>
                   카카오톡
                </a>
            </li>
            <li>
                <a href="">
                   <div class="twtic"></div>
                   트위터
                </a>
            </li>
            <li>
                <a href="">
                   <div class="nbic"></div>
                   블로그
                </a>
            </li>
            <li>
                <a href="">
                   <div class="inic"></div>
                   인스타그램
                </a>
            </li>
-->
       </ul>
       <div class="sharelink">
            <input name="share_link" id="share_link" type="text" value="" readonly>
            <button type="button" class="copybtn" onclick="copyURL()">${afn:getMessage('url_copy',sessionScope.locale)}</button>
        </div>
   </div>
</div>
<header class="header">
    <div class="usermenu-section">
        <div class="usermenu-inner">
            <ul class="usermenu">
    <c:if test="${!sessionScope.login}">

        <li><a href="/sign/signup">${afn:getMessage('join',sessionScope.locale)}</a></li>
        <li><a href="/sign/login">${afn:getMessage('login',sessionScope.locale)}</a></li>
        <li><a href="/MyPage/ShoppingBasket">${afn:getMessage('cart',sessionScope.locale)}</a></li>
        <li><a href="/MyPage/OrderAndDelivery">${afn:getMessage('order_and_delivery',sessionScope.locale)}</a></li>
        <li><a href="/Help/csinfo">${afn:getMessage('customer_service',sessionScope.locale)}</a></li>
      	<li class="language-nav"><a href="javascrip:void(0)">${afn:getMessage('national_selection',sessionScope.locale)}</a> 
            <ul>
				<li><a href="javascript:setGlobalLocale('ko')">${afn:getMessage('korea',sessionScope.locale)}</a></li>
                <li><a href="javascript:setGlobalLocale('en')">${afn:getMessage('america',sessionScope.locale)}</a></li>
                <li><a href="javascript:setGlobalLocale('zh')">${afn:getMessage('china',sessionScope.locale)}</a></li>
                <li><a href="javascript:setGlobalLocale('ja')">${afn:getMessage('japan',sessionScope.locale)}</a></li>
            </ul>
        </li>
    </c:if>
    <c:if test="${sessionScope.login}">
        <li><a href="/MyPage/ShoppingBasket">${afn:getMessage('cart',sessionScope.locale)}</a></li>
        <li><a href="/MyPage/OrderAndDelivery">${afn:getMessage('order_and_delivery',sessionScope.locale)}</a></li>
        <li><a href="/MyPage/DashBoard">${afn:getMessage('header_mypage',sessionScope.locale)}</a></li>
        <li><a href="/Help/csinfo">${afn:getMessage('customer_service',sessionScope.locale)}</a></li>
        <li><a href="/sign/logout" class="logoutBtn">${afn:getMessage('logout',sessionScope.locale)}</a></li>
        <!-- <li><a href="https://kauth.kakao.com/oauth/logout?client_id=edae5e01f6d81723613c9cd06f550593&logout_redirect_uri=http://onejoy-life.com/sign/logout&state=?">로그아웃</a></li> -->
        <li class="language-nav"><a href="javascrip:void(0)">${afn:getMessage('national_selection',sessionScope.locale)}</a> 
            <ul>
                <li><a href="javascript:setGlobalLocale('ko')">${afn:getMessage('korea',sessionScope.locale)}</a></li>
                <li><a href="javascript:setGlobalLocale('en')">${afn:getMessage('america',sessionScope.locale)}</a></li>
                <li><a href="javascript:setGlobalLocale('zh')">${afn:getMessage('china',sessionScope.locale)}</a></li>
                <li><a href="javascript:setGlobalLocale('ja')">${afn:getMessage('japan',sessionScope.locale)}</a></li>
            </ul>
        </li>
    </c:if>

            </ul>
        </div>
    </div>
    <div class="header-logo">
        <div class="header-logo-inner">
            <a href="/"><h1>${afn:getMessage('onejoylife',sessionScope.locale)}</h1></a>
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
