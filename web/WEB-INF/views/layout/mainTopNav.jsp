<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

    <div class="gnb-section">
        <div class="gnb-inner">
            <ul class="gnb">
                <li>
                    <i class="main-menu-ic"></i>전체 카테고리
                    <ul class="gnb-submenu">
                    <c:if test="${not empty categoryList}">
                    <c:forEach var="ctegoryList" items="${categoryList}" varStatus="status">
                        <li>
                            <a href="/product?product_ct=${ctegoryList.pd_category_id}">${ctegoryList.pd_category_name}</a>
                            <ul class="gnb-submenu-2dp">
                            <c:if test="${not empty subList}">
                                <c:forEach var="subList" items="${subList}">
                                    <c:if test="${ctegoryList.pd_category_id eq subList.pd_category_upper_code}">
                                        <li>
                                        <a href="/product?product_ct=${subList.pd_category_id}"><span></span>${subList.pd_category_name}</a>
                                        <ul class="gnb-submenu-3dp">
                                        <c:if test="${not empty thirdList}">
                                            <c:forEach var="thirdList" items="${thirdList}">
                                                <c:if test="${subList.pd_category_id eq thirdList.pd_category_upper_code}">
                                                    <li>
                                                    <a href="/product?product_ct=${thirdList.pd_category_id}"><span></span>${thirdList.pd_category_name}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        </ul>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            </ul>
                        </li>
                    </c:forEach>
                    </c:if>
                    </ul>
                </li>
                <li><a href="/mall/today">오늘의 특가</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="javascript:void(0);" class="ready">라이브 쇼핑</a></li>
            </ul>
            <div class="search-box">
                <div class="cart-box">
                    <a href="/MyPage/ShoppingBasket">
                        <i class="cart-ic"></i>
                        <span class="cart-num">${searchVO.totRow}</span>
                    </a>
                </div>
                <form action="" id="main-search-form" name="main-search-form" method="get">
                    <input type="text" id="main-search" name="main-search" class="input-text">
                    <button id="main-search-btn" type="submit" class="search-btn"></button>
                </form>
            </div>
        </div>
    </div>
</header>
    <div class="out-box">
        <a href="/MyPage/ShoppingBasket"><p class="out-h">장바구니</p></a>
        <div class="out-in">
            <p>최근 본 상품 <span></span></p>
            <div id="todaySlider" class="out-in-box">
            <c:if test="${not empty todayList}">
                <c:forEach var="todayList" items="${todayList}" varStatus="status">
                    <div class="img1"><a href="/product/productDetail?product_cd=${todayList.product_cd}"><img src="${todayList.file_1}" onerror="this.src='http://placehold.it/68'" alt=""></a></div>

                </c:forEach>
            </c:if>
            </div>

            <div class="arr-box">
                <div class="left-ar "></div>
                <div class="ar-num"><span>1</span>/<span>1</span></div>
                <div class="right-ar bx-prev"></div>
            </div>
        </div>
        <div class="fo-box ">
            <a href="" class="top-but">
            <div>TOP</div>
            <div class="ar-top"></div>
            </a>
            <a href="" class="down-but">
            <div>DOWN</div>
            <div class="ar-down"></div>
            </a>
        </div>
    </div>