<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-02
  Time: 오전 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">

        <main class="clearfix">
            <form name="defaultForm" id="defaultForm" method="POST">
                <h2 class="head-h2">${afn:getMessage("orders_payment",sessionScope.locale)}</h2>
                <div class="left-box">
                    <div class="sec1">
                        <p class="sec-h1">${afn:getMessage("userinformation",sessionScope.locale)}</p>

                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 620px;">
                            </colgroup>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td>${afn:getMessage("userN",sessionScope.locale)}</td>
                                <td><input type="text" name="order_user_name" id="order_user_name"  class="sec1-in1"  value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if><c:if test="${empty sessionScope.email}"></c:if>"></td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("order_user_email",sessionScope.locale)}</td>
                                <td><input type="text" name="order_user_email" id="order_user_email"  class="sec1-in1" value="<c:if test="${not empty sessionScope.email}">${sessionScope.email}</c:if><c:if test="${empty sessionScope.email}"></c:if>"></td>
                            </tr>
                            <tr >
                                <td>${afn:getMessage("userPH",sessionScope.locale)}

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
                                <td>${afn:getMessage("cusClearNum",sessionScope.locale)}</td>
                                <td><input type="text" name="customs_clearance_number" id="customs_clearance_number" class="sec1-in1" /> </td>
                            </tr>
                            </c:if>
                            <c:if test="${empty sessionScope.email}">
                            <tr >
                                <td>${afn:getMessage("orderChkPwd",sessionScope.locale)}</td>
                                <td>
                                    <input type="password" id="password" name="password" class="sec1-in1">
                                    <p id="passwordValidation" style="float:right;line-height: 33px;color: red"></p>
                                </td>
                            </tr>
                            <tr class="bor-none">
                                <td>${afn:getMessage("orderChkPwdCf",sessionScope.locale)}</td>
                                <td>
                                    <input type="password" id="password_cf" name="password_cf" class="sec1-in1">
                                    <p id="password_cfValidation" style="float:right;line-height: 33px;color: red"></p>
                                </td>
                            </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <p class="sec1-f-txt">·<span> ${afn:getMessage("msg_msg_deliv1-",sessionScope.locale)}</span></p>
                    </div>

                    <div class="sec2">
                        <p class="sec-h1">${afn:getMessage("deliv_info",sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 620px;">
                            </colgroup>
                            <tbody class="sec2-tbody">
                            <tr>
                                <td>${afn:getMessage("deliv_way",sessionScope.locale)}</td>
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
                                <td>${afn:getMessage("deliv_choose",sessionScope.locale)}</td>
                                <td class="sec2-ov">
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-1" checked value="OLD">
                                        <label for="ra1-1"><span class="ra-txt">${afn:getMessage("deliv_main",sessionScope.locale)}</span></label>
                                    </p>
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-2" value="LAST">
                                        <label for="ra1-2"><span class="ra-txt">${afn:getMessage("deliv_recent",sessionScope.locale)}</span></label>
                                    </p>
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-3" value="NEW">
                                        <label for="ra1-3"><span class="ra-txt">${afn:getMessage("deliv_new",sessionScope.locale)}</span></label>
                                    </p>
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-4" value="LIST">
                                        <label for="ra1-4"><span class="ra-txt">${afn:getMessage("deliv_list",sessionScope.locale)}</span></label>
                                    </p>
                                </td>
                            </tr>
                            </c:if>
                            <tr>
                                <td>${afn:getMessage("deliv_receiveN",sessionScope.locale)}</td>
                                <td><input type="text"  class="sec2-in1" name="delivery_user_name" id="delivery_user_name" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>"></td>
                            </tr>
                            <tr class="bor-none">
                                <td>${afn:getMessage("deliv_receiveCPH",sessionScope.locale)} <!-- Map 선언 -->
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
                                <td>${afn:getMessage("deliv_receivePH",sessionScope.locale)}<!-- Map 선언 -->
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
                                <td>${afn:getMessage("address",sessionScope.locale)}</td>
                                <td>
                                    <p class="mar-p1">
                                        <input type="text" name="postcode" id="postcode" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
                                        <button type="button" id="daumMapCall">${afn:getMessage("find_zipcode",sessionScope.locale)}</button>
                                    </p>
                                    <p class="mar-p2"><input type="text" class="sec2-in2" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>"></p>
                                    <p class="mar-p2"><input type="text" class="sec2-in2" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>"></p>
                                    <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>
                                    <%--                                    <p class="hidden"><input type="hidden" name="extraAddress" id="extraAddress"></p>--%>
                                    <p class="mar-p2" id="guide"></p>
                                </td>
                            </tr>
                            <tr class="bor-none">
                                <td>${afn:getMessage("deliv_msg",sessionScope.locale)}</td>
                                <td class="sel-td">

                                    <select name="delivery_message_select" id="delivery_message_select" >
                                        <option value="">${afn:getMessage("deliv_msg_option",sessionScope.locale)}</option>
                                        <option value="">${afn:getMessage("deliv_msg_option_door",sessionScope.locale)}</option>
                                        <option value="">${afn:getMessage("security_office",sessionScope.locale)}</option>
                                        <option value="">${afn:getMessage("deliv_box",sessionScope.locale)}</option>
                                        <option value="self">${afn:getMessage("deliv_msg_option_write",sessionScope.locale)}</option>
                                    </select>

                                    <p class="mar-p2 hidden" id="delivery_message_box"><input type="text" class="sec2-in2" name="delivery_message" id="delivery_message"></p>
                                </td>
                            </tr>
                            <c:if test="${store_delivery.product_delivery_hope_date_yn == 'Y'}">
                            <tr class="bor-none">
                                <td>${afn:getMessage("deliv_wish_date",sessionScope.locale)}</td>
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
                                <td>${afn:getMessage("deliv_wish_time",sessionScope.locale)}</td>
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
                        <p class="sec-h1">${afn:getMessage("order_product_info",sessionScope.locale)}</p>
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
                                <td>${afn:getMessage("product_info",sessionScope.locale)}</td>
                                <td>${afn:getMessage("proPrice",sessionScope.locale)}</td>
                                <td>${afn:getMessage("quantity",sessionScope.locale)}</td>
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
                                <td><span><fmt:formatNumber value="${detail.product_payment}" groupingUsed="true" /></span>${afn:getMessage("korea_won",sessionScope.locale)}</td>
                                <c:if test="${param.payment_order_quantity != null}">
                                    <td><span>${param.payment_order_quantity}<input type="hidden" name="payment_order_quantity" value="${param.payment_order_quantity}"></span></td>
                                </c:if>
                                <c:if test="${param.order_no != null}">
                                    <td><span>${detail.payment_order_quantity}<input type="hidden" name="payment_order_quantity" value="${detail.payment_order_quantity}"></span></td>
                                </c:if>
<%--                                <td><span>123456</span></td>--%>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="sec4">
                        <p class="sec-h1">${afn:getMessage("UsableCou",sessionScope.locale)}</p>
                        <table class="sec4-table">
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 620px;">
                            </colgroup>
                            <tbody class="sec4-tbody">
                            <tr class="bor-none">
                                <td>${afn:getMessage("coupon",sessionScope.locale)}</td>
                                <td class="sec4-sel">
                                    <div class="sel-box">
                                        <select id="couponBox">
                                        	<c:if test="${not empty enableCouponList}">
                                        		<option value="">${afn:getMessage("NotSelect",sessionScope.locale)}</option>
                                        		<c:forEach var="list" items="${enableCouponList}" varStatus="status">
                                            		<option value="${status.index}">${list.coupon_name} ( ~ ${list.coupon_valid_date_end})</option>
                                            	</c:forEach>
                                            </c:if>
                                            <c:if test="${empty enableCouponList}">
                                            	<option value="">${afn:getMessage("msg.none_Coucontent",sessionScope.locale)}</option>
                                            </c:if>
                                        </select>
                                        <input type="hidden" name="coupon_discount" value="0"/>
                                    </div>
                                    <p>${afn:getMessage("UsableCou",sessionScope.locale)} <span><fmt:formatNumber value="${fn:length(enableCouponList)}" groupingUsed="true" /></span>${afn:getMessage("cou_count",sessionScope.locale)}</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="sec5">
                        <p class="sec-h1">${afn:getMessage("payment_info2",sessionScope.locale)}</p>
                        <div class="ck-box">
                            <input type="checkbox" id="escrow">
                            <label for="escrow"><span class="le-ck-txt"> ${afn:getMessage("escrow_use",sessionScope.locale)}</span></label>
                        </div>
                        <div class="sec5-box">
                            <div class="sec5-p1">
                                ${afn:getMessage("pay_method",sessionScope.locale)}
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
                                    <label for="sec5-ra1"><span class="ra-txt">${afn:getMessage("card",sessionScope.locale)}</span></label>
                                </p>
                                <p>
                                    <input type="radio" id="sec5-ra2" name="payment_type_cd" value="trans">
                                    <label for="sec5-ra2"><span class="ra-txt">${afn:getMessage("trans",sessionScope.locale)}</span></label>
                                </p>
                                <p>
                                    <input type="radio" id="sec5-ra3" name="payment_type_cd" value="vbank">
                                    <label for="sec5-ra3"><span class="ra-txt">${afn:getMessage("vbank",sessionScope.locale)}</span></label>
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
                        <p>${afn:getMessage("final_payment_confirm",sessionScope.locale)}</p>
                        <div class="num-outer">
                            <div class="num-box1">
                                <div class="txt-in1">
                                    <p class="in1-font1">${afn:getMessage("total_price",sessionScope.locale)}</p>
<%--                                    <p>VIP 회원할인</p>--%>
                                    <p>${afn:getMessage("discount_price",sessionScope.locale)}</p>
<%--                                    <c:if test="${not empty detail.product_delivery_payment}">--%>
                                        <p>${afn:getMessage("shippingFee",sessionScope.locale)}</p>
<%--                                    </c:if>--%>
                                </div>
                                <div class="txt-in2">
                                	<c:set var = "productTotal" value = "${detail.product_user_payment * detail.payment_order_quantity}" />
                                	<c:set var = "discountTotal" value = "${(detail.product_user_payment - detail.product_payment) * detail.payment_order_quantity}" />
                                    <p><span class="in1-font2"><fmt:formatNumber value="${productTotal}" groupingUsed="true" /></span> ${afn:getMessage("korea_won",sessionScope.locale)}</p>
<%--                                    <p>-<span class="in1-font3"> 90,000</span> 원</p>--%>
                                    <p>-<span class="in1-font3" id="discountSpan"><fmt:formatNumber value="${discountTotal}" groupingUsed="true" /></span> ${afn:getMessage("korea_won",sessionScope.locale)}</p>
                                    <c:if test="${not empty deliveryPayment}">
                                        <p>+<span class="in1-font3" id="deliverySpan"> <fmt:formatNumber value="${deliveryPayment}" groupingUsed="true" /></span> ${afn:getMessage("korea_won",sessionScope.locale)}</p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="num-box2">
                                <div class="txt-in1">
                                    <p>${afn:getMessage("final_price",sessionScope.locale)}</p>
                                    <p>E-POINT ${afn:getMessage("accEx",sessionScope.locale)}</p>
                                </div>
                                <div class="txt-in2 in2-color">
                                    <p><span class="in2-font2" id="paymentSpan"><fmt:formatNumber value="${productTotal - discountTotal + deliveryPayment}" groupingUsed="true" /></span> ${afn:getMessage("korea_won",sessionScope.locale)}</p>
                                    <p><span><fmt:formatNumber value="${(productTotal*detail.product_point_rate)/100}" groupingUsed="true" /> </span></span> ${afn:getMessage("korea_won",sessionScope.locale)}</p>
                                </div>
                            </div>
                        </div>
                        <div class="ck-box">
                            <input type="checkbox" id="le-ck">
                            <label for="le-ck"><span class="le-ck-txt"><span class="le-ck-color">(${afn:getMessage("require",sessionScope.locale)})</span> ${afn:getMessage("msg.payment.confirm1",sessionScope.locale)}<br>${afn:getMessage("msg.payment.confirm2",sessionScope.locale)}</span></label>
                        </div>
                    </div>
                    <div class="but-box">
                        <button type="button" id="submitPayment">${afn:getMessage("do_payment",sessionScope.locale)}</button>
                    </div>
                </div>
                <input type="hidden" name="payment" value="${productTotal - discountTotal + deliveryPayment}">
                <input type="hidden" name="order_no" value="${order_no}">
                <input type="hidden" name="product_cd" value="${detail.product_cd}">
                <input type="hidden" name="payment_order_quantity" value="${detail.payment_order_quantity}">
                <input type="hidden" name="coupon_cd" value="">
                <input type="hidden" name="coupon_paid_user_id" value="">
                <input type="hidden" name="product_order_name" value="${detail.product_name} ${option}"/>
                <input type="hidden" name="option_name" value="${option}"/>                
            </form>
        </main>
    </div>
</div>
<div class="modal">
        <div class="modal-content">
            <div class="modal-close close2">×</div>
            <div class="mo-in-con1">
                <p class="body-txt1">${afn:getMessage("myDeliv_add",sessionScope.locale)}</p>
                <div class="ov-s">
                    <table>
                        <colgroup>
                       
                            <col style="width: 300px;">
                            <col style="width: 200px;">
                        </colgroup>
                        <tbody class="body-tr" id="list_address">
                       <%-- (append 되는 html)
                        <c:forEach var="deliveryList" items="${deliveryList}">
                            <tr>
                               <td>
                                    <p>${deliveryList.delivery_alias}</p>
                                </td>
                                <td>
                                    <p>${deliveryList.order_user_name}</p>
                                    <p>${deliveryList.roadAddress}</p>
                                </td>
                                <td>
                                    <button type="button" class="c-btn">선택</button>
                                </td>
                            </tr>
                            </c:forEach> 
                        --%>     
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
    </div>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	var noneLoginPWCheck = false;
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
                text: getMessageAjax('error.payment.orderNameInput'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#order_user_email').val() == ""){
            $.toast({
                text: getMessageAjax('error.payment.emailInput'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#order_user_phone_a').val() == "" || $('#order_user_phone_b').val() == "" || $('#order_user_phone_c').val() == ""){
            $.toast({
                text: getMessageAjax('error.payment.hpInput'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        <c:if test="${empty sessionScope.email}">
        else if(!noneLoginPWCheck){
            $.toast({
                text: getMessageAjax('error.payment.orderPwdInput'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        </c:if>
        else if($('#delivery_user_name').val() == ""){
            $.toast({
                text: getMessageAjax('error.payment.delivName'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if($('#postcode').val() == "" || $('#roadAddress').val() == "" || $('#extraAddress').val() == ""){
            $.toast({
                text: getMessageAjax('error.payment.delivAddInpu'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }
        else if(!$('#le-ck').is(":checked")){
            $.toast({
                text: getMessageAjax('error.payment.agreeChek'),
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }else{
        	$('input[name=order_no]').val('PD-ORDER-'+numberGen(7));
        	var formData = $('#defaultForm').serialize()
            				+'&payment_class=PRODUCT';
            
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
                                showText = index + ${afn:getMessage("is2",sessionScope.locale)} + item;
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
                        }, function (rsp) {
                        	if(rsp.success){
                            	$.ajax({
                            		method: 'post',
                            		data: formData+'&imp_uid='+rsp.imp_uid,
                            		url: '/Save/PaymentSuccess',
                            		success: function(res){
                           				location.href=data.redirectUrl;
                            		},
                            		error: function(e){
                            			console.log(e);
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
                },
                error: function (xhr, status, error) {
                    alert("error");
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
    	noneLoginPWCheck = false;
    	var pw = $('input[name=password]').val();
    	var pw_cf = $('input[name=password_cf]').val();
        if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
            $("#passwordValidation").text(" * ${afn:getMessage('error.sign.pwdpattern',sessionScope.locale)}");
            $("#passwordValidation").removeClass("text-success");
            $("#password_cfValidation").text('');
        }else{
        	$("#passwordValidation").text('');
        	if(pw != pw_cf){
                $("#password_cfValidation").text(" * ${afn:getMessage('error.sign.pwdDis',sessionScope.locale)}");
                $("#password_cfValidation").removeClass("text-success");
            }else{
            	noneLoginPWCheck = true;
            	$("#password_cfValidation").text(" * ${afn:getMessage('msg.sign.pwdSuccess',sessionScope.locale)}");
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
		
		$("input[name=coupon_discount]").val(disCoupon);
		var resultDiscount = parseInt(originDiscount) + parseInt(disCoupon);
		var resultPayment = originPayment - disCoupon + addDelivery;
        $("#discountSpan").text(resultDiscount.toLocaleString('en'));
        $("#paymentSpan").text(resultPayment.toLocaleString('en'));
        $("input[name=payment]").val(resultPayment);
    });
 
    $("#ra1-4").click(function(){
    $('#list_address').empty();
        $(".modal").addClass('on');
        $('html,body').css("overflow", "hidden");
        
        
    	jQuery.ajax({
            type: 'POST',
            url: '/payment/getMyListDelivery',
            data:formData,
            success: function (data) {
            	for (var i=0;i<data.deliveryList.length;i++) {
            		var item = data.deliveryList[i];
            		$("#list_address").append('<tr><td><p align="left" >' + item.order_user_name + '</p><p align="left" >' + item.roadAddress +'</p><p align="left" >' + item.extraAddress +'</p></td><td> <button type="button" class="c-btn" id="choose" data-id="' + item.order_no + '">선택</button></td>');
            	}
            	
            },
            error: function (xhr, status, error) {
                console.log(error,xhr,status );
            },
        });
        
    });
 
    $(document).on("click","#choose",function(){ 
    	var order_no = $(this).data("id");
    	
    	jQuery.ajax({
            type: 'POST',
            url: '/payment/getDeliveryAddress2',
            data: "order_no="+order_no,
            success: function (data) {
                if(data.deliveryChoose!=null ) {
                    $.each(data.deliveryChoose,function(index, item){
                        if(index != "order_no" &&  index != "product_cd"){
                            $("input[name="+index+"]").val(item);
                        }
                        if(index=="delivery_user_phone" || index=="delivery_user_tel"){
                            var number = item.split("-");
                            ['a','b','c'].forEach(function(el,idx){
                                $("input[name="+index+"_"+el+"]").val(number[idx]);
                            });
                        }
                    });
                    $(".modal").removeClass('on');
                    $('html,body').css("overflow", "auto");
                }
            },
            error: function (xhr, status, error) {
                console.log(error,xhr,status );
            },
        });
    });

    $(".modal-close").click(function(){
        $(".modal").removeClass('on');
        $('html,body').css("overflow", "auto");
    });
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
