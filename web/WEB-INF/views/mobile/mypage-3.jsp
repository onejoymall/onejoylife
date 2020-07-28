<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>

    <section class="subheader">
        <div class="subTitle">${afn:getMessage('coupon',sessionScope.locale)} ${afn:getMessage('lookup',sessionScope.locale)}</div>
        <c:import url="/MyPage/RightHeaderSub"/>
        <hr>
    </section>
    <section class="wrap">
        <h2 class="pb-1">${afn:getMessage('coupon',sessionScope.locale)} ${afn:getMessage('registration',sessionScope.locale)}</h2>
        <hr class="mb-2">
        <form action="">
            <input type="text" class="coupon-in" name="coupon_cd" placeholder="${afn:getMessage('msg.coupon.register',sessionScope.locale)}"><button type="button" class="cou-btn" id="couponRegButton">${afn:getMessage('register',sessionScope.locale)}</button>
        </form>
    </section>
    <section class="wrap">
        <h2 class="pb-1">${afn:getMessage('coupon',sessionScope.locale)} ${afn:getMessage('receive',sessionScope.locale)}</h2>
        <hr>
        <table>
            <colgroup>
                <col style="width: *">
                <col style="width: 75px;">
                <col style="width: 50px;">
            </colgroup>
            <tbody class="lis-body">
            	<c:if test="${not empty userDownloadCouponList}">
	            <c:forEach var="list" items="${userDownloadCouponList}">
	            	<tr>
	                    <td class="lis-td-con">
	                        <p><span>${list.coupon_name}</span></p>
	                        <c:if test="${not empty list.coupon_use_min_amount}">
                            	<p><span>(<fmt:formatNumber value="${list.coupon_use_min_amount}" groupingUsed="true" /> ${message_coupon_payment_condition})</span></p>
                            </c:if>
                            <c:if test="${empty list.coupon_use_min_amount}">
                            <p><span class="text-bold">${afn:getMessage('amount',sessionScope.locale)}</span>&nbsp;&nbsp;:&nbsp;&nbsp;${afn:getMessage('no_limit',sessionScope.locale)}</p>
                            </c:if>
                            <c:if test="${not empty list.category_name}">
                            <p>${afn:getMessage('category',sessionScope.locale)}&nbsp;&nbsp;:&nbsp;&nbsp;${list.category_name}</p>
                            </c:if>
                            <c:if test="${empty list.category_name}">
                            <p>${afn:getMessage('category',sessionScope.locale)}&nbsp;&nbsp;:&nbsp;&nbsp;${afn:getMessage('no_limit',sessionScope.locale)}</p>
                            </c:if>
	                        <p><span> ~ ${list.coupon_valid_date_end}</span></p>
	                    </td>
	                    <td><button type="button" class="btn couponDownBtn" data-id="${list.coupon_cd}">${afn:getMessage('download',sessionScope.locale)}</button></td>
	                </tr>            	
	            </c:forEach>
	            </c:if>
	            <c:if test="${empty userDownloadCouponList}">
	            	${afn:getMessage('msg.coupon.none_down_coupon',sessionScope.locale)}
	            </c:if>
            </tbody>
        </table>
    </section>
    <section class="wrap">
        <h2 class="pb-1">${afn:getMessage('reg_coupon',sessionScope.locale)}</h2>
        <hr>
        <table>
            <colgroup>
                <col style="width: 70%;">
                <col style="width: 30%;">
            </colgroup>
            <thead class="lis-head">
                <tr>
                    <th>${afn:getMessage('coupon_name',sessionScope.locale)}</th>
                    <th>${afn:getMessage('validity',sessionScope.locale)}</th>
                </tr>
            </thead>
            <tbody class="lis-body">
            <c:if test="${not empty userCouponList}">
                <c:forEach var="userCouponList" items="${userCouponList}">
                <tr>
                    <td class="lis-td-con">
                        <p><span>${userCouponList.coupon_name}</span></p>
                        <c:if test="${not empty userCouponList.coupon_use_min_amount}"><p><span><fmt:formatNumber value="${userCouponList.coupon_use_min_amount}" groupingUsed="true" /> ${message_coupon_payment_condition}</span></p></c:if>
                    </td>
                    <td class="lis-td-p">
                        <p><span><fmt:formatDate value="${userCouponList.coupon_valid_date_start}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${userCouponList.coupon_valid_date_end}" pattern="yyyy.MM.dd"/></span></p>
                    </td>
                 </tr>
                <tr>
                    <td class="lis-td-con" colspan="2">
                        <c:if test="${not empty list.coupon_use_min_amount}">
                            <p><span>(<fmt:formatNumber value="${list.coupon_use_min_amount}" groupingUsed="true" /> ${message_coupon_payment_condition})</span></p>
                        </c:if>
                        <c:if test="${empty list.coupon_use_min_amount}">
                            <p><span class="text-bold">${afn:getMessage('amount',sessionScope.locale)}</span>&nbsp;&nbsp;:&nbsp;&nbsp;${afn:getMessage('no_limit',sessionScope.locale)}</p>
                        </c:if>
                        <p>
                            <span class="text-bold">${afn:getMessage('category',sessionScope.locale)}</span> :
                            <c:if test="${not empty userCouponList.category_name}">
                                ${userCouponList.category_name}
                            </c:if>
                            <c:if test="${empty userCouponList.category_name}">
                                ${afn:getMessage('no_limit',sessionScope.locale)}
                            </c:if>
                        </p>
                    </td>
                </tr>

                </c:forEach>
            </c:if>
            <c:if test="${empty userCouponList}">
                <tr>
                    <td colspan="2">${afn:getMessage('msg.coupon.none_reg_coupon',sessionScope.locale)}</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <!-- <ul class="centerBtns mt-3">
            <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
            <li><a href="#" class="active">1</a></li>
            <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
        </ul> -->
    </section>
     <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>