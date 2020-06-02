<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>


<section class="subheader">
    <div class="subTitle">주문/결제</div>
</section>
<form name="defaultForm" id="defaultForm" method="POST">
<section class="wrap">
        <h2 class="pb-1">주문자 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">주문하시는 분</p>
        <input type="text" class="width-100 mb-05" name="order_user_name" id="order_user_name" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>">
        <p class="text-md mt-2 mb-05">이메일 주소</p>
        <input type="text" class="width-100 mb-05" name="order_user_email" id="order_user_email" value="<c:if test="${not empty sessionScope.email}">${sessionScope.email}</c:if>">

        <p class="text-md mt-2 mb-05">휴대폰 번호
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
        <p class="text-md mt-2 mb-05">통관고유번호</p>
        <input type="text" name="customs_clearance_number" id="customs_clearance_number" class="sec1-in1" /> </td>
        </c:if>

        <c:if test="${empty sessionScope.email}">
        <p class="text-md mt-2 mb-05">주문확인용 비밀번호 입력</p>
        <input type="password" name="password" id="password" class="sec1-in1">
        <p id="passwordValidation" style="float:right;line-height: 33px;color: red"></p>
        <p class="text-md mt-2 mb-05">주문확인용 비밀번호 입력 확인</p>
        <input type="password" name="password_cf" id="password_cf" class="sec1-in1">
        <p id="password_cfValidation" style="float:right;line-height: 33px;color: red"></p>
        </c:if>

        <h2 class="pb-1 mt-4">배송지 정보</h2>
        <hr>
        <c:if test="${sessionScope.login}">
        <p class="text-md mt-2 mb-05">배송지 선택</p>
        <div class="my-1">
            <input type="radio" name="selectAddress" id="ra1-1" checked value="OLD"><label for="ra1-1">기본 배송지</label>
            <input type="radio" id="ra1-2" name="selectAddress" value="LAST"><label for="ra1-2">최신 배송지</label>
            <input type="radio" id="ra1-3" name="selectAddress" value="NEW"><label for="ra1-3">새로입력</label>
        </div>
        </c:if>
        <p class="text-md mt-2 mb-05">받으시는 분</p>
        <input type="text" class="width-100 mb-05"  name="delivery_user_name" id="delivery_user_name" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>">

        <p class="text-md mt-2 mb-05">휴대폰 번호
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

        <p class="text-md mt-2 mb-05">전화 번호
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
            <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
            <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
            <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
            <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
            <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
            <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
        </select>
        <span> - </span>
        <input type="text" name="delivery_user_tel_b" id="delivery_user_tel_b" value="${phoneMap.key2}" class="delivery_user_tel width-30 mb-05" maxlength="4">
        <span> - </span>
        <input type="text" name="delivery_user_tel_c" id="delivery_user_tel_c" value="${phoneMap.key3}" class="delivery_user_tel width-30 mb-05" maxlength="4">
        <input type="hidden" name="delivery_user_tel" id="delivery_user_tel" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.delivery_user_tel}</c:if>">

        <p class="text-md mt-2 mb-05">주소</p>
        <div class="input-group mb-05">
            <input type="text" name="postcode" id="postcode" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
            <button type="button" id="daumMapCall" class="grey">우편번호 찾기</button>
        </div>
        <input type="text" class="width-100 mb-05" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>">
        <input type="text" class="width-100 mb-05" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>">
        <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>

        <p class="text-md mt-2 mb-05">배송시 요청사항</p>
        <select class="full mt-05 mb-05" name="delivery_message_select" id="delivery_message_select" >
            <option value="" disabled selected>요청사항</option>
            <option value="">직접 받고 부재 시 문 앞</option>
            <option value="self">직접입력</option>
        </select>
        <p class="mar-p2 hidden" id="delivery_message_box"><input type="text" class="sec2-in2" name="delivery_message" id="delivery_message"></p>
        
        <c:if test="${store_delivery.product_delivery_hope_date_yn == 'Y'}">
        <p class="text-md mt-2 mb-05">배송 희망일자</p>
        <input type="text" id="start_date" name="hope_date" class="date_pick width-100 mb-05">
        </c:if>
        
        <c:if test="${store_delivery.product_delivery_hope_time_yn == 'Y'}">
        <p class="text-md mt-2 mb-05">배송 희망시간</p>
        <input type="text" name="hope_time" class="time_pick width-100 mb-05">
        </c:if>

        <h2 class="pb-1 mt-4">주문상품 정보</h2>
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
                <li>상품금액</li>
                <li><fmt:formatNumber value="${detail.product_payment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
            <ul class="options">
                <li>수량</li>
                <li><span>${param.payment_order_quantity}<input type="hidden" name="payment_order_quantity" value="${param.payment_order_quantity}"></span><span>개</span></li>
            </ul>
            <hr class="grey my-1">
            <ul class="options mb-1">
                <li>주문금액</li>
                <li><fmt:formatNumber value="${detail.product_payment*param.payment_order_quantity+deliveryPayment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
        </ul>

        <h2 class="mt-4">할인 정보</h2>
        <hr class="my-1">
        <p class="text-md mt-1 mb-05">배송시 요청사항</p>
         <select class="full mt-05 mb-05" id="couponBox">
         	<c:if test="${not empty enableCouponList}">
        		<option value="">선택 안함</option>
        		<c:forEach var="list" items="${enableCouponList}" varStatus="status">
            		<option value="${status.index}">${list.coupon_name} ( ~ ${list.coupon_valid_date_end})</option>
            	</c:forEach>
            </c:if>
            <c:if test="${empty enableCouponList}">
            	<option value="">사용가능 쿠폰이 없습니다.</option>
            </c:if>
         </select>
         <ul class="calculator">
            <li>사용가능 쿠폰</li>
            <li><fmt:formatNumber value="${fn:length(enableCouponList)}" groupingUsed="true" /> <span>장</span></li>
        </ul>

        <h2 class="pb-1 mt-4">결제 정보</h2>
        <hr>
        <div class="ck-box">
            <input type="checkbox" id="escrow">
            <label for="escrow"><span class="le-ck-txt"> 에스크로 사용</span></label>
        </div>
        <p class="text-md mt-2 mb-05">결제수단</p>
        <div class="my-1">
            <input type="radio" id="purchase01" name="payment_type_cd" checked value="card"><label for="purchase01">신용카드</label>
            <input type="radio" id="purchase02" name="payment_type_cd" value="trans"><label for="purchase02">실시간계좌이체</label>
            <input type="radio" id="purchase03" name="payment_type_cd" value="vbank"><label for="purchase03">가상계좌</label>
            <%--<input type="radio" id="purchase03" name="purchase"><label for="purchase03">휴대폰결제</label>--%>
        </div>
</section>
<hr>
<section class="wrap bg_grey">
    <h1 class="pb-1">최종 결제 금액 확인</h1>
    <hr>
    <ul class="calculator pt-2 pb-1">
    	<c:set var = "productTotal" value = "${detail.product_user_payment * detail.payment_order_quantity}" />
       	<c:set var = "discountTotal" value = "${(detail.product_user_payment - detail.product_payment) * detail.payment_order_quantity}" />
        <li class="text-lg">총 상품 금액</li>
        <li><fmt:formatNumber value="${productTotal}" groupingUsed="true" /> <span>원</span></li>
    </ul>
    <ul class="calculator pb-1">
        <li>할인금액</li>
        <li>- <span class="in1-font3" id="discountSpan"><fmt:formatNumber value="${discountTotal}" groupingUsed="true" /></span> <span>원</span></li>
    </ul>
    <%--        <ul class="calculator pb-1">--%>
    <%--            <li>할인쿠폰</li>--%>
    <%--            <li>- 9,000 <span>원</span></li>--%>
    <%--        </ul>--%>
    <ul class="calculator pb-1">
        <li>배송비</li>
        <c:if test="${not empty deliveryPayment}">
            <li><span id="deliverySpan"><fmt:formatNumber value="${deliveryPayment}" groupingUsed="true" /></span> <span>원</span></li>
        </c:if>
    </ul>
    <hr class="grey my-1">
    <ul class="calculator pb-1">
        <li>최종 결제 금액</li>
        <li class="text-lg red"><span id="paymentSpan"><fmt:formatNumber value="${productTotal - discountTotal + deliveryPayment}" groupingUsed="true" /></span> <span>원</span></li>
    </ul>
    <ul class="calculator pb-1">
        <li>E-POINT 적립예정</li>
        <li class="text-md red"><fmt:formatNumber value="${(detail.product_payment*detail.product_point_rate)/100}" groupingUsed="true" /> <span>원</span></li>
    </ul>
    <hr class="my-1">
    <input type="checkbox" id="replysns" class="b8 mb-2">
    <label for="replysns"><span class="red text-bold">필수</span> 주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</label>
</section>
<div class="bottomBtns">
    <ul>
        <li><a href="#" class="btn btn-redcover" id="submitPayment">결제하기</a></li>
    </ul>
</div>

				<input type="hidden" name="payment" value="${productTotal - discountTotal + deliveryPayment}">
                <input type="hidden" name="order_no" value="${order_no}">
                <input type="hidden" name="product_cd" value="${detail.product_cd}">
                <input type="hidden" name="payment_order_quantity" value="${detail.payment_order_quantity}">
                <input type="hidden" name="product_order_name" value="${detail.product_name} ${option}"/>

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
                text: "주문자 성함을 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#order_user_email').val() == ""){
            $.toast({
                text: "이메일주소를 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#order_user_phone_a').val() == "" || $('#order_user_phone_b').val() == "" || $('#order_user_phone_c').val() == ""){
            $.toast({
                text: "휴대폰 번호를 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        <c:if test="${empty sessionScope.email}">
        else if($('#password').val() == "" || $('#password_ch').val() == ""){
            $.toast({
                text: "주문확인용 비밀번호를 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        </c:if>
        else if($('#delivery_user_name').val() == ""){
            $.toast({
                text: "받으시는 분 성함을 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#postcode').val() == "" || $('#roadAddress').val() == "" || $('#extraAddress').val() == ""){
            $.toast({
                text: "배송 주소를 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if(!$('#replysns').is(":checked")){
            $.toast({
                text: "이용약관 동의는 필수 항목입니다.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }else{

			// loginAuth(data.access_token);
			// location.href=data.redirectUrl;
			IMP.request_pay({ // param
				pg: "kcp",
				pay_method:$('input[name=payment_type_cd]:checked').val(),
				merchant_uid:$('input[name=order_no]').val(),
				name: '${detail.product_name} ${option}',
				amount: $('input[name=payment]').val(),
				buyer_email: "${sessionScope.email}",
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
				m_redirect_url: "${baseURL}/SavePaymentMobile?"+$('#defaultForm').serialize()+'&payment_class=PRODUCT'
                <%--m_redirect_url: "${baseURL}/MyPage/OrderAndDelivery",--%>
			}, function (rsp) { // callback
				var formData = $('#defaultForm').serialize()
					+'&payment_class=PRODUCT'
					+'&success='+rsp.success
					+'&imp_uid='+rsp.imp_uid
					+'&merchant_uid='+rsp.merchant_uid
					+'&pg_provider='+rsp.pg_provider
					+'&pay_method='+rsp.pay_method
					+'&pg_type='+rsp.pg_type
					+'&error_msg='+rsp.error_msg;

				var alertType;
				var showText;
				if(rsp.success){
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
										showText = index + " (은) " + item;
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
								jQuery.ajax({
									type: "POST",
									url: "/SaveDeliveInfo",
									data: $('#defaultForm').serialize(),
									// enctype: 'multipart/form-data',
									success: function (data) {
										if (data.validateError) {
											$('.validateError').empty();
											$.each(data.validateError, function (index, item) {
												// $('#validateError'+index).removeClass('none');
												// $('#validateError'+index).html('* '+item);
												if (index == "Error") {//일반에러메세지
													alertType = "error";
													showText = item;
												} else {
													alertType = "error";
													showText = index + " (은) " + item;
												}

												$.toast({
													text: showText,
													showHideTransition: 'plain', //펴짐
													position: 'bottom-right',
													heading: 'Error',
													icon: 'error'
												});
											});
										}
									},
									error: function (xhr, status, error) {
										alert("error");
									}
								});
								// loginAuth(data.access_token);
								location.href=data.redirectUrl;
							}
						},
						error: function (xhr, status, error) {
							alert("error");
						}
					});
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

	var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
	//패스워드 체크
	$(document).on('keyup','input[name=password]',function () {
		if(!$(this).val().match(mathPassword)){
			$("#passwordValidation").text(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.")
			$("#passwordValidation").removeClass("text-success");
		}else{
			$("#passwordValidation").addClass("text-success");
		}
	})
	$(document).on('keyup','input[name=password_cf]',function () {
		if(!$(this).val().match($('input[name=password]').val())){
			$("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.")
			$("#password_cfValidation").removeClass("text-success");
		}else{
			$("#password_cfValidation").text(" * 비밀번호가 일치합니다.")
			$("#password_cfValidation").addClass("text-success");
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
		
		var resultDiscount = parseInt(originDiscount) + parseInt(disCoupon);
		var resultPayment = originPayment - disCoupon + addDelivery;
        $("#discountSpan").text(resultDiscount.toLocaleString('en'));
        $("#paymentSpan").text(resultPayment.toLocaleString('en'));
        $("input[name=payment]").val(resultPayment);
    });
</script>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>