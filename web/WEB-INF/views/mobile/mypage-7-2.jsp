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
        <h2 class="pb-1">반품신청</h2>
        <hr class="pb-1">
        <ul class="flexbetween pb-1">
            <li>상점주문번호</li>
            <li class="red">${paymentDetail.order_no}</li>
        </ul>
        <ul class="flexbetween mb-1">
            <li>주문일</li>
            <li><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></li>
            <input type="hidden" name="order_no" value="${paymentDetail.order_no}">
                        <input type="hidden" name="cancel_request_amount" value="${paymentDetail.payment}">
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
        
        <h2 class="pb-1 mt-4">반품사유</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">사유입력</p>
        <div class="textarea mt-05">
           <span>(0/250)</span>
           <textarea name="reason" id="reason" class="width-100"></textarea>
        </div>
        
        <h2 class="pb-1 mt-4">반품수거 정보입력</h2>
        <hr class="pb-1">
        <p class="mt-1 mb-05">반품하실 상품을 발송하셨습니까?</p>
        <div class="my-1">
            <input type="radio" id="tab1-rd" name="refund_send_type" checked value="Y">
            <label for="tab1-rd">네, 이미 발송하였습니다.</label>
        </div>
        <div class="mb-2">
            <input type="radio" id="tab2-rd" name="refund_send_type" value="N">
            <label for="tab2-rd">아니요, 아직 발송하지 않았습니다.</label>
        </div>
        <p class="grey pb-05">반품상품 발송일</p>
        <input type="text" id="from_date" class="date_pick" name="refund_send_date">
        <p class="grey pt-2 pb-05">반품상품 택배사</p>
        <select class="full mb-05" name="refund_delivery_t_code">
            <c:forEach var="companyList" items="${companyList}" varStatus="status">
			  <option value="${companyList.Name}">${companyList.Name}</option>
			</c:forEach>
         </select>
        <p class="grey pt-2 pb-05">반품상품 송장번호</p>
        <input type="text" name="refund_delivery_t_invoice" class="num-s" >
        
        <h2 class="pb-1 mt-4">결제 정보</h2>
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
      <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>