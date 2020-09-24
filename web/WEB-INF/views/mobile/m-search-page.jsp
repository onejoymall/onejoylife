<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/main-header"/>

    <section class="wrap category-wrap">
        
        <article class="epoint-gift-wrap">
            <div class="inner clearfix">
                <div class="sort-tab">
                    <div class="sort-tab-left">
                        <c:if test="${not empty param.product_ct}">
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=1&product_name=${param.product_name}"/>'">${afn:getMessage("shortRanking",sessionScope.locale)}</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2&product_name=${param.product_name}"/>'">${afn:getMessage("shortLowPrice",sessionScope.locale)}</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3&product_name=${param.product_name}"/>'">${afn:getMessage("shorthighPrice",sessionScope.locale)}</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=4&product_name=${param.product_name}"/>'">${afn:getMessage("shortSales",sessionScope.locale)}</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=5&product_name=${param.product_name}"/>'">${afn:getMessage("shortNewest",sessionScope.locale)}</button>
                        </c:if>
                        <c:if test="${empty param.product_ct}">
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=1&product_name=${param.product_name}"/>'">${afn:getMessage("shortRanking",sessionScope.locale)}</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?orderByKey=product_payment&orderByValue=ASC&sortOrder=2&product_name=${param.product_name}"/>'">${afn:getMessage("shortLowPrice",sessionScope.locale)}</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?orderByKey=product_payment&orderByValue=DESC&sortOrder=3&product_name=${param.product_name}"/>'">${afn:getMessage("shorthighPrice",sessionScope.locale)}</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=4&product_name=${param.product_name}"/>'">${afn:getMessage("shortSales",sessionScope.locale)}</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=5&product_name=${param.product_name}"/>'">${afn:getMessage("shortNewest",sessionScope.locale)}</button>
                        </c:if>
                    </div>
                </div>
                <div class="point-product-list">
                	<c:if test="${not empty list}">
                	<c:forEach var="list" items="${list}" varStatus="status">
                    <div class="point-product-item">
                        <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                            <div class="img-out">
                                <img src='${list.file_1}' onerror="this.src='http://placehold.it/300x300'" >
                            </div>
                         	 <p class="sale-percent">${list.percent_discount} <span>%</span></p>
                       		
                  		  	 <p class="info-production">${list.product_made_company_name}</p> 
                             <p class="point-pdt-title">${list.product_name}</p>
                        </a>
                        <p class="info-price">
                            <span class="price-before"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</span><br><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}
                        </p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <c:if test="${list.review_score == 0 }"><span class="score-number" >0.0</span></c:if>
    					<c:if test="${list.review_score != NULL and  list.review_score != 0 }"><span class="score-number" >${list.review_score}</span></c:if>
                       
                        <c:if test="${list.review_cnt == NULL }"><span class="score-text">(0)</span></c:if>
                        <c:if test="${list.review_cnt != NULL }"><span class="score-text">(${list.review_cnt})</span></c:if>
						  <input type="hidden" name="product_option_yn" value="${list.product_option_yn}" />                    
						 <i class="share-ic" onclick="share_product('${list.product_cd}', '${list.product_name}')"></i>
						<a href="#"  onclick="addShoppingBasketF('${list.product_cd}')"class="list-cartic"></a>
                        </p>
                    </div>
                    </c:forEach>
       				</c:if>
            </div>
                <form id="form1" name="form1"  method="get">
                  		<c:if test="${not empty param.product_name}">
                        <input type="hidden" name="product_name" value="${param.product_name}">
                        </c:if>
                        <c:if test="${not empty param.product_ct}">
                        <input type="hidden" name=product_ct value="${param.product_ct}">
                        </c:if>
                        <c:if test="${not empty param.product_score}">
                        <input type="hidden" name="product_score" value="${param.product_score}">
                        </c:if>
                        <c:if test="${not empty param.product_option_color}">
                        <input type="hidden" name="product_option_color" value="${param.product_option_color}">
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
                        <c:if test="${not empty param.searchToPayment}">
                        <input type="hidden" name="searchToPayment" value="${param.searchToPayment}">
                        </c:if>
                        <c:if test="${not empty param.searchBePayment}">
                        <input type="hidden" name="searchBePayment" value="${param.searchBePayment}">
                        </c:if>
                        <c:if test="${not empty param.orderByKey}">
                        <input type="hidden" name="orderByKey" value="${param.orderByKey}">
                        </c:if>
                        <c:if test="${not empty param.orderByValue}">
                        <input type="hidden" name="orderByValue" value="${param.orderByValue}">
                        </c:if>
                    <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
                </form>
            </div>
        </article>
    </section>
        <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>