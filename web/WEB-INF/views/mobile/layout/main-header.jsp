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
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>${afn:getMessage('onejoylife',sessionScope.locale)}</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <meta property="og:url" content="http://onejoy-life.com" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="${afn:getMessage('ojl_prize',sessionScope.locale)}" />
    <meta property="og:description" content="" />
    <meta property="og:image" content="http://onejoy-life.com/fileupload/banner/2020/202005180644214820.jpg" />
    <meta property="og:image:width" content="1100" />
    <meta property="og:image:height" content="265" />
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
    <!-- Toastr -->
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
    <link href="<c:url value="/assets/css/toastr.css"/>" rel="stylesheet" type="text/css">
    <!-- timepicker -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

	<script type='text/javascript' src='http://wcs.naver.net/wcslog.js'></script> 

	<script type='text/javascript'> 
	
	if(!wcs_add) var wcs_add = {};
	
	wcs_add['wa'] = 's_1e285b9b3844';
	
	wcs.inflow('onejoy-life.com');
	
	</script>
    </head>
    <script>
        //전역변수
        <c:if test="${not empty postUrl}">
            var postUrl = '<c:url value="${postUrl}"/> ';
        </c:if>
        var isLogin ='<c:out value="${sessionScope.login}"/>';
    </script>
<body class="pt-83">
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
                <%--<li>
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
                </li>--%>
           </ul>
           <div class="sharelink">
                <input type="text" name="share_link" id="share_link" value="" readonly>
                <button type="button" class="copybtn" onclick="copyURL()">${afn:getMessage('url_copy',sessionScope.locale)}</button>
            </div>
       </div>
    </div>
    <header class="h-main">
        <div class="top-inner">
            <h1 class="main-logo"><a href="/">${afn:getMessage('onejoymall',sessionScope.locale)}</a></h1>
            <form action="/product/search-page" id="main-search-form" name="main-search-form" method="get" class="src-form">
                <div class="src-inner">
                    <input type="text" id="main-search" name="product_name" class="src-input" value="${param.product_name}">
                    <button type="submit" class="src-btn"><span>${afn:getMessage('search',sessionScope.locale)}</span></button>
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
            <li><a href="/mall/today">${afn:getMessage('todayPrice_cate',sessionScope.locale)}</a></li>
            <li><a href="/giveaway">${afn:getMessage('giveaway',sessionScope.locale)}</a></li>
            <li><a href="/product?product_ct=808">${afn:getMessage('special_edition',sessionScope.locale)}</a></li>
            <li><a href="/product?product_ct=880">${afn:getMessage('travel',sessionScope.locale)}</a></li>
            <li><a href="http://onejoymcm.com">${afn:getMessage('live_shopping',sessionScope.locale)}</a></li>
        </ul>
    </header>