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
<%--                <%@ include file="/WEB-INF/views/layout/MyPageRightHeader.jsp" %>--%>
                <c:import url="/MyPage/RightHeader"/>
                <div class="coupon1">
                    <p class="cou-font">쿠폰 등록</p>
                    <div class="coupon-box">

                        <div class="coupon-input">
                            <p>*소지하고 계신 원조이몰 할인쿠폰 번호 15자리를 입력해 주세요.</p>
                            <input type="text" placeholder="" name="coupon_cd">
                            <button type="button" id="couponRegButton">등록하기</button>
                        </div>
                    </div>
                </div>
                <div class="coupon2">
                    <p class="cou-font">쿠폰 받기</p>
                    <table>
                        <colgroup>
                            <col style="width:247px">
                            <col style="width:247px">
                            <col style="width:200px">
                            <col style="width:200px">
                        </colgroup>
                        <thead class="cou-header">
                            <tr>
                                <th>쿠폰명</th>
                                <th>조건</th>
                                <th>유효기간</th>
                                <th>받기</th>
                            </tr>
                        </thead>
                        <tbody class="cou-body">
                            <c:if test="${not empty userDownloadCouponList}">
				            <c:forEach var="list" items="${userDownloadCouponList}">
				            	<td><span>${list.coupon_name}</span></td>
                                <td>
                                	<span>
                                	<c:if test="${not empty list.coupon_use_min_amount}">
                                    	<fmt:formatNumber value="${list.coupon_use_min_amount}" groupingUsed="true" /> ${message_coupon_payment_condition}
                                    </c:if>
                                    </span>
                                </td>
                                <td><span> ~ ${list.coupon_valid_date_end}</span></td>
                                <td><button type="button" class="btn-blue couponDownBtn" data-id="${list.coupon_cd}">다운로드</button></td>
				            </c:forEach>
				            </c:if>
				            <c:if test="${empty userDownloadCouponList}">
				            	<td colspan="4">다운로드 가능한 쿠폰이 없습니다.</td>
				            </c:if>
                        </tbody>
                    </table>
                </div>
                <div class="coupon2">
                    <p class="cou-font">등록된 쿠폰 내역</p>
                    <table>
                        <colgroup>
                            <col style="width:150px">
                            <col style="width:247px">
                            <col style="width:247px">
                            <col style="width:100px">
                            <col style="width:150px">
                        </colgroup>
                        <thead class="cou-header">
                        <tr>
                            <th>등록시간</th>
                            <th>쿠폰명</th>
                            <th>조건</th>
                            <th>쿠폰할인</th>
                            <th>유효기간</th>
                        </tr>
                        </thead>
                        <tbody class="cou-body">
                        <c:if test="${not empty userCouponList}">
                            <c:forEach var="userCouponList" items="${userCouponList}">
                                <tr>
                                    <td><fmt:formatDate value="${userCouponList.reg_date}" pattern="yyyy.MM.dd HH:mm"/></td>
                                    <td>${userCouponList.coupon_name}</td>
                                    <td>
										<c:if test="${not empty userCouponList.coupon_use_min_amount}">
                                    	<fmt:formatNumber value="${userCouponList.coupon_use_min_amount}" groupingUsed="true" /> ${message_coupon_payment_condition}
	                                    </c:if>
                                  	</td>
                                  	<td>
				                    	<c:if test="${userCouponList.coupon_sale_type eq 'amount'}"><fmt:formatNumber value="${userCouponList.coupon_sale_payment}" groupingUsed="true" />원</c:if>
				                    	<c:if test="${userCouponList.coupon_sale_type eq 'percentage'}"><fmt:formatNumber value="${userCouponList.coupon_sale_rate}" groupingUsed="true" />%</c:if>
                                  	</td>
                                    <td><fmt:formatDate value="${userCouponList.coupon_valid_date_start}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${userCouponList.coupon_valid_date_end}" pattern="yyyy.MM.dd"/></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty userCouponList}">
                            <tr>
                                <td colspan="5">사용 가능 쿠폰  Q&amp;A이 없습니다.</td>
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
