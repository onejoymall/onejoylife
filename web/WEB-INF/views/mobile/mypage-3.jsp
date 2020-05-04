<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>

    <section class="subheader">
        <div class="subTitle">쿠폰 조회</div>
        <c:import url="/MyPage/RightHeaderSub"/>
        <hr>
    </section>
    <section class="wrap">
        <h2 class="pb-1">쿠폰 등록</h2>
        <hr class="mb-2">
        <form action="">
            <input type="text" class="coupon-in" name="coupon_cd" placeholder="15자리를 입력하세요"><button type="button" class="cou-btn" id="couponRegButton">등록하기</button>
        </form>
    </section>
    <section class="wrap">
        <h2 class="pb-1">다운로드 가능한 쿠폰</h2>
        <hr class="mb-2">
        <form action="">
        	<c:if test="${not empty userDownloadCouponList}">
            <c:forEach var="list" items="${userDownloadCouponList}">
            	${list.coupon_name} <button type="button" class="couponDownBtn cou-btn" data-id="${list.coupon_cd}">다운로드</button>            	
            </c:forEach>
            </c:if>
            <c:if test="${empty userDownloadCouponList}">
            	다운로드 가능한 쿠폰이 없습니다.
            </c:if>
        </form>
    </section>
    <section class="wrap">
        <h2 class="pb-1">등록된 쿠폰 내역</h2>
        <hr>
        <table>
            <colgroup>
                <col style="width: 70%;">
                <col style="width: 30%;">
            </colgroup>
            <thead class="lis-head">
                <tr>
                    <th>사용가능</th>
                    <th>사용기간</th>
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
                </c:forEach>
            </c:if>
            <c:if test="${empty userCouponList}">
                <tr>
                    <td colspan="2">사용 가능 쿠폰  Q&amp;A이 없습니다.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <ul class="centerBtns mt-3">
            <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
            <li><a href="#" class="active">1</a></li>
            <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
        </ul>
    </section>
    
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>