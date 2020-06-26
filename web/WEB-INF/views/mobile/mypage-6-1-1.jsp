<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>
    <section class="subheader">
        <div class="subTitle">취소/재결제/교환/반품</div>
    </section>
<form name="defaultForm" id="defaultForm" method="POST">
    <section class="wrap">
        <h2 class="pb-1">취소신청</h2>
        <hr class="pb-1">
        <ul class="flexbetween pb-1">
            <li>상점주문번호</li>
            <li class="red">${paymentDetail.order_no}</li>
            <input type="hidden" name="merchant_uid" value="${paymentDetail.order_no}">
            <input type="hidden" name="cancel_request_amount" value="${paymentDetail.payment}">
        </ul>
        <ul class="flexbetween mb-1">
            <li>주문일</li>
            <li><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></li>
        </ul>
        <hr class="grey">
        <ul class="product pb-0">
            <ul class="pb-0">
                <li><img src="${paymentDetail.file_1}" alt=""></li>
                <li>
                    <h5>${paymentDetail.product_name}</h5>
                    <p class="grey">${paymentDetail.product_made_company_model}</p>
                </li>
            </ul>
            <ul class="options">
                <li>상품금액</li>
                <li><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
        </ul>
        
        <h2 class="pb-1 mt-4">취소사유</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">사유입력</p>
		<input name="reason" type="text" class="select-op">
        
        <h2 class="pb-1 mt-4">환불 정보</h2>
        <hr class="pb-1">
        <p class="grey pb-05">주문금액</p>
        <h3><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />원</h3>
        <p class="grey pt-2 pb-05">상품금액</p>
        <h3><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" />원</h3>
        <p class="grey pt-2 pb-05">결제금액</p>
        <h3 class="red"><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" />원</h3>
        <p class="grey pt-2 pb-05">결제수단</p>
        <h3>${paymentDetail.pay_method}</h3>
        
        <h2 class="pb-1 mt-4">환불 계좌</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">은행명</p>
        <!-- <input name="refund_bank" type="text" class="select-op"> -->
        <select name="refund_bank" class="select-op">
            <c:if test="${not empty getSelectorList}">
                <option value="">은행명</option>
                <c:forEach var="getSelectorList" items="${getSelectorList}" varStatus="status">
                    <option value="${getSelectorList.code_value}" >${getSelectorList.code_name}</option>
                </c:forEach>
            </c:if>
        </select>
        <p class="text-md mt-1 mb-05">계좌 번호</p>
        <input type="text" name="refund_account"  class="select-op">
        <p class="text-md mt-1 mb-05">예금주</p>
        <input type="text" name="refund_holder" class="select-op">
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" id="formSubmit">신청</a></li>
        </ul>
    </div>
    </form>
    
    <%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>