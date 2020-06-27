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
                <input type="hidden" name="order_no" value="${order_no}">
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
                                <td><input type="text" name="order_user_name" id="order_user_name"  class="sec1-in1"  value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>"></td>
                            </tr>
                            <tr>
                                <td>이메일주소</td>
                                <td><input type="text" name="order_user_email" id="order_user_email"  class="sec1-in1" value="<c:if test="${not empty sessionScope.email}">${sessionScope.email}</c:if>"></td>
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
                            <c:set var="doneLoop" value="false"/>
                                <c:forEach var="cartPaymentList" items="${cartPaymentList}" varStatus="status">
                                    <c:if test="${cartPaymentList.product_delivery_International_type eq 'B' || cartPaymentList.product_delivery_International_type eq 'C'}">
                                        <c:if test="${not doneLoop}">
                                        <tr>
                                            <td>통관고유번호</td>
                                            <td><input type="text" name="customs_clearance_number" id="customs_clearance_number" class="sec1-in1" /> </td>
                                        </tr>
                                        <c:set var="doneLoop" value="true"/>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
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
                                        <option value="02" <c:if test="${phoneMap.key1 eq \"02\"}">selected</c:if>>02</option>
										<option value="031" <c:if test="${phoneMap.key1 eq \"031\"}">selected</c:if>>031</option>
										<option value="032" <c:if test="${phoneMap.key1 eq \"032\"}">selected</c:if>>032</option>
										<option value="033" <c:if test="${phoneMap.key1 eq \"033\"}">selected</c:if>>033</option>
										<option value="041" <c:if test="${phoneMap.key1 eq \"041\"}">selected</c:if>>041</option>
										<option value="042" <c:if test="${phoneMap.key1 eq \"042\"}">selected</c:if>>042</option>
										<option value="043" <c:if test="${phoneMap.key1 eq \"043\"}">selected</c:if>>043</option>
										<option value="044" <c:if test="${phoneMap.key1 eq \"044\"}">selected</c:if>>044</option>
										<option value="051" <c:if test="${phoneMap.key1 eq \"051\"}">selected</c:if>>051</option>
										<option value="052" <c:if test="${phoneMap.key1 eq \"052\"}">selected</c:if>>052</option>
										<option value="053" <c:if test="${phoneMap.key1 eq \"053\"}">selected</c:if>>053</option>
										<option value="054" <c:if test="${phoneMap.key1 eq \"054\"}">selected</c:if>>054</option>
										<option value="055" <c:if test="${phoneMap.key1 eq \"055\"}">selected</c:if>>055</option>
										<option value="061" <c:if test="${phoneMap.key1 eq \"061\"}">selected</c:if>>061</option>
										<option value="062" <c:if test="${phoneMap.key1 eq \"062\"}">selected</c:if>>062</option>
										<option value="063" <c:if test="${phoneMap.key1 eq \"063\"}">selected</c:if>>063</option>
										<option value="064" <c:if test="${phoneMap.key1 eq \"064\"}">selected</c:if>>064</option>
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
                                        <option value="">경비실</option>
                                        <option value="">택배함</option>
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
                    <div class="box on">
                        <p class="sec-h1">주문상품 정보</p>
                        <table class="table border-none">
                            <colgroup>

                                <col style="width: 20%">
                                <col style="width: 30%">
                                <col style="width: 10%">
                                <col style="width: 15%">
                                <col style="width: 15%">
                                <col style="width: 10%">
                            </colgroup>
                            <thead>
                            <tr class="head-tr">

                                <td colspan="2">상품정보</td>
                                <%--                            <td>옵션병경</td>--%>
                                <td>수량</td>
                                <td>소비자가</td>
                                <td>상품가격</td>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty cartPaymentList}">
                                <c:forEach var="cartPaymentList" items="${cartPaymentList}" varStatus="status">
                                    <input type="hidden" name="cart_cd" value="${cartPaymentList.cart_cd}">
                                    <input type="hidden" name="chk" value="${cartPaymentList.cart_cd}">
                                    <tr>
                                        <td>
                                            <a href="<c:url value="/product/productDetail?product_cd=${cartPaymentList.product_cd}"/>">
                                                <img src='${cartPaymentList.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/product/productDetail?product_cd=${cartPaymentList.product_cd}"/>">
                                                <p>${cartPaymentList.product_name}</p>
                                            </a>
                                        </td>
                                        <td>
                                                ${cartPaymentList.payment_order_quantity}
                                        </td>
                                        <td>
                                            <div class="price-number before-price">
                                                <fmt:formatNumber value="${cartPaymentList.product_user_payment*cartPaymentList.payment_order_quantity}" groupingUsed="true" />원
                                            </div>
                                        </td>
                                        <td>
                                            <span><fmt:formatNumber value="${cartPaymentList.product_payment*cartPaymentList.payment_order_quantity}" groupingUsed="true" /></span>원
                                            <input type="hidden" name="product_cd" value="${cartPaymentList.product_cd}">
                                            <input type="hidden" name="product_cds" value="${cartPaymentList.product_cd}">
                                            <input type="hidden" name="payment_order_quantity" value="${cartPaymentList.payment_order_quantity}">
                                            <input type="hidden" name="option_name[]" value="${not empty cartPaymentList.option_name ? cartPaymentList.option_name : ''}">
                                        </td>
                                        <td>
                                            <button type="button" class="del" value="${cartPaymentList.cart_cd}"></button>
                                        </td>
                                    </tr>
                                    <tr class="bor-none bor-bot-b">
		                                <td>쿠폰</td>
		                                <td class="sec4-sel" colspan="5">
		                                    <div class="sel-box">
		                                        <select name="coupon_cd" class="couponBox" data-id="${status.index}" data-payment="${cartPaymentList.product_payment*cartPaymentList.payment_order_quantity}" data-user-payment="${cartPaymentList.product_user_payment*cartPaymentList.payment_order_quantity}">
		                                        	<c:if test="${not empty cartPaymentList.enableCouponList}">
		                                        		<option value=" ">선택 안함</option>
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
		                                            	<option value=" ">사용가능 쿠폰이 없습니다.</option>
		                                            </c:if>
		                                        </select>
		                                    </div>
		                                    <p>사용가능 쿠폰 <span><fmt:formatNumber value="${fn:length(cartPaymentList.enableCouponList)}" groupingUsed="true" /></span>장</p>
		                                </td>
	                                </tr>
                                </c:forEach>
                            </c:if>

                            </tbody>
                        </table>
                    </div>
                    <%-- <div class="sec4">
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
                    </div> --%>
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
                                    <p>할인 금액</p>
                                    <p>배송비</p>
                                </div>
                                <div class="txt-in2">
                                    <p><span class="in1-font2 sum-span1"></span>  원</p>
<%--                                    <p>-<span class="in1-font3"> 90,000</span> 원</p>--%>
                                    <p>-<span class="in1-font3 sum-span2"> </span> 원</p>
                                    <p>+<span class="in1-font3 sum-span3"> </span>  원</p>
                                </div>
                            </div>
                            <div class="num-box2">
                                <div class="txt-in1">
                                    <p>최종 결제 금액</p>
                                    <p>E-POINT 적립예정</p>
                                </div>
                                <div class="txt-in2 in2-color">
                                    <p><span class="in2-font2 total sum-span4"></span> 원</p>
                                    <p><span class="total sum-span5"></span></span> 원</p>
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
                    <input type="hidden" name="payment" value="9999999">
                    <input type="hidden" name="product_order_name" value="상품이름">
                    <input type="hidden" name="point_add" value="포인트">
                    <input type="hidden" name="quantity_total" value="수량합">
                </div>
            </form>
        </main>
    </div>
</div>

<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, req.requestURI, '')}" />
<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="noParamUrl" value="${baseURL}${requestPath}"/>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var noneLoginPWCheck = false;
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

			if(!cart.product_delivery_bundle_yn || cart.product_delivery_bundle_yn == 'N'){ //묶음배송 아니면 상품의 배송비 + 지열별배송비  
				delivery += parseInt(cart.delivery_payment) + parseInt(addDelivery[cart.product_store_id] ? addDelivery[cart.product_store_id] : 0);
			}else{
				if(storeDeliveryList.hasOwnProperty(cart.product_store_id)){ //스토어키가 이미 있다면 가장비싼배송비
					if(storeDeliveryList[cart.product_store_id] < cart.delivery_payment) { 
						storeDeliveryList[cart.product_store_id] = parseInt(cart.delivery_payment) 
	    			}
				}else{ //키가없다면 키추가
					storeDeliveryList[cart.product_store_id] = parseInt(cart.delivery_payment)
				}
			}
		});
		
		//스토어별 지역별배송비
		$.each(storeDeliveryList,function(key,val){
			delivery += val + parseInt(addDelivery[key] ? addDelivery[key] : 0);
		});
		
		discount += couponDiscount;
		
		$(".sum-span1").html(payment.toLocaleString('en'));
		$(".sum-span2").html(discount.toLocaleString('en'));
		$(".sum-span3").html(delivery.toLocaleString('en'));
		$(".sum-span4").html((payment-discount+delivery).toLocaleString('en'));
		$(".sum-span5").html(point.toLocaleString('en'));
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
    	
        $(this).parent().parent().next().remove();
        $(this).parent().parent().remove();
        
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
                	addDelivery[cart.product_store_id] = data.additionalDeliveryPayment;
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
                position: 'bottom-right',
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
  			if($(this).val().trim()){
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
        else if(!noneLoginPWCheck){
            $.toast({
                text: "주문확인용 비밀번호를 확인해주세요.",
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
                buyer_email: $('input[name=order_user_email]').val(),
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
                                        /* if (data.validateError) {
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
                                        } */
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

    // var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
    var regExp = /^[a-zA-Z0-9]{6,20}$/;
    
    //패스워드 체크
    $(document).on('input','input[name=password],input[name=password_cf]',function () {
    	noneLoginPWCheck = false;
    	var pw = $('input[name=password]').val();
    	var pw_cf = $('input[name=password_cf]').val();
        if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
            $("#passwordValidation").text(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.");
            $("#passwordValidation").removeClass("text-success");
            $("#password_cfValidation").text('');
        }else{
        	$("#passwordValidation").text('');
        	if(pw != pw_cf){
                $("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.");
                $("#password_cfValidation").removeClass("text-success");
            }else{
            	noneLoginPWCheck = true;
            	$("#password_cfValidation").text(" * 비밀번호가 일치합니다.");
                $("#password_cfValidation").addClass("text-success");	
            }
        }
    })
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
