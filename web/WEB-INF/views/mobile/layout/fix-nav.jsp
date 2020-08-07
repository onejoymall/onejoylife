<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<nav class="nav">
     <ul>
         <li><a href="#" id="nav-cate"><i class="cate-ic">${afn:getMessage('category',sessionScope.locale)}</i></a></li>
         <li><a href="/" id="nav-home"><i class="home-ic">${afn:getMessage('home',sessionScope.locale)}</i></a></li>
         <li><a href="/product/search-page" id="nav-src"><i class="src-ic">${afn:getMessage('search',sessionScope.locale)}</i></a></li>
         <li><a href="<c:url value="/MyPage/DashBoard"/>" id="nav-user"><i class="user-ic">${afn:getMessage('mypage',sessionScope.locale)}</i></a></li>
     </ul>
 </nav>
 <div class="category">
    <div class="cate-bg"></div>
     <div class="content">
         <div class="cate-close"><span></span></div>
         <header class="cate-hd">
             <div class="cate-hdTop">
                <c:if test="${sessionScope.login}">
                    <p><span>${sessionScope.email}</span>${afn:getMessage('msg.user.welcome',sessionScope.locale)}</p>
                </c:if>
                <c:if test="${!sessionScope.login}">
                    <a href="<c:url value="/sign/login"/>" class="login">${afn:getMessage('login',sessionScope.locale)} ></a>
                </c:if>
<!--                    <a href="#" class="login">로그인 ＞</a>-->
             </div>
             <ul class="cate-hdBtm">
                 <li><a href="<c:url value="/MyPage/DashBoard"/>"><i class="user-ic"></i><p>${afn:getMessage('mypage',sessionScope.locale)}</p></a></li>
                 <li><a href="<c:url value="/MyPage/OrderAndDelivery"/>"><i class="ship-ic"></i><p>${afn:getMessage('order_and_delivery',sessionScope.locale)}</p></a></li>
                 <li><a href="<c:url value="/MyPage/ShoppingAddList"/>"><i class="heart-ic"></i><p>${afn:getMessage('mywishlist',sessionScope.locale)}</p></a></li>
                 <li><a href="<c:url value="/Help/csinfo"/>"><i class="call-ic"></i><p>${afn:getMessage('customer_service',sessionScope.locale)}</p></a></li>
             </ul>
         </header>
    <div class="cate-body">
        <h4 class="cate-ttl">${afn:getMessage('category',sessionScope.locale)}</h4>
        <hr>
        <c:import url="/layout/mainTopNav"/>
        <div class="logoutWrap">
           <hr>
            <c:if test="${sessionScope.login}">
                <a href="<c:url value="/sign/logout"/>" class="logout">${afn:getMessage('logout',sessionScope.locale)} <i class="ri-logout-box-r-line"></i></a>
            </c:if>
            <c:if test="${!sessionScope.login}">
                <a href="<c:url value="/sign/login"/>" class="logout">${afn:getMessage('login',sessionScope.locale)} <i class="ri-logout-box-r-line"></i></a>
            </c:if>
            <button type="button" class="language">${afn:getMessage('national_selection',sessionScope.locale)}</button>
        </div>
         </div>
     </div>
    <div class="languagePop" id="language-m">
        <div class="content clearfix">
            <header>
            <h3>${afn:getMessage('national_selection',sessionScope.locale)}</h3>
            <button class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <ul class="language-ul">
                <li><button type="button" onclick="setGlobalLocale('ko')">${afn:getMessage('korea',sessionScope.locale)}</button></li>
                <li><button type="button" onclick="setGlobalLocale('en')">${afn:getMessage('america',sessionScope.locale)}</button></li>
                <li><button type="button" onclick="setGlobalLocale('zh')">${afn:getMessage('china',sessionScope.locale)}</button></li>
                <li><button type="button" onclick="setGlobalLocale('ja')">${afn:getMessage('japan',sessionScope.locale)}</button></li>
            </ul>
        </content>
    </div>

    </div>
 </div>

    <script>
    $('.logout').click(function (e) {
    	if('${sessionScope.token}'){
    		e.preventDefault();
	        location.href='https://kauth.kakao.com/oauth/logout?client_id=edae5e01f6d81723613c9cd06f550593&logout_redirect_uri=http://onejoy-life.com/sign/logout';
	    }
    });
    
    $(function(){

    $('.language').on('click',function(){
    $('#language-m').addClass('on');
    })
    $('.popClose').on('click',function(){
    $('#language-m').removeClass('on');
    })
    });
    </script>