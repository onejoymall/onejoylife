<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
    <section class="subheader">
        <div class="subTitle">${afn:getMessage('can_re_ch_back',sessionScope.locale)}</div>
    </section>
<form name="defaultForm" id="defaultForm" method="POST">
    <section class="wrap">
        <h2 class="pb-1">${afn:getMessage('cancel_req',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <ul class="flexbetween pb-1">
            <li>${afn:getMessage('store_order_no',sessionScope.locale)}</li>
            <li class="red">${paymentDetail.order_no}</li>
            <input type="hidden" name="merchant_uid" value="${paymentDetail.order_no}">
            <input type="hidden" name="cancel_request_amount" value="${paymentDetail.payment}">
        </ul>
        <ul class="flexbetween mb-1">
            <li>${afn:getMessage('order_date',sessionScope.locale)}</li>
            <li><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></li>
        </ul>
        <hr class="grey">
        <c:forEach var="list" items="${paymentBundleList}" varStatus="status">
	        <ul class="product pb-0">
	            <ul class="pb-0">
	                <li><img src="${list.file_1}" alt=""></li>
	                <li>
	                    <h5>${list.product_name}</h5>
	                    <p class="grey">${list.option_name}</p>
	                </li>
	            </ul>
	            <ul class="options">
	                <li>${afn:getMessage('product_amount',sessionScope.locale)}</li>
	                <li><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
	            </ul>
	        </ul>
        </c:forEach>
        
        <h2 class="pb-1 mt-4">${afn:getMessage('cancel_reason',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">${afn:getMessage('reason',sessionScope.locale)}</p>
		<input name="reason" type="text" class="select-op">
        
        <h2 class="pb-1 mt-4">${afn:getMessage('rollback_info',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="grey pb-05">${afn:getMessage('order_payment',sessionScope.locale)}</p>
        <h3><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('product_amount',sessionScope.locale)}</p>
        <h3><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)} <c:if test="${fn:length(paymentBundleList) > 1}"> 외 ${fn:length(paymentBundleList) - 1}건</c:if></h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('payment_payment',sessionScope.locale)}</p>
        <h3 class="red"><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('pay_method',sessionScope.locale)}</p>
        <h3>${paymentDetail.pay_method}</h3>
        
        <h2 class="pb-1 mt-4">${afn:getMessage('rollback_account',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">${afn:getMessage('bank_name',sessionScope.locale)}</p>
        <!-- <input name="refund_bank" type="text" class="select-op"> -->
        <select name="refund_bank" class="select-op">
            <c:if test="${not empty getSelectorList}">
                <option value="">${afn:getMessage('bank_name',sessionScope.locale)}</option>
                <c:forEach var="getSelectorList" items="${getSelectorList}" varStatus="status">
                    <option value="${getSelectorList.code_value}" >${getSelectorList.code_name}</option>
                </c:forEach>
            </c:if>
        </select>
        <p class="text-md mt-1 mb-05">${afn:getMessage('account',sessionScope.locale)}</p>
        <input type="text" name="refund_account"  class="select-op">
        <p class="text-md mt-1 mb-05">${afn:getMessage('account_name',sessionScope.locale)}</p>
        <input type="text" name="refund_holder" class="select-op">
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" id="formSubmit">${afn:getMessage('request',sessionScope.locale)}</a></li>
        </ul>
    </div>
    </form>
        <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>