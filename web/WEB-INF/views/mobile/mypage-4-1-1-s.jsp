<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>


    <section class="subheader">
        <div class="subTitle">주문/결제</div>
    </section>
    
    <section class="wrap">
    <form name="defaultForm" id="defaultForm" method="POST">
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
        <c:set var="doneLoop" value="false"/>
        <c:forEach var="cartPaymentList" items="${cartPaymentList}" varStatus="status">
        <c:if test="${cartPaymentList.product_delivery_International_type eq 'B' || cartPaymentList.product_delivery_International_type eq 'C'}">
        <c:if test="${not doneLoop}">
            <p class="text-md mt-2 mb-05">통관고유번호</p>
            <input type="text" name="customs_clearance_number" id="customs_clearance_number" class="sec1-in1" />
            <c:set var="doneLoop" value="true"/>
        </c:if>
        </c:if>
        </c:forEach>
        <c:if test="${empty sessionScope.email}">
            <p class="text-md mt-2 mb-05">주문확인용 비밀번호 입력</p>
                <input type="password" name="password" class="sec1-in1">
                <p id="passwordValidation" style="float:right;line-height: 33px;color: red"></p>
            <p class="text-md mt-2 mb-05">주문확인용 비밀번호 입력 확인</p>
                <input type="password"  name="password_cf" class="sec1-in1">
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
         
         <h2 class="pb-1 mt-4">주문상품 정보</h2>
         <hr>

<c:if test="${not empty cartPaymentList}">
    <c:forEach var="cartPaymentList" items="${cartPaymentList}" varStatus="status">
    <div id="cart-wrap">
        <input type="hidden" name="cart_cd" value="${cartPaymentList.cart_cd}">
        <input type="hidden" name="chk" value="${cartPaymentList.cart_cd}">
        <ul class="product pt-1 pb-0">
            <ul class="pdinfo py-0">
                <li>
                    <a href="<c:url value="/product/productDetail?product_cd=${cartPaymentList.product_cd}"/>">
                        <img src='${cartPaymentList.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                    </a>
                </li>
                <li>
                    <%-- <p>${cartPaymentList.product_made_company_name}</p> --%>
                    <a href="<c:url value="/product/productDetail?product_cd=${cartPaymentList.product_cd}"/>">
                    	<h5>${cartPaymentList.product_name}</h5>
                   	</a>
                    <%-- <p class="grey">${cartPaymentList.product_model}</p> --%>
                </li>
                <li><button type="button" class="del del-p" value="${cartPaymentList.cart_cd}"></button></li>
            </ul>
            <ul class="options">
                <li>수량</li>
                <li><span>${cartPaymentList.payment_order_quantity} 개</span></li>
            </ul>
            <ul class="options ">
                <li>소비자가</li>
                <li class="line-through"><fmt:formatNumber value="${cartPaymentList.product_user_payment*cartPaymentList.payment_order_quantity}" groupingUsed="true" /><span> 원</span></li>
            </ul>
            <ul class="options mb-1">
                <li>상품가격</li>
                <input type="hidden" name="product_cd" value="${cartPaymentList.product_cd}">
                <input type="hidden" name="payment_order_quantity" value="${cartPaymentList.payment_order_quantity}">
                <li><fmt:formatNumber value="${cartPaymentList.product_payment*cartPaymentList.payment_order_quantity}" groupingUsed="true" /><span> 원</span></li>
            </ul>
            <ul class="options">
                <li>쿠폰 <span class="enable-coupon">(사용가능 쿠폰 <fmt:formatNumber value="${fn:length(cartPaymentList.enableCouponList)}" groupingUsed="true" />장)</span></li>
                <li>
	                <select name="coupon_cd" class="couponBox" data-id="${status.index}" data-payment="${cartPaymentList.product_payment*cartPaymentList.payment_order_quantity}" data-user-payment="${cartPaymentList.product_user_payment*cartPaymentList.payment_order_quantity}">
	                	<c:if test="${not empty cartPaymentList.enableCouponList}">
	                		<option value="">선택 안함</option>
	                		<c:forEach var="list" items="${cartPaymentList.enableCouponList}" varStatus="status">
	                    		<option value="${list.coupon_cd}" 
	                   			 data-type="${list.coupon_sale_type}" 
	                   			 data-sale-condition="${list.coupon_sale_cal_condition}"
	                   			 data-sale-rate="${list.coupon_sale_rate}"
	                   			 data-sale-payment="${list.coupon_sale_payment}">
	                    			${list.coupon_name} ( ~ ${list.coupon_valid_date_end})
	                   			</option>
	                    	</c:forEach>
	                    </c:if>
	                    <c:if test="${empty cartPaymentList.enableCouponList}">
	                    	<option value="">사용가능 쿠폰이 없습니다.</option>
	                    </c:if>
	                </select>
                </li>
            </ul>
        </ul>
        </div>
    </c:forEach>
</c:if>
        <%--<h2 class="mt-4">할인 정보</h2>
        <hr class="my-1">
        <ul class="calculator">
            <li>총 주문금액</li>
            <li>13,090,000 <span>원</span></li>
        </ul>
        <p class="text-md mt-1 mb-05">배송시 요청사항</p>
         <select class="full mt-05 mb-05">
            <option value="" disabled selected>첫 구매 고객 특별할이 20% ( ~ 2020.04.30)</option>
         </select>
         <ul class="calculator">
            <li>보유 쿠폰</li>
            <li>3 <span>장</span></li>
        </ul>--%>
        
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
            <li class="text-lg">총 상품 금액</li>
            <li class="sum-span1"></li>
        </ul>
       <ul class="calculator pb-1">
            <li>할인</li>
            <li class="sum-span2"></li>
        </ul>
        <ul class="calculator pb-1">
            <li>배송비</li>
            <li class="delivery sum-span3"></li>
        </ul>

        <hr class="grey my-1">
        <ul class="calculator pb-1">
            <li>최종 결제 금액</li>
            <li class="text-lg red total sum-span4" ></li>
        </ul>
        <ul class="calculator pb-1">
            <li>E-POINT 적립예정</li>
            <li class="text-md red sum-span5"></li>
        </ul>
        <hr class="my-1">
        <input type="checkbox" id="replysns" class="b8 mb-2">
        <label for="replysns"><span class="red text-bold">필수</span> 주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</label>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" class="btn btn-redcover" id="submitPayment">결제하기</a></li>
            <input type="hidden" name="payment" value="9999999">
            <input type="hidden" name="product_order_name" value="상품이름">
            <input type="hidden" name="point_add" value="포인트">
            <input type="hidden" name="quantity_total" value="수량합">
        </ul>
    </div>
    <input type="hidden" name="order_no" value="${order_no}">
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
	var addDelivery = {};
	var cartList = [];
	var couponDiscount = 0;
	<c:forEach var="list" items="${cartPaymentList}" varStatus="status">
		var obj = {
		<c:forEach var="el" items="${list}" varStatus="status">
			<c:if test="${!fn:contains(el.key, 'html') && !fn:contains(el.key, 'editor')}">
				${el.key}: "${el.value}",
			</c:if>
		</c:forEach>
		};
		cartList.push(obj);
	</c:forEach>
	
	var ids = cartList.map(function(el){
		return el.cart_cd;
	});
	applyCoupon();
	addDeliveryPayment(ids);
	computePayment(ids);
	
	function computePayment(ids){
		var payment=0;
		var discount=0;
		var delivery=0;
		var total=0;
		var point=0;
		var quantity=0;
		
		var storeDeliveryList = {};
		ids.forEach(function(id){
			var cart = cartList.find(function(el){
				return el.cart_cd == id
			});
			
			var point_rate = (cart.product_point_rate && cart.product_point_rate > 0) ? cart.product_point_rate : 0;
			payment += parseInt(cart.product_user_payment*cart.payment_order_quantity);
			discount += parseInt((cart.product_user_payment-cart.product_payment)*cart.payment_order_quantity);
			point += parseInt(((cart.product_payment*point_rate)/100)*cart.payment_order_quantity);
			quantity += parseInt(cart.payment_order_quantity);
	
			if(cart.product_delivery_bundle_yn == 'N'){ //묶음배송 아니면 상품의 배송비 + 지열별배송비  
				delivery += parseInt(cart.delivery_payment) + parseInt(addDelivery[cart.product_user_ud] ? addDelivery[cart.product_user_ud] : 0);
			}else{
				if(storeDeliveryList.hasOwnProperty(cart.product_user_ud)){ //스토어키가 이미 있다면 가장비싼배송비
					if(storeDeliveryList[cart.product_user_ud] < cart.delivery_payment) { 
						storeDeliveryList[cart.product_user_ud] = parseInt(cart.delivery_payment) 
	    			}
				}else{ //키가없다면 키추가
					storeDeliveryList[cart.product_user_ud] = parseInt(cart.delivery_payment)
				}
			}
		});
		
		//스토어별 지역별배송비
		$.each(storeDeliveryList,function(key,val){
			delivery += val + parseInt(addDelivery[key] ? addDelivery[key] : 0);
		});
		
		discount += couponDiscount;
		
		$(".sum-span1").html(payment.toLocaleString('en') + '<span> 원</span>');
		$(".sum-span2").html("- " + discount.toLocaleString('en') + '<span> 원</span>');
		$(".sum-span3").html("+ " + delivery.toLocaleString('en') + '<span> 원</span>');
		$(".sum-span4").html((payment-discount+delivery).toLocaleString('en') + '<span> 원</span>');
		$(".sum-span5").html(point.toLocaleString('en') + '<span> 원</span>');
		$('input[name=payment]').val(payment-discount+delivery);
		$('input[name=point_add]').val(point);
		$('input[name=quantity_total]').val(quantity);
	}
	
	//주문페이지 상품 삭제
	$(document).on("click","button.del",function(){
		if(cartList.length <= 1){
			alert("삭제할 수 없습니다.");
			return
		}
		var del_cart_cd = $(this).val();
		var cartIdx = cartList.findIndex(function(el){
			return el.cart_cd == del_cart_cd
		});
		cartList.splice(cartIdx,1);
		
	    $(this).closest("div#cart-wrap").remove();
	    
	    var ids = cartList.map(function(el){
			return el.cart_cd;
		});
	    applyCoupon();
		addDeliveryPayment(ids);
		computePayment(ids);
	});
	
	//추가배송비
	function addDeliveryPayment(ids){
		ids.forEach(function(id){
			var cart = cartList.find(function(el){
				return el.cart_cd == id
			});
			
			var formData = "postcode="+$("input[name=postcode]").val()+"&product_cd="+cart.product_cd;
			$.ajax({
	            method:"post",
	            url: "/additionalDeliveryPayment",
	            data:formData,
	            async: false,
	            success: function (data) {
	            	addDelivery[cart.product_user_ud] = data.additionalDeliveryPayment;
	            },
	            error: function (xhr, status, error) {
	                console.log(error,xhr,status );
	            }
	        });
		});
	}
	
		//우편번호 변경이벤트
	$("input[name=postcode]").on("input", function() {
		var ids = cartList.map(function(el){
			return el.cart_cd;
		});
		applyCoupon();
		addDeliveryPayment(ids);
		computePayment(ids);
	});
		
		//쿠폰박스 변경시
	$(".couponBox").on("input", function(){
		var couponCd = $(this).val();
		var curIdx = $(this).attr("data-id");
		var isDup = false;
	
		$(".couponBox").each(function(index) {
	   		if($(this).attr("data-id") != curIdx){ //선택한셀렉트제외 같은쿠폰이있다면
	   			  if($(this).val() && $(this).val() == couponCd){
	   				  isDup = true;
	   			  }
	   		}
			});
	
		if(isDup){
			$.toast({
                text: "이미 선택된 쿠폰입니다.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
			$(this).val('').trigger("click");
			return;
		}else{
			applyCoupon();
			addDeliveryPayment(ids);
			computePayment(ids);
		}
	});
	
	//쿠폰적용
	function applyCoupon(){
		var disCoupon = 0;
		$(".couponBox").each(function(index) {
			if($(this).val()){
				var option = $(this).children("option[value="+$(this).val()+"]");
				var saleType = option.attr("data-type");
				var saleCalCondition = option.attr("data-sale-condition");
				var salePayment = option.attr("data-sale-payment");
				var saleRate = option.attr("data-sale-rate");
				
				var productUserPayment = $(this).attr("data-user-payment");
				var productPayment = $(this).attr("data-payment");
				
				if(saleType == 'amount'){
					disCoupon += parseInt(salePayment);
			    }else{
					if(saleCalCondition == 'A'){
					    disCoupon += parseInt(productUserPayment*(saleRate/100));
				    }else{
						disCoupon += parseInt(productPayment*(saleRate/100));
				    }
			    }
		    }
		});
		couponDiscount = disCoupon;
	}

    var IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init("imp78484974");
    var formData = $('#defaultForm').serialize();
    //여러건의 결제
    var product_name ='';
    var orderSize = $('input[name=product_cd]').length;
    if(orderSize >= 0){
        product_name = $('input[name=product_name]').eq(1).val()+"외 "+orderSize+" 건";
    }else{
        product_name = $('input[name=product_name]').eq(0).val();
    }

    $("#submitPayment").on("click",function() {
        if($('#order_user_name').val() == ""){
            $.toast({
                text: "주문자 성함을 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#order_user_email').val() == ""){
            $.toast({
                text: "이메일주소를 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#order_user_phone_a').val() == "" || $('#order_user_phone_b').val() == "" || $('#order_user_phone_c').val() == ""){
            $.toast({
                text: "휴대폰 번호를 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        }
            <c:if test="${empty sessionScope.email}">
        else if($('#password').val() == "" || $('#password_ch').val() == ""){
            $.toast({
                text: "주문확인용 비밀번호를 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        }
            </c:if>
        else if($('#delivery_user_name').val() == ""){
            $.toast({
                text: "받으시는 분 성함을 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#postcode').val() == "" || $('#roadAddress').val() == "" || $('#extraAddress').val() == ""){
            $.toast({
                text: "배송 주소를 입력해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        } else if(!$('#replysns').is(":checked")){
            var filter = "win16|win32|win64|macintel|mac|";
            if(navigator.platform){
                if(filter.indexOf(navigator.platform.toLowerCase()) < 0){
                    $.toast({
                        text: "이용약관 동의는 필수 항목입니다.",
                        showHideTransition: 'plain', //펴짐
                        position: 'mid-center',
                        heading: 'Error',
                        icon: 'error'
                    });
                } else {
                    $.toast({
                        text: "이용약관 동의는 필수 항목입니다.",
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                }
            }
        }else{
        	var product_name = cartList.length <= 1 ? cartList[0].product_name : cartList[0].product_name + " 외 " + (cartList.length-1) + "건";
        	$("input[name=product_order_name]").val(product_name);

            // loginAuth(data.access_token);
            // location.href=data.redirectUrl;
            IMP.request_pay({ // param
                pg: "kcp",
                pay_method:$('input[name=payment_type_cd]:checked').val(),
                merchant_uid:$('input[name=order_no]').val(),
                name: product_name,
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
                        "name" : cartList,
                        "quantity" : $('input[name=quantity_total]').val(),
                        "amount" : $('input[name=payment]').val(),
                    },
                ],
            }, function (rsp) { // callback 모바일 호출안됨
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
                        url: "/Save/PaymentOrders",
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
                                        position: 'top-right',
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
                                                    position: 'top-right',
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
                    /* commonAjaxCall("POST","/Save/PaymentOrders",formData) */
                }else{
                    $.toast({
                        text: rsp.error_msg,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
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
            $("#password_cfValidation").addClass("text-success");
        }
    })
</script>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>