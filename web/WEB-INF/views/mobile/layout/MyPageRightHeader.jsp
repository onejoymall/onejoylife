<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

	<div class="point-box clearfix">
    <p><span>${sessionScope.email}</span>${afn:getMessage('sir',sessionScope.locale)}<a href="<c:url value="/MyPage/mypage-12"/>" class="setting-i"></a></p>
    <div class="coupon clearfix">
        <div>
            <p class="c-sub-tit">${afn:getMessage('coupon',sessionScope.locale)}</p>
            <p class="c-sub-num"><a href="<c:url value="/MyPage/Coupon"/>"><span>${couponCnt}</span></a></p>
        </div>
        <div>
            <p class="c-sub-tit">${afn:getMessage('delivery_product',sessionScope.locale)}</p>
            <p class="c-sub-num"><a href="<c:url value="/MyPage/OrderAndDelivery?payment_status=R"/>"><span>${paymentCnt.rCnt}</span></a></p>
        </div>
        <div>
            <p class="c-sub-tit">${afn:getMessage('giveaway_contest',sessionScope.locale)}</p>
            <p class="c-sub-num"><a href="<c:url value="/MyPage/GiveawayWinningList"/>"><span>${giveawayCnt}</span></a></p>
        </div>
    </div>
    <div class="point">
        <div class="clearfix">
            <p>${afn:getMessage('epoint',sessionScope.locale)}</p>
            <p><a href="<c:url value="/MyPage/ePoint"/>"><fmt:formatNumber value="${point_amount}" groupingUsed="true" /></a></p>
        </div>
        <div class="clearfix">
            <p>${afn:getMessage('ojt',sessionScope.locale)}</p>
            <p><a href="">${afn:getMessage('Preparing',sessionScope.locale)}</a></p>
        </div>
        <%--<div class="clearfix">
            <p>OJST</p>
            <p><a href="">준비중</a></p>
        </div>--%>
    </div>
</div>