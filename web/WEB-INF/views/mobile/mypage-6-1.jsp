<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>
    <section class="subheader">
        <div class="subTitle">주문상세</div>
    </section>
    
    <section class="wrap">
        <h2 class="pb-1">주문 상세내역</h2>
        <hr class="pb-1">
        <ul class="flexbetween pb-1">
            <li>상점주문번호</li>
            <li class="red">${paymentDetail.order_no}</li>
        </ul>
        <ul class="flexbetween pb-1">
            <li>주문번호</li>
            <li class="red">${paymentDetail.imp_uid}</li>
        </ul>
        <ul class="flexbetween mb-1">
            <li>주문일</li>
            <li><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></li>
        </ul>
        <hr class="grey">
        <ul class="product pb-0">
           <c:forEach var="list" items="${paymentBundleList}" varStatus="status">
           <h5>${list.payment_status_name}</h5>
            <ul class="pb-0">
                <li><a href="/product/productDetail?product_cd=${list.product_cd}"><img src="${list.file_1}" alt=""></a></li>
                <li>
	               <a href="/product/productDetail?product_cd=${list.product_cd}">
	                   <h5>${list.product_name}</h5>
	               </a>
                </li>
            </ul>
            <ul class="options">
                <li>상품금액</li>
                <li><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
            <ul class="options mb-1">
                <li>수량</li>
                <li><fmt:formatNumber value="${list.payment_order_quantity}" groupingUsed="true" /> <span>개</span></li>
            </ul>
            <div class="my-1">
                <!-- <button class="btn">배송지 변경</button> -->
                <c:if test="${list.payment_status eq 'W' || list.payment_status eq 'D'}">
                <button type="button" class="btn btn-red" onclick="location.href='/MyPage/OrderCancel?order_no=${list.order_no}'">전액취소</button>
                </c:if>
                <c:if test="${list.payment_status eq 'R' || list.payment_status eq 'S'}">
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderCancel?order_no=${list.no}'">배송조회</button>
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderChange?order_no=${list.no}'">교환신청 하기</button>
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderRollback?order_no=${list.no}'">반품신청 하기</button>
				</c:if>
                <c:if test="${list.payment_status eq 'O'}">
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderChange?order_no=${list.no}'">교환신청 하기</button>
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderRollback?order_no=${list.no}'">반품신청 하기</button>
                </c:if>
            </div>
            <hr>
            </c:forEach>
        </ul>
        
        <h2 class="pb-1 mt-4">배송지 정보</h2>
        <hr class="pb-1">
        <p class="grey pb-05">주문하시는분</p>
        <h3>${delivery.delivery_user_name}</h3>
        <p class="grey pt-2 pb-05">휴대폰 번호</p>
        <h3>${delivery.delivery_user_phone}</h3>
        <p class="grey pt-2 pb-05">주소</p>
        <h3>${delivery.postcode} ${delivery.roadAddress} ${delivery.extraAddress}</h3>
        <p class="grey pt-2 pb-05">배송시 요청사항	</p>
        <h3>${delivery.delivery_message}</h3>
        <c:if test="${not empty paymentDetail.delivery_hope_date}">
            <p class="grey pt-2 pb-05">희망 배송일시</p>
            <h3>${paymentDetail.delivery_hope_date} ${paymentDetail.delivery_hope_time}</h3>
        </c:if>
        
        <ul class="flexbetween pb-1 mt-4">
            <li><h2>결제 정보</h2></li>
            <!-- <li><button class="btn">신용카드 전표</button></li> -->
        </ul>
        
        <hr class="pb-1">
        <p class="grey pb-05">주문금액</p>
        <h3><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />원</h3>
        <p class="grey pt-2 pb-05">상품금액</p>
        <h3><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" />원 <c:if test="${fn:length(paymentBundleList) > 1}"> 외 ${fn:length(paymentBundleList) - 1}건</c:if></h3>
        <p class="grey pt-2 pb-05">결제금액</p>
        <h3 class="red"><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />원</h3>
        <p class="grey pt-2 pb-05">결제수단</p>
        <h3>${paymentDetail.pay_method_name} ${paymentDetail.vbank_name} ${paymentDetail.vbank_num}</h3>
        
        <!--20.07.06 추가~-->
        <hr class="mt-4">
        <section class="subheader bg_grey py-1">
        	<c:if test="${impPayment.status == 'paid'}">
        		<ul class="calculator p-1">
	                <li>세금계산서</li>
	                <li><a href="javascript:taxInvoice('${paymentDetail.order_no}');">전송하기 <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
	            <ul class="calculator p-1">
	                <li>영수증</li>
	                <li><a href="javascript:normalReceipt('${paymentDetail.order_no}');">출력하기 <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
           </c:if>
           <c:if test="${impPayment.status == 'paid' && impPayment.payMethod != 'card'}">
	            <ul class="calculator p-1">
	                <li>현금영수증</li>
	                <li><a href="javascript:cashReceipt('${paymentDetail.order_no}');">신청하기 <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
           </c:if>
           <c:if test="${impPayment.status == 'paid'}">
	            <ul class="calculator p-1">
	                <li>거래명세서</li>
	                <li><a href="javascript:transactionStatement('${paymentDetail.order_no}');">출력하기 <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
            </c:if>
			<c:if test="${impPayment.status == 'paid' && impPayment.payMethod == 'card'}">
	            <ul class="calculator p-1">
	                <li>매출전표</li>
	                <li><a href="javascript:salesStatement('${paymentDetail.order_no}');">출력하기 <i class="ri-arrow-right-s-line"></i></a></li>
	            </ul>
	        </c:if>
        </section>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="/MyPage/OrderAndDelivery" class="btn ">목록보기</a></li>
        </ul>
    </div>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>