<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>

    <section class="subheader">
        <div class="subTitle">장바구니</div>
        <ul class="taps">
            <li><a href="#" class="active">일반 (${searchVO.totRow})</a></li>
<%--            <li><a href="#">경품 (5)</a></li>--%>
        </ul>
    </section>
    <section class="wrap">
        <form name="defaultform" id="defaultForm" method="POST">
            <input type="hidden" name="table_name" value="product_cart">
            <input type="hidden" name="pk" value="cart_cd">

            <ul class="btns">
    <%--            <li><a href="#" class="active">선택 찜하기</a></li>--%>
                <li><a href="" class="commonlistDelete">선택 삭제</a></li>
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
                                    <img src='${list.file_1}' onerror="this.src='http://placehold.it/90'">
                                    </a>
                                </li>
                                <li>
                                    <p>${list.product_brand}</p>
                                    <h5>${list.product_name}</h5>
                                    <p class="grey">${list.product_model_name}</p>
                                    <%--<p class="option"><span>구성품</span> <br>
                                    · 30mm 1.4 여친렌즈 <br>
                                    · 추가배터리</p>--%>
                                </li>
                            </ul>
                            <h2><fmt:formatNumber value="${list.product_payment*list.payment_order_quantity}" groupingUsed="true" /><span>원</span> <span class="shipping">무료배송</span></h2>
    <%--                        <button class="btn-black btn">옵션변경</button>--%>
                            <button class="btn x" data-id="${list.product_cd}">삭제</button>
                            <select name="payment_order_quantity" value="${list.payment_order_quantity}" class="half payment_order_quantity" data-id="${list.cart_cd}">
                                <option value="1" <c:if test="${list.payment_order_quantity eq '1'}"> selected</c:if>>1</option>
                                <option value="2" <c:if test="${list.payment_order_quantity eq '2'}"> selected</c:if>>2</option>
                                <option value="3" <c:if test="${list.payment_order_quantity eq '3'}"> selected</c:if>>3</option>
                                <option value="4" <c:if test="${list.payment_order_quantity eq '4'}"> selected</c:if>>4</option>
                                <option value="5" <c:if test="${list.payment_order_quantity eq '5'}"> selected</c:if>>5</option>
                                <option value="6" <c:if test="${list.payment_order_quantity eq '6'}"> selected</c:if>>6</option>
                            </select>
                            <input type="hidden" name="order_max" value="${list.product_max_limit}" />
                            <input type="hidden" name="order_min" value="${list.product_min_limit}" />
                        </li>
                    </ul>
                </c:forEach>
            </c:if>
            <c:if test="${empty list}">
                <ul class="basket">
                    <li>표시할 내용이 없습니다.</li>
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
            <li>총 주문금액</li>
            <li class="sum-span1"></li>
        </ul>
        <ul class="calculator">
            <li>총 할인금액</li>
            <li class="sum-span2"></li>
        </ul>
        <ul class="calculator">
            <li>배송비</li>
            <li class="sum-span3"></li>
        </ul>
        <hr>
        <ul class="calculator">
            <li>원결제예정금액</li>
            <li class="txtRed sum-span4"></li>
        </ul>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" id="selectOrder" class="cartPaymentOrder" data-id="selectCheck">선택 주문하기</a></li>
           <li><a href="#" id="allOrder" class="cartPaymentOrder" data-id="allCheck">전체 주문하기</a></li>
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
		if(cart.product_delivery_bundle_yn == 'N'){ //묶음배송체크
			delivery += parseInt(cart.delivery_payment);
		}else{
			if(storeDeliveryList.hasOwnProperty(cart.product_user_ud)){ //키가있다면 가장비싼배송비
				if(storeDeliveryList[cart.product_user_ud] < cart.delivery_payment) { 
					storeDeliveryList[cart.product_user_ud] = parseInt(cart.delivery_payment) 
    			}
			}else{ //키가없다면 키추가
				storeDeliveryList[cart.product_user_ud] = parseInt(cart.delivery_payment)
			}
		}
	});
	
	$.each(storeDeliveryList,function(key,val){
		delivery += val;
	});
	
	$(".sum-span1").html(payment.toLocaleString('en') + '<span>원</span>');
	$(".sum-span2").html('- ' + discount.toLocaleString('en') + '<span>원</span>');
	$(".sum-span3").html('+ ' + delivery.toLocaleString('en') + '<span>원</span>');
	$(".sum-span4").html((payment-discount+delivery).toLocaleString('en') + '<span>원</span>');
}
</script>
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>