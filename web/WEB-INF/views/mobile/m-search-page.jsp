<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/main-header"/>

    <section class="wrap category-wrap">
        
        <article class="epoint-gift-wrap">
            <div class="inner clearfix">
                <div class="sort-tab">
                    <div class="sort-tab-left">
                        <c:if test="${not empty param.product_ct}">
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=1&product_name=${param.product_name}"/>'">랭킹순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2&product_name=${param.product_name}"/>'">낮은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3&product_name=${param.product_name}"/>'">높은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=4&product_name=${param.product_name}"/>'">판매량</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=5&product_name=${param.product_name}"/>'">최신순</button>
                        </c:if>
                        <c:if test="${empty param.product_ct}">
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=1&product_name=${param.product_name}"/>'">랭킹순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?orderByKey=product_payment&orderByValue=ASC&sortOrder=2&product_name=${param.product_name}"/>'">낮은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?orderByKey=product_payment&orderByValue=DESC&sortOrder=3&product_name=${param.product_name}"/>'">높은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=4&product_name=${param.product_name}"/>'">판매량</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=5&product_name=${param.product_name}"/>'">최신순</button>
                        </c:if>
                    </div>
                </div>
                <div class="point-product-list">
                	<c:if test="${not empty list}">
                	<c:forEach var="list" items="${list}" varStatus="status">
                    <div class="point-product-item">
                        <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/300x300'" >
                            <p class="info-production">${list.product_made_company_name}</p>
                            <p class="point-pdt-title">${list.product_name}</p>
                        </a>
                        <p class="info-price">
                            <span class="price-before"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</span><br><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원
                        </p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">(5,324)</span>
                        </p>
                    </div>
                    </c:forEach>
       				</c:if>
            </div>
        </article>
    </section>
    
    <%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>