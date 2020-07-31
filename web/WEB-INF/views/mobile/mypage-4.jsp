<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
<style>
.npay_storebtn_bx{
	margin-top: 15px !important;
	zoom:1.4;
}
</style>
<script type="text/javascript">
	function buy_nc(){
		if($('input[name=chk]:checked').length <= 0){
            $.toast({
                heading: '${afn:getMessage('msg.payment_product',sessionScope.locale)}',
                // text: [
                //     '<a href="/sign/signup">회원 가입 후 이용</a>',
                //     '<a href="#" onclick="$(\'#defaultForm\').submit();">비 회원 주문</a>',
                // ],
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                icon: 'info',
            });
            return;
        }
		
		var item_ids = [];
		var item_names = [];
		var item_counts = [];
		var item_uprices = [];
		var item_tprices = [];
		var item_options = [];
		
		var shipping_price = 0;
		var shipping_type = "";
		var total_price = 0;
		
		var checkIds=[];
		$('input[type=checkbox][name=chk]').each(function (index) {
			if($(this).is(":checked")){
				checkIds.push($(this).val());
			}
		});

		var payment=0;
		var discount=0;
		var delivery=0;
		var total=0;
		
		var storeDeliveryList = {};
		checkIds.forEach(function(id){
			var cart = cartList.find(function(el){
				return el.cart_cd == id
			});
			
			item_ids.push(cart.product_cd);
			item_names.push(cart.product_name);
			item_counts.push(cart.payment_order_quantity);
			item_uprices.push(cart.product_payment);
			item_tprices.push(cart.product_payment * cart.payment_order_quantity);
			item_options.push(cart.option_name ? cart.option_name : ' ');
			
			payment += cart.product_user_payment*cart.payment_order_quantity;
			discount += (cart.product_user_payment-cart.product_payment)*cart.payment_order_quantity;
			if(!cart.product_delivery_bundle_yn || cart.product_delivery_bundle_yn == 'N'){ //묶음배송체크
				delivery += parseInt(cart.delivery_payment);
			}else{
				if(storeDeliveryList.hasOwnProperty(cart.product_store_id)){ //키가있다면 가장비싼배송비
					if(storeDeliveryList[cart.product_store_id] < cart.delivery_payment) { 
						storeDeliveryList[cart.product_store_id] = parseInt(cart.delivery_payment) 
	    			}
				}else{ //키가없다면 키추가
					storeDeliveryList[cart.product_store_id] = parseInt(cart.delivery_payment)
				}
			}
		});
		
		$.each(storeDeliveryList,function(key,val){
			delivery += val;
		});
		
		if(delivery == 0){
	    	shipping_type = "FREE"
	    }else{
	    	shipping_type = "PAYED";
	    }
		shipping_price = delivery;
		total_price = payment-discount+delivery;

	    //데이터
		var formData = {
			SHOP_ID: 'np_xqqgk375177',
			CERTI_KEY: 'FC4BA46C-56EB-4BB6-B089-18DC8FF1CA1A',
			ITEM_ID: item_ids,
			ITEM_NAME: item_names,
			ITEM_COUNT: item_counts,
			ITEM_UPRICE: item_uprices,
			ITEM_TPRICE: item_tprices,
			ITEM_OPTION: item_options,
			SHIPPING_PRICE: shipping_price,
			SHIPPING_TYPE: shipping_type,
			TOTAL_PRICE: total_price,
			BACK_URL: 'http://onejoy-life.com/MyPage/ShoppingBasket'
		};

		$.ajax({
			crossOrigin : true,
			url: "/api/naverPayOrderKey",
			method: 'post',
			data: formData,
			success:function(order_id){
		        location.href = "https://m.pay.naver.com/mobile/customer/order.nhn?ORDER_ID="+order_id+"&SHOP_ID=np_xqqgk375177&TOTAL_PRICE="+total_price;
			},
			error:function(e){
				alert("error");
			}
		})
		return;
	}
</script>

    <section class="subheader">
        <div class="subTitle">${afn:getMessage('cart',sessionScope.locale)}</div>
        <ul class="taps">
            <li><a href="#" class="active">${afn:getMessage('brd_usual',sessionScope.locale)} (${searchVO.totRow})</a></li>
<%--            <li><a href="#">경품 (5)</a></li>--%>
        </ul>
    </section>
    <section class="wrap">
        <form name="defaultform" id="defaultForm" method="POST">
            <input type="hidden" name="table_name" value="product_cart">
            <input type="hidden" name="pk" value="cart_cd">

            <ul class="btns">
    <%--            <li><a href="#" class="active">선택 찜하기</a></li>--%>
                <li><a href="" class="commonlistDelete">${afn:getMessage('chkdelete',sessionScope.locale)}</a></li>
            </ul>
            <hr>

            <c:if test="${not empty list}">
                <c:forEach var="list" items="${list}" varStatus="status">
                    <ul class="basket">
                        <li>
                            <input type="hidden" name="cart_cd" value="${list.cart_cd}">
                            <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.cart_cd}">
                            <label for="body-ck1-${status.index}"></label>
                        </li>
                        <li>
                            <ul>
                                <li>
                                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                                    <img src='${list.file_1}' onerror="this.src='http://placehold.it/90'" width="100">
                                    </a>
                                </li>
                                <li>
                                    <%-- <p>${list.product_brand}</p> --%>
                                    <h5>${list.product_name}</h5>
                                    <%-- <p class="grey">${list.product_model_name}</p> --%>
                                    <p class="option"><span><c:if test="${not empty list.option_name}">${list.option_name}</c:if>
										<c:if test="${empty list.option_name}">-</c:if></span></p>
                                </li>
                            </ul>
                            <h2><fmt:formatNumber value="${list.product_payment*list.payment_order_quantity}" groupingUsed="true" /><span>${afn:getMessage('korea_won',sessionScope.locale)}</span> <span class="shipping">${afn:getMessage('free_shipping',sessionScope.locale)}</span></h2>
    <%--                        <button class="btn-black btn">옵션변경</button>--%>
                            <button class="btn x" data-id="${list.product_cd}">${afn:getMessage('delete',sessionScope.locale)}</button>
                            <select name="payment_order_quantity" value="${list.payment_order_quantity}" class="half payment_order_quantity" data-id="${list.cart_cd}">
                                <c:forEach var="i" begin="1" end="100">
                               		<option value="${i}" <c:if test="${list.payment_order_quantity eq i}"> selected</c:if>>${i}</option>
                                </c:forEach>
                            </select>
                            <input type="hidden" name="order_max" value="${list.product_max_limit}" />
                            <input type="hidden" name="order_min" value="${list.product_min_limit}" />
                        </li>
                    </ul>
                </c:forEach>
            </c:if>
            <c:if test="${empty list}">
                <ul class="basket">
                    <li>${afn:getMessage('msg.none_content',sessionScope.locale)}</li>
                </ul>

            </c:if>
            <%--<ul class="basket">
                <li>
                    <input type="checkbox" id="basket1">
                    <label for="basket1"></label>
                </li>
                <li>
                    <ul>
                        <li><img src="../../assets/img/cam-img.jpg" alt=""></li>
                        <li>
                            <p>브라운</p>
                            <h5>쿠쿠 10인용 IH전기압력밥솥</h5>
                            <p class="grey">VR25G66G98UWS</p>
                            <p class="option"><span>구성품</span> <br>
                            · 30mm 1.4 여친렌즈 <br>
                            · 추가배터리</p>
                        </li>
                    </ul>
                    <h2>3,999,000<span>원</span> <span class="shipping">무료배송</span></h2>
                    <button class="btn-black btn">옵션변경</button>
                    <button class="btn">삭제</button>
                    <select class="half">
                        <option value="1" selected>1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </li>
            </ul>--%>
        </form>
    </section>
    <hr>
    <section class="wrap">
        <ul class="calculator">
            <li>${afn:getMessage('total_order_amount',sessionScope.locale)}</li>
            <li class="sum-span1"></li>
        </ul>
        <ul class="calculator">
            <li>${afn:getMessage('total_discount_amount',sessionScope.locale)}</li>
            <li class="sum-span2"></li>
        </ul>
        <ul class="calculator">
            <li>${afn:getMessage('shippingFee',sessionScope.locale)}</li>
            <li class="sum-span3"></li>
        </ul>
        <hr>
        <ul class="calculator">
            <li>${afn:getMessage('payment_scheduled_amount',sessionScope.locale)}</li>
            <li class="txtRed sum-span4"></li>
        </ul>
        <script type="text/javascript" >
	       naver.NaverPayButton.apply({
               BUTTON_KEY: "353CD814-8087-4896-AEE9-B9FE1EA7FA7F", // 네이버페이에서 제공받은 버튼 인증 키 입력
               TYPE: "MA", // 버튼 모음 종류 설정
               COLOR: 1, // 버튼 모음의 색 설정
               COUNT: 1, // 버튼 개수 설정. 구매하기 버튼만 있으면(장바구니 페이지) 1, 찜하기 버튼도 있으면(상품 상세 페이지) 2를 입력.
               ENABLE: "Y", // 품절 등의 이유로 버튼 모음을 비활성화할 때에는 "N" 입력
               BUY_BUTTON_HANDLER: buy_nc, // 구매하기 버튼 이벤트 Handler 함수 등록, 품절인 경우 not_buy_nc 함수 사용
           });
          </script>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" id="selectOrder" class="cartPaymentOrder" data-id="selectCheck">${afn:getMessage('selective_order',sessionScope.locale)}</a></li>
           <li><a href="#" id="allOrder" class="cartPaymentOrder" data-id="allCheck">${afn:getMessage('all_order',sessionScope.locale)}</a></li>
        </ul>
    </div>


<script>
var cartList = [];
<c:forEach var="list" items="${list}" varStatus="status">
	var obj = {
	<c:forEach var="el" items="${list}" varStatus="status">
		<c:if test="${!fn:contains(el.key, 'html')}">
			${el.key}: "${el.value}",	
		</c:if>
	</c:forEach>
	};
	cartList.push(obj);
</c:forEach>
computePayment([]);
$(function(){
	$("input[type=checkbox][name=chk], #tr-ck1-1").on("input",function(){
		var checkIds=[];
		$('input[type=checkbox][name=chk]').each(function (index) {
			if($(this).is(":checked")){
				checkIds.push($(this).val());
			}
		});
		computePayment(checkIds);
	})
	$('input[name=chk], #tr-ck1-1').prop("checked",true);
	var checkIds=[];
	$('input[type=checkbox][name=chk]').each(function (index) {
		if($(this).is(":checked")){
			checkIds.push($(this).val());
		}
	});
	computePayment(checkIds);
});
	
function computePayment(ids){
	var payment=0;
	var discount=0;
	var delivery=0;
	var total=0;
	
	var storeDeliveryList = {};
	ids.forEach(function(id){
		var cart = cartList.find(function(el){
			return el.cart_cd == id
		});
		
		payment += cart.product_user_payment*cart.payment_order_quantity;
		discount += (cart.product_user_payment-cart.product_payment)*cart.payment_order_quantity;
		if(!cart.product_delivery_bundle_yn || cart.product_delivery_bundle_yn == 'N'){ //묶음배송체크
			delivery += parseInt(cart.delivery_payment);
		}else{
			if(storeDeliveryList.hasOwnProperty(cart.product_store_id)){ //키가있다면 가장비싼배송비
				if(storeDeliveryList[cart.product_store_id] < cart.delivery_payment) { 
					storeDeliveryList[cart.product_store_id] = parseInt(cart.delivery_payment) 
    			}
			}else{ //키가없다면 키추가
				storeDeliveryList[cart.product_store_id] = parseInt(cart.delivery_payment)
			}
		}
	});
	
	$.each(storeDeliveryList,function(key,val){
		delivery += val;
	});
	
	$(".sum-span1").html(payment.toLocaleString('en') + '<span>${afn:getMessage('korea_won',sessionScope.locale)}</span>');
	$(".sum-span2").html('- ' + discount.toLocaleString('en') + '<span>${afn:getMessage('korea_won',sessionScope.locale)}</span>');
	$(".sum-span3").html('+ ' + delivery.toLocaleString('en') + '<span>${afn:getMessage('korea_won',sessionScope.locale)}</span>');
	$(".sum-span4").html((payment-discount+delivery).toLocaleString('en') + '<span>${afn:getMessage('korea_won',sessionScope.locale)}</span>');
}
</script>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>