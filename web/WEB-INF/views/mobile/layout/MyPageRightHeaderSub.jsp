<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

	<div class="subTitle"><i class="mem-i"></i><strong>${sessionScope.email}</strong>님 안녕하세요</div>
    <div class="bg_grey py-1">
        
        <ul class="status">
            <li>${afn:getMessage('coupon',sessionScope.locale)}</li>
            <li><a href="<c:url value="/MyPage/Coupon"/>">${couponCnt} ${afn:getMessage('cou_count',sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></li>
        </ul>
        <ul class="status">
            <li>${afn:getMessage('delivery_product',sessionScope.locale)}</li>
            <li><a href="<c:url value="/MyPage/OrderAndDelivery?payment_status=R"/>">${paymentCnt.rCnt} ${afn:getMessage('piece',sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></li>
        </ul>
        <ul class="status">
            <li>${afn:getMessage('contest_product',sessionScope.locale)}</li>
            <li><a href="<c:url value="/MyPage/GiveawayWinningList"/>">${giveawayCnt} ${afn:getMessage('cou_count',sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></li>
        </ul>
        <ul class="status">
            <li>E-point</li>
            <li><a href="<c:url value="/MyPage/ePoint"/>"><fmt:formatNumber value="${point_amount}" groupingUsed="true" /> p <i class="ri-arrow-right-s-line"></i></a></li>
        </ul>
        <!-- <ul class="status">
            <li>OJT</li>
            <li><a href="#">999,999,999 coin <i class="ri-arrow-right-s-line"></i></a></li>
        </ul>
        <ul class="status">
            <li>OJST</li>
            <li><a href="#">999,999,999 coin <i class="ri-arrow-right-s-line"></i></a></li>
        </ul> -->
        </div>
        