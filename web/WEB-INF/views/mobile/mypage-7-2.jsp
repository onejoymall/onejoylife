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
        <h2 class="pb-1">${afn:getMessage('rollback_req',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <ul class="flexbetween pb-1">
            <li>${afn:getMessage('storeorder_num',sessionScope.locale)}</li>
            <li class="red">${paymentDetail.order_no}</li>
        </ul>
        <ul class="flexbetween mb-1">
            <li>${afn:getMessage('order_date',sessionScope.locale)}</li>
            <li><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></li>
            <input type="hidden" name="order_no" value="${paymentDetail.no}">
            <input type="hidden" name="cancel_request_amount" value="${paymentDetail.payment}">
        </ul>
        <hr class="grey">
        <ul class="product pb-0">
            <ul class="pb-0">
                <li><img src="${paymentDetail.file_1}" alt=""></li>
                <li>
                    <h5>${paymentDetail.product_name}</h5>
                    <p class="grey">${paymentDetail.option_name}</p>
                </li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage('product_amount',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage('product_quantity',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${paymentDetail.payment_order_quantity}" groupingUsed="true" /></li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage('coupon_discount',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${paymentDetail.coupon_discount}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
            </ul>
        </ul>
        
        <h2 class="pb-1 mt-4">${afn:getMessage('return_reasons',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">${afn:getMessage('return_reasons',sessionScope.locale)}</p>
        <div class="textarea mt-05">
           <span>(0/250)</span>
           <textarea name="reason" id="reason" class="width-100"></textarea>
        </div>
        <div class="card-rd-box">
		     <input type="radio" id="card-rd1" value="카드변경" onclick="txInput('reason',this.value)">
		     <label for="card-rd1">${afn:getMessage('changeCard',sessionScope.locale)}</label>
		     <input type="radio" id="card-rd2" value="결제방식 변경" onclick="txInput('reason',this.value)">
		     <label for="card-rd2">${afn:getMessage('changePay',sessionScope.locale)}</label>
		</div>
		   <script>
			function txInput(Obj,Str)
			{
			  document.getElementById(Obj).value = Str;
				}
		  </script>
        
        <h2 class="pb-1 mt-4">${afn:getMessage('returncollection_informationinput',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="mt-1 mb-05">${afn:getMessage('msg.return.shipment',sessionScope.locale)}</p>
        <div class="my-1">
            <input type="radio" id="tab1-rd" name="refund_send_type" checked value="Y">
            <label for="tab1-rd">${afn:getMessage('msg.returnshipment.yes',sessionScope.locale)}</label>
        </div>
        <div class="mb-2">
            <input type="radio" id="tab2-rd" name="refund_send_type" value="N">
            <label for="tab2-rd">${afn:getMessage('msg.returnshipment.no',sessionScope.locale)}</label>
        </div>
        <p class="grey pb-05">${afn:getMessage('return_shipmentdate',sessionScope.locale)}</p>
        <input type="text" id="from_date" class="date_pick" name="refund_send_date">
        <p class="grey pt-2 pb-05">${afn:getMessage('return_courierservice',sessionScope.locale)}</p>
        <select class="full mb-05" name="refund_delivery_t_code">
            <c:forEach var="companyList" items="${companyList}" varStatus="status">
			  <option value="${companyList.name}">${companyList.name}</option>
			</c:forEach>
         </select>
        <p class="grey pt-2 pb-05">${afn:getMessage('return_invoicenumber',sessionScope.locale)}</p>
        <input type="text" name="refund_delivery_t_invoice" class="num-s" >
        
        <h2 class="pb-1 mt-4">${afn:getMessage('payment_info',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="grey pb-05">${afn:getMessage('order_payment',sessionScope.locale)}</p>
        <h3><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('product_amount',sessionScope.locale)}</p>
        <h3><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('return_amount',sessionScope.locale)}</p>
        <h3 class="red"><fmt:formatNumber value="${paymentDetail.product_payment * paymentDetail.payment_order_quantity - paymentDetail.coupon_discount}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</h3>
        <p class="grey pt-2 pb-05">${afn:getMessage('pay_method',sessionScope.locale)}</p>
        <h3>${paymentDetail.pay_method}</h3>
        <input type="hidden" name="pay_method" value="${paymentDetail.pay_method}"/>
        
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