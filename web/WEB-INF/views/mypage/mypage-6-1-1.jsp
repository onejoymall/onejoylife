<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <div class="wrap">
        <div class="page-box">
            <main class="clearfix">
                <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
                <div class="right-contain">
                    <form name="defaultForm" id="defaultForm" method="POST">
                        <div class="r-sec1">
                            <p class="sec1-h1">취소신청</p>
                            <p class="sec1-p1">상점주문번호 : <span>${paymentDetail.order_no}</span><span> │ </span>주문일 : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p>
                            <input type="hidden" name="merchant_uid" value="${paymentDetail.order_no}">
                            <input type="hidden" name="cancel_request_amount" value="${paymentDetail.payment}">
                            <table>
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col style="width: 460px;">
                                    <col style="width: 200px;">
                                    <col style="width: 200px;">
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
                                        <th>총합계</th>
                                    </tr>
                                </thead>
                                <tbody class="sec1-tbody">
                                    <c:if test="${fn:length(paymentBundleList) <= 1}">
                                    <tr>
                                        <td><img src="${paymentDetail.file_1}" style="width: 80px;"/></td>
                                        <td class="sec1-tbody-p1">
                                            <p>${paymentDetail.product_name}</p>
                                        </td>
<%--                                        <td><span>${paymentDetail.product_made_company}</span></td>--%>
                                        <td><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>원</td>
                                        <td><span>${paymentDetail.payment_order_quantity}</span></td>
                                        <td><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                                    </tr>
                                    </c:if>
                                    <c:if test="${fn:length(paymentBundleList) > 1}">
                                        <c:forEach var="list" items="${paymentBundleList}" varStatus="status">
                                            <tr>
                                                <td><img src="${list.file_1}" style="width: 80px;"/></td>
                                                <td class="sec1-tbody-p1">
                                                    <p>${list.product_name}</p>
                                                    <p>${list.option_name}</p>
                                                </td>
        <%--                                        <td><span>${paymentDetail.product_made_company}</span></td>--%>
                                                <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</td>
                                                <td><span>${list.payment_order_quantity}</span></td>
                                                <c:if test="${status.index == 0 }">
                                                <td rowspan="${fn:length(paymentBundleList)}"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="r-sec2">
                            <p class="sec-h1">취소사유</p>
                            <table>
                                <colgroup>
                                    <col style="width: 180px;">
                                    <col style="width: 300px;">
                                    <col style="width: 420px;">
                                </colgroup>
                                <tbody class="sec2-body body-tr-s">
                                    <tr>
                                        <td class="body-td-tit">사유</td>
                                        <td colspan="2" class="body-td-txt1">
                                            <input name="reason" type="text" class="select-op">
                                        </td>
<%--                                        <td class="body-td-txt1">--%>
<%--                                            <input type="checkbox" id="ch-box">--%>
<%--                                            <label for="ch-box">--%>
<%--                                                <span class="ch-display">장바구니 다시담기</span>--%>
<%--                                            </label>--%>
<%--                                        </td>--%>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="r-sec3">
                            <p class="sec-h1">환불 정보</p>
                            <table>
                                <colgroup>
                                    <col style="width: 180px;">
                                    <col style="width: 267px">
                                    <col style="width: 180px;">
                                    <col style="width: 267px">
                                </colgroup>
                                <tbody class="sec3-body body-tr-s">
                                <tr>
                                    <td class="body-td-tit">주문금액</td>
                                    <td class="body-td-txt2"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                                    <td class="body-td-tit">상품금액</td>
                                    <td class="body-td-txt2"><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>원 <c:if test="${fn:length(paymentBundleList) > 1}"> 외 ${fn:length(paymentBundleList) - 1}건</c:if></td>
                                </tr>
                                <tr>
                                    <td class="body-td-tit">결제금액</td>
                                    <td class="body-td-txt2 txt-color"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                                    <td class="body-td-tit">결제수단</td>
                                    <td class="body-td-txt2"><span>${paymentDetail.pay_method}</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="r-sec4">
                            <p class="sec-h1">환불 계좌</p>
                            <table>
                                <colgroup>
                                    <col style="width: 180px;">
                                    <col style="width: 110px;">
                                    <col style="width: 610px">
                                </colgroup>
                                <tbody class="sec4-body">
                                    <tr>
                                        <td class="body-td-tit" rowspan="3">환불계좌</td>
                                        <td class="body-td-txt2 pad-top">은행명</td>
                                        <td class="pad-top">
<%--                                            <input name="refund_bank" type="text" class="select-op">--%>
                                            <select name="refund_bank" class="select-op">
                                                <c:if test="${not empty getSelectorList}">
                                                    <option value="">은행명</option>
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
                        <div class="r-sec5">
                            <button type="button" id="formSubmit">신청</button>
                            <button type="button" onclick="location.href='${header.referer}'">이전</button>
                        </div>
                    </form>
                </div>   
            </main>
        </div>
    </div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>