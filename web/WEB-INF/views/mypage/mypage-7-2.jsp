<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <form id="defaultForm" name="defaultForm" method="POST">
                    <div class="r-sec1">
                        <p class="sec1-h1">반품신청</p>
                        <p class="sec1-p1">상점주문번호 : <span>${paymentDetail.order_no}</span><span> │ </span>주문일 : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p>
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
                                <th>상품정보</th>
                                <%--                                        <th>판매자</th>--%>
                                <th>상품금액</th>
                                <th>수량</th>
                                <th>쿠폰할인</th>
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
                                <td><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>원</td>
                                <td><span><fmt:formatNumber value="${paymentDetail.payment_order_quantity}" groupingUsed="true" /></span></td>
                                <td><span><fmt:formatNumber value="${paymentDetail.coupon_discount}" groupingUsed="true" /></span>원</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <p class="sec-h1">반품사유</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec2-body body-tr-s  body-border">
                            <tr>
                                <td class="body-td-tit">반품사유</td>
                                <td class="body-td-txt1">
                                    <textarea name="reason" id="reason" cols="97" rows="4" class="area-content"></textarea>
                                    <p class="area-num">(0/20000)</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec3">
                        <p class="sec-h1">반품수거 정보입력</p>
                        <table>
                            <colgroup>
                                <col style="width: 290px;">
                                <col style="width: 610px;">
                            </colgroup>
                            <tbody class="sec3-body t-border">
                            <tr>
                                <td class="body-td-tit1">반품하실 상품을 발송하셨습니까?</td>
                                <td class="body-td-txt2">
                                    <ul class="input-ul">
                                        <li class="ra-tab1 on" data-id="tab1">
                                            <input type="radio" id="tab1-rd" name="refund_send_type" checked value="Y">
                                            <label for="tab1-rd" class="rd-label"><span class="rd-txt">네, 이미 발송하였습니다.</span></label>
                                        </li>
                                        <li class="ra-tab2" data-id="tab2">
                                            <input type="radio" id="tab2-rd" name="refund_send_type" value="N">
                                            <label for="tab2-rd" class="rd-label"><span class="rd-txt">아니요, 아직 발송하지 않았습니다.</span></label>
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
                                <td class="body-td-tit1">반품상품 발송일</td>
                                <td class="body-td-txt2">
                                    <div class="cla">
                                        <input type="text" id="from_date" class="date_pick" name="refund_send_date">
                                        <div class="cla-img1"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit1">반품상품 택배사</td>
                                <td class="body-td-txt2">

                                    <select name="refund_delivery_t_code" class="txt1-select">
                                        <c:forEach var="companyList" items="${companyList}" varStatus="status">
                                            <option value="${companyList.Name}">${companyList.Name}</option>
                                        </c:forEach>
                                    </select>


                                </td>
                            </tr>

                            <tr>
                                <td class="body-td-tit1">반풍상품 송장번호</td>
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
                                <td class="body-td-tit">수령인</td>
                                <td class="body-td-txt2"><input name = "return_user_name" type="text" value="${delivery.delivery_user_name}" class="select-op"></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">연락처</td>
                                <td class="body-td-txt2"><input name = "return_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op"></td>
                            </tr>

                            <tr>
                                <td class="body-td-tit">우편번호</td>
                                <td class="body-td-txt2"><input name = "postcode" type="text" value="${delivery.postcode}" class="select-op"><button class="sec-but" type="button" id="daumMapCall">주소지 변경</button></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">주소</td>
                                <td class="body-td-txt2">
                                    <input name = "roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
                                    <input name = "jibunAddress" type="hidden" value="${delivery.jibunAddress}" >
                                    <input name = "guide" type="hidden" value="${delivery.jibunAddress}" >
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">상세주소</td>
                                <td class="body-td-txt2"><input name = "extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec4">
                        <p class="sec-h1">결제 정보</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 267px">
                                <col style="width: 180px;">
                                <col style="width: 267px">
                            </colgroup>
                            <tbody class="sec4-body body-tr-s body-border">
                            <tr>
                                <td class="body-td-tit">주문금액</td>
                                <td class="body-td-txt2"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                                <td class="body-td-tit">상품금액</td>
                                <td class="body-td-txt2"><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>원</td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">반품예정금액</td>
                                <td class="body-td-txt2 txt-color"><span><fmt:formatNumber value="${paymentDetail.product_payment * paymentDetail.payment_order_quantity - paymentDetail.coupon_discount}" groupingUsed="true" /></span>원</td>
                                <td class="body-td-tit">결제수단</td>
                                <td class="body-td-txt2"><span>${paymentDetail.pay_method}</span></td>
                                <input type="hidden" name="pay_method" value="${paymentDetail.pay_method}"/>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec5">
                        <p class="sec-h1">환불 계좌</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 110px;">
                                <col style="width: 610px">
                            </colgroup>
                            <tbody class="sec5-body body-border">
                            <tr>
                                <td class="body-td-tit" rowspan="3">환불계좌</td>
                                <td class="body-td-txt2 pad-top">은행명</td>
                                <td class="pad-top">
                                    <!-- <input name="refund_bank" type="text" class="select-op"> -->
                                    <select name="refund_bank" class="select-op">
                                    	<option value="">은행명</option>
                                        <c:if test="${not empty getSelectorList}">
                                            <c:forEach var="getSelectorList" items="${getSelectorList}" varStatus="status">
                                                <option value="${getSelectorList.code_value}" >${getSelectorList.code_name}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-txt2">계좌번호</td>
                                <td>
                                    <input type="text" name="refund_account"  class="select-op">
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-txt2 pad-bottom">예금주</td>
                                <td class="pad-bottom">
                                    <input type="text" name="refund_holder" class="select-op">
                                    <%--                                            <button class="sec-but">계좌인증</button>--%>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="r-sec6">
                        <button type="button" id="formSubmit">반품신청</button>
                        <button type="button" onclick="location.href='${header.referer}'">이전</button>
                    </div>
                </form>
            </div>
        </main>

    </div>
</div>

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>