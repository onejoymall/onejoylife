<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-31
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <c:import url="/layout/scrollRight"/>
            <h3>${categoryRowData.pd_category_name}</h3>

            <c:if test="${not empty categoryRowData.file_link3 and categoryRowData.pd_category_event_use_yn eq 'Y' || not empty categoryRowData.file_link5 and categoryRowData.event_use_yn eq 'Y'}">
            <section class="main-section">
                <h2 class="main-section-title hide">main section</h2>
                <article class="main-slider">
                    <h3 class="main-slider-title hide">main slider</h3>
                    <div class="main-slider-inner">
                        <ul class="main-slider-wrap">
                            <c:if test="${not empty categoryRowData.file_link3 and categoryRowData.pd_category_event_use_yn eq 'Y'}">
                                <li id="main-slide-1"><a href="#" style="background: url(${categoryRowData.file_link3}) no-repeat center / contain !important;"></a></li>
                            </c:if>

                            <c:if test="${not empty categoryRowData.file_link5 and categoryRowData.event_use_yn eq 'Y'}">
                                <li id="main-slide-1"><a href="#" style="background:url(${categoryRowData.file_link5}) no-repeat center / contain !important;"></a></li>
                            </c:if>
                        </ul>
                    </div>
                </article>
            </section>
            </c:if>
            <p class="gift-amount">${categoryRowData.pd_category_name} ${afn:getMessage("msg.prolist_allcate",sessionScope.locale)} <span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span>${afn:getMessage("msg.today.EntProduct",sessionScope.locale)}</p>

            <form id="form1" name="form1"  method="get">
                <div class="sort-tab">
                    <div class="sort-tab-left">
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=1"/>'">${afn:getMessage("shortRanking",sessionScope.locale)}</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2"/>'">${afn:getMessage("shortLowPrice",sessionScope.locale)}</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3"/>'">${afn:getMessage("shorthighPrice",sessionScope.locale)}</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=4"/>'">${afn:getMessage("shortSales",sessionScope.locale)}</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=5"/>'">${afn:getMessage("shortNewest",sessionScope.locale)}</button>
                    </div>
                    <div class="sort-tab-right">
                        <select name="displayRowCount" class="order-select">
                            <option value="12" <c:if test="${searchVO.displayRowCount ==12}">selected</c:if>>${afn:getMessage("display_row12",sessionScope.locale)}</option>
                            <option value="32" <c:if test="${searchVO.displayRowCount ==32}">selected</c:if>>${afn:getMessage("display_row32",sessionScope.locale)}</option>
                            <option value="64" <c:if test="${searchVO.displayRowCount ==64}">selected</c:if>>${afn:getMessage("display_row64",sessionScope.locale)}</option>
                            <option value="128" <c:if test="${searchVO.displayRowCount ==128}">selected</c:if>>${afn:getMessage("display_row128",sessionScope.locale)}</option>
                        </select>
                    </div>
                </div>
                <div class="point-product-list">
                <div class="row clearfix">
            <c:if test="${not empty list}">
                <c:forEach var="list" items="${list}" varStatus="status">
                <c:set var="lineCut" value="${status.count%4}"></c:set>
                <div class="point-product-item">
                
              	 <input type="hidden" name="order_max" value="${list.product_max_limit}" />
                 <input type="hidden" name="order_min" value="${list.product_min_limit}" />
                 <input type="hidden" name="product_option_yn" value="${list.product_option_yn}" />
                     
                    
                     
                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                        <div class="img-out">
                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/300x300'" >
                        </div>
                        <p class="sale-percent">${list.percent_discount} <span>%</span></p>
                   <%--      <i class="share-ic" onclick="share_product('${list.product_cd}', '${list.product_name}')"></i> --%>
                        <p class="info-production">${list.product_made_company_name}</p>
                        <p class="point-pdt-title">${list.product_name}</p>
                    </a>
                    <p class="info-price">
                        <span class="price-before">
                            <fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</span>
                        <i class="right-arrow"></i><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}
                    </p>
                    <p class="info-score">
                    
                        <i class="star-ic"></i>
                
                     	<c:if test="${list.review_score == NULL }"><span class="score-number">0.0</span></c:if>
    					<c:if test="${list.review_score != NULL }"><span class="score-number">${list.review_score}</span></c:if>
                       
                        <c:if test="${list.review_cnt == NULL }"><span class="score-text">0${afn:getMessage("reviewCount",sessionScope.locale)}</span></c:if>
                        <c:if test="${list.review_cnt != NULL }"><span class="score-text">${list.review_cnt}${afn:getMessage("reviewCount",sessionScope.locale)}</span></c:if>
                       <i class="share-ic" onclick="share_product('${list.product_cd}', '${list.product_name}')"></i> 
                       <a href="#"  onclick="addShoppingBasketF('${list.product_cd}')" class="list-cartic"></a>
                       <%--  <button class="incart" type="button" onclick="addShoppingBasket('${list.product_cd}')">장바구니</button> --%>
                    </p>
                </div>
                <c:if test="${lineCut  == 0}">
            </div>
            <div class="row clearfix">
            </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            ${afn:getMessage("msg.none_content",sessionScope.locale)}
        </c:if>
            </div>
        </div>

                <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
                <input type="hidden" name="product_ct" value="${param.product_ct}">
<%--                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">--%>
            </form>
    </article>
</section>
<script>
    $('.order-select').on("change",function () {
        $('#form1').submit();
    })
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>