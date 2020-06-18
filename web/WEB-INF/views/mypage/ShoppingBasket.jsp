<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<!-- <style>
.npay_storebtn_bx{
	zoom:2;
}
</style> -->
<script type="text/javascript">
	function buy_nc(){
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
			item_options.push('');
			
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
			BACK_URL: 'http://onejoy-life.com/' 
		};

		$.ajax({
			crossOrigin : true,
			url: "/api/naverPayOrderKey",
			method: 'post',
			data: formData,
			success:function(order_id){
		        location.href = "https://test-order.checkout.naver.com/customer/order.nhn?ORDER_ID="+order_id+"&SHOP_ID=np_xqqgk375177&TOTAL_PRICE="+total_price;
			},
			error:function(e){
				alert("error");
			}
		})
		return;
	}
</script>
<div class="wrap">
    <div class="page-box">

        <main class="clearfix main-tab">
            <c:import url="/layout/scrollRight"/>
            <h2 class="head-h2">장바구니</h2>
            <div class="tab-box">
                <p class="tab on" data-tab="t-box1">일반 <span>(${searchVO.totRow})</span></p>
<%--                <p class="tab" data-tab="t-box2">경품 <span>(5)</span></p>--%>
            </div>
            <div class="box on" id="t-box1">
                <form name="defaultform" id="defaultForm" method="POST">
                    <input type="hidden" name="table_name" value="product_cart">
                    <input type="hidden" name="pk" value="cart_cd">

                    <div class="click-txt">
<%--                        <p class="txt1">선택 찜하기</p>--%>
                        <p class="txt2 commonlistDelete">선택 삭제</p>
                    </div>
                    <table class="box1-table">
                        <colgroup>
                            <col style="width: 50px;">
                            <col style="width: 150px;">
                            <col style="width: 370px;">
                            <col style="width: 120px;">
                            <col style="width: 120px;">
                            <col style="width: 290px;">
                            <col style="width: 170px;">
<%--                            <col style="width: 50px;">--%>
                        </colgroup>
                        <thead>
                        <tr class="head-tr">
                            <td><input type="checkbox" id="tr-ck1-1"><label for="tr-ck1-1" class="tr-icon"></label></td>
                            <td></td>
                            <td>상품정보</td>
<%--                            <td>옵션병경</td>--%>
                            <td>수량</td>
                            <td>소비자가</td>
                            <td>상품가격</td>
<%--                            <td>배송비</td>--%>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody class="body-t">

                        <c:if test="${not empty list}">
                            <c:forEach var="list" items="${list}" varStatus="status">
                                <tr>
                                    <td>
                                        <input type="hidden" name="cart_cd" value="${list.cart_cd}">
                                        <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.cart_cd}"><label for="body-ck1-${status.index}"></label>
                                    </td>
                                    <td>
                                        <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                                        </a>
                                    </td>
                                    <td class="p-box">
                                        <p>${list.product_brand}</p>
                                        <p>${list.product_name}</p>
                                        <p>${list.product_model_name}</p>
<%--                                        <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
                                    </td>
<%--                                    <td><p class="op-td1">옵션변경</p></td>--%>
                                    <td>
                                        <input type="number" name="payment_order_quantity" value="${list.payment_order_quantity}" class="num-box payment_order_quantity" data-id="${list.cart_cd}">
                                        <input type="hidden" name="order_max" value="${list.product_max_limit}" />
                                        <input type="hidden" name="order_min" value="${list.product_min_limit}" />
                                    </td>
                                    <td>
                                        <div class="price-number before-price">
                                            <fmt:formatNumber value="${list.product_user_payment*list.payment_order_quantity}" groupingUsed="true" />원
                                        </div>
                                    </td>
                                    <td><span><fmt:formatNumber value="${list.product_payment*list.payment_order_quantity}" groupingUsed="true" /></span>원</td>
<%--                                    <td><span><fmt:formatNumber value="${list.product_delivery_payment}" groupingUsed="true" /></span>원</td>--%>
                                    <td><button class="x" data-id="${list.product_cd}"></button></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="8">
                                    표시할 내용이 없습니다.
                                </td>
                            </tr>

                        </c:if>
                        </tbody>
                    </table>
                    <table class="box1-table table-none">
                        <colgroup>
                            <col style="width: 50px;">
                            <col style="width: 150px;">
                            <col style="width: 370px;">
                            <col style="width: 120px;">
                            <col style="width: 120px;">
                            <col style="width: 120px;">
                            <col style="width: 120px;">
                            <col style="width: 50px;">
                        </colgroup>
                        <thead>

                        <tr class="head-tr">
                            <td>
<%--                                <input type="checkbox" id="all-chk" name="all-chk">--%>
                                <input type="checkbox" id="all-chk" name="all-chk"><label for="all-chk" class="tr-icon"></label>
                            </td>
                            <td></td>
                            <td>상품정보</td>
                            <td>옵션병경</td>
                            <td>수량</td>
                            <td>상품가격</td>
                            <td>배송정보</td>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody class="body-t">
                        <tr>
                            <td colspan="8">장바구니에 담긴 상품이 없습니다.</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="click-txt">
<%--                        <p class="txt1">선택 찜하기</p>--%>
                        <p class="txt2 commonlistDelete">선택 삭제</p>
                    </div>
                    <div class="sum">
                        <div class="sum-in">
                            <p><span>총 주문금액</span><br><span class="font-s sum-span1"></span><span>원</span></p>
                            <div class="sum-icon1"></div>
                            <p><span>총 할인금액</span><br><span class="font-s sum-span2"></span><span>원</span></p>
                            <div class="sum-icon2"></div>
                            <p><span>배송비</span><br><span class="font-s sum-span3"></span><span>원</span></p>
                            <div class="sum-icon3"></div>
                            <p><span>결제예정금액</span><br><span class="font-s  sum-span4"></span><span>원</span></p>
                        </div>
                    </div>
                    <div class="but-box">
                        <button type="button" class="but1 cartPaymentOrder" data-id="allCheck">전체 주문하기</button>
                        <button type="button" class="but2 cartPaymentOrder" data-id="selectCheck">선택 주문하기</button>
                        <c:if test="${sessionScope.email == 'test'}">
	                        <script type="text/javascript" >
	                        naver.NaverPayButton.apply({
	                            BUTTON_KEY: "353CD814-8087-4896-AEE9-B9FE1EA7FA7F", // 네이버페이에서 제공받은 버튼 인증 키 입력
	                            TYPE: "A", // 버튼 모음 종류 설정
	                            COLOR: 1, // 버튼 모음의 색 설정
	                            COUNT: 1, // 버튼 개수 설정. 구매하기 버튼만 있으면(장바구니 페이지) 1, 찜하기 버튼도 있으면(상품 상세 페이지) 2를 입력.
	                            ENABLE: "Y", // 품절 등의 이유로 버튼 모음을 비활성화할 때에는 "N" 입력
	                            BUY_BUTTON_HANDLER: buy_nc, // 구매하기 버튼 이벤트 Handler 함수 등록, 품절인 경우 not_buy_nc 함수 사용
                            });
	                        </script>
	                    </c:if>
                    </div>
                </form>
            </div>
        </main>

    </div>
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
	
	$(".sum-span1").html(payment.toLocaleString('en'));
	$(".sum-span2").html(discount.toLocaleString('en'));
	$(".sum-span3").html(delivery.toLocaleString('en'));
	$(".sum-span4").html((payment-discount+delivery).toLocaleString('en'));
}
</script>
<script>
    $(document).ready(function(){
        $('.gnb>li:first-child').mouseover(function(){
            $('.gnb-submenu').show();
        });
        $('.gnb>li:first-child').mouseleave(function(){
            $('.gnb-submenu').hide();
        });
        $('.gnb-submenu>li').mouseover(function(){
            $(this).children('.gnb-submenu-2dp').show();
        });
        $('.gnb-submenu>li').mouseleave(function(){
            $(this).children('.gnb-submenu-2dp').hide();
        });
        $('.gnb-submenu-2dp>li').mouseover(function(){
            $(this).children('.gnb-submenu-3dp').show().animate({
                width: '200px'
            },100);
        });
        $('.gnb-submenu-2dp>li').mouseleave(function(){
            $(this).children('.gnb-submenu-3dp').hide().animate({
                width: '0px'
            },100);
        });
        //헤더 sticky
        $(function(){
            var windowB = $(window),
                headerOffsetTop = $(".gnb-section").offset().top;
            windowB.on("scroll",function(){
                if(windowB.scrollTop()>headerOffsetTop) {
                    $(".gnb-section").addClass("sticky");
                    $('.header-logo').addClass('mgbt60')
                }else{
                    $(".gnb-section").removeClass("sticky");
                    $('.header-logo').removeClass('mgbt60')
                }

            });//scroll
            // 윈도우의 스크롤 이벤트를 발생시키는
            // (헤더의 초기 위치를 조정하기 위해)
            windowB.trigger('scroll');
        });//end

        $('.tab-box p').click(function(){
            var tab_id = $(this).attr('data-tab');

            $('.tab-box p').removeClass('on');
            $('.main-tab .box').removeClass('on');

            $(this).addClass('on');
            $("#"+tab_id).addClass('on');
        })
        $(function(){
            $('#tr-ck1-1').click(function(){
                var chk = $(this).is(':checked');//.attr('checked');
                if(chk) $('.body-t input').prop('checked',true);
                else $('.body-t input').prop('checked',false);
            });
        });

        $(".top-but").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
        $(".down-but").click(function(){
            $('html, body').animate({
                scrollTop:($('body').height())
            }, 400);
            return false;
        });
    });



</script>
<script type="text/javascript">
// 추가 정보 입력
// wcs_do 함수 호출
wcs_do();
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>