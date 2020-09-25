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
        <h2 class="pb-1">${afn:getMessage('change_request',sessionScope.locale)}</h2>
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
                    <p class="grey">${paymentDetail.product_made_company_model}</p>
                </li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage('product_amount',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage('quantity',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${paymentDetail.payment_order_quantity}" groupingUsed="true" /></li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage('coupon_discount',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${paymentDetail.coupon_discount}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
            </ul>
        </ul>
        
        <h2 class="pb-1 mt-4">${afn:getMessage('change_reason',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">${afn:getMessage('reason_input',sessionScope.locale)}</p>
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
        
        
        <h2 class="pb-1 mt-4">${afn:getMessage('product_reclamation_information',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="grey pb-05">${afn:getMessage('delivery_user_name',sessionScope.locale)}</p>
        <input name = "return_user_name" type="text" value="${delivery.delivery_user_name}" class="select-op">
        <p class="grey pt-2 pb-05">${afn:getMessage('contact_num',sessionScope.locale)}</p>
        <input name = "return_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op">
        <p class="grey pt-2 pb-05">${afn:getMessage('postcode',sessionScope.locale)}</p>
        <input name = "postcode" type="text" value="${delivery.postcode}" class="select-op">
        <p class="grey pt-2 pb-05">${afn:getMessage('address',sessionScope.locale)}</p>
        <input name = "roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
        <input name = "jibunAddress" type="hidden" value="${delivery.jibunAddress}" >
        <input name = "guide" type="hidden" value="${delivery.jibunAddress}" >
        <p class="grey pt-2 pb-05">${afn:getMessage('extraAddress',sessionScope.locale)}</p>
        <input name = "extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long">
        <button class="btn my-1" type="button" id="daumMapCall">${afn:getMessage('address_change',sessionScope.locale)}</button>
        
        <h2 class="pb-1 mt-4">${afn:getMessage('changepro_deliv_info',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="grey pb-05">${afn:getMessage('delivery_user_name',sessionScope.locale)}</p>
        <input name = "refund_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op">
        <p class="grey pt-2 pb-05">${afn:getMessage('contact_num',sessionScope.locale)}</p>
        <input name = "refund_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op">
        <p class="grey pt-2 pb-05">${afn:getMessage('postcode',sessionScope.locale)}</p>
        <input name = "refund_postcode" type="text" value="${delivery.postcode}" class="select-op">
        <p class="grey pt-2 pb-05">${afn:getMessage('address',sessionScope.locale)}</p>
        <input name = "refund_roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
        <input name = "refund_jibunAddress" type="hidden" value="${delivery.jibunAddress}" >
        <input name = "refund_guide" type="hidden" value="${delivery.jibunAddress}" >
        <p class="grey pt-2 pb-05">${afn:getMessage('extraAddress',sessionScope.locale)}</p>
        <input name = "refund_extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long">
        <button class="btn my-1" type="button" id="daumMapCall2">${afn:getMessage('address_change',sessionScope.locale)}</button>
        
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" id="formSubmit">${afn:getMessage('change_request',sessionScope.locale)}</a></li>
        </ul>
    </div>
<c:import url="/layout/footer"/>