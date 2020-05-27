<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/main-header"/>
    <section class="subheader">
        <div class="subTitle">E-point 경품추첨</div>
    </section>
    <section class="wrap category-wrap">
        <p class="gift-amount">경품 카테고리에 <span class="gift-amount-number">1,017</span>개의 상품이 등록되어 있습니다.</p>

        <article class="epoint-gift-wrap">
            <div class="inner clearfix">
                <div class="sort-tab clearfix">
                    <div class="sort-tab-left">
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 1}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=DESC&sortOrder=1&parti_rate=100"/>'">추첨완료</button>
                        <button type="button" class="sort-tab-item <c:if test="${empty searchVO.sortOrder}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/giveaway"/>'">ALL</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=ASC&sortOrder=2"/>'">낮은가격순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=DESC&sortOrder=3"/>'">높은가격순</button>
                    </div>
                </div>
                <div class="point-product-list">
                    <ul class="mainList-big">
                <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}" varStatus="status">
                        <li>
                            <div class="img-box">
                                <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id="/>${list.giveaway_id}">
                                    <img src='${list.file_1}' onerror="this.src='http://placehold.it/400x300'" >
                                </a>
            <!--                    <p class="saleBox">35%</p>-->
                                <a href="#" class="share-ic"></a>
                            </div>
                            <a href="#" class="mainList-big-text">
                                <p class="list-title"> ${list.giveaway_name}</p>
                                <p><ins><fmt:formatNumber value="${list.giveaway_payment}" groupingUsed="true" /> E-point</ins>
                                    <span class="day-c">
                                    <c:set var="deadline" value="${fn:split(list.giveaway_validity,'~')}"/>
                                    <c:out value='~${deadline[1]}'/>
                                    </span>
                                </p>
                                <div class="progress-wrap">
                                    <p class="progress-now">참여율 <b class="red">${list.parti_rate}%</b></p>
                                    <div class="progress-bar">
                                        <div class="progress-bar-active" style="width:${list.parti_rate}%"></div>
                                    </div>
                                    <p class="parti"><span><fmt:formatNumber value="${list.player_count}" groupingUsed="true" /></span>명 참여 중</p>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </c:if>
                <c:if test="${empty list}">
                    표시할 내용이 없습니다.
                </c:if>
                    </ul>

                </div>
            </div>
        </article>
    </section>


<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>