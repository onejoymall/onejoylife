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
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <c:import url="/layout/scrollRight"/>
            <h3>${afn:getMessage("epointRaffel",sessionScope.locale)}</h3>
            <p class="gift-amount">${afn:getMessage("msg_epoint1-1",sessionScope.locale)}<span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span>${afn:getMessage("msg_epoint1-2",sessionScope.locale)}</p>
            <form id="form1" name="form1"  method="get">
                <div class="sort-tab">
                    <div class="sort-tab-left">
                        <button type="button" class="sort-tab-item <c:if test="${empty searchVO.sortOrder}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/giveaway"/>'">ALL</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 1}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=DESC&sortOrder=1&parti_rate=100"/>'">추첨완료</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=ASC&sortOrder=2"/>'">${afn:getMessage("lowpriceord",sessionScope.locale)}</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/giveaway?product_ct=${param.product_ct}&orderByKey=giveaway_payment&orderByValue=DESC&sortOrder=3"/>'">${afn:getMessage("highpriceord",sessionScope.locale)}</button>
                    </div>
                    <div class="sort-tab-right">
                        <select name="displayRowCount" class="order-select">
                            <option value="9" <c:if test="${searchVO.displayRowCount ==9}">selected</c:if>>${afn:getMessage("9each",sessionScope.locale)}</option>
                            <option value="24" <c:if test="${searchVO.displayRowCount ==24}">selected</c:if>>${afn:getMessage("24each",sessionScope.locale)}</option>
                            <option value="60" <c:if test="${searchVO.displayRowCount ==60}">selected</c:if>>${afn:getMessage("60each",sessionScope.locale)}</option>
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
                                <i class="share-ic" onclick="share_giveaway('${list.giveaway_id}', '${list.giveaway_name}')"></i>
                                <p class="point-pdt-title"> ${list.giveaway_name}</p>
                            </a>
                            <p class="point-pdt-price"><fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /> ${afn:getMessage("korea_won",sessionScope.locale)}</p>
                            <p class="deadline">
                                <c:set var="deadline" value="${fn:split(list.giveaway_validity,'~')}"/>
                                <c:out value='~${deadline[1]}'/>
                            </p>
                            <div class="point-pdt-parti-wrap">
                                <div class="parti-percent-wrap">
                                    <span class="progress">0%</span>
                                    <span class="progress-now">${afn:getMessage("parti_rate",sessionScope.locale)} <span class="progress-now-number">${list.parti_rate}%</span><span class="parti-ppl"><%-- &#40;<span class="parti-ppl-number"><fmt:formatNumber value="${list.player_count}" groupingUsed="true" /></span>명 참여 중&#41;--%></span></span>
                                    <span class="progress">100%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-bar-active" style="width:${list.parti_rate}%"></div>
                                </div>
                                <div class="parti-point-wrap">
                                    <p><span class="parti-point-now"><fmt:formatNumber value="${list.sum_play_point}" groupingUsed="true" /></span>/<fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /> E-point</p>
                                    <p>&#40;${afn:getMessage("currentallpoint",sessionScope.locale)}&#41;</p>
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
                   ${afn:getMessage("nomoretoShow",sessionScope.locale)}
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
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>