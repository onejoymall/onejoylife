<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="nav">
     <ul>
         <li><a href="#" id="nav-cate"><i class="cate-ic">카테고리</i></a></li>
         <li><a href="/" id="nav-home"><i class="home-ic">홈</i></a></li>
         <li><a href="/product/search-page" id="nav-src"><i class="src-ic">검색</i></a></li>
         <li><a href="<c:url value="/MyPage/DashBoard"/>" id="nav-user"><i class="user-ic">마이페이지</i></a></li>
     </ul>
 </nav>
 <div class="category">
    <div class="cate-bg"></div>
     <div class="content">
         <div class="cate-close"><span></span></div>
         <header class="cate-hd">
             <div class="cate-hdTop">
                <c:if test="${sessionScope.login}">
                    <p><span>${sessionScope.email}</span>님 환영합니다.</p>
                </c:if>
                <c:if test="${!sessionScope.login}">
                    <a href="<c:url value="/sign/login"/>" class="login">로그인 ></a>
                </c:if>
<!--                    <a href="#" class="login">로그인 ＞</a>-->
             </div>
             <ul class="cate-hdBtm">
                 <li><a href="<c:url value="/MyPage/DashBoard"/>"><i class="user-ic"></i><p>마이페이지</p></a></li>
                 <li><a href="<c:url value="/MyPage/OrderAndDelivery"/>"><i class="ship-ic"></i><p>주문/배송</p></a></li>
                 <li><a href="<c:url value="/MyPage/ShoppingAddList"/>"><i class="heart-ic"></i><p>위시리스트</p></a></li>
                 <li><a href="<c:url value="/Help/csinfo"/>"><i class="call-ic"></i><p>고객센터</p></a></li>
             </ul>
         </header>
    <div class="cate-body">
        <h4 class="cate-ttl">카테고리</h4>
        <hr>
        <c:import url="/layout/mainTopNav"/>
        <div class="logoutWrap">
           <hr>
            <a href="<c:url value="/sign/logout"/>" class="logout">로그아웃 <i class="ri-logout-box-r-line"></i></a>
        </div>
         </div>
     </div>
 </div>