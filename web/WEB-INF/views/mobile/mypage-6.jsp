<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
<form id="form1" name="form1"  method="get">
	<section class="subheader">
		<c:import url="/MyPage/RightHeaderSub"/>
	</section>
    <section class="wrap">
        <h2 class="pb-1">${afn:getMessage('order_status',sessionScope.locale)}</h2>
        <ul class="btns">
            <li><a href="javascript:void(0)" class="ra-num" data-id="con1">${afn:getMessage('today',sessionScope.locale)}</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con2">1${afn:getMessage('week',sessionScope.locale)}</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con3">1${afn:getMessage('month',sessionScope.locale)}</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con4">3${afn:getMessage('month',sessionScope.locale)}</a></li>
        </ul>
        <div class="date-box">
       
        
            <div class="input-box2">
                <div class="cla">
                    <input type="text" id="from_date" name="start_date" class="date_pick" value="<c:out value="${param.start_date}"/>">
                    <!-- <div class="cla-img1"></div> -->
                </div>
                <p class="cla-p1"> ~ </p>
                <div class="cla">
                    <input type="text" id="to_date" name="end_date" class="date_pick" value="<c:out value="${param.end_date}"/>">
                    <!-- <div class="cla-img1"></div> -->
                </div>
            </div>
            <button type="submit" class="date-btn">${afn:getMessage('lookup',sessionScope.locale)}</button>
        </div>
         <button  type="button"  class="ex-order" onclick="location.href='/Help/csBoardLargeOrder?bgno=15'">
         	${afn:getMessage('1:1largeorder',sessionScope.locale)}
         </button>
        <!-- 2020-09-10 고객사측에서 	주문상태선택은 불필요하다 판단하여 주석처리    
     
        <select name="payment_status" id="mo-select" class="mo-select">
            <c:if test="${not empty getSelectorList}">
                <option value="">${afn:getMessage('order_statusselection',sessionScope.locale)}</option>
                <c:forEach var="getSelectorList" items="${getSelectorList}" varStatus="status">
                <option value="${getSelectorList.code_value}" <c:if test="${getSelectorList.code_value eq param.payment_status}">selected</c:if>>${getSelectorList.code_name}</option>
                </c:forEach>
            </c:if>
        </select>
         -->
        <h2 class="py-1">${afn:getMessage('order_product',sessionScope.locale)}</h2>
        <hr>
        <c:if test="${not empty paymentList}">
        	<c:forEach var="map" items="${paymentList}">
           		<c:forEach var="paymentList" items="${map.value}" varStatus="status">
           			<ul class="product pb-0">
		                <h5><fmt:formatDate value="${paymentList.reg_date}" pattern="yyyy.MM.dd"/></h5>
		                <ul class="pb-0">
	                        <li><a href="/product/productDetail?product_cd=${paymentList.product_cd}"><img src="${paymentList.file_1}" alt=""></a></li>
		                    <li>
		                       <a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}" class="mb-1">${paymentList.order_no}</a>
		                        <%-- <p>${paymentList.product_made_company_name}</p> --%>
		                        <h5><a href="/product/productDetail?product_cd=${paymentList.product_cd}" style="text-decoration: none; color:black;">${paymentList.product_name}<c:if test="${not empty list.option_name}"> / ${list.option_name}</c:if></a></h5>
		                        <%-- <p class="grey">${paymentList.product_model}</p> --%>
		                    </li>
		                </ul>
		                <ul class="options">
		                    <li>${afn:getMessage('product_amount',sessionScope.locale)}</li>
		                    <li><fmt:formatNumber value="${paymentList.product_payment}" groupingUsed="true" /> <fmt:formatNumber value="${paymentList.giveaway_payment}" groupingUsed="true" /><span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
		                </ul>
		                <ul class="options">
		                    <li>${afn:getMessage('quantity',sessionScope.locale)}</li>
		                    <li><fmt:formatNumber value="${paymentList.payment_order_quantity}" groupingUsed="true" /> <span>${afn:getMessage('piece',sessionScope.locale)}</span></li>
		                </ul>
		                <hr>
		                <ul class="options mb-1">
		                    <li>${afn:getMessage('order_payment',sessionScope.locale)}</li>
		                    <li><fmt:formatNumber value="${paymentList.payment}" groupingUsed="true" /> <span>${afn:getMessage('korea_won',sessionScope.locale)}</span></li>
		                </ul>
		                <ul class="options bg_grey p-1">
		                    <li class="w100px">${paymentList.payment_status_name}</li>
		                    <li>
		                        <button type="button" class="btn btn-red" onclick="location.href='/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}'" >${afn:getMessage('order_detail',sessionScope.locale)}</button>
		                        <c:if test="${paymentList.payment_status eq 'R' || paymentList.payment_status eq 'S'}">
		                            <button type="button" id="SearchDelivery" class="btn btn-red" data-id="${paymentList.order_no}" >${afn:getMessage('delivery_check',sessionScope.locale)}</button>
		                        </c:if>
		                        <c:if test="${paymentList.payment_status == 'O' || paymentList.payment_status eq 'S'}">
		                            <c:if test="${paymentList.review_id == null}">
		                            <button type="button" class="btn btn-red review-write" data-id="${paymentList.no}" >${afn:getMessage('review_writing',sessionScope.locale)}</button>
		                            </c:if>
		                            <c:if test="${paymentList.review_id != null}">
		                            <button type="button" class="btn btn-red" onclick="location.href='/MyPage/Reviews';">${afn:getMessage('review_reading',sessionScope.locale)}</button>
		                            </c:if>
		                        </c:if>
		                        <c:if test="${paymentList.payment_status == 'C'}">
		                            <c:if test="${fn:startsWith(paymentList.order_no, 'PD')}">
		                                <button type="button" class="btn btn-blue" onclick="location.href='/product/productPayment?order_no=${paymentList.order_no}'">${afn:getMessage('reordering',sessionScope.locale)}</button>
		                            </c:if>
		                            <c:if test="${fn:startsWith(paymentList.order_no, 'PO')}">
		                                <button type="button" class="btn btn-blue" onclick="location.href='/product/productPaymentCart?order_no=${paymentList.order_no}'">${afn:getMessage('partial_cancellation',sessionScope.locale)}</button>
		                            </c:if>
		                        </c:if>
		                    </li>
		<%--                    <li>
		                        <c:if test="${paymentList.payment_status == 'C'}">
		                            <c:if test="${fn:startsWith(paymentList.order_no, 'PD')}">
		                                <button type="button" class="btn btn-blue" onclick="location.href='/product/productPayment?order_no=${paymentList.order_no}'">재주문</button>
		                            </c:if>
		                            <c:if test="${fn:startsWith(paymentList.order_no, 'PO')}">
		                                <button type="button" class="btn btn-blue" onclick="location.href='/product/productPaymentCart?order_no=${paymentList.order_no}'">부분취소 재주문</button>
		                            </c:if>
		                        </c:if>
		                    </li>--%>
		                </ul>
		            </ul>
		        	<hr>
           		</c:forEach>
       		</c:forEach>
   		</c:if>
   		
        <c:if test="${empty paymentList}">
        	${afn:getMessage('msg.none_content',sessionScope.locale)}
        	<hr>
        </c:if>
        <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
    </section>
    </form>
     <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>
<script>

</script>