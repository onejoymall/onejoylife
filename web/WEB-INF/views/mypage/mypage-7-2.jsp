<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <form id="defaultForm" name="defaultForm" method="POST">
                    <div class="r-sec1">
                        <p class="sec1-h1">${afn:getMessage('rollback_req',sessionScope.locale)}</p>
                        <p class="sec1-p1">${afn:getMessage('storeorder_num',sessionScope.locale)} : <span>${paymentDetail.order_no}</span><span> │ </span>${afn:getMessage('order_date',sessionScope.locale)} : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p>
                        <input type="hidden" name="order_no" value="${paymentDetail.no}">
                        <input type="hidden" name="cancel_request_amount" value="${paymentDetail.payment}">
                        <table>
                            <colgroup>
                                <col style="width: 150px;">
                                <col style="width: 260px;">
                                <col style="width: 225px;">
                                <col style="width: 125px;">
                                <col style="width: 200px;">
                                <%--                                    <col style="width: 259px;">--%>
                                <%--                                    <col style="width: 100px;">--%>
                            </colgroup>
                            <thead class="sec1-thead">
                            <tr>
                                <th></th>
                                <th>${afn:getMessage('product_infor',sessionScope.locale)}</th>
                                <%--                                        <th>판매자</th>--%>
                                <th>${afn:getMessage('product_amount',sessionScope.locale)}</th>
                                <th>${afn:getMessage('product_quantity',sessionScope.locale)}</th>
                                <th>${afn:getMessage('coupon_discount',sessionScope.locale)}</th>
                            </tr>
                            </thead>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td><img src="${paymentDetail.file_1}" style="width: 80px;"/></td>
                                <td class="sec1-tbody-p1">
                                    <p>${paymentDetail.product_name}</p>
                                    <p>${paymentDetail.option_name}</p>
                                </td>
                                <%--                                        <td><span>${paymentDetail.product_made_company}</span></td>--%>
                                <td><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                <td><span><fmt:formatNumber value="${paymentDetail.payment_order_quantity}" groupingUsed="true" /></span></td>
                                <td><span><fmt:formatNumber value="${paymentDetail.coupon_discount}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <p class="sec-h1">${afn:getMessage('return_reasons',sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec2-body body-tr-s  body-border">
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('return_reasons',sessionScope.locale)}</td>
                                <td class="body-td-txt1">
                                    <textarea name="reason" id="reason" cols="97" rows="4" class="area-content"></textarea>
                                    <p class="area-num">(0/20000)</p>
                                    <div class="card-rd-box">
										     <input type="radio" id="card-rd1" name="card-rd" value="카드변경" onclick="txInput('reason',this.value)">
										     <label for="card-rd1">카드변경</label>
										     <input type="radio" id="card-rd2" name="card-rd" value="결제방식 변경" onclick="txInput('reason',this.value)">
										     <label for="card-rd2">결제방식 변경</label>
										</div>
                                </td>
                            </tr>
                             <script>
								function txInput(Obj,Str)
								{
								  document.getElementById(Obj).value = Str;
								}
							</script>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec3">
                        <p class="sec-h1">${afn:getMessage('returncollection_informationinput',sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 290px;">
                                <col style="width: 610px;">
                            </colgroup>
                            <tbody class="sec3-body t-border">
                            <tr>
                                <td class="body-td-tit1">${afn:getMessage('msg.return.shipment',sessionScope.locale)}</td>
                                <td class="body-td-txt2">
                                    <ul class="input-ul">
                                        <li class="ra-tab1 on" data-id="tab1">
                                            <input type="radio" id="tab1-rd" name="refund_send_type" checked value="Y">
                                            <label for="tab1-rd" class="rd-label"><span class="rd-txt">${afn:getMessage('msg.returnshipment.yes',sessionScope.locale)}</span></label>
                                        </li>
                                        <li class="ra-tab2" data-id="tab2">
                                            <input type="radio" id="tab2-rd" name="refund_send_type" value="N">
                                            <label for="tab2-rd" class="rd-label"><span class="rd-txt">${afn:getMessage('msg.returnshipment.no',sessionScope.locale)}</span></label>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="tab on" id="tab1">
                            <colgroup>
                                <col style="width: 290px;">
                                <col style="width: 610px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s body-border">
                            <tr>
                                <td class="body-td-tit1">${afn:getMessage('return_shipmentdate',sessionScope.locale)}</td>
                                <td class="body-td-txt2">
                                    <div class="cla">
                                        <input type="text" id="from_date" class="date_pick" name="refund_send_date">
                                        <div class="cla-img1"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit1">${afn:getMessage('return_courierservice',sessionScope.locale)}</td>
                                <td class="body-td-txt2">

                                    <select name="refund_delivery_t_code" class="txt1-select">
                                        <c:forEach var="companyList" items="${companyList}" varStatus="status">
                                            <option value="${companyList.name}">${companyList.name}</option>
                                        </c:forEach>
                                    </select>


                                </td>
                            </tr>

                            <tr>
                                <td class="body-td-tit1">${afn:getMessage('return_invoicenumber',sessionScope.locale)}</td>
                                <td class="body-td-txt2">
                                    <input type="text" name="refund_delivery_t_invoice" class="num-s" >
<%--                                    <input type="checkbox" id="ch-box">--%>
<%--                                    <label for="ch-box">--%>
<%--                                        <span class="ch-display">송장번호 없이 반품신청</span>--%>
<%--                                    </label>--%>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="tab" id="tab2">
                            <colgroup>
                                <col style="width: 290px;">
                                <col style="width: 610px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s body-border">
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('receiver',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "return_user_name" type="text" value="${delivery.delivery_user_name}" class="select-op"></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('contact',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "return_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op"></td>
                            </tr>

                            <tr>
                                <td class="body-td-tit">${afn:getMessage('postcode',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "postcode" type="text" value="${delivery.postcode}" class="select-op"><button class="sec-but" type="button" id="daumMapCall">주소지 변경</button></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('address',sessionScope.locale)}</td>
                                <td class="body-td-txt2">
                                    <input name = "roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
                                    <input name = "jibunAddress" type="hidden" value="${delivery.jibunAddress}" >
                                    <input name = "guide" type="hidden" value="${delivery.jibunAddress}" >
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('extraAddress',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec4">
                        <p class="sec-h1">${afn:getMessage('payment_info',sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 267px">
                                <col style="width: 180px;">
                                <col style="width: 267px">
                            </colgroup>
                            <tbody class="sec4-body body-tr-s body-border">
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('order_payment',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                <td class="body-td-tit">${afn:getMessage('product_amount',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('return_amount',sessionScope.locale)}</td>
                                <td class="body-td-txt2 txt-color"><span><fmt:formatNumber value="${paymentDetail.product_payment * paymentDetail.payment_order_quantity - paymentDetail.coupon_discount}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                <td class="body-td-tit">${afn:getMessage('pay_method',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><span>${paymentDetail.pay_method}</span></td>
                                <input type="hidden" name="pay_method" value="${paymentDetail.pay_method}"/>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec5">
                        <p class="sec-h1">${afn:getMessage('rollback_account',sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 110px;">
                                <col style="width: 610px">
                            </colgroup>
                            <tbody class="sec5-body body-border">
                            <tr>
                                <td class="body-td-tit" rowspan="3">${afn:getMessage('rollback_account',sessionScope.locale)}</td>
                                <td class="body-td-txt2 pad-top">${afn:getMessage('bank_name',sessionScope.locale)}</td>
                                <td class="pad-top">
                                    <!-- <input name="refund_bank" type="text" class="select-op"> -->
                                    <select name="refund_bank" class="select-op">
                                    	<option value="">${afn:getMessage('bank_name',sessionScope.locale)}</option>
                                        <c:if test="${not empty getSelectorList}">
                                            <c:forEach var="getSelectorList" items="${getSelectorList}" varStatus="status">
                                                <option value="${getSelectorList.code_value}" >${getSelectorList.code_name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-txt2">${afn:getMessage('account',sessionScope.locale)}</td>
                                <td>
                                    <input type="text" name="refund_account"  class="select-op">
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-txt2 pad-bottom">${afn:getMessage('account_name',sessionScope.locale)}</td>
                                <td class="pad-bottom">
                                    <input type="text" name="refund_holder" class="select-op">
                                    <%--                                            <button class="sec-but">계좌인증</button>--%>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="r-sec6">
                        <button type="button" id="formSubmit">${afn:getMessage('rollback_req',sessionScope.locale)}</button>
                        <button type="button" onclick="location.href='${header.referer}'">${afn:getMessage('prev',sessionScope.locale)}</button>
                    </div>
                </form>
            </div>
        </main>

    </div>
</div>

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>