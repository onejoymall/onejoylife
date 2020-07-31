<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>


<section class="subheader">
    <div class="subTitle">${afn:getMessage("orders_payment",sessionScope.locale)}</div>
</section>
<form name="defaultForm" id="defaultForm" method="POST">
<section class="wrap">
        <h2 class="pb-1">${afn:getMessage("userinformation",sessionScope.locale)}</h2>
        <hr>
        <p class="text-md mt-2 mb-05">${afn:getMessage("userN",sessionScope.locale)}</p>
        <input type="text" class="width-100 mb-05" name="order_user_name" id="order_user_name" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>">
        <p class="text-md mt-2 mb-05">${afn:getMessage("order_user_email",sessionScope.locale)}</p>
        <input type="text" class="width-100 mb-05" name="order_user_email" id="order_user_email" value="<c:if test="${not empty sessionScope.email}">${sessionScope.email}</c:if>">

        <p class="text-md mt-2 mb-05">${afn:getMessage("userPH",sessionScope.locale)}
            <!-- Map 선언 -->
            <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />

            <c:if test="${empty userInfo.phone}">
                <c:set var="phoneNumber" value="" />
            </c:if>
            <c:if test="${not empty userInfo.phone}">
                <c:set var="phoneNumber" value="${userInfo.phone}" />
            </c:if>

            <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
                <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
            </c:forEach>
        </p>
        <select name="order_user_phone_a" id="order_user_phone_a" class="width-30 mb-05">
            <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
            <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
            <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
            <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
            <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
            <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
        </select>
        <span> - </span>
        <input type="text" class="width-30 mb-05" name="order_user_phone_b" id="order_user_phone_b" value="${phoneMap.key2}" class="order_user_phone" maxlength="4">
        <span> - </span>
        <input type="text" class="width-30 mb-05" name="order_user_phone_c" id="order_user_phone_c" value="${phoneMap.key3}" class="order_user_phone" maxlength="4">
        <input type="hidden" name="order_user_phone" id="order_user_phone" value="<c:if test="${not empty sessionScope.email}"><c:out value="${phoneNumber}"/> </c:if>">

        <c:if test="${detail.product_delivery_International_type eq 'B' || detail.product_delivery_International_type eq 'C'}">
        <p class="text-md mt-2 mb-05">${afn:getMessage("cusClearNum",sessionScope.locale)}</p>
        <input type="text" name="customs_clearance_number" id="customs_clearance_number" class="sec1-in1" /> </td>
        </c:if>

        <c:if test="${empty sessionScope.email}">
        <p class="text-md mt-2 mb-05">${afn:getMessage("orderChkPwd",sessionScope.locale)}</p>
        <input type="password" name="password" id="password" class="sec1-in1">
        <p id="passwordValidation" style="float:right;line-height: 33px;color: red"></p>
        <p class="text-md mt-2 mb-05">${afn:getMessage("orderChkPwdCf",sessionScope.locale)}</p>
        <input type="password" name="password_cf" id="password_cf" class="sec1-in1">
        <p id="password_cfValidation" style="float:right;line-height: 33px;color: red"></p>
        </c:if>

        <h2 class="pb-1 mt-4">${afn:getMessage("deliv_info",sessionScope.locale)}</h2>
        <hr>
        <c:if test="${sessionScope.login}">
        <p class="text-md mt-2 mb-05">${afn:getMessage("deliv_choose",sessionScope.locale)}</p>
        <div class="my-1">
            <input type="radio" name="selectAddress" id="ra1-1" checked value="OLD"><label for="ra1-1">${afn:getMessage("deliv_main",sessionScope.locale)}</label>
            <input type="radio" id="ra1-2" name="selectAddress" value="LAST"><label for="ra1-2">${afn:getMessage("deliv_recent",sessionScope.locale)}</label>
            <input type="radio" id="ra1-3" name="selectAddress" value="NEW"><label for="ra1-3">${afn:getMessage("deliv_new",sessionScope.locale)}</label>
            <input type="radio" id="ra1-4" name="selectAddress" value="LIST"><label for="ra1-4">${afn:getMessage("deliv_list",sessionScope.locale)}</label>
        </div>
        </c:if>
        <p class="text-md mt-2 mb-05">${afn:getMessage("deliv_receiveN",sessionScope.locale)}</p>
        <input type="text" class="width-100 mb-05"  name="delivery_user_name" id="delivery_user_name" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>">

        <p class="text-md mt-2 mb-05">${afn:getMessage("deliv_receiveCPH",sessionScope.locale)}
            <!-- Map 선언 -->
            <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
            <c:if test="${empty userInfo.phone}">
                <c:set var="phoneNumber" value="" />
            </c:if>
            <c:if test="${not empty userInfo.phone}">
                <c:set var="phoneNumber" value="${latestDelivery.delivery_phone_tel}" />
            </c:if>
            <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
                <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
            </c:forEach>
        </p>

        <select name="delivery_user_phone_a" id="delivery_user_phone_a" class="width-30 mb-05">
            <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
            <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
            <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
            <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
            <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
            <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
        </select>
        <span> - </span>
        <input type="text" name="delivery_user_phone_b" id="delivery_user_phone_b" value="${phoneMap.key2}" class="delivery_user_phone width-30 mb-05" maxlength="4">
        <span> - </span>
        <input type="text" name="delivery_user_phone_c" id="delivery_user_phone_c" value="${phoneMap.key3}" class="delivery_user_phone width-30 mb-05" maxlength="4">
        <input type="hidden" name="delivery_user_phone" id="delivery_user_phone" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.delivery_user_phone}</c:if>">

        <p class="text-md mt-2 mb-05">${afn:getMessage("deliv_receivePH",sessionScope.locale)}
            <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
            <c:if test="${empty userInfo.phone}">
                <c:set var="phoneNumber" value="" />
            </c:if>
            <c:if test="${not empty userInfo.phone}">
                <c:set var="phoneNumber" value="${latestDelivery.delivery_user_tel}" />
            </c:if>
            <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
                <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
            </c:forEach>
        </p>
        <select name="delivery_user_tel_a" id="delivery_user_tel_a" class="width-30 mb-05">
            <option value="02" <c:if test="${phoneMap.key1 eq \"02\"}">selected</c:if>>02</option>
            <option value="031" <c:if test="${phoneMap.key1 eq \"031\"}">selected</c:if>>031</option>
            <option value="032" <c:if test="${phoneMap.key1 eq \"032\"}">selected</c:if>>032</option>
            <option value="033" <c:if test="${phoneMap.key1 eq \"033\"}">selected</c:if>>033</option>
            <option value="041" <c:if test="${phoneMap.key1 eq \"041\"}">selected</c:if>>041</option>
            <option value="042" <c:if test="${phoneMap.key1 eq \"042\"}">selected</c:if>>042</option>
            <option value="043" <c:if test="${phoneMap.key1 eq \"043\"}">selected</c:if>>043</option>
            <option value="044" <c:if test="${phoneMap.key1 eq \"044\"}">selected</c:if>>044</option>
            <option value="051" <c:if test="${phoneMap.key1 eq \"051\"}">selected</c:if>>051</option>
            <option value="052" <c:if test="${phoneMap.key1 eq \"052\"}">selected</c:if>>052</option>
            <option value="053" <c:if test="${phoneMap.key1 eq \"053\"}">selected</c:if>>053</option>
            <option value="054" <c:if test="${phoneMap.key1 eq \"054\"}">selected</c:if>>054</option>
            <option value="055" <c:if test="${phoneMap.key1 eq \"055\"}">selected</c:if>>055</option>
            <option value="061" <c:if test="${phoneMap.key1 eq \"061\"}">selected</c:if>>061</option>
            <option value="062" <c:if test="${phoneMap.key1 eq \"062\"}">selected</c:if>>062</option>
            <option value="063" <c:if test="${phoneMap.key1 eq \"063\"}">selected</c:if>>063</option>
            <option value="064" <c:if test="${phoneMap.key1 eq \"064\"}">selected</c:if>>064</option>
        </select>
        <span> - </span>
        <input type="text" name="delivery_user_tel_b" id="delivery_user_tel_b" value="${phoneMap.key2}" class="delivery_user_tel width-30 mb-05" maxlength="4">
        <span> - </span>
        <input type="text" name="delivery_user_tel_c" id="delivery_user_tel_c" value="${phoneMap.key3}" class="delivery_user_tel width-30 mb-05" maxlength="4">
        <input type="hidden" name="delivery_user_tel" id="delivery_user_tel" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.delivery_user_tel}</c:if>">

        <p class="text-md mt-2 mb-05">${afn:getMessage("address",sessionScope.locale)}</p>
        <div class="input-group mb-05">
            <input type="text" name="postcode" id="postcode" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
            <button type="button" id="daumMapCall" class="grey">${afn:getMessage("find_zipcode",sessionScope.locale)}</button>
        </div>
        <input type="text" class="width-100 mb-05" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>">
        <input type="text" class="width-100 mb-05" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>">
        <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>

        <p class="text-md mt-2 mb-05">${afn:getMessage("deliv_msg",sessionScope.locale)}</p>
        <select class="full mt-05 mb-05" name="delivery_message_select" id="delivery_message_select" >
            <option value="" disabled selected>${afn:getMessage("deliv_msg_option",sessionScope.locale)}</option>
            <option value="">${afn:getMessage("deliv_msg_option_door",sessionScope.locale)}</option>
            <option value="">${afn:getMessage("security_office",sessionScope.locale)}</option>
            <option value="">${afn:getMessage("deliv_box",sessionScope.locale)}</option>
            <option value="self">${afn:getMessage("deliv_msg_option_write",sessionScope.locale)}</option>
        </select>
        <p class="mar-p2 hidden" id="delivery_message_box"><input type="text" class="sec2-in2" name="delivery_message" id="delivery_message"></p>
        
        <c:if test="${store_delivery.product_delivery_hope_date_yn == 'Y'}">
        <p class="text-md mt-2 mb-05">${afn:getMessage("deliv_wish_date",sessionScope.locale)}</p>
        <input type="text" id="start_date" name="hope_date" class="date_pick width-100 mb-05">
        </c:if>
        
        <c:if test="${store_delivery.product_delivery_hope_time_yn == 'Y'}">
        <p class="text-md mt-2 mb-05">${afn:getMessage("deliv_wish_time",sessionScope.locale)}</p>
        <input type="text" name="hope_time" class="time_pick width-100 mb-05">
        </c:if>

        <h2 class="pb-1 mt-4">${afn:getMessage("order_product_info",sessionScope.locale)}</h2>
        <hr>
        <ul class="product pt-1 pb-0">
            <%--<ul class="options">
                <li>당첨번호</li>
                <li class="red">123456</li>
            </ul>--%>
            <ul class="py-0">
                <li><img src='${detail.file_1}' onerror="this.src='http://placehold.it/80'"></li>
                <li>
                    <p>${detail.product_made_company_name}</p>
                    <h5>${detail.product_name} ${option}</h5>
                    <p class="grey">${detail.product_model}</p>
                    <%-- <p class="option"><span>구성품</span> <br>
                     · 30mm 1.4 여친렌즈 <br>
                     · 추가배터리</p>--%>
                </li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage("proPrice",sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${detail.product_payment}" groupingUsed="true" /> <span>${afn:getMessage("korea_won",sessionScope.locale)}</span></li>
            </ul>
            <ul class="options">
                <li>${afn:getMessage("quantity",sessionScope.locale)}</li>
                <li><span>${param.payment_order_quantity}<input type="hidden" name="payment_order_quantity" value="${param.payment_order_quantity}"></span><span>개</span></li>
            </ul>
            <hr class="grey my-1">
            <ul class="options mb-1">
                <li>${afn:getMessage("order_payment",sessionScope.locale)}</li>
                <li><fmt:formatNumber value="${detail.product_payment*param.payment_order_quantity+deliveryPayment}" groupingUsed="true" /> <span>${afn:getMessage("korea_won",sessionScope.locale)}</span></li>
            </ul>
        </ul>

        <h2 class="mt-4">${afn:getMessage("discount_info",sessionScope.locale)}</h2>
        <hr class="my-1">
         <select class="full mt-05 mb-05" id="couponBox">
         	<c:if test="${not empty enableCouponList}">
        		<option value="">${afn:getMessage("NotSelect",sessionScope.locale)}</option>
        		<c:forEach var="list" items="${enableCouponList}" varStatus="status">
            		<option value="${status.index}">${list.coupon_name} ( ~ ${list.coupon_valid_date_end})</option>
            	</c:forEach>
            </c:if>
            <c:if test="${empty enableCouponList}">
            	<option value="">${afn:getMessage("msg.none_Coucontent",sessionScope.locale)}</option>
            </c:if>
         </select>
         <input type="hidden" name="coupon_discount" value="0"/>
         <ul class="calculator">
            <li>${afn:getMessage("UsableCou",sessionScope.locale)}</li>
            <li><fmt:formatNumber value="${fn:length(enableCouponList)}" groupingUsed="true" /> <span>${afn:getMessage("cou_count",sessionScope.locale)}</span></li>
        </ul>

        <h2 class="pb-1 mt-4">${afn:getMessage("payment_info2",sessionScope.locale)}</h2>
        <hr>
        <div class="ck-box">
            <input type="checkbox" id="escrow">
            <label for="escrow"><span class="le-ck-txt"> ${afn:getMessage("escrow_use",sessionScope.locale)}</span></label>
        </div>
        <p class="text-md mt-2 mb-05">${afn:getMessage("pay_method",sessionScope.locale)}</p>
        <div class="my-1">
            <input type="radio" id="purchase01" name="payment_type_cd" checked value="card"><label for="purchase01">${afn:getMessage("card",sessionScope.locale)}</label>
            <input type="radio" id="purchase02" name="payment_type_cd" value="trans"><label for="purchase02">${afn:getMessage("trans",sessionScope.locale)}</label>
            <input type="radio" id="purchase03" name="payment_type_cd" value="vbank"><label for="purchase03">${afn:getMessage("vbank",sessionScope.locale)}</label>
            <%--<input type="radio" id="purchase03" name="purchase"><label for="purchase03">휴대폰결제</label>--%>
        </div>
</section>
<hr>
<section class="wrap bg_grey">
    <h1 class="pb-1">${afn:getMessage("final_payment_confirm",sessionScope.locale)}</h1>
    <hr>
    <ul class="calculator pt-2 pb-1">
    	<c:set var = "productTotal" value = "${detail.product_user_payment * detail.payment_order_quantity}" />
       	<c:set var = "discountTotal" value = "${(detail.product_user_payment - detail.product_payment) * detail.payment_order_quantity}" />
        <li class="text-lg">${afn:getMessage("total_price",sessionScope.locale)}</li>
        <li><fmt:formatNumber value="${productTotal}" groupingUsed="true" /> <span>${afn:getMessage("korea_won",sessionScope.locale)}</span></li>
    </ul>
    <ul class="calculator pb-1">
        <li>${afn:getMessage("discount_price",sessionScope.locale)}</li>
        <li>- <span class="in1-font3" id="discountSpan"><fmt:formatNumber value="${discountTotal}" groupingUsed="true" /></span> <span>${afn:getMessage("korea_won",sessionScope.locale)}</span></li>
    </ul>
    <%--        <ul class="calculator pb-1">--%>
    <%--            <li>할인쿠폰</li>--%>
    <%--            <li>- 9,000 <span>원</span></li>--%>
    <%--        </ul>--%>
    <ul class="calculator pb-1">
        <li>${afn:getMessage("shippingFee",sessionScope.locale)}</li>
        <c:if test="${not empty deliveryPayment}">
            <li><span id="deliverySpan"><fmt:formatNumber value="${deliveryPayment}" groupingUsed="true" /></span> <span>${afn:getMessage("korea_won",sessionScope.locale)}</span></li>
        </c:if>
    </ul>
    <hr class="grey my-1">
    <ul class="calculator pb-1">
        <li>${afn:getMessage("final_price",sessionScope.locale)}</li>
        <li class="text-lg red"><span id="paymentSpan"><fmt:formatNumber value="${productTotal - discountTotal + deliveryPayment}" groupingUsed="true" /></span> <span>${afn:getMessage("korea_won",sessionScope.locale)}</span></li>
    </ul>
    <ul class="calculator pb-1">
        <li>E-POINT ${afn:getMessage("accEx",sessionScope.locale)}</li>
        <li class="text-md red"><fmt:formatNumber value="${(detail.product_payment*detail.product_point_rate)/100}" groupingUsed="true" /> <span>${afn:getMessage("korea_won",sessionScope.locale)}</span></li>
    </ul>
    <hr class="my-1">
    <input type="checkbox" id="replysns" class="b8 mb-2">
    <label for="replysns"><span class="red text-bold">(${afn:getMessage("require",sessionScope.locale)})</span> ${afn:getMessage("msg.payment.confirm1",sessionScope.locale)} ${afn:getMessage("msg.payment.confirm2",sessionScope.locale)}</label>
</section>
<div class="bottomBtns">
 <div class="underPop" id="S-list">
        <div class="content">
            <header>
               <h3>${afn:getMessage("myDeliv_add",sessionScope.locale)}</h3>
                <button class="popClose">
                    <i class="ri-close-line"></i>
                </button>
            </header>
            <content>
                <div class="ov-s">
                    <table>
                        <colgroup>
                            <col style="width: 300px;">
                            <col style="width: 100px;">
                        </colgroup>
                        <tbody class="body-tr" id="list_address">

                    </table>
                </div>
               
            </content>
        </div>
    </div>
    <ul>
        <li><a href="javascript:void(0);" class="btn btn-redcover" id="submitPayment">${afn:getMessage("do_payment",sessionScope.locale)}</a></li>
    </ul>
</div>

				<input type="hidden" name="payment" value="${productTotal - discountTotal + deliveryPayment}">
                <input type="hidden" name="order_no" value="${order_no}">
                <input type="hidden" name="product_cd" value="${detail.product_cd}">
                <input type="hidden" name="payment_order_quantity" value="${detail.payment_order_quantity}">
                <input type="hidden" name="coupon_cd" value="">
                <input type="hidden" name="coupon_paid_user_id" value="">
                <input type="hidden" name="product_order_name" value="${detail.product_name} ${option}"/>
                <input type="hidden" name="option_name" value="${option}"/>

</form>


<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, req.requestURI, '')}" />
<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="noParamUrl" value="${baseURL}${requestPath}"/>

<script>
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var noneLoginPWCheck = false;
	var	originProduct = ${productTotal};	//원래 소비자가
	var originDelivery = ${deliveryPayment}; //원래 배송비
	var originPayment = ${productTotal - discountTotal + deliveryPayment}; //원래 판매가+배송비
	var originDiscount = ${discountTotal}; //원래 할인가
	var addDelivery = 0;	//도서산간 추가배송비
	var disCoupon = 0;	//쿠폰할인
	var useCoupon;
	
	var enableCouponList = [];
    <c:forEach var="list" items="${enableCouponList}" varStatus="status">
		var obj = {
		<c:forEach var="el" items="${list}" varStatus="status">
			${el.key}: "${el.value}",	
		</c:forEach>
		};
		enableCouponList.push(obj);
	</c:forEach>
	
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp78484974");
	var formData = $('#defaultForm').serialize();
	$("#submitPayment").on("click",function() {
		if($('#order_user_name').val() == ""){
            $.toast({
                text: getMessageAjax('error.payment.orderNameInput'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#order_user_email').val() == ""){
            $.toast({
                text: getMessageAjax('error.payment.emailInput'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#order_user_phone_a').val() == "" || $('#order_user_phone_b').val() == "" || $('#order_user_phone_c').val() == ""){
            $.toast({
                text: getMessageAjax('error.payment.hpInput'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        <c:if test="${empty sessionScope.email}">
        else if(!noneLoginPWCheck){
            $.toast({
                text: getMessageAjax('error.payment.orderPwdInput'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        </c:if>
        else if($('#delivery_user_name').val() == ""){
            $.toast({
                text: getMessageAjax('error.payment.delivName'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#postcode').val() == "" || $('#roadAddress').val() == "" || $('#extraAddress').val() == ""){
            $.toast({
                text:  getMessageAjax('error.payment.delivAddInpu'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if(!$('#replysns').is(":checked")){
            $.toast({
                text: getMessageAjax('error.payment.agreeChek'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }else{
        	$('input[name=order_no]').val('PD-ORDER-'+numberGen(7));
        	var formData = $('#defaultForm').serialize()
            				+'&payment_class=PRODUCT';
            
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
                                showText = index + ${afn:getMessage("is2",sessionScope.locale)} + item;
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
                            merchant_uid:$('input[name=order_no]').val(),
                            name: '${detail.product_name} ${option}',
                            amount: $('input[name=payment]').val(),
                            buyer_email: $('input[name=order_user_email]').val(),
                            buyer_name: $('#order_user_name').val(),
                            buyer_tel: $('#order_user_phone').val(),
                            buyer_addr: $('#roadAddress').val() + $('#extraAddress').val(),
                            buyer_postcode: $('#postcode').val(),
                            escrow:$('#escrow').is(":checked"),
                            kcpProducts : [
                                {
                                    "orderNumber" : $('input[name=order_no]').val(),
                                    "name" : '${detail.product_name} ${option}',
                                    "quantity" : $('input[name=payment_order_quantity]').val(),
                                    "amount" : $('input[name=payment]').val(),
                                },
                            ],
                            m_redirect_url: "${baseURL}/Save/PaymentSuccessMobile?"+$('#defaultForm').serialize()+'&payment_class=PRODUCT'
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

	$(".order_user_phone").on("focusout",function () {
		var phoneA = $("#order_user_phone_a").val();
		var phoneB = $("#order_user_phone_b").val();
		var phoneC = $("#order_user_phone_c").val();
		$("#order_user_phone").val(phoneA+"-"+phoneB+"-"+phoneC);
	})
	$(".delivery_user_phone").on("focusout",function () {
		var phoneA = $("#delivery_user_phone_a").val();
		var phoneB = $("#delivery_user_phone_b").val();
		var phoneC = $("#delivery_user_phone_c").val();
		$("#delivery_user_phone").val(phoneA+"-"+phoneB+"-"+phoneC);
		console.log(phoneA+"-"+phoneB+"-"+phoneC)
	})
	$(".delivery_user_tel").on("focusout",function () {
		var phoneA = $("#delivery_user_tel_a").val();
		var phoneB = $("#delivery_user_tel_b").val();
		var phoneC = $("#delivery_user_tel_c").val();
		$("#delivery_user_tel").val(phoneA+"-"+phoneB+"-"+phoneC);
		console.log(phoneA+"-"+phoneB+"-"+phoneC)
	})

	// var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
	var regExp = /^[a-zA-Z0-9]{6,20}$/;
    
    //패스워드 체크
    $(document).on('input','input[name=password],input[name=password_cf]',function () {
    	noneLoginPWCheck = false;
    	var pw = $('input[name=password]').val();
    	var pw_cf = $('input[name=password_cf]').val();
        if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
            $("#passwordValidation").text(" * ${afn:getMessage("error.sign.pwdpattern",sessionScope.locale)}\"");
            $("#passwordValidation").removeClass("text-success");
            $("#password_cfValidation").text('');
        }else{
        	$("#passwordValidation").text('');
        	if(pw != pw_cf){
                $("#password_cfValidation").text(" * ${afn:getMessage("error.sign.pwdDis",sessionScope.locale)}");
                $("#password_cfValidation").removeClass("text-success");
            }else{
            	noneLoginPWCheck = true;
            	$("#password_cfValidation").text(" * ${afn:getMessage("msg.sign.pwdSuccess",sessionScope.locale)}");
                $("#password_cfValidation").addClass("text-success");	
            }
        }
    })
	
	$("input[name=postcode]").on("input", function() {
        var formData = "postcode="+$(this).val()+"&product_cd="+$("input[name=product_cd]").val();
        $.ajax({
            method:"post",
            url: "/additionalDeliveryPayment",
            data:formData,
            async: false,
            success: function (data) {
        		addDelivery = data.additionalDeliveryPayment;
                var resultDelivery = originDelivery + addDelivery;
                var resultPayment = originPayment - disCoupon + addDelivery;
                $("#deliverySpan").text(resultDelivery.toLocaleString('en'));
                $("#paymentSpan").text(resultPayment.toLocaleString('en'));
                $("input[name=payment]").val(resultPayment);
            },
            error: function (xhr, status, error) {
                console.log(error,xhr,status );
            }
        });
    });
    var originalVal = $.fn.val;
    $.fn.val = function (value) {
        var res = originalVal.apply(this, arguments);

        if (this.is('input:text') && arguments.length >= 1) {
            // this is input type=text setter
            this.trigger("input");
        }

        return res;
    };
	
	$("#couponBox").on("input", function(){
		var idx = $(this).val();
		useCoupon = enableCouponList[idx];
		
		
		if(useCoupon){
		    var resultDiscount;
		    if(useCoupon.coupon_sale_type == 'amount'){
				disCoupon = useCoupon.coupon_sale_payment;
		    }else{
				if(useCoupon.coupon_sale_cal_condition == 'A'){
				    disCoupon = parseInt(originProduct*(useCoupon.coupon_sale_rate/100));
			    }else{
					disCoupon = parseInt((originProduct-originDiscount)*(useCoupon.coupon_sale_rate/100));
			    }
		    }
		    $("input[name=coupon_cd]").val(useCoupon.coupon_cd);
		    $("input[name=coupon_paid_user_id]").val(useCoupon.coupon_paid_user_id);
		}else{
		    disCoupon = 0;
		    $("input[name=coupon_cd]").val('');
		    $("input[name=coupon_paid_user_id]").val('');
		}
		
		$("input[name=coupon_discount]").val(disCoupon);
		var resultDiscount = parseInt(originDiscount) + parseInt(disCoupon);
		var resultPayment = originPayment - disCoupon + addDelivery;
        $("#discountSpan").text(resultDiscount.toLocaleString('en'));
        $("#paymentSpan").text(resultPayment.toLocaleString('en'));
        $("input[name=payment]").val(resultPayment);
    });
	
	
	$('.popClose').on('click',function(){
	    $('.underPop').removeClass('on');
	    $('body').removeClass('overflow-hidden');
	})
	$('#ra1-4').on('click',function(){
		$('#list_address').empty();
	    $('#S-list').addClass('on');
	    $('body').addClass('overflow-hidden');
	    
	 	jQuery.ajax({
            type: 'POST',
            url: '/payment/getMyListDelivery',
            data:formData,
            success: function (data) {
            	for (var i=0;i<data.deliveryList.length;i++) {
            		var item = data.deliveryList[i];
          
            		$("#list_address").append('<tr><td><p align="left" >' + item.order_user_name + '</p><p align="left" >' + item.roadAddress +'</p><p align="left" >' + item.extraAddress +'</p></td><td> <button type="button" class="c-btn" id="choose" data-id="' + item.order_no + '">선택</button></td>');
            		 
            	}
            	
            },
            error: function (xhr, status, error) {
                console.log(error,xhr,status );
            },
        });
	    
	})
	
	    $(document).on("click","#choose",function(){ 
    	var order_no = $(this).data("id");
    	
    	jQuery.ajax({
            type: 'POST',
            url: '/payment/getDeliveryAddress2',
            data: "order_no="+order_no,
            success: function (data) {
                if(data.deliveryChoose!=null ) {
                    $.each(data.deliveryChoose,function(index, item){
                        if(index != "order_no" &&  index != "product_cd"){
                            $("input[name="+index+"]").val(item);
                        }
                        if(index=="delivery_user_phone" || index=="delivery_user_tel"){
                            var number = item.split("-");
                            ['a','b','c'].forEach(function(el,idx){
                                $("input[name="+index+"_"+el+"]").val(number[idx]);
                            });
                        }
                    });
                    $(".underPop").removeClass('on');
                    $('body').removeClass('overflow-hidden');
                }
            },
            error: function (xhr, status, error) {
                console.log(error,xhr,status );
            },
        });
    	
    });
	
</script>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>