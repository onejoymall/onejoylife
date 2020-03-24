<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <div class="r-sec1">
                    <p class="sec1-h1">주문 상세내역</p>
                    <p class="sec1-p1">주문번호 : <span>${paymentDetail.order_no}</span><span> │ </span>주문일 : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p>
                    <table>
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 260px;">
                            <col style="width: 125px;">
                            <col style="width: 110px;">
                            <col style="width: 100px;">
                            <col style="width: 150px;">
                        </colgroup>
                        <thead class="sec1-thead">
                        <tr>
                            <th></th>
                            <th>상품정보</th>
                            <th>상품금액</th>
                            <th>수량</th>
                            <th>진행상태</th>
                            <th>관리</th>
                        </tr>
                        </thead>
                        <tbody class="sec1-tbody">
                        <tr>
                            <td><img src="${paymentDetail.file_1}" style="width: 80px;"/></td>
                            <td class="sec1-tbody-p1">
                                <p>[${paymentDetail.product_made_company_name}] ${paymentDetail.product_name}</p>
                                <p>${paymentDetail.product_made_company_model}</p>
                            </td>
                            <td><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                            <td><span>1</span></td>
                            <td><span>${paymentDetail.error_msg}</span></td>
                            <td class="sec1-tbody-p2">
                                <div class="p2-box1">
                                    <p class="p2-ck"><a href="">배송지 변경</a></p>
                                    <p><a href="../sub/mypage-6-1-1.html">주문취소</a></p>
                                    <p><a href="">판매자 문의</a></p>
                                </div>
                                <div class="p2-box2 dis-none1">
                                    <p class="p2-color"><a href="">배송조회</a></p>
                                    <p><a href="">반품/교환 신청</a></p>
                                    <p><a href="">판매자 문의</a></p>
                                    <p><a href="">리뷰쓰기</a></p>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="r-sec2">
                    <p class="sec-h1">배송지 정보</p>
                    <table>
                        <colgroup>
                            <col style="width: 180px;">
                            <col style="width: 715px;;">
                        </colgroup>
                        <tbody class="sec2-body body-tr-s">
                        <tr>
                            <td class="body-td-tit1">수취인</td>
                            <td class="body-td-txt"><span>${delivery.delivery_user_name}</span></td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">휴대폰 번호</td>
                            <td class="body-td-txt">${delivery.delivery_user_phone}</td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">주소</td>
                            <td class="body-td-txt"><span>${delivery.postcode} ${delivery.roadAddress} ${delivery.extraAddress}</span></td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">배송시 요청사항</td>
                            <td class="body-td-txt"><span>${delivery.delivery_message}</span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
<%--                <div class="r-sec3">--%>
<%--                    <p class="sec-h1">주문자 정보</p>--%>
<%--                    <table>--%>
<%--                        <colgroup>--%>
<%--                            <col style="width: 180px;">--%>
<%--                            <col style="width: 720px;">--%>
<%--                        </colgroup>--%>
<%--                        <tbody class="sec3-body body-tr-s">--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">주문하시는분</td>--%>
<%--                            <td class="body-td-txt"><span>홍길동</span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">이메일주소</td>--%>
<%--                            <td class="body-td-txt"><span>gildonghong@onejoy.co.kr</span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">휴대폰 번호</td>--%>
<%--                            <td class="body-td-txt"><span>010</span><span class="td-txt-un"> - </span><span>1234</span><span class="td-txt-un"> - </span><span>1234</span></td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
                <div class="r-sec4">
                    <p class="sec-h1">결제 정보</p>
                    <table>
                        <colgroup>
                            <col style="width: 180px;">
                            <col style="width: 267px">
                            <col style="width: 180px;">
                            <col style="width: 267px">
                        </colgroup>
                        <tbody class="sec3-body body-tr-s">
                        <tr>
                            <td class="body-td-tit2">주문금액</td>
                            <td class="body-td-txt"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                            <td class="body-td-tit2">상품금액</td>
                            <td class="body-td-txt"><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>원</td>
                        </tr>
                        <tr>
                            <td class="body-td-tit2">결제금액</td>
                            <td class="body-td-txt txt-color"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                            <td class="body-td-tit2">결제수단</td>
                            <td class="body-td-txt"><span>${paymentDetail.pay_method}</span></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="sec4-ca"><a href="">신용카드 전표</a></div>
                </div>
                <div class="r-sec5">
                    <a href="/MyPage/OrderAndDelivery">목록보기</a>
                </div>
            </div>
        </main>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>