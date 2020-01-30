<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
<%--                <%@ include file="/WEB-INF/views/layout/MyPageRightHeader.jsp" %>--%>
                <c:import url="/MyPage/RightHeader"/>
                <div class="coupon1">
                    <p class="cou-font">쿠폰 등록</p>
                    <div class="coupon-box">

                        <div class="coupon-input">
                            <p>*소지하고 계신 원조이몰 할인쿠폰 번호 15자리를 입력해 주세요.</p>
                            <input type="text" placeholder="1234">
                            <button>등록하기</button>
                        </div>
                    </div>
                </div>
                <div class="coupon2">
                    <p class="cou-font">등록된 쿠폰 내역</p>
                    <table>
                        <colgroup>
                            <col style="width:200px">
                            <col style="width:247px">
                            <col style="width:247px">
                            <col style="width:200px">
                        </colgroup>
                        <thead class="cou-header">
                        <tr>
                            <th>등록시간</th>
                            <th>쿠폰명</th>
                            <th>조건</th>
                            <th>유효기간</th>
                        </tr>
                        </thead>
                        <tbody class="cou-body">
                        <c:if test="${not empty userCouponList}">
                            <c:forEach var="userCouponList" items="${userCouponList}">
                                <c:set var="coupon_payment_condition" value="${userCouponList.coupon_payment_condition}"/>
                                <tr>
                                    <td>${userCouponList.reg_date}</td>
                                    <td>${userCouponList.coupon_name}</td>

                                    <td>${userCouponList.coupon_payment_condition} ${message_coupon_payment_condition}</td>
                                    <td>${userCouponList.coupon_use_day}</td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty userCouponList}">
                            <tr>
                                <td colspan="4">사용 가능 쿠폰  Q&amp;A이 없습니다.</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:if>

                        </tbody>
                    </table>
                    <div class="num-box">
                        <div class="num-box-in">
                            <div class="left-box"><a href=""></a></div>
                            <div class="num">
                                <span><a href="">1</a></span>
                            </div>
                            <div class="right-box"><a href=""></a></div>
                        </div>
                    </div>
                </div>

            </div>
        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
