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
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box clearfix">
        <main>
            <c:import url="/layout/scrollRight"/>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
<%--                <%@ include file="/WEB-INF/views/layout/MyPageRightHeader.jsp" %>--%>
                <c:import url="/MyPage/RightHeader"/>
                <div class="coupon1">
                    <p class="cou-font">${afn:getMessage('coupon',sessionScope.locale)} ${afn:getMessage('registration',sessionScope.locale)}</p>
                    <div class="coupon-box">

                        <div class="coupon-input">
                            <p>* ${afn:getMessage('msg.coupon.register',sessionScope.locale)}</p>
                            <input type="text" placeholder="" name="coupon_cd">
                            <button type="button" id="couponRegButton">${afn:getMessage('register',sessionScope.locale)}</button>
                        </div>
                    </div>
                </div>
                <div class="coupon2">
                    <p class="cou-font">${afn:getMessage('coupon',sessionScope.locale)} ${afn:getMessage('receive',sessionScope.locale)}</p>
                    <table>
                        <colgroup>
                            <col style="width:247px">
                            <col style="width:247px">
                            <col style="width:200px">
                            <col style="width:200px">
                        </colgroup>
                        <thead class="cou-header">
                            <tr>
                                <th>${afn:getMessage('coupon_name',sessionScope.locale)}</th>
                                <th>${afn:getMessage('condition',sessionScope.locale)}</th>
                                <th>${afn:getMessage('validity',sessionScope.locale)}</th>
                                <th>${afn:getMessage('receive',sessionScope.locale)}</th>
                            </tr>
                        </thead>
                        <tbody class="cou-body">
                            <c:if test="${not empty userDownloadCouponList}">
				            <c:forEach var="list" items="${userDownloadCouponList}">
				            <tr>
				            	<td><span>${list.coupon_name}</span></td>
                                <td style="text-align: left!important;">
                                	<span>
                                	<c:if test="${not empty list.coupon_use_min_amount}">
                                    	<fmt:formatNumber value="${list.coupon_use_min_amount}" groupingUsed="true" /> ${message_coupon_payment_condition}<br>
                                    </c:if>
                                    <c:if test="${empty list.coupon_use_min_amount}">
                                       <span class="text-bold">${afn:getMessage('amount',sessionScope.locale)}</span>&nbsp;&nbsp;:&nbsp;&nbsp;${afn:getMessage('no_limit',sessionScope.locale)}<br>
                                    </c:if>
                                     <c:if test="${not empty list.category_name}">
                                         ${afn:getMessage('category',sessionScope.locale)}&nbsp;&nbsp;:&nbsp;&nbsp;${list.category_name}<br>
                                     </c:if>
                                    <c:if test="${empty list.category_name}">
                                        ${afn:getMessage('category',sessionScope.locale)}&nbsp;&nbsp;:&nbsp;&nbsp;${afn:getMessage('no_limit',sessionScope.locale)}<br>
                                    </c:if>
                                    </span>
                                </td>
                                <td><span> ~ ${list.coupon_valid_date_end}</span></td>
                                <td><button type="button" class="btn-blue couponDownBtn" data-id="${list.coupon_cd}">${afn:getMessage('download',sessionScope.locale)}</button></td>
                            </tr>
				            </c:forEach>
				            </c:if>
				            <c:if test="${empty userDownloadCouponList}">
				            	<td colspan="4">${afn:getMessage('msg.coupon.none_down_coupon',sessionScope.locale)}</td>
				            </c:if>
                        </tbody>
                    </table>
                </div>
                <div class="coupon2">
                    <p class="cou-font">${afn:getMessage('reg_coupon',sessionScope.locale)}</p>
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
                            <th>${afn:getMessage('reg_time',sessionScope.locale)}</th>
                            <th>${afn:getMessage('coupon_name',sessionScope.locale)}</th>
                            <th>${afn:getMessage('condition',sessionScope.locale)}</th>
                            <th>${afn:getMessage('coupon_discount',sessionScope.locale)}</th>
                            <th>${afn:getMessage('validity',sessionScope.locale)}</th>
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
                                            <fmt:formatNumber value="${userCouponList.coupon_use_min_amount}" groupingUsed="true" /> ${message_coupon_payment_condition}<br>
                                        </c:if>
                                        <c:if test="${empty userCouponList.coupon_use_min_amount}">
                                            <span class="text-bold">${afn:getMessage('amount',sessionScope.locale)}</span>&nbsp;&nbsp;:&nbsp;&nbsp;${afn:getMessage('no_limit',sessionScope.locale)}<br>
                                        </c:if>
                                        <c:if test="${not empty userCouponList.category_name}">
                                            ${afn:getMessage('category',sessionScope.locale)}&nbsp;&nbsp;:&nbsp;&nbsp;${userCouponList.category_name}<br>
                                        </c:if>
                                        <c:if test="${empty userCouponList.category_name}">
                                            ${afn:getMessage('category',sessionScope.locale)}&nbsp;&nbsp;:&nbsp;&nbsp;${afn:getMessage('no_limit',sessionScope.locale)}<br>
                                        </c:if>
                                  	</td>
                                  	<td>
				                    	<c:if test="${userCouponList.coupon_sale_type eq 'amount'}"><fmt:formatNumber value="${userCouponList.coupon_sale_payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</c:if>
				                    	<c:if test="${userCouponList.coupon_sale_type eq 'percentage'}"><fmt:formatNumber value="${userCouponList.coupon_sale_rate}" groupingUsed="true" />%</c:if>
                                  	</td>
                                    <td><fmt:formatDate value="${userCouponList.coupon_valid_date_start}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${userCouponList.coupon_valid_date_end}" pattern="yyyy.MM.dd"/></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty userCouponList}">
                            <tr>
                                <td colspan="5">${afn:getMessage('msg.coupon.none_reg_coupon',sessionScope.locale)}</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:if>

                        </tbody>
                    </table>
                    <!-- <div class="num-box">
                        <div class="num-box-in">
                            <div class="left-box"><a href=""></a></div>
                            <div class="num">
                                <span><a href="">1</a></span>
                            </div>
                            <div class="right-box"><a href=""></a></div>
                        </div>
                    </div> -->
                </div>

            </div>
        </main>

    </div>
</div>
<c:import url="/layout/footer"/>

<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
