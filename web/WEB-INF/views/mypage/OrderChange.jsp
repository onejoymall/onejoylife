<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <form id="defaultForm" name="defaultForm"  method="POST">
                    <div class="r-sec1">
                        <p class="sec1-h1">교환신청</p>
                        <p class="sec1-p1">상점주문번호 : <span>${paymentDetail.order_no}</span><span> │ </span>주문일 : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p>
                        <input type="hidden" name="order_no" value="${paymentDetail.order_no}">
                        <input type="hidden" name="cancel_request_amount" value="${paymentDetail.payment}">
                        <table>
                            <colgroup>
                                <col style="width: 150px;">
                                <col style="width: 260px;">
                                <col style="width: 525px;">
                                <%--                                    <col style="width: 259px;">--%>
                                <%--                                    <col style="width: 100px;">--%>
                            </colgroup>
                            <thead class="sec1-thead">
                            <tr>
                                <th></th>
                                <th>상품정보</th>
                                <%--                                        <th>판매자</th>--%>
                                <th>상품금액</th>
                                <%--                                        <th>수량</th>--%>
                            </tr>
                            </thead>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td><img src="${paymentDetail.file_1}" style="width: 80px;"/></td>
                                <td class="sec1-tbody-p1">
                                    <p>${paymentDetail.product_name}</p>
                                    <p>${paymentDetail.product_made_company_model}</p>
                                </td>
                                <%--                                        <td><span>${paymentDetail.product_made_company}</span></td>--%>
                                <td><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                                <%--                                        <td><span>1</span></td>--%>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <p class="sec-h1">교환사유</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec2-body body-tr-s">
<%--                            <tr>--%>
<%--                                <td class="body-td-tit">사유선택</td>--%>
<%--                                <td class="body-td-txt1">--%>
<%--                                    <select name="" id="" class="txt1-select">--%>
<%--                                        <option value="">사유를 선택하세요</option>--%>
<%--                                        <option value="">사유1</option>--%>
<%--                                        <option value="">사유2</option>--%>
<%--                                        <option value="">사유3</option>--%>
<%--                                    </select>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                            <tr>
                                <td class="body-td-tit">사유입력</td>
                                <td class="body-td-txt1">
                                    <textarea name="reason" id="reason" cols="97" rows="4" style="resize: none; margin-top: 10px;" class="area-content" maxlength="250"></textarea>
                                    <p class="area-num">(0/250)</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec3">
                        <p class="sec-h1">원상품 회수지 정보</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s">
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
                        <p class="sec-h1">교환상품 배송지 정보</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s">
                            <tr>
                                <td class="body-td-tit">수령인</td>
                                <td class="body-td-txt2"><input name = "refund_user_name" type="text" value="${delivery.delivery_user_name}" class="select-op"></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">연락처</td>
                                <td class="body-td-txt2"><input name = "refund_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op"></td>
                            </tr>

                            <tr>
                                <td class="body-td-tit">우편번호</td>
                                <td class="body-td-txt2"><input name = "refund_postcode" type="text" value="${delivery.postcode}" class="select-op"><button class="sec-but" type="button"  id="daumMapCall2">주소지 변경</button></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">주소</td>
                                <td class="body-td-txt2">
                                    <input name = "refund_roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
                                    <input name = "refund_jibunAddress" type="hidden" value="${delivery.jibunAddress}" >
                                    <input name = "refund_guide" type="hidden" value="${delivery.jibunAddress}" >
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">상세주소</td>
                                <td class="body-td-txt2"><input name = "refund_extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="r-sec5">
                        <button type="button" id="formSubmit">교환신청</button>
                        <button type="button" onclick="location.href='${header.referer}'">이전</button>
                    </div>
                </form>
            </div>

        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>