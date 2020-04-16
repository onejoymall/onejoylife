<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>
    <section class="subheader">
        <div class="subTitle">주문/배송 조회</div>
    </section>
    
    <section class="wrap">
        <h2 class="pb-1">주문 상세내역</h2>
        <hr class="pb-1">
        <ul class="flexbetween pb-1">
            <li>주문번호</li>
            <li class="red">${paymentDetail.order_no}</li>
        </ul>
        <ul class="flexbetween mb-1">
            <li>주문일</li>
            <li><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></li>
        </ul>
        <hr class="grey">
        <ul class="product pb-0">
           <h5>${paymentDetail.payment_status_name}</h5>
            <ul class="pb-0">
                <li><img src="${paymentDetail.file_1}" alt=""></li>
                <li>
                    <p>[${paymentDetail.product_made_company_name}]</p>
                    <h5>${paymentDetail.product_name}</h5>
                    <p class="grey">${paymentDetail.product_made_company_model}</p>
                    <!-- <p class="option"><span>구성품</span> <br>
                    · 30mm 1.4 여친렌즈 <br>
                    · 추가배터리</p> -->
                </li>
            </ul>
            <ul class="options">
                <li>상품금액</li>
                <li><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
            <ul class="options mb-1">
                <li>수량</li>
                <li>1 <span>개</span></li>
            </ul>
            <div class="my-1">
                <!-- <button class="btn">배송지 변경</button> -->
                <c:if test="${paymentDetail.payment_status eq 'W'}">
                <button type="button" class="btn btn-red" onclick="location.href='/MyPage/OrderCancel?order_no=${paymentDetail.order_no}'">주문취소</button>
                </c:if>
                <c:if test="${paymentDetail.payment_status eq 'R'}">
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderCancel?order_no=${paymentDetail.order_no}'">배송조회</button>
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderChange?order_no=${paymentDetail.order_no}'">교환신청 하기</button>
                <button type="button" class="btn btn-blue" onclick="location.href='/MyPage/OrderRollback?order_no=${paymentDetail.order_no}'">반품신청 하기</button>
				</c:if>
            </div>
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
        
        <ul class="flexbetween pb-1 mt-4">
            <li><h2>결제 정보</h2></li>
            <!-- <li><button class="btn">신용카드 전표</button></li> -->
        </ul>
        
        <hr class="pb-1">
        <p class="grey pb-05">주문금액</p>
        <h3><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />원</h3>
        <p class="grey pt-2 pb-05">상품금액</p>
        <h3><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" />원</h3>
        <p class="grey pt-2 pb-05">결제금액</p>
        <h3 class="red"><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />원</h3>
        <p class="grey pt-2 pb-05">결제수단</p>
        <h3>${paymentDetail.pay_method}</h3>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="/MyPage/OrderAndDelivery" class="btn ">목록보기</a></li>
        </ul>
    </div>
    