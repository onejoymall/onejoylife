<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>

<section class="subheader">
    <div class="subTitle">${afn:getMessage('tax_payment',sessionScope.locale)}</div>
</section>

<form name="defaultForm" ID="defaultForm" method="POST">
    <section class="wrap">
         <h2 class="pb-1">${afn:getMessage('order_product_info',sessionScope.locale)}</h2>
         <hr>
         <ul class="product pt-1 pb-0">
            <ul class="options">
                <li>${afn:getMessage('win_num',sessionScope.locale)}</li>
                <li class="red">${delivery.giveaway_play_cd}</li>
            </ul>
            <ul class="py-0">
                <li><div style="    width: 80px; height: 80px; margin: 0 auto; background: url(<c:url value="/assets/fileupload/giveaway/${detail.giveaway_list_image}"/>) no-repeat center / cover;"></div></li>
                <li>
                    <p>${detail.giveaway_brand}</p>
                    <h5>${detail.giveaway_name}</h5>
                    <p class="grey">${detail.giveaway_model_name}</p>
                    <%--<p class="option"><span>구성품</span> <br>
                    · 30mm 1.4 여친렌즈 <br>
                    · 추가배터리</p>--%>
                </li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage('product_company_payment',sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /> <span>원</span></li>
            </ul>
            <%--<hr class="grey my-1">
            <ul class="options mb-1">
                <li>주문금액</li>
                <li>3,099,000 <span>원</span></li>
            </ul>--%>
        </ul>

        <h2 class="pb-1 mt-4">${afn:getMessage('payment_info',sessionScope.locale)}</h2>
        <hr>
        <p class="text-md mt-2 mb-05">${afn:getMessage('pay_method',sessionScope.locale)}</p>
        <div class="my-1">
            <input type="radio" id="sec2-ra" name="payment_type_cd" value="card" checked>
            <label for="sec2-ra"><span class="ra-txt">${afn:getMessage('card',sessionScope.locale)}</span></label>
            <input type="radio" id="sec2-ra2" name="payment_type_cd" value="trans">
            <label for="sec2-ra2"><span class="ra-txt">${afn:getMessage('trans',sessionScope.locale)}</span></label>
            <input type="radio" id="sec2-ra3" name="payment_type_cd" value="vbank">
            <label for="sec2-ra3"><span class="ra-txt">${afn:getMessage('vbank',sessionScope.locale)}</span></label>
        </div>

        <h2 class="pb-1 mt-4">${afn:getMessage('winner_info',sessionScope.locale)}</h2>
        <hr>
        <p class="text-md mt-2 mb-05">${afn:getMessage('reg_num',sessionScope.locale)}</p>
        <div class="my-1">
            <input type="number" class="width-40 mb-05" name="reg_no1"> <span>-</span>
            <input type="number" class="width-40 mb-05" name="reg_no2">
            <input type="hidden" name="reg_no">
        </div>
    </section>
    <hr>
    <section class="wrap bg_grey">
        <h1 class="pb-1">${afn:getMessage('final_payment_confirm',sessionScope.locale)}</h1>
        <hr>
        <ul class="calculator pt-2 pb-1">
            <li>${afn:getMessage('tax',sessionScope.locale)}</li>
            <li><fmt:formatNumber value="${texSum}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
        </ul>
        <ul class="calculator pb-1">
            <li>${afn:getMessage('total_payment',sessionScope.locale)}</li>
            <li class="text-lg red"><fmt:formatNumber value="${detail.giveaway_delivery_payment+texSum}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
            <input type="hidden" name="payment" value="${detail.giveaway_delivery_payment+texSum}">
            <input type="hidden" name="payment_user_id" value="${delivery.order_user_id}">
            <input type="hidden" name="order_no" value="${delivery.order_no}">
            <input type="hidden" name="giveaway_cd" value="${delivery.giveaway_cd}">
            <input type="hidden" name="giveaway_play_cd" value="${delivery.giveaway_play_cd}">
            <input type="hidden" name="product_order_name" value="${detail.giveaway_name}">
            <input type="hidden" name="payment_order_quantity" value="1"/>
        </ul>
        <hr class="grey my-1">
        <input type="checkbox" id="replysns" class="b8 mb-2">
        <label for="replysns"><span class="red text-bold">${afn:getMessage('require',sessionScope.locale)}</span> ${afn:getMessage('msg.payment.confirm1',sessionScope.locale)} ${afn:getMessage('msg.payment.confirm2',sessionScope.locale)}</label>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="javascript:void(0)" class="btn btn-redcover" id="submitPayment">${afn:getMessage('do_payment',sessionScope.locale)}</a></li>
        </ul>
    </div>
</form>

<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, req.requestURI, '')}" />
<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="noParamUrl" value="${baseURL}${requestPath}"/>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var regCheck = true;
	var regExp1 = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
	var regExp2 = /^[1-4][0-9]{6}$/;
	$(document).on('input','input[name=reg_no1],input[name=reg_no2]',function () {
		regCheck = true;
		var reg1 = $('input[name=reg_no1]').val();
		var reg2 = $('input[name=reg_no2]').val();
	
		if(!regExp1.test(reg1) || !regExp2.test(reg2)){
			regCheck = true;
		}else{
			regCheck = false;
		}
	})

    var IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init("imp78484974");
    $("#submitPayment").on("click",function() {
        if(!$('#replysns').is(":checked")){
            $.toast({
                text: "${afn:getMessage('error.chkAgreeTerms',sessionScope.locale)}",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }else if(regCheck){
        	$.toast({
                text: "${afn:getMessage('error.chkRegNum',sessionScope.locale)}",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }else{
        	var formData = $('#defaultForm').serialize()
							+'&payment_class=GIVEAWAY';

        	jQuery.ajax({
                type: "POST",
                url: "/SavePayment",
                data: formData,
                success: function (data) {
                    if (data.validateError) {
                        $('.validateError').empty();
                        $.each(data.validateError, function (index, item) {
                            if(index == "Error"){//일반에러메세지
                                alertType = "error";
                                showText = item;
                            }else{
                                alertType = "error";
                                showText = index + " ${afn:getMessage('is',sessionScope.locale)} " + item;
                            }
                            // $.toast().reset('all');//토스트 초기화
                            $.toast({
                                text: showText,
                                showHideTransition: 'plain', //펴짐
                                position: 'bottom-right',
                                heading: 'Error',
                                icon: 'error'
                            });
                        });
                    } else {
                    	IMP.request_pay({ // param
                            pg: "kcp",
                            pay_method:$('input[name=payment_type_cd]:checked').val(),
                            merchant_uid: "${delivery.order_no}",
                            name: "${detail.giveaway_name}",
                            amount: ${detail.giveaway_delivery_payment+texSum},
                            buyer_email: "${sessionScope.email}",
                            buyer_name: "${delivery.order_user_name}",
                            buyer_tel: "${delivery.delivery_user_phone}",
                            buyer_addr: "${delivery.roadAddress}${delivery.extraAddress}",
                            buyer_postcode: "${delivery.postcode}",
                            m_redirect_url: "${baseURL}/Save/PaymentSuccessMobile?payment_class=GIVEAWAY"
                        }, function (rsp) {
                            if(rsp.success){
                            	location.href=data.redirectUrl;
                            }else{
                                $.toast({
                                    text: rsp.error_msg,
                                    showHideTransition: 'plain', //펴짐
                                    position: 'bottom-right',
                                    heading: 'Error',
                                    icon: 'error'
                                });
                            }
                        });
                    }
                },
                error: function (xhr, status, error) {
                    alert("error");
                }
            });
        }
    });

$(document).ready(function(){
    $('#write').show();
    $('#list').hide();
    $('.qna').on('click',function(){
        $(this).addClass('active');
        $('.qna').not($(this)).removeClass('active');
    })
    $('#date li a').on('click',function(){
        $(this).addClass('active');
        $('#date li a').not($(this)).removeClass('active');
    })
});
/**
 * 탭 function
 */
function show(num){
    if(num == 1){
        $('#write').show();
        $('#list').hide();
        $('#tap1').addClass('active');
        $('#tap2').removeClass('active');
    } else if (num == 2) {
        $('#write').hide();
        $('#list').show();
        $('#tap1').removeClass('active');
        $('#tap2').addClass('active');
    }
}
</script>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>