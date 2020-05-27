<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-01
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <c:import url="/layout/scrollRight"/>
            <h3>오늘의 특가</h3>
            <div class="txt-box">
                <ul class="txt-box-ul">

                    <li class="<c:if test="${searchVO.product_ct eq null}">active</c:if>"><a href="/mall/today">전체</a></li>
            <c:if test="${not empty categoryList}">
                <c:forEach var="categoryList" items="${categoryList}" varStatus="status">
                    <li <c:if test="${searchVO.product_ct eq categoryList.pd_category_id}">class="active"</c:if> ><a href="/mall/today?product_ct=${categoryList.pd_category_id}">${categoryList.pd_category_name}</a></li>
                </c:forEach>
            </c:if>
                </ul>
            </div>
            <div class="banner-box">

            </div>
            <p class="gift-amount">오늘의 특가 전체 카테고리에 <span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span>개의 상품이 등록되어 있습니다.</p>
            <form id="form1" name="form1"  method="get">
                <div class="sort-tab">
                    <div class="sort-tab-left">
                        <c:if test="${not empty param.product_ct}">
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&sortOrder=1"/>'">랭킹순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2"/>'">낮은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3"/>'">높은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&sortOrder=4"/>'">판매량</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&sortOrder=5"/>'">최신순</button>
                        </c:if>
                        <c:if test="${empty param.product_ct}">
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/mall/today?sortOrder=1"/>'">랭킹순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?orderByKey=product_payment&orderByValue=ASC&sortOrder=2"/>'">낮은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/mall/today?orderByKey=product_payment&orderByValue=DESC&sortOrder=3"/>'">높은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?sortOrder=4"/>'">판매량</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/mall/today?sortOrder=5"/>'">최신순</button>
                        </c:if>
                    </div>
                    <div class="sort-tab-right">
                        <select name="displayRowCount" class="order-select">
                            <option value="12" <c:if test="${searchVO.displayRowCount ==12}">selected</c:if>>12개씩 보기</option>
                            <option value="32" <c:if test="${searchVO.displayRowCount ==32}">selected</c:if>>32개씩 보기</option>
                            <option value="64" <c:if test="${searchVO.displayRowCount ==64}">selected</c:if>>64개씩 보기</option>
                            <option value="128" <c:if test="${searchVO.displayRowCount ==128}">selected</c:if>>128개씩 보기</option>
                        </select>
                    </div>
                </div>
                <div class="point-product-list">
                    <div class="row clearfix">
                        <c:if test="${not empty list}">
                        <c:forEach var="list" items="${list}" varStatus="status">
                        <c:set var="lineCut" value="${status.count%4}"></c:set>
                        <div class="point-product-item">
                            <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                                <img src='${list.file_1}' onerror="this.src='http://placehold.it/300x300'" >
                                    <%--                        <p class="sale-percent">35<span>%</span></p>--%>
                                    <%--                        <i class="share-ic"></i>--%>
                                <p class="info-production">${list.product_made_company_name}</p>
                                <p class="point-pdt-title">${list.product_name}</p>
                            </a>
                            <p class="info-price">
                        <span class="price-before">
                            <fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</span>
                                <i class="right-arrow"></i><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원
                            </p>
                            <p class="info-score">
                                <i class="star-ic"></i>
                                <span class="score-number">4.5</span>
                                <span class="score-text">5,324개 평가</span>
                            </p>
                        </div>
                        <c:if test="${lineCut  == 0}">
                    </div>
                    <div class="row clearfix">
                        </c:if>
                        </c:forEach>
                        </c:if>
                        <c:if test="${empty list}">
                            표시할 내용이 없습니다.
                        </c:if>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
                <%--                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">--%>
            </form>
        </div>
    </article>
</section>
<script>
    $('.order-select').on("change",function () {
        $('#form1').submit();
    })
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

