<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">날짜별 매출현황</h2>
            </div>
            <table class="goods-list-tab">
                <colgroup></colgroup>
                <tbody>
                    <tr>
                        <th data-id="/Manager/date-sales" class="list-tab on">일별 매출</th>
                        <th data-id="/Manager/date-sales-week" class="list-tab">주별 매출</th>
                        <th data-id="/Manager/date-sales-month" class="list-tab">월별 매출</th>
                    </tr>
                </tbody>
            </table>
            <div>
                <div class="in-list-tab on" id="tab-on1">
                    <div class="search-form">
                        <form name="" id="" class="listSrcForm1" method="get">
                        	<!-- <div class="keyword-src-wrap">
                                <input type="text" class="keyword-src" name="keyword-src">
                                <button type="button" class="keyword-src-button">검색</button>
                            </div> -->
                            <table class="keyword-src-table">
                                <colgroup>
                                    <col width="80px">
                                    <col width="420px">
                                    <col width="80px">
                                    <col width="420px">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>날짜 지정</th>
                                        <td>
                                            <div class="input-box2 date-input-box">
                                                <div class="cla">
		                                            <input type="text" id="start_date" name="start_date" class="date_pick" value="${param.start_date}">
		                                            <div class="cla-img1"></div>
		                                        </div>
		                                        <p class="cla-p1"> ~ </p>
		                                        <div class="cla">
		                                            <input type="text" id="end_date" name="end_date" class="date_pick" value="${param.end_date}">
		                                            <div class="cla-img1"></div>
		                                        </div>
                                                <button type="submit" class="date-search-btn">검색</button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="goods-list-wrap">
                        <div class="list-box clearfix">
                            <table class="sort-wrap-table1">
                                <colgroup>
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="11%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="11%">
                                    <col width="11%">
                                    <col width="13%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <td rowspan="2">일자</td>
                                        <td colspan="4">결제완료 주문</td>
                                        <td rowspan="2">결제합계</td>
                                        <td rowspan="2">환불합계</td>
                                        <td rowspan="2">순매출</td>
                                    </tr>
                                    <tr>
                                        <td>주문수</td>
                                        <td>품목수</td>
                                        <td>상품구매 금액</td>
                                        <td>할인</td>
                                    </tr>
                                </thead>
                                <tbody>
                            <c:set var = "total1" value = "0" />
                            <c:set var = "total2" value = "0" />
                            <c:set var = "total3" value = "0" />
                            <c:set var = "total4" value = "0" />
                            <c:set var = "total5" value = "0" />
                            <c:set var = "total6" value = "0" />
                            <c:set var = "total7" value = "0" />
                            <c:if test="${not empty list}">
		                        <c:forEach var="list" items="${list}">
			                        <c:set var = "total1" value = "${total1 + list.payment_order_quantity}" />
		                            <c:set var = "total2" value = "${total2 + list.product_count}" />
		                            <c:set var = "total3" value = "${total3 + list.product_user_payment}" />
		                            <c:set var = "total4" value = "${total4 + list.product_discount}" />
		                            <c:set var = "total5" value = "${total5 + (list.product_user_payment - list.product_discount + list.product_delivery_payment)}" />
		                            <c:set var = "total6" value = "${total6 + list.cancel_request_amount}" />
		                            <c:set var = "total7" value = "${total7 + (list.product_user_payment - list.product_discount + list.product_delivery_payment - list.cancel_request_amount)}" />
		                           <tr>
		                                <td>${list.reg_date}</td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.payment_order_quantity}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_count}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_user_payment}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_discount}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_user_payment - list.product_discount + list.product_delivery_payment}" /></td>		                                
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cancel_request_amount}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_user_payment - list.product_discount + list.product_delivery_payment - list.cancel_request_amount}" /></td>
		                            </tr>
		                        </c:forEach>
		                    </c:if>
                                </tbody>
                                <tfoot>
									<tr>
										<td>합계</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total1}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total2}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total3}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total4}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total5}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total6}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total7}" /></td>
									</tr>
                                </tfoot>
                            </table>
                        </div>
                        <form id="form1" name="form1"  method="get">
		                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
		                    <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
		                </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        $(function(){//로드
            $(".list-tab").click(function(){
        		window.location.href = $(this).attr("data-id");
            });
        });
        </script>
    </main>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
