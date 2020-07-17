<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/main-header"/>

    <section class="subheader">
        <div class="subTitle">${categoryRowData.pd_category_name}</div>
    </section>
    
    <section class="wrap category-wrap">
        <form id="form1" name="form1"  method="get">
    	<p class="gift-amount">${categoryRowData.pd_category_name} 전체 <span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span>개의 상품이 등록되어 있습니다.</p>
		<article class="epoint-gift-wrap">
            <div class="inner clearfix">
                <div class="sort-tab clearfix">
                    <div class="sort-tab-left">
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '1'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=1"/>'">랭킹순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2"/>'">낮은가격순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '3'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3"/>'">높은가격순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '4'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=4"/>'">판매량</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '5'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=5"/>'">최신순</button>
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
                        <i class="share-ic"></i>
                            
                            <p class="info-production">${list.product_made_company_name}</p>
                            <p class="point-pdt-title">${list.product_name}</p>
                        </a>
                        <p class="info-price">
                            <span class="price-before"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</span><br><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원
                        </p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <c:if test="${list.review_score == NULL }"><span class="score-number">0.0</span></c:if>
    						<c:if test="${list.review_score != NULL }"><span class="score-number">${list.review_score}</span></c:if>
                            
                            
                           <c:if test="${list.review_cnt == NULL }"><span class="score-text">(0)</span></c:if>
                      	   <c:if test="${list.review_cnt != NULL }"><span class="score-text">(${list.review_cnt})</span></c:if>
                          
                           <input type="hidden" name="product_option_yn" value="${list.product_option_yn}" />
                           <a href="#"  onclick="addShoppingBasketF('${list.product_cd}')"class="list-cartic"></a>
                        </p>
                    </div>
                    </c:forEach>
       				</c:if>
                </div>

                    <input type="hidden" name="product_ct" value="${param.product_ct}">
                    <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
            </div>
        </article>
        </form>
    </section>

    <%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>