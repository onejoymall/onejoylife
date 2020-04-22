<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>
<form id="form1" name="form1"  method="post">
	<section class="subheader">
		<c:import url="/MyPage/RightHeaderSub"/>
	</section>
    <section class="wrap">
        <h2 class="pb-1">주문현황</h2>
        <ul class="btns">
            <li><a href="javascript:void(0)" class="ra-num" data-id="con1">오늘</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con2">1주일</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con3">1개월</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con4">3개월</a></li>
        </ul>
        <div class="date-box">
            <div class="input-box2">
            <form>
                <div class="cla">
                    <input type="text" id="from_date" name="start_date" class="date_pick" value="<c:out value="${param.start_date}"/> ">
                    <!-- <div class="cla-img1"></div> -->
                </div>
                <p class="cla-p1"> ~ </p>
                <div class="cla">
                    <input type="text" id="to_date" name="end_date" class="date_pick" value="<c:out value="${param.end_date}"/> ">
                    <!-- <div class="cla-img1"></div> -->
                </div>
            </div>
            <button type="submit" class="date-btn">조회</button>
            </form>
        </div>
        <h2 class="py-1">주문상품</h2>
        <hr>
        <c:if test="${not empty paymentList}">
            <c:forEach var="paymentList" items="${paymentList}" varStatus="status">
            <ul class="product pb-0">
            <h5><fmt:formatDate value="${paymentList.reg_date}" pattern="yyyy.MM.dd"/></h5>
            <ul class="pb-0">
                <li><a href="/product/productDetail?product_cd=${paymentList.product_cd}"><img src="${paymentList.file_1}" alt=""></a></li>
                <li>
                   <a href="" class="mb-1">${paymentList.order_no}</a>
                    <p>${paymentList.product_made_company_name}</p>
                    <h5>${paymentList.product_name}</h5>
                    <p class="grey">${paymentList.product_model}</p>
                </li>
            </ul>
            <ul class="options">
                <li>상품금액</li>
                <li><fmt:formatNumber value="${paymentList.product_payment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
            <ul class="options">
                <li>수량</li>
                <li>1 <span>개</span></li>
            </ul>
            <hr>
            <ul class="options mb-1">
                <li>주문금액</li>
                <li><fmt:formatNumber value="${paymentList.payment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
            <ul class="options bg_grey p-1">
                <li>${paymentList.payment_status_name}</li>
                <li>
                	<button type="button" class="btn btn-red" onclick="location.href='/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}'" >주문상세</button>
                	<c:if test="${paymentList.payment_status eq 'R'}">
                		<button type="button" id="SearchDelivery" class="btn btn-red" data-id="${paymentList.order_no}" >배송조회</button>
               		</c:if>
               		<c:if test="${paymentList.payment_status == 'O'}">
                    	<c:if test="${paymentList.review_id == null}">
                    	<button type="button" class="btn btn-red review-write" data-id="${paymentList.order_no}" >상품평작성</button>
                        </c:if>
                        <c:if test="${paymentList.review_id != null}">
                        <button type="button" class="btn btn-red" onclick="location.href='/MyPage/Reviews';">상품평보기</button>
                        </c:if>
                    </c:if>
                </li>
            </ul>
        </ul>
        <hr>
            </c:forEach>
        </c:if>
        <c:if test="${empty paymentList}">
        	표시할 내용이 없습니다.
        	<hr>
        </c:if>
    </section>
    </form>
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>