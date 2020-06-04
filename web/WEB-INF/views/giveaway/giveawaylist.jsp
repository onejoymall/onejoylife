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
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <c:import url="/layout/scrollRight"/>
            <h3>E-point 경품추첨</h3>
            <p class="gift-amount">경품 카테고리에 <span class="gift-amount-number">${searchVO.totRow}</span>개의 상품이 등록되어 있습니다.</p>
            <form id="form1" name="form1"  method="get">
                <div class="sort-tab">
                    <div class="sort-tab-left">
                        <button type="button" class="sort-tab-item <c:if test="${empty searchVO.sortOrder}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/giveaway"/>'">ALL</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 1}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=DESC&sortOrder=1&parti_rate=100"/>'">추첨완료</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=ASC&sortOrder=2"/>'">낮은가격순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=DESC&sortOrder=3"/>'">높은가격순</button>
                    </div>
                    <div class="sort-tab-right">
                        <select name="displayRowCount" class="order-select">
                            <option value="9" <c:if test="${searchVO.displayRowCount ==9}">selected</c:if>>9개씩 보기</option>
                            <option value="24" <c:if test="${searchVO.displayRowCount ==24}">selected</c:if>>24개씩 보기</option>
                            <option value="60" <c:if test="${searchVO.displayRowCount ==60}">selected</c:if>>60개씩 보기</option>
                        </select>
                    </div>
                </div>
                <div class="point-product-list">
                <div class="row clearfix">
                <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}" varStatus="status">
                        <c:set var="lineCut" value="${status.count%3}"></c:set>
                        <div class="point-product-item">
                            <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id="/>${list.giveaway_id}">
                                <img src='${list.file_1}' onerror="this.src='http://placehold.it/300x300'" >
<%--                                <i class="share-ic"></i>--%>
                                <p class="point-pdt-title"> ${list.giveaway_name}</p>
                            </a>
                            <p class="point-pdt-price"><fmt:formatNumber value="${list.giveaway_payment}" groupingUsed="true" /> 원</p>
                            <p class="deadline">
                                <c:set var="deadline" value="${fn:split(list.giveaway_validity,'~')}"/>
                                <c:out value='~${deadline[1]}'/>
                            </p>
                            <div class="point-pdt-parti-wrap">
                                <div class="parti-percent-wrap">
                                    <span class="progress">0%</span>
                                    <span class="progress-now">참여율 <span class="progress-now-number">${list.parti_rate}%</span><span class="parti-ppl"><%-- &#40;<span class="parti-ppl-number"><fmt:formatNumber value="${list.player_count}" groupingUsed="true" /></span>명 참여 중&#41;--%></span></span>
                                    <span class="progress">100%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-bar-active" style="width:${list.parti_rate}%"></div>
                                </div>
                                <div class="parti-point-wrap">
                                    <p><span class="parti-point-now"><fmt:formatNumber value="${list.sum_play_point}" groupingUsed="true" /></span>/<fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /> E-point</p>
                                    <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                                </div>
                            </div>
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
            </form>
    </article>
</section>
<script>
    $('.order-select').on("change",function () {
        $('#form1').submit();
    })
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>