<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <section class="main-section">
        <h2 class="main-section-title hide">main section</h2>
        <article class="epoint-gift-wrap">
            <div class="inner clearfix">
                <form id="form1" name="form1"  method="post">
                    <div class="sort-tab">
                        <div class="sort-tab-left">
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=1&product_name=${param.product_name}"/>'">랭킹순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2&product_name=${param.product_name}"/>'">낮은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3&product_name=${param.product_name}"/>'">높은가격순</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=4&product_name=${param.product_name}"/>'">판매량</button>
                            <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=5&product_name=${param.product_name}"/>'">최신순</button>
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
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>