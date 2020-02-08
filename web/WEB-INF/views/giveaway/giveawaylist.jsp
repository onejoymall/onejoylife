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
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <h3>E-point 경품추첨</h3>
            <p class="gift-amount">경품 카테고리에 <span class="gift-amount-number">${searchVO.totRow}</span>개의 상품이 등록되어 있습니다.</p>
            <div class="sort-tab">
                <div class="sort-tab-left">
                    <button type="button" class="sort-tab-item active">임박순</button>
                    <button type="button" class="sort-tab-item">낮은가격순</button>
                    <button type="button" class="sort-tab-item">높은가격순</button>
                </div>
                <div class="sort-tab-right">
                    <select name="order" class="order-select">
                        <option value="9" <c:if test="${param.staticRowEnd ==9}">selected</c:if>>9개씩 보기</option>
                        <option value="24" <c:if test="${param.staticRowEnd ==24}">selected</c:if>>24개씩 보기</option>
                        <option value="60" <c:if test="${param.staticRowEnd ==60}">selected</c:if>>60개씩 보기</option>
                    </select>
                </div>
            </div>
            <div class="point-product-list">
                <div class="row clearfix">
                <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}" varStatus="status">
                        <c:set var="lineCut" value="${status.count%3}"></c:set>
                        <div class="point-product-item">
                            <a href="<c:url value="/giveaway/giveawaydetail?giveway_id="/>${list.giveway_id}">
                                <img src="<c:url value="/assets/img/"/>${list.giveway_list_image}" />
                                <i class="share-ic"></i>
                                <p class="point-pdt-title"> ${list.giveway_name}</p>
                            </a>
                            <p class="point-pdt-price"><fmt:formatNumber value="${list.giveway_payment}" groupingUsed="true" /> E-point</p>
                            <p class="deadline">${list.giveway_validity}</p>
                            <div class="point-pdt-parti-wrap">
                                <div class="parti-percent-wrap">
                                    <span class="progress">0%</span>
                                    <span class="progress-now">참여율 <span class="progress-now-number">${list.parti_rate}%</span><span class="parti-ppl"> &#40;<span class="parti-ppl-number"><fmt:formatNumber value="${list.player_count}" groupingUsed="true" /></span>명 참여 중&#41;</span></span>
                                    <span class="progress">100%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-bar-active" style="width:${list.parti_rate}%"></div>
                                </div>
                                <div class="parti-point-wrap">
                                    <p><span class="parti-point-now"><fmt:formatNumber value="${list.sum_play_point}" groupingUsed="true" /></span>/<fmt:formatNumber value="${list.giveway_play_min_point}" groupingUsed="true" /> E-point</p>
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

                        <form id="form1" name="form1"  method="post">
                            <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
                            <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                        </form>

            </div>
        </div>
    </article>
</section>
<script>
    $('.order-select').on("change",function () {
        $('#staticRowEnd').val($(this).val())
        $('#form1').submit();
    })
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>