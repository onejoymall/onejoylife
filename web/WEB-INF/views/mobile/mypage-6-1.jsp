<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
    <section class="subheader">
        <div class="subTitle">${afn:getMessage('order_detail',sessionScope.locale)}</div>
    </section>
    
    <section class="wrap">
        <h2 class="pb-1">${afn:getMessage('order_detail',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <ul class="flexbetween pb-1">
            <li>${afn:getMessage('storeorder_num',sessionScope.locale)}</li>
            <li class="red">${paymentDetail.order_no}</li>
        </ul>
        <ul class="flexbetween pb-1">
            <li>${afn:getMessage('ordernum',sessionScope.locale)}</li>
            <li class="red">${paymentDetail.imp_uid}</li>
        </ul>
        <ul class="flexbetween mb-1">
            <li>${afn:getMessage('order_date',sessionScope.locale)}</li>
            <li><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></li>
        </ul>
        <hr class="grey">
        <ul class="product pb-0">
           <c:forEach var="list" items="${paymentBundleList}" varStatus="status">
           <h5>${list.payment_status_name}</h5>
            <ul class="pb-0">
                <li><a href="/product/productDetail?product_cd=${list.product_cd}"><img src="${list.file_1}" alt=""></a></li>
                <li>
	               <a href="/product/productDetail?product_cd=${list.product_cd}">
	                   <h5>${list.product_name}</h5>
	               </a>
                </li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage('product_amount',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
            </ul>
            <ul class="options mb-1">
                <li>${afn:getMessage('quantity',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${list.payment_order_quantity}" groupingUsed="true" /> <span>${afn:getMessage('piece',sessionScope.locale)}</span></li>
            </ul>
            <div class="my-1">
                <!-- <button class="btn">배송지 변경</button> -->
                <c:if test="${list.payment_status eq 'W' || list.payment_status eq 'D'}">
                <button type="button" class="btn btn-red" onclick="location.href='/MyPage/OrderCancel?order_no=${list.order_no}'">${afn:getMessage('full_cancellation',sessionScope.locale)}</button>
                </c:if>
                <c:if test="${list.payment_status eq 'R' || list.payment_status eq 'S'}">
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderCancel?order_no=${list.no}'">${afn:getMessage('delivery_check',sessionScope.locale)}</button>
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderChange?order_no=${list.no}'">${afn:getMessage('change_request',sessionScope.locale)}</button>
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderRollback?order_no=${list.no}'">${afn:getMessage('rollback_req',sessionScope.locale)}</button>
				</c:if>
                <c:if test="${list.payment_status eq 'O'}">
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderChange?order_no=${list.no}'">${afn:getMessage('change_request',sessionScope.locale)}</button>
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderRollback?order_no=${list.no}'">${afn:getMessage('rollback_req',sessionScope.locale)}</button>
                </c:if>
                   <c:if test="${list.payment_status eq 'M'}">
                <button type="button" class="btn btn-red" onclick="location.href='/MyPage/OrderCancel?order_no=${list.order_no}'">${afn:getMessage('full_cancellation',sessionScope.locale)}</button>
             
                </c:if>
                
             
            </div>
            <hr>
            </c:forEach>
        </ul>
        
        <h2 class="pb-1 mt-4">${afn:getMessage('delivery_address',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="grey pb-05">${afn:getMessage('delivery_user_name',sessionScope.locale)}</p>
        <h3>${delivery.delivery_user_name}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('delivery_user_phone',sessionScope.locale)}</p>
        <h3>${delivery.delivery_user_phone}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('deliv_receiveADDR',sessionScope.locale)}</p>
        <h3>${delivery.postcode} ${delivery.roadAddress} ${delivery.extraAddress}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('delivery_message_select',sessionScope.locale)}	</p>
        <h3>${delivery.delivery_message}</h3>
        <c:if test="${not empty paymentDetail.delivery_hope_date}">
            <p class="grey pt-2 pb-05">${afn:getMessage('delivery_hope_date',sessionScope.locale)}</p>
            <h3>${paymentDetail.delivery_hope_date} ${paymentDetail.delivery_hope_time}</h3>
        </c:if>
        
        <ul class="flexbetween pb-1 mt-4">
            <li><h2>${afn:getMessage('payment_info',sessionScope.locale)}</h2></li>
            <!-- <li><button class="btn">신용카드 전표</button></li> -->
        </ul>
        
        <hr class="pb-1">
        <p class="grey pb-05">${afn:getMessage('order_payment',sessionScope.locale)}</p>
        <h3><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('product_amount',sessionScope.locale)}</p>
        <h3><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)} <c:if test="${fn:length(paymentBundleList) > 1}"> ${afn:getMessage('other',sessionScope.locale)} ${fn:length(paymentBundleList) - 1}${afn:getMessage('case',sessionScope.locale)}</c:if></h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('payment_payment',sessionScope.locale)}</p>
        <h3 class="red"><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('pay_method',sessionScope.locale)}</p>
        <h3>${paymentDetail.pay_method_name} ${paymentDetail.vbank_name} ${paymentDetail.vbank_num}</h3>
        
        <!--20.07.06 추가~-->
        <hr class="mt-4">
        <section class="subheader bg_grey py-1">
        	<c:if test="${impPayment.status == 'paid'}">
        		<ul class="calculator p-1">
	                <li>${afn:getMessage('tax_bill',sessionScope.locale)}</li>
	                <li><a href="javascript:taxInvoice('${paymentDetail.order_no}');">${afn:getMessage('tax_bill_sand',sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
	            <ul class="calculator p-1">
	                <li>${afn:getMessage('receipt',sessionScope.locale)}</li>
	                <li><a href="javascript:normalReceipt('${paymentDetail.order_no}');">${afn:getMessage('receipt_output',sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
           </c:if>
           <c:if test="${impPayment.status == 'paid' && impPayment.payMethod != 'card'}">
	            <ul class="calculator p-1">
	                <li>${afn:getMessage('cash_receipt',sessionScope.locale)}</li>
	                <li><a href="javascript:cashReceipt('${paymentDetail.order_no}');">${afn:getMessage('cash_receipt_request',sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
           </c:if>
           <c:if test="${impPayment.status == 'paid'}">
	            <ul class="calculator p-1">
	                <li>${afn:getMessage('transaction_statement',sessionScope.locale)}</li>
	                <li><a href="javascript:transactionStatement('${paymentDetail.order_no}');">${afn:getMessage('transaction_statement_output',sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
            </c:if>
			<c:if test="${impPayment.status == 'paid' && impPayment.payMethod == 'card'}">
	            <ul class="calculator p-1">
	                <li>${afn:getMessage('sales_statement',sessionScope.locale)}</li>
	                <li><a href="javascript:salesStatement('${paymentDetail.order_no}');">${afn:getMessage('sales_statement_output',sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
	        </c:if>
        </section>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="/MyPage/OrderAndDelivery" class="btn ">${afn:getMessage('view_list',sessionScope.locale)}</a></li>
        </ul>
    </div>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>