<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="point-box clearfix">
    <p><span>${sessionScope.email}</span>님<a href="<c:url value="/MyPage/Coupon"/>" class="setting-i"></a></p>
    <div class="coupon clearfix">
        <div>
            <p class="c-sub-tit">쿠폰</p>
            <p class="c-sub-num"><a href="<c:url value="/MyPage/Coupon"/>"><span>${couponCnt}</span></a></p>
        </div>
        <div>
            <p class="c-sub-tit">배송중</p>
            <p class="c-sub-num"><a href="<c:url value="/MyPage/OrderAndDelivery"/>"><span>${paymentCnt.rCnt}</span></a></p>
        </div>
        <div>
            <p class="c-sub-tit">응모중인 경품</p>
            <p class="c-sub-num"><a href="<c:url value="/MyPage/GiveawayWinningList"/>"><span>${giveawayCnt}</span></a></p>
        </div>
    </div>
    <div class="point">
        <div class="clearfix">
            <p>E-POINT</p>
            <p><a href="<c:url value="/MyPage/ePoint"/>"><fmt:formatNumber value="${point_amount}" groupingUsed="true" /></a></p>
        </div>
        <!-- <div class="clearfix">
            <p>OJT</p>
            <p><a href="">999,999,999</a></p>
        </div>
        <div class="clearfix">
            <p>OJST</p>
            <p><a href="">999,999,999</a></p>
        </div> -->
    </div>
</div>