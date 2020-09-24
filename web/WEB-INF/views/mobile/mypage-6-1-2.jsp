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
		<input name="reason" id="reason" type="text" class="select-op">
		 <div class="card-rd-box">
		     <input type="radio" id="card-rd1" value="카드변경" name="card-rd" onclick="txInput('reason',this.value)">
		     <label for="card-rd1">${afn:getMessage('changeCard',sessionScope.locale)}</label>
		     <input type="radio" id="card-rd2" value="결제방식 변경"  name="card-rd" onclick="txInput('reason',this.value)">
		     <label for="card-rd2">${afn:getMessage('changePay',sessionScope.locale)}</label>
		</div>
		   <script>
			function txInput(Obj,Str)
			{
			  document.getElementById(Obj).value = Str;
				}
		  </script>
        
         <!--  
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
         -->
       <!-- 
        <h2 class="pb-1 mt-4">${afn:getMessage('rollback_account',sessionScope.locale)}</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">${afn:getMessage('bank_name',sessionScope.locale)}</p>
        <!-- <input name="refund_bank" type="text" class="select-op">
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
         -->   
    </section>
    <div class="bottomBtns">
        <ul>
           <!-- <li><a href="#" id="formSubmit">${afn:getMessage('request',sessionScope.locale)}</a></li>-->
           <li><a href="#" id="payCancel">${afn:getMessage('request',sessionScope.locale)}</a></li> 
    
        </ul>
    </div>
    </form>
        <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>

<script>
$('#payCancel').on("click",function () {
    var formData = $('#defaultForm').serialize();
    var alertType;
    var showText;

    jQuery.ajax({
        type: $('#defaultForm').attr('method'),
        url: postUrl,
        // enctype: 'multipart/form-data',
        data: formData,
        success: function (data) {
            // console.log(data.validateError)
            if (data.validateError) {
                $('.validateError').empty();
                console.log(data);
                $.each(data.validateError, function (index, item) {
                    // $('#validateError'+index).removeClass('none');
                    // $('#validateError'+index).html('* '+item);
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + " "+getMessageAjax('is')+" " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error',
                    });
                });

            } else {
                // loginAuth(data.access_token);
                if (data.success) {
                    $.toast({
                        text: 'success',
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        icon: 'success',
                        hideAfter: 2000,
                        afterHidden: function () {
                        	if(data.redirectUrl){
                        		location.href=data.redirectUrl;	
                        	}else{
                        		location.reload();
                        	}
                        }
                    });
                } else{
                	if(data.redirectUrl){
                		location.href=data.redirectUrl;	
                	}else{
                		$.toast({
                            text: "ERROR",
                            showHideTransition: 'plain', //펴짐
                            position: 'bottom-right',
                            heading: 'Error',
                            icon: 'error',
                        });
                	}
                }
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});


</script>