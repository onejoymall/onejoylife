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
<%@ include file="/WEB-INF/views/layout/header.jsp" %>'
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
                    <p class="r-in-p1">주문현황</p>

                    <div class="r-in-box">
                        <div class="input-box1">
                            <p class="ra-num <c:if test="${param.date_pick_con=='con1'}">on</c:if>" data-id="con1">오늘</p>
                            <p class="ra-num <c:if test="${param.date_pick_con=='con2'}">on</c:if>" data-id="con2">1주일</p>
                            <p class="ra-num <c:if test="${param.date_pick_con=='con3'}">on</c:if>" data-id="con3">1개월</p>
                            <p class="ra-num <c:if test="${param.date_pick_con=='con4'}">on</c:if>" data-id="con4">3개월</p>
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
                            <p class="cla-p2"><a href="#" onclick="$('#form1').submit();">조회</a></p>
                        </div>
                        <div class="input-box3">
                            <select name="payment_status" >
                                <c:if test="${not empty getSelectorList}">
                                    <option value="">주문상태 선택</option>
                                    <c:forEach var="getSelectorList" items="${getSelectorList}" varStatus="status">
                                    <option value="${getSelectorList.code_value}" <c:if test="${getSelectorList.code_value eq param.payment_status}">selected</c:if>>${getSelectorList.code_name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <p class="r-in-p2">조회일자를 설정하시면 최대 3개월 간의 주문내역을 조회하실 수 있습니다.</p>
                </div>
                <div class="con on" id="con1">
                    <div class="r-sec4">
                        <div class="sec4-txt">
                            <p class="txt-tit">주문상품</p>
                            <p class="mor-a">
                                <a href="">더보기 ></a>
                            </p>
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
                                <th>주문일/상점주문번호</th>
                                <th>상품정보</th>
                                <th>상품금액</th>
                                <th>수량</th>
                                <th>주문금액</th>
                                <th>진행상태</th>
                            </tr>
                            </thead>
                            <tbody class="lis-body">
                            <c:if test="${not empty paymentList}">
                                <c:forEach var="paymentList" items="${paymentList}" varStatus="status">
                                    <tr>
                                        <td class="my-lis-1">
                                            <p><fmt:formatDate value="${paymentList.reg_date}" pattern="yyyy.MM.dd"/></p>
                                            <p><a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}">${paymentList.order_no}</a></p>
                                        </td>
                                        <td class="my-lis-2">
                                            <c:if test="${not empty paymentList.giveaway_cd}">
                                                <a href="/giveaway/giveawaydetail?giveaway_id=${paymentList.giveaway_id}">
                                                    <div style="width: 22%;height: 90px;background: url(${paymentList.file_6}) no-repeat center / cover;"></div>
                                                    <div class="my-lis-txt">
                                                        <p>${paymentList.product_made_company_name}</p>
                                                        <p class="lis-font-w">${paymentList.product_name}</p>
<%--                                                        <p>${paymentList.product_model}</p>--%>
                                                    </div>
                                                </a>
                                            </c:if>
                                            <c:if test="${not empty paymentList.product_cd}">
                                                <a href="/product/productDetail?product_cd=${paymentList.product_cd}">
                                                    <div style="width: 22%;height: 90px;background: url(${paymentList.file_1}) no-repeat center / cover;"></div>
                                                    <div class="my-lis-txt">
                                                        <p>${paymentList.product_made_company_name}</p>
                                                        <p class="lis-font-w">${paymentList.product_name}</p>
<%--                                                        <p>${paymentList.product_model}</p>--%>
                                                    </div>
                                                </a>
                                            </c:if>
                                        </td>
                                        <td class="lis-font-w">
                                            <span>
                                                <fmt:formatNumber value="${paymentList.product_payment}" groupingUsed="true" />
                                                <fmt:formatNumber value="${paymentList.giveaway_payment}" groupingUsed="true" />
                                            </span>
                                            <span>원</span>
                                        </td>
                                        <td class="lis-font-w"><span><fmt:formatNumber value="${paymentList.payment_order_quantity}" groupingUsed="true" /></span></td>
                                        <td class="lis-font-w"><span><fmt:formatNumber value="${paymentList.payment}" groupingUsed="true" /></span><span>원</span></td>
                                        <td class="pointer">
                                            <p class="lis-font-w dis-none">주문접수</p>
                                            <p class="lis-font-w ">${paymentList.payment_status_name}</p>
                                            <p class="lis-font-w dis-none">상품준비중</p>
                                            <p class="lis-font-w dis-none">배송중</p>
                                            <p class="lis-font-w dis-none">배송완료</p>
                                            <div class="lis-txt-box lis-txt-box1-1 dis-none">
                                                <span>결제하기</span>
                                            </div>
                                            <div class="lis-txt-box lis-txt-box1-2">
                                                <a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}"><span>주문상세</span></a>
                                            </div>
                                            <c:if test="${paymentList.payment_status eq 'R' || paymentList.payment_status eq 'S'}">
                                                <div class="lis-txt-box lis-txt-box1-3">
                                                    <a href="#" id="SearchDelivery" class="click-span" data-id="${paymentList.order_no}">배송조회</a>
                                                </div>
                                            </c:if>
											
											<c:if test="${paymentList.payment_status == 'O'}">
                                            <div class="lis-txt-box lis-txt-box1-4">
                                            	<c:if test="${paymentList.review_id == null}">
                                                <a href="#" class="review-write" data-id="${paymentList.order_no}"><span>상품평작성</span></a>
                                                </c:if>
                                                <c:if test="${paymentList.review_id != null}">
                                                <a href="/MyPage/Reviews"><span>상품평보기</span></a>
                                                </c:if>
                                            </div>
                                            </c:if>

                                            <c:if test="${paymentList.payment_status == 'C'}">
                                                <c:if test="${fn:startsWith(paymentList.order_no, 'PD')}">
                                                    <div class="lis-txt-box lis-txt-box1-4 txt-color1">
                                                        <a href="#" onclick="location.href='/product/productPayment?order_no=${paymentList.order_no}'"><span>재주문</span></a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${fn:startsWith(paymentList.order_no, 'PO')}">
                                                    <div class="lis-txt-box lis-txt-box1-4 txt-color1">
                                                        <a href="#" onclick="location.href='/product/productPaymentCart?order_no=${paymentList.order_no}'"><span>부분취소</span></a>
                                                    </div>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty paymentList}">
                                <tr>
                                    <td colspan="6">표시할 내용이 없습니다.</td>
                                    <td></td>
                                    <td></td>
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

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>