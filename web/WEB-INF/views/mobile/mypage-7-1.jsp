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
        <h2 class="pb-1">교환신청</h2>
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
        
        <h2 class="pb-1 mt-4">교환사유</h2>
        <hr class="pb-1">
        <p class="text-md mt-1 mb-05">사유입력</p>
        <div class="textarea mt-05">
           <span>(0/250)</span>
           <textarea name="reason" id="reason" class="width-100"></textarea>
        </div>
        
        <h2 class="pb-1 mt-4">원상품 회수지 정보</h2>
        <hr class="pb-1">
        <p class="grey pb-05">수령인</p>
        <input name = "return_user_name" type="text" value="${delivery.delivery_user_name}" class="select-op">
        <p class="grey pt-2 pb-05">연락처</p>
        <input name = "return_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op">
        <p class="grey pt-2 pb-05">우편번호</p>
        <input name = "postcode" type="text" value="${delivery.postcode}" class="select-op">
        <button class="btn my-1" type="button" id="daumMapCall">주소지 변경</button>
        <p class="grey pt-2 pb-05">주소</p>
        <input name = "roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
        <input name = "jibunAddress" type="hidden" value="${delivery.jibunAddress}" >
        <input name = "guide" type="hidden" value="${delivery.jibunAddress}" >
        <p class="grey pt-2 pb-05">상세주소</p>
        <input name = "extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long">
        
        <h2 class="pb-1 mt-4">교환상품 배송지 정보</h2>
        <hr class="pb-1">
        <p class="grey pb-05">수령인</p>
        <input name = "refund_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op">
        <p class="grey pt-2 pb-05">연락처</p>
        <input name = "refund_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op">
        <p class="grey pt-2 pb-05">우편번호</p>
        <input name = "refund_postcode" type="text" value="${delivery.postcode}" class="select-op">
        <button class="btn my-1" type="button" id="daumMapCall">주소지 변경</button>
        <p class="grey pt-2 pb-05">주소</p>
        <input name = "refund_roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
        <input name = "refund_jibunAddress" type="hidden" value="${delivery.jibunAddress}" >
        <input name = "refund_guide" type="hidden" value="${delivery.jibunAddress}" >
        <p class="grey pt-2 pb-05">상세주소</p>
        <input name = "refund_extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long">
        
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" id="formSubmit">교환신청</a></li>
        </ul>
    </div>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>