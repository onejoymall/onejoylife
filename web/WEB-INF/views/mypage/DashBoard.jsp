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
                <div class="r-sec3">
                    <div class="sec3-in">
                        <div class="sec3-box1">배송현황</div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon1"></div>
                            <p>주문접수<span>(${paymentCnt.mCnt})</span></p>
                        </div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon2"></div>
                            <p>결제완료<span>(${paymentCnt.wCnt})</span></p>
                        </div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon3"></div>
                            <p>상품준비중<span>(${paymentCnt.iCnt})</span></p>
                        </div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon4"></div>
                            <p>배송중<span>(${paymentCnt.rCnt})</span></p>
                        </div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon5"></div>
                            <p>배송완료<span>(${paymentCnt.oCnt})</span></p>
                        </div>
                    </div>
                </div>
                <div class="r-sec4">
                    <div class="sec4-txt">
                        <p class="txt-tit">최근 구매내역<span>최근주문3건(1개월내)</span></p>
                        <p class="mor-a">
                            <a href="mypage-6.html">더보기 ></a>
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
                                        <p><a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}">${paymentList.order_no}</a></p>
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

                                        <p class="lis-font-w ">${paymentList.payment_status_name}</p>

                                        <div class="lis-txt-box lis-txt-box1-2">
                                            <a href="/MyPage/OrderAndDeliveryDetail?order_no=${paymentList.order_no}"><span>주문상세</span></a>
                                        </div>
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
<%--                                        <c:if test="${paymentList.payment_status eq 'R'}">--%>
<%--                                            <div class="lis-txt-box">--%>
<%--                                                <a href="#" id="SearchDelivery" class="click-span" data-id="${paymentList.order_no}">배송조회</a>--%>
<%--                                            </div>--%>
<%--                                            <div class="lis-txt-box">--%>
<%--                                                <a href="/MyPage/OrderChange?order_no=${paymentDetail.order_no}" class="click-span">교환신청 하기</a>--%>
<%--                                            </div>--%>
<%--                                            <div class="lis-txt-box">--%>
<%--                                                <a href="/MyPage/OrderRollback?order_no=${paymentDetail.order_no}" class="click-span">반품신청 하기</a>--%>
<%--                                            </div>--%>
<%--                                        </c:if>--%>
                                        <c:if test="${paymentList.payment_status eq 'P'}">
                                        <div class="lis-txt-box lis-txt-box1-4">
                                            <span>상품평작성</span>
                                        </div>
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
                </div>
                <div class="r-sec5">
                    <div class="sec5-txt">
                        <p class="txt-tit">경품 참여 내역</p>
                        <p class="mor-a"><a href="/MyPage/GiveawayWinningList">더보기 ></a></p>
                    </div>
                    <table>
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 630px;">
                            <col style="width: 120px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>참여일</th>
                            <th>이벤트명</th>
                            <th>진행상태</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body2">
                        <c:if test="${not empty giveawayList}">
                            <c:forEach var="giveawayList" items="${giveawayList}" varStatus="status">
                                <tr>
                                    <td>
                                        <p><fmt:formatDate value="${giveawayList.reg_date}" pattern="yyyy.MM.dd"/><br><fmt:formatDate value="${giveawayList.reg_date}" pattern="HH:mm"/></p>
                                    </td>
                                    <td>
                                        <a href="/giveaway/giveawaydetail?giveaway_cd=${giveawayList.giveaway_cd}">
                                            <p>${giveawayList.giveaway_name}</p>
                                        </a>
                                    </td>
                                    <td>
                                    <c:if test="${empty giveawayList.giveaway_winner_reg_date && empty giveawayList.winner_id}">
                                        <span>진행중</span><br>
                                    </c:if>
                                    <c:if test="${not empty giveawayList.giveaway_winner_reg_date && empty giveawayList.winner_id}">
                                        <span>추첨완료</span><br>
                                        <span class="txt-s">(<fmt:formatDate value="${giveawayList.giveaway_winner_reg_date}" pattern="yyyy.MM.dd"/>)</span>
                                    </c:if>
                                    <c:if test="${not empty giveawayList.giveaway_winner_reg_date && giveawayList.winner_id > 0}">
                                        <div class="win-icon"></div>
                                        <p class="txt-s">
                                            <span>(<fmt:formatDate value="${giveawayList.giveaway_winner_reg_date}" pattern="yyyy.MM.dd"/>)</span>
                                        </p>
                                    </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty giveawayList}">
                            <tr>
                                <td colspan="5">표시할 내용이 없습니다.</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <table class="dis-none1">
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 630px;">
                            <col style="width: 120px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>참여일</th>
                            <th>이벤트명</th>
                            <th>진행상태</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body3">
                        <tr>
                            <td colspan="3">3개월동안 응모하신 경품이 없습니다.</td>
                            <td></td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="r-sec6 hide">
                    <div class="sec6-txt">
                        <p class="txt-tit">나의 상품 Q&A</p>
                        <p class="mor-a"><a href="#">더보기 ></a></p>
                    </div>
                    <table>
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 630px;">
                            <col style="width: 120px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>작성일</th>
                            <th>제목</th>
                            <th>답변상태</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body2">
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td>답변대기</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">답변완료</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">답변완료</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">답변완료</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">답변완료</td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="dis-none1">
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 630px;">
                            <col style="width: 120px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>작성일</th>
                            <th>제목</th>
                            <th>답변상태</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body3">
                        <tr>
                            <td colspan="3">등록하신 상품 Q&A가 없습니다.</td>
                            <td></td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
        </main>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
