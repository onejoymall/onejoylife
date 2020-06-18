<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-02
  Time: 오전 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">

        <main class="clearfix">
            <form name="defaultForm" id="defaultForm" method="POST">
                <h2 class="head-h2">주문/결제</h2>
                <div class="left-box">
                    <div class="sec1">
                        <p class="sec-h1">주문자 정보</p>

                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 620px;">
                            </colgroup>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td>주문하시는 분</td>
                                <td><input type="text" name="order_user_name" id="order_user_name"  class="sec1-in1"  value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if><c:if test="${empty sessionScope.email}"></c:if>"></td>
                            </tr>
                            <tr>
                                <td>이메일주소</td>
                                <td><input type="text" name="order_user_email" id="order_user_email"  class="sec1-in1" value="<c:if test="${not empty sessionScope.email}">${sessionScope.email}</c:if><c:if test="${empty sessionScope.email}"></c:if>"></td>
                            </tr>
                            <tr >
                                <td>휴대폰 번호

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

                                </td>
                                <td class="nth-3-td">
                                    <select name="order_user_phone_a" id="order_user_phone_a">
                                        <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
                                        <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
                                        <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
                                        <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
                                        <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
                                        <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
                                    </select>
                                    <span> - </span>
                                    <input type="text" name="order_user_phone_b" id="order_user_phone_b" value="${phoneMap.key2}" class="order_user_phone" maxlength="4">
                                    <span> - </span>
                                    <input type="text" name="order_user_phone_c" id="order_user_phone_c" value="${phoneMap.key3}" class="order_user_phone" maxlength="4">
                                    <input type="hidden" name="order_user_phone" id="order_user_phone" value="<c:if test="${not empty sessionScope.email}"><c:out value="${phoneNumber}"/> </c:if>">
                                </td>
                            </tr>
                            <c:if test="${detail.product_delivery_International_type eq 'B' || detail.product_delivery_International_type eq 'C'}">
                            <tr>
                                <td>통관고유번호</td>
                                <td><input type="text" name="customs_clearance_number" id="customs_clearance_number" class="sec1-in1" /> </td>
                            </tr>
                            </c:if>
                            <c:if test="${empty sessionScope.email}">
                            <tr >
                                <td>주문확인용 비밀번호 입력</td>
                                <td>
                                    <input type="password" id="password" name="password" class="sec1-in1">
                                    <p id="passwordValidation" style="float:right;line-height: 33px;color: red"></p>
                                </td>
                            </tr>
                            <tr class="bor-none">
                                <td>주문확인용 비밀번호 입력 확인</td>
                                <td>
                                    <input type="password" id="password_cf" name="password_cf" class="sec1-in1">
                                    <p id="password_cfValidation" style="float:right;line-height: 33px;color: red"></p>
                                </td>
                            </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <p class="sec1-f-txt">·<span> 주문자 정보로 주문과 관련된 SMS와 E-MAIL이 발송됩니다. 정확한 정보인지 확인해주세요.</span></p>
                    </div>

                    <div class="sec2">
                        <p class="sec-h1">배송지 정보</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 620px;">
                            </colgroup>
                            <tbody class="sec2-tbody">
                            <tr>
                                <td>배송 방법</td>
                                <td class="sel-td">
                                    <c:if test="${delivery.delivery_class eq 'F'}">
                                        ${delivery.selector}
                                    </c:if>
                                    <c:if test="${delivery.delivery_class eq 'T'}">
                                        <select name="delivery_type">
                                            <c:if test="${not empty delivery.selector}">
                                                <c:forEach var="selectorList" items="${delivery.selector}" varStatus="status">
                                                    <option value="${selectorList.code_value}">${selectorList.code_name}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </c:if>


                                </td>
                            </tr>
                            <c:if test="${sessionScope.login}">
                            <tr>
                                <td>배송지 선택</td>
                                <td class="sec2-ov">
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-1" checked value="OLD">
                                        <label for="ra1-1"><span class="ra-txt">기본 배송지</span></label>
                                    </p>
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-2" value="LAST">
                                        <label for="ra1-2"><span class="ra-txt">최근 배송지</span></label>
                                    </p>
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-3" value="NEW">
                                        <label for="ra1-3"><span class="ra-txt">새로입력</span></label>
                                    </p>
                                </td>
                            </tr>
                            </c:if>
                            <tr>
                                <td>받으시는 분</td>
                                <td><input type="text"  class="sec2-in1" name="delivery_user_name" id="delivery_user_name" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>"></td>
                            </tr>
                            <tr class="bor-none">
                                <td>휴대폰 번호 <!-- Map 선언 -->
                                    <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
                                    <c:if test="${empty userInfo.phone}">
                                        <c:set var="phoneNumber" value="" />
                                    </c:if>
                                    <c:if test="${not empty userInfo.phone}">
                                        <c:set var="phoneNumber" value="${latestDelivery.delivery_user_phone}" />
                                    </c:if>
                                    <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                                        <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
                                        <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
                                    </c:forEach>
                                </td>
                                <td class="nth-3-td">
                                    <select name="delivery_user_phone_a" id="delivery_user_phone_a">
                                        <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
                                        <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
                                        <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
                                        <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
                                        <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
                                        <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
                                    </select>
                                    <span> - </span>
                                    <input type="text" name="delivery_user_phone_b" id="delivery_user_phone_b" value="${phoneMap.key2}" class="delivery_user_phone" maxlength="4">
                                    <span> - </span>
                                    <input type="text" name="delivery_user_phone_c" id="delivery_user_phone_c" value="${phoneMap.key3}" class="delivery_user_phone" maxlength="4">
                                    <input type="hidden" name="delivery_user_phone" id="delivery_user_phone" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.delivery_user_phone}  </c:if>">
                                </td>
                            </tr>
                            <tr>
                                <td>전화 번호<!-- Map 선언 -->
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
                                </td>
                                <td class="nth-3-td">
                                    <select name="delivery_user_tel_a" id="delivery_user_tel_a">
                                        <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
                                        <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
                                        <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
                                        <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
                                        <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
                                        <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
                                    </select>
                                    <span> - </span>
                                    <input type="text" name="delivery_user_tel_b" id="delivery_user_tel_b" value="${phoneMap.key2}" class="delivery_user_tel" maxlength="4">
                                    <span> - </span>
                                    <input type="text" name="delivery_user_tel_c" id="delivery_user_tel_c" value="${phoneMap.key3}" class="delivery_user_tel" maxlength="4">
                                    <input type="hidden" name="delivery_user_tel" id="delivery_user_tel" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.delivery_user_tel}</c:if>">
                                </td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td>
                                    <p class="mar-p1">
                                        <input type="text" name="postcode" id="postcode" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
                                        <button type="button" id="daumMapCall">우편번호 찾기</button>
                                    </p>
                                    <p class="mar-p2"><input type="text" class="sec2-in2" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>"></p>
                                    <p class="mar-p2"><input type="text" class="sec2-in2" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>"></p>
                                    <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>
                                    <%--                                    <p class="hidden"><input type="hidden" name="extraAddress" id="extraAddress"></p>--%>
                                    <p class="mar-p2" id="guide"></p>
                                </td>
                            </tr>
                            <tr class="bor-none">
                                <td>배송시 요청사항</td>
                                <td class="sel-td">

                                    <select name="delivery_message_select" id="delivery_message_select" >
                                        <option value="">배송시 요청사항 (선택사항)</option>
                                        <option value="">직접 받고 부재 시 문 앞</option>
                                        <option value="self">직접입력</option>
                                    </select>

                                    <p class="mar-p2 hidden" id="delivery_message_box"><input type="text" class="sec2-in2" name="delivery_message" id="delivery_message"></p>
                                </td>
                            </tr>
                            <c:if test="${store_delivery.product_delivery_hope_date_yn == 'Y'}">
                            <tr class="bor-none">
                                <td>배송 희망일자</td>
                                <td class="sel-td">

                                    <div class="cla">
                                        <input type="text" id="start_date" name="hope_date" class="date_pick">
                                        <div class="cla-img1"></div>
                                    </div>
                                </td>
                            </tr>
                            </c:if>
                            <c:if test="${store_delivery.product_delivery_hope_time_yn == 'Y'}">
                            <tr class="bor-none">
                                <td>배송 희망시간</td>
                                <td class="sel-td">
									
									<div class="cla">
                                        <input type="text" name="hope_time" class="time_pick">
                                        <!-- <div class="cla-img1"></div> -->
                                    </div>
                                </td>
                            </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="sec3">
                        <p class="sec-h1">주문상품 정보</p>
                        <table class="box1-table">
                            <colgroup>
                                <col style="width: 150px;">
                                <col style="width: 390px;">
                                <col style="width: 130px;">
                                <col style="width: 130px;">
<%--                                <col style="width: 130px;">--%>
                            </colgroup>
                            <thead>
                            <tr class="head-tr">
                                <td></td>
                                <td>상품정보</td>
                                <td>상품가격</td>
                                <td>수량</td>
<%--                                <td>당첨번호</td>--%>
                            </tr>
                            </thead>
                            <tbody class="body-tr">
                            <tr >
                                <td><img src='${detail.file_1}' onerror="this.src='http://placehold.it/100'" width="100"></td>
                                <td class="p-box">
                                    <p>${detail.product_made_company_name}</p>
                                    <p>${detail.product_name} ${option}</p>
                                    <p>${detail.product_model}</p>
<%--                                    <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
                                </td>
                                <td><span><fmt:formatNumber value="${detail.product_payment}" groupingUsed="true" /></span>원</td>
                                <td><span>${param.payment_order_quantity}<input type="hidden" name="payment_order_quantity" value="${param.payment_order_quantity}"></span></td>
<%--                                <td><span>123456</span></td>--%>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="sec4">
                        <p class="sec-h1">사용가능한 쿠폰</p>
                        <table class="sec4-table">
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 620px;">
                            </colgroup>
                            <tbody class="sec4-tbody">
                            <tr class="bor-none">
                                <td>쿠폰</td>
                                <td class="sec4-sel">
                                    <div class="sel-box">
                                        <select id="couponBox">
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
                                    </div>
                                    <p>사용가능 쿠폰 <span><fmt:formatNumber value="${fn:length(enableCouponList)}" groupingUsed="true" /></span>장</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="sec5">
                        <p class="sec-h1">결제 정보</p>
                        <div class="ck-box">
                            <input type="checkbox" id="escrow">
                            <label for="escrow"><span class="le-ck-txt"> 에스크로 사용</span></label>
                        </div>
                        <div class="sec5-box">
                            <div class="sec5-p1">
                                결제수단
                            </div>
                            <div class="sec5-p2">
                                <!--
                                card(신용카드)
                                trans(실시간계좌이체)
                                vbank(가상계좌)
                                phone(
                                -->
                                <p>
                                    <input type="radio" id="sec5-ra1" name="payment_type_cd" checked value="card">
                                    <label for="sec5-ra1"><span class="ra-txt">신용카드</span></label>
                                </p>
                                <p>
                                    <input type="radio" id="sec5-ra2" name="payment_type_cd" value="trans">
                                    <label for="sec5-ra2"><span class="ra-txt">실시간계좌이체</span></label>
                                </p>
                                <p>
                                    <input type="radio" id="sec5-ra3" name="payment_type_cd" value="vbank">
                                    <label for="sec5-ra3"><span class="ra-txt">가상계좌</span></label>
                                </p>
<%--                                <p>--%>
<%--                                    <input type="radio" id="sec5-ra4" name="payment_type_cd" value="phone">--%>
<%--                                    <label for="sec5-ra4"><span class="ra-txt">휴대폰결제</span></label>--%>
<%--                                </p>--%>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="right-box">
                    <div class="right-line">
                        <p>최종 결제 금액 확인</p>
                        <div class="num-outer">
                            <div class="num-box1">
                                <div class="txt-in1">
                                    <p class="in1-font1">총 상품 금액</p>
<%--                                    <p>VIP 회원할인</p>--%>
                                    <p>할인금액</p>
<%--                                    <c:if test="${not empty detail.product_delivery_payment}">--%>
                                        <p>배송비</p>
<%--                                    </c:if>--%>
                                </div>
                                <div class="txt-in2">
                                	<c:set var = "productTotal" value = "${detail.product_user_payment * detail.payment_order_quantity}" />
                                	<c:set var = "discountTotal" value = "${(detail.product_user_payment - detail.product_payment) * detail.payment_order_quantity}" />
                                    <p><span class="in1-font2"><fmt:formatNumber value="${productTotal}" groupingUsed="true" /></span> 원</p>
<%--                                    <p>-<span class="in1-font3"> 90,000</span> 원</p>--%>
                                    <p>-<span class="in1-font3" id="discountSpan"><fmt:formatNumber value="${discountTotal}" groupingUsed="true" /></span> 원</p>
                                    <c:if test="${not empty deliveryPayment}">
                                        <p>+<span class="in1-font3" id="deliverySpan"> <fmt:formatNumber value="${deliveryPayment}" groupingUsed="true" /></span> 원</p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="num-box2">
                                <div class="txt-in1">
                                    <p>최종 결제 금액</p>
                                    <p>E-POINT 적립예정</p>
                                </div>
                                <div class="txt-in2 in2-color">
                                    <p><span class="in2-font2" id="paymentSpan"><fmt:formatNumber value="${productTotal - discountTotal + deliveryPayment}" groupingUsed="true" /></span> 원</p>
                                    <p><span><fmt:formatNumber value="${(productTotal*detail.product_point_rate)/100}" groupingUsed="true" /> </span></span>원</p>
                                </div>
                            </div>
                        </div>
                        <div class="ck-box">
                            <input type="checkbox" id="le-ck">
                            <label for="le-ck"><span class="le-ck-txt"><span class="le-ck-color">(필수)</span> 주문 상품정보 및 결제대행<br>서비스 이용약관에 모두 동의하십니까?</span></label>
                        </div>
                    </div>
                    <div class="but-box">
                        <button type="button" id="submitPayment">결제하기</button>
                    </div>
                </div>
                <input type="hidden" name="payment" value="${productTotal - discountTotal + deliveryPayment}">
                <input type="hidden" name="order_no" value="${order_no}">
                <input type="hidden" name="product_cd" value="${detail.product_cd}">
                <input type="hidden" name="payment_order_quantity" value="${detail.payment_order_quantity}">
                <input type="hidden" name="coupon_cd" value="">
                <input type="hidden" name="coupon_paid_user_id" value="">
                <input type="hidden" name="product_order_name" value="${detail.product_name} ${option}"/>
            </form>
        </main>
    </div>
</div>

<!-- iamport.payment.js -->
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
        else if($('#password').val() == "" || $('#password_cf').val() == ""){
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
        else if(!$('#le-ck').is(":checked")){
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
                buyer_email: $('input[name=order_user_email]').val(),
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

    var regExp = /^[a-zA-Z0-9]{6,20}$/;
    
    //패스워드 체크
    $(document).on('input','input[name=password],input[name=password_cf]',function () {
    	var pw = $('input[name=password]').val();
    	var pw_cf = $('input[name=password_cf]').val();
        if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
            $("#passwordValidation").text(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.")
            $("#passwordValidation").removeClass("text-success");
        }else{
        	$("#passwordValidation").text('');
        	if(pw != pw_cf){
                $("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.")
                $("#password_cfValidation").removeClass("text-success");
            }else{
            	$("#password_cfValidation").text(" * 비밀번호가 일치합니다.")
                $("#password_cfValidation").addClass("text-success");	
            }
        }
    })
    /* $(document).on('input','input[name=password_cf]',function () {
        if(!$(this).val().match($('input[name=password]').val())){
            $("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.")
            $("#password_cfValidation").removeClass("text-success");
        }else{
            $("#password_cfValidation").text(" * 비밀번호가 일치합니다.")
            $("#password_cfValidation").addClass("text-success");
        }
    }) */

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
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
