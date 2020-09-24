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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box clearfix">
        <main>
            <c:import url="/layout/scrollRight"/>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <c:import url="/MyPage/RightHeader"/>
                <form id="form1" name="form1" method="get">
                    <input type="hidden" name="date_pick_con">
                <div class="r-input-box">
                    <p class="r-in-p1">${afn:getMessage('order_status',sessionScope.locale)}</p>

                    <div class="r-in-box">
                        <div class="input-box1">
                            <p class="ra-num on" data-id="con1">${afn:getMessage('today',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con2">1${afn:getMessage('week',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con3">1${afn:getMessage('month',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con4">3${afn:getMessage('month',sessionScope.locale)}</p>
                        </div>
                        <div class="input-box2">
                            <div class="cla">
                                <input type="text" id="from_date" name="start_date" class="date_pick" value="<c:if test="${param.start_date} != null"><c:out value="${param.start_date}"/></c:if><c:out value="${param.start_date}"/>">
                                <div class="cla-img1"></div>
                            </div>
                            <p class="cla-p1"> ~ </p>
                            <div class="cla">
                                <input type="text" id="to_date" name="end_date" class="date_pick" value="<c:if test="${param.end_date} != null"><c:out value="${param.end_date}"/></c:if><c:out value="${param.end_date}"/>">
                                <div class="cla-img1"></div>
                            </div>
                            <p class="cla-p2"><a href="#" onclick="$('#form1').submit();">${afn:getMessage('lookup',sessionScope.locale)}</a></p>
                        </div>
                  <!--   2020-09-10 	주문상태선택은 불필요하다 판단하여 주석처리      
                        <div class="input-box3">
                            <select name="payment_status" >
                                <c:if test="${not empty getSelectorList}">
                                    <option value="">${afn:getMessage('order_statusselection',sessionScope.locale)}</option>
                                    <c:forEach var="getSelectorList" items="${getSelectorList}" varStatus="status">
                                    <option value="${getSelectorList.code_value}" <c:if test="${getSelectorList.code_value eq param.payment_status}">selected</c:if>>${getSelectorList.code_name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                       -->
                    </div>
                    <p class="r-in-p2">${afn:getMessage('msg.order.search3m',sessionScope.locale)}</p>
                    <!-- <button type="button" class="ex-order" onclick="location.href='/Help/csBoard?bgno=15'" >1:1 대량주문문의</button>class="write-review" -->
                <button type="button" class="ex-order" onclick="location.href='/Help/csBoardLargeOrder?bgno=15'" >${afn:getMessage('1:1largeorder',sessionScope.locale)}</button>
                </div>
                <div class="con on" id="con1">
                    <div class="r-sec4">
                        <div class="sec4-txt">
                            <p class="txt-tit">${afn:getMessage('order_product',sessionScope.locale)}</p>
                            <!-- <p class="mor-a">
                                <a href="">더보기 ></a>
                            </p> -->
                        </div>
                        <table class="sec4-lis">
                            <colgroup>
                                <col style="width: 150px;">
                                <col style="width: 305px;">
                                <col style="width: 125px;">
                                <col style="width: 100px;">
                                <col style="width: 100px;">
                                <col style="width: 120px;">
                            </colgroup>
                            <thead class="lis-head">
                            <tr>
                                <th>${afn:getMessage('order_date',sessionScope.locale)}/${afn:getMessage('storeorder_num',sessionScope.locale)}</th>
                                <th>${afn:getMessage('product_info',sessionScope.locale)}</th>
                                <th>${afn:getMessage('product_amount',sessionScope.locale)}</th>
                                <th>${afn:getMessage('quantity',sessionScope.locale)}</th>
                                <th>${afn:getMessage('order_payment',sessionScope.locale)}</th>
                                <th>${afn:getMessage('status',sessionScope.locale)}</th>
                            </tr>
                            </thead>
                            <tbody class="lis-body">
                            <c:if test="${not empty paymentList}">
	                        	<c:forEach var="map" items="${paymentList}">
	                           		<c:forEach var="paymentList" items="${map.value}" varStatus="status">
	                               		<c:if test="${status.index == 0}">
	                               			<tr>
			                                    <td class="my-lis-1" rowspan="${fn:length(map.value)}">
			                                        <p><fmt:formatDate value="${paymentList.reg_date}" pattern="yyyy.MM.dd"/></p>
			                                        <p><a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}">${paymentList.order_no}</a></p>
			                                    </td>
			                                    <td class="my-lis-2">
			                                        <a href="/product/productDetail?product_cd=${paymentList.product_cd}">
			                                            <div style="width: 22%;height: 90px;background: url(${paymentList.file_1}) no-repeat center / cover;"></div>
			                                            <div class="my-lis-txt">
			                                                <%-- <p>${paymentList.product_made_company_name}</p> --%>
			                                                <p class="lis-font-w">${paymentList.product_name}<c:if test="${not empty list.option_name}"> / ${list.option_name}</c:if></p>
			                                                <%-- <p>${paymentList.product_model}</p> --%>
			                                            </div>
			                                        </a>
			                                    </td>
			                                    <td class="lis-font-w"><span><fmt:formatNumber value="${paymentList.product_payment}" groupingUsed="true" /><fmt:formatNumber value="${paymentList.giveaway_payment}" groupingUsed="true" /></span><span>${afn:getMessage('korea_won',sessionScope.locale)}</span></td>
			                                    <td class="lis-font-w"><span><fmt:formatNumber value="${paymentList.payment_order_quantity}" groupingUsed="true" /></span></td>
			                                    <td class="lis-font-w" rowspan="${fn:length(map.value)}"><span><fmt:formatNumber value="${paymentList.payment}" groupingUsed="true" /></span><span>${afn:getMessage('korea_won',sessionScope.locale)}</span></td>
			                                    <td class="pointer">
		                                            <p class="lis-font-w ">${paymentList.payment_status_name}</p>
		                                            <div class="lis-txt-box lis-txt-box1-2">
		                                                <a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}"><span>${afn:getMessage('order_detail',sessionScope.locale)}</span></a>
		                                            </div>
		                                            <c:if test="${paymentList.payment_status eq 'R' || paymentList.payment_status eq 'S'}">
		                                                <div class="lis-txt-box lis-txt-box1-3">
		                                                    <a href="#" id="SearchDelivery" class="click-span" data-id="${paymentList.no}">${afn:getMessage('delivery_check',sessionScope.locale)}</a>
		                                                </div>
		                                            </c:if>
													
													<c:if test="${paymentList.payment_status == 'O' || paymentList.payment_status eq 'S'}">
		                                            <div class="lis-txt-box lis-txt-box1-4">
		                                            	<c:if test="${paymentList.review_id == null}">
		                                                <a href="#" class="review-write" data-id="${paymentList.no}"><span>${afn:getMessage('review_writing',sessionScope.locale)}</span></a>
		                                                </c:if>
		                                                <c:if test="${paymentList.review_id != null}">
		                                                <a href="/MyPage/Reviews"><span>${afn:getMessage('review_reading',sessionScope.locale)}</span></a>
		                                                </c:if>
		                                            </div>
		                                            </c:if>
		
		                                            <c:if test="${paymentList.payment_status == 'C'}">
		                                                <c:if test="${fn:startsWith(paymentList.order_no, 'PD')}">
		                                                    <div class="lis-txt-box lis-txt-box1-4 txt-color1">
		                                                        <a href="#" onclick="location.href='/product/productPayment?order_no=${paymentList.order_no}'"><span>${afn:getMessage('reordering',sessionScope.locale)}</span></a>
		                                                    </div>
		                                                </c:if>
		                                                <c:if test="${fn:startsWith(paymentList.order_no, 'PO')}">
		                                                    <div class="lis-txt-box lis-txt-box1-4 txt-color1">
		                                                        <a href="#" onclick="location.href='/product/productPaymentCart?order_no=${paymentList.order_no}'"><span>${afn:getMessage('partial_cancellation',sessionScope.locale)}</span></a>
		                                                    </div>
		                                                </c:if>
		                                            </c:if>
		                                        </td>
			                                </tr>
			                            </c:if>
			                            <c:if test="${status.index != 0}">
				                            <tr>
			                                    <td class="my-lis-2">
			                                        <a href="/product/productDetail?product_cd=${paymentList.product_cd}">
			                                            <div style="width: 22%;height: 90px;background: url(${paymentList.file_1}) no-repeat center / cover;"></div>
			                                            <div class="my-lis-txt">
			                                                <%-- <p>${paymentList.product_made_company_name}</p> --%>
			                                                <p class="lis-font-w">${paymentList.product_name} <c:if test="${not empty paymentList.option_name}"> / ${paymentList.option_name}</c:if></p>
			                                                <%-- <p>${paymentList.product_model}</p> --%>
			                                            </div>
			                                        </a>
			                                    </td>
			                                    <td class="lis-font-w"><span><fmt:formatNumber value="${paymentList.product_payment}" groupingUsed="true" /><fmt:formatNumber value="${paymentList.giveaway_payment}" groupingUsed="true" /></span><span>${afn:getMessage('korea_won',sessionScope.locale)}</span></td>
			                                    <td class="lis-font-w"><span><fmt:formatNumber value="${paymentList.payment_order_quantity}" groupingUsed="true" /></span></td>
			                                    <td class="pointer">
		                                            <p class="lis-font-w ">${paymentList.payment_status_name}</p>
		                                            <div class="lis-txt-box lis-txt-box1-2">
		                                                <a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}"><span>${afn:getMessage('order_detail',sessionScope.locale)}</span></a>
		                                            </div>
		                                            <c:if test="${paymentList.payment_status eq 'R' || paymentList.payment_status eq 'S'}">
		                                                <div class="lis-txt-box lis-txt-box1-3">
		                                                    <a href="#" id="SearchDelivery" class="click-span" data-id="${paymentList.no}">${afn:getMessage('delivery_check',sessionScope.locale)}</a>
		                                                </div>
		                                            </c:if>
													
													<c:if test="${paymentList.payment_status == 'O' || paymentList.payment_status eq 'S'}">
		                                            <div class="lis-txt-box lis-txt-box1-4">
		                                            	<c:if test="${paymentList.review_id == null}">
		                                                <a href="#" class="review-write" data-id="${paymentList.no}"><span>${afn:getMessage('review_writing',sessionScope.locale)}</span></a>
		                                                </c:if>
		                                                <c:if test="${paymentList.review_id != null}">
		                                                <a href="/MyPage/Reviews"><span>${afn:getMessage('review_reading',sessionScope.locale)}</span></a>
		                                                </c:if>
		                                            </div>
		                                            </c:if>
		
		                                            <c:if test="${paymentList.payment_status == 'C'}">
		                                                <c:if test="${fn:startsWith(paymentList.order_no, 'PD')}">
		                                                    <div class="lis-txt-box lis-txt-box1-4 txt-color1">
		                                                        <a href="#" onclick="location.href='/product/productPayment?order_no=${paymentList.order_no}'"><span>${afn:getMessage('reordering',sessionScope.locale)}</span></a>
		                                                    </div>
		                                                </c:if>
		                                                <c:if test="${fn:startsWith(paymentList.order_no, 'PO')}">
		                                                    <div class="lis-txt-box lis-txt-box1-4 txt-color1">
		                                                        <a href="#" onclick="location.href='/product/productPaymentCart?order_no=${paymentList.order_no}'"><span>${afn:getMessage('partial_cancellation',sessionScope.locale)}</span></a>
		                                                    </div>
		                                                </c:if>
		                                            </c:if>
		                                        </td>
			                                </tr>
			                            </c:if>
	                            	</c:forEach> 
	                            </c:forEach>
	                        </c:if>
	                        <c:if test="${empty paymentList}">
	                            <tr>
	                                <td colspan="8">${afn:getMessage('msg.none_content',sessionScope.locale)}</td>
	                            </tr>
	                        </c:if>
                            </tbody>
                        </table>

                            <jsp:include page="/WEB-INF/views/common/pagingforSubmitList.jsp" />
                            <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">

                    </div>
                </div>
                </form>
            </div>
        </main>
    </div>
</div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
<script>
$('#ex-order').on("click",function () {
    var formData = $('#defaultForm').serialize();
    var alertType;
    var showText;

    jQuery.ajax({
        type: 'POST',
        enctype: 'multipart/form-data',
        data: formData,
        processData: false, // 필수
        contentType: false, // 필수
        url:'/Manager/productCategoryDisplayProc',
        success: function (data) {
            console.log(data.validateError)
            if (data.validateError) {
                $('.validateError').empty();
                
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + " "+getMessageAjax('is')+" " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
                // loginAuth(data.access_token);
                location.href=data.redirectUrl;
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});
</script>