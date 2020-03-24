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
<%@ include file="/WEB-INF/views/layout/header.jsp" %>'
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <c:import url="/MyPage/RightHeader"/>

                <div class="r-input-box">
                    <p class="r-in-p1">주문현황</p>
                    <div class="r-in-box">
                        <div class="input-box1">
                            <p class="ra-num on" data-id="con1">오늘</p>
                            <p class="ra-num" data-id="con2">1주일</p>
                            <p class="ra-num" data-id="con3">1개월</p>
                            <p class="ra-num" data-id="con4">3개월</p>
                        </div>
                        <div class="input-box2">
                            <div class="cla">
                                <input type="text" id="from_date" class="date_pick">
                                <div class="cla-img1"></div>
                            </div>
                            <p class="cla-p1"> ~ </p>
                            <div class="cla">
                                <input type="text" id="to_date" class="date_pick">
                                <div class="cla-img1"></div>
                            </div>
                            <p class="cla-p2"><a href="">조회</a></p>
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
                                <th>주문일/주문번호</th>
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
                                            <p><a href="">${paymentList.order_no}</a></p>
                                        </td>
                                        <td class="my-lis-2">
                                            <a href="/product/productDetail?product_cd=${paymentList.product_cd}">
                                                <div style="width: 22%;height: 90px;background: url(${paymentList.file_1}) no-repeat center / cover;"></div>
                                                <div class="my-lis-txt">
                                                    <p>${paymentList.product_made_company_name}</p>
                                                    <p class="lis-font-w">${paymentList.product_name}</p>
                                                    <p>${paymentList.product_model}</p>
                                                </div>
                                            </a>
                                        </td>
                                        <td class="lis-font-w"><span><fmt:formatNumber value="${paymentList.product_payment}" groupingUsed="true" /></span><span>원</span></td>
                                        <td class="lis-font-w"><span>1</span></td>
                                        <td class="lis-font-w"><span><fmt:formatNumber value="${paymentList.payment}" groupingUsed="true" /></span><span>원</span></td>
                                        <td class="pointer">
                                            <p class="lis-font-w dis-none">주문접수</p>
                                            <p class="lis-font-w ">결제완료</p>
                                            <p class="lis-font-w dis-none">상품준비중</p>
                                            <p class="lis-font-w dis-none">배송중</p>
                                            <p class="lis-font-w dis-none">배송완료</p>
                                            <div class="lis-txt-box lis-txt-box1-1 dis-none">
                                                <span>결제하기</span>
                                            </div>
                                            <div class="lis-txt-box lis-txt-box1-2">
                                                <a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}"><span>주문상세</span></a>
                                            </div>
                                            <div class="lis-txt-box lis-txt-box1-3 dis-none">
                                                <a href="mypage-6-mo1.html" target="_blank" class="click-span">배송조회</a>
                                            </div>
                                            <div class="lis-txt-box lis-txt-box1-4 dis-none">
                                                <span>상품평작성</span>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty list}">
                                <tr>
                                    <td colspan="6">표시할 내용이 없습니다.</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <form id="form1" name="form1"  method="post">
                            <jsp:include page="/WEB-INF/views/common/pagingforSubmitList.jsp" />
                            <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                        </form>
                    </div>
                    <!--
                    <div class="r-sec5">
                        <div class="sec5-txt">
                            <p class="txt-tit">티켓/할인권</p>
                            <p class="mor-a">
                                <a href="">더보기 ></a>
                            </p>
                        </div>
                        <table class="sec5-lis">
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
                                <th>주문일/주문번호</th>
                                <th>상품정보</th>
                                <th>상품금액</th>
                                <th>수량</th>
                                <th>주문금액</th>
                                <th>관리</th>
                            </tr>
                            </thead>
                            <tbody class="lis-body">
                            <tr>
                                <td class="my-lis-1">
                                    <p>2019.04.10</p>
                                    <p><a href="">123456789121</a></p>
                                </td>
                                <td class="my-lis-2">
                                    <a href="">
                                        <div class="my-lis-img2"></div>
                                        <div class="my-lis-txt1">
                                            <p>덕수궁 달빛산책</p>
                                            <p>관람일 : 2019.04.20 (토) ~ 2019.05.30 (목)</p>
                                        </div>
                                    </a>
                                </td>
                                <td class="lis-font-w1"><span>3,099,000</span><span>원</span></td>
                                <td class="lis-font-w1"><span>2</span></td>
                                <td class="lis-font-w1"><span>3,099,000</span><span>원</span></td>
                                <td class="pointer">
                                    <div class="lis-txt-box1">
                                        <span>티켓출력</span>
                                    </div>
                                    <div class="lis-txt-box2">
                                        <span>문자발송</span>
                                    </div>
                                    <div class="lis-txt-box3">
                                        <span>상품평작성</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="my-lis-1">
                                    <p>2019.04.10</p>
                                    <p><a href="">123456789121</a></p>
                                </td>
                                <td class="my-lis-2">
                                    <a href="">
                                        <div class="my-lis-img2"></div>
                                        <div class="my-lis-txt1">
                                            <p>브라운</p>
                                            <p>관람일 : 2019.04.20 (토)</p>
                                        </div>
                                    </a>
                                </td>
                                <td class="lis-font-w1"><span>3,099,000</span><span>원</span></td>
                                <td class="lis-font-w1"><span>2</span></td>
                                <td class="lis-font-w1"><span>3,099,000</span><span>원</span></td>
                                <td class="pointer">
                                    <div class="lis-txt-box1">
                                        <span>티켓출력</span>
                                    </div>
                                    <div class="lis-txt-box2">
                                        <span>문자발송</span>
                                    </div>
                                    <div class="lis-txt-box3">
                                        <span>상품평작성</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="my-lis-1">
                                    <p>2019.04.10</p>
                                    <p><a href="">123456789121</a></p>
                                </td>
                                <td class="my-lis-2">
                                    <a href="">
                                        <div class="my-lis-img2"></div>
                                        <div class="my-lis-txt1">
                                            <p>브라운</p>
                                            <p>관람일 : 2019.04.20 (토) 까지</p>
                                        </div>
                                    </a>
                                </td>
                                <td class="lis-font-w1"><span>3,099,000</span><span>원</span></td>
                                <td class="lis-font-w1"><span>2</span></td>
                                <td class="lis-font-w1"><span>3,099,000</span><span>원</span></td>
                                <td class="pointer">
                                    <div class="lis-txt-box1">
                                        <span>티켓출력</span>
                                    </div>
                                    <div class="lis-txt-box2">
                                        <span>문자발송</span>
                                    </div>
                                    <div class="lis-txt-box3">
                                        <span>상품평작성</span>
                                    </div>
                                </td>
                            </tr>
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
                    -->
                </div>
            </div>
        </main>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>