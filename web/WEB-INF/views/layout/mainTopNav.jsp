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
    <%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

    <div class="gnb-section">
        <div class="gnb-inner">
            <ul class="gnb">
                <li>
                    <i class="main-menu-ic"></i>${afn:getMessage('catechory_all',sessionScope.locale)}
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
                <li><a href="/mall/today">${afn:getMessage('todayPrice_cate',sessionScope.locale)}</a></li>
<%--                <li><a href="#">이벤트</a></li>--%>
                <li><a href="/giveaway">${afn:getMessage('giveaway',sessionScope.locale)}</a></li>
                <li><a href="/product?product_ct=808">${afn:getMessage('special_edition',sessionScope.locale)}</a></li>
                <li><a href="/product?product_ct=880">${afn:getMessage('travel',sessionScope.locale)}</a></li>
                <li><a href="http://onejoymcm.com">${afn:getMessage('live_shopping',sessionScope.locale)}</a></li>
            </ul>
            <div class="search-box">
                <div class="cart-box">
                    <a href="/MyPage/ShoppingBasket">
                        <i class="cart-ic"></i>
                        <span class="cart-num">${searchVO.totRow}</span>
                    </a>
                </div>
                <form action="/product/search-page" id="main-search-form" name="main-search-form" method="get">
                    <input type="text" id="main-search" name="product_name" class="input-text" value="${param.product_name}">
                    <button id="main-search-btn" type="submit" class="search-btn"></button>
                <c:if test="${fn:contains(header.referer, 'search-page') && not empty param.product_ct}">
                    <input type="hidden" name="product_ct" value="${param.product_ct}">
                </c:if>
                <c:if test="${not empty param.product_delivery_International_type}">
                    <input type="hidden" name="product_delivery_International_type" value="${param.product_delivery_International_type}">
                </c:if>
                <c:if test="${not empty param.product_delivery_payment_class}">
                    <input type="hidden" name="product_delivery_payment_class" value="${param.product_delivery_payment_class}">
                </c:if>
                <c:if test="${not empty param.product_brand}">
                    <input type="hidden" name="product_brand" value="${param.product_brand}">
                </c:if>
                <c:if test="${not empty param.product_option_color}">
                    <input type="hidden" name="product_option_color" value="${param.product_option_color}">
                </c:if>
                <c:if test="${not empty param.product_score}">
                    <input type="hidden" name="product_score" value="${param.product_score}">
                </c:if>
                <c:if test="${not empty param.product_score}">
                    <input type="hidden" name="product_score" value="${param.product_score}">
                </c:if>
                </form>
            </div>
        </div>
    </div>
</header>
