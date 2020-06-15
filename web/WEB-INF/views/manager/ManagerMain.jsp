<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-title clearfix">
            <h3>오늘 매출 현황</h3>
            <span class="desc">(<fmt:formatDate value="${today}" pattern="MM월 dd일 HH:mm"/> 기준)</span>
        </div>
        <div class="main-content-sales clearfix">
            <a href="/Manager/order?start_date=<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"/>" class="content-sales item">
                <span class="item-icon"></span>
                <span class="content-item-text">
                        <strong class="item-tit">
                        주문<span class="item-count">(<fmt:formatNumber type="number" maxFractionDigits="3" value="${todaySummary.orderCnt}" /> 건)</span>
                        </strong>
                        <span class="item-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${todaySummary.orderTotal}" /></strong>
                            <span class="data-unit">원</span>
                        </span>
                    </span>
            </a>
            <a href="/Manager/order?payment_status=W&start_date=<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"/>" class="content-sales pay">
                <span class="pay-icon"></span>
                <span class="content-item-text">
                        <strong class="item-tit">
                        결제<span class="item-count">(<fmt:formatNumber type="number" maxFractionDigits="3" value="${todaySummary.payCnt}" /> 건)</span>
                        </strong>
                        <span class="item-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${todaySummary.payTotal}" /></strong>
                            <span class="data-unit">원</span>
                        </span>
                    </span>
            </a>
            <a href="/Manager/returned?start_date=<fmt:formatDate value="${today}" pattern="YYYY-MM-dd"/>" class="content-sales refund">
                <span class="refund-icon"></span>
                <span class="content-item-text">
                        <strong class="item-tit">
                        환불<span class="item-count">(<fmt:formatNumber type="number" maxFractionDigits="3" value="${todaySummary.refundCnt}" /> 건)</span>
                        </strong>
                        <span class="item-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${todaySummary.refundTotal}" /></strong>
                            <span class="data-unit">원</span>
                        </span>
                    </span>
            </a>
        </div>
        <div class="main-title clearfix">
        <%
        Calendar mon = Calendar.getInstance();
        mon.add(Calendar.MONTH , -1);
        %>
        	<c:set var="lastMonth" value="<%=mon.getTime()%>"/>
            <h3>주문 현황</h3>
            <span class="desc">(최근 1개월 기준)</span>
        </div>
        <div class="main-content-section clearfix">
            <div class="status">
                <a href="/Manager/order?start_date=<fmt:formatDate value="${lastMonth}" pattern="YYYY-MM-dd"/>&payment_status=M" class="content-status order">
                        <span class="order-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lastMonthSummary.mCnt}" /></strong>
                            <span class="data-unit">입금전</span>
                        </span>
                </a>
            </div>
            <div class="status">
                <a href="/Manager/order?start_date=<fmt:formatDate value="${lastMonth}" pattern="YYYY-MM-dd"/>&payment_status=D" class="content-status order">
                        <span class="order-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lastMonthSummary.dCnt}" /></strong>
                            <span class="data-unit">배송준비중</span>
                        </span>
                </a>
            </div>
            <div class="status">
                <a href="/Manager/order?start_date=<fmt:formatDate value="${lastMonth}" pattern="YYYY-MM-dd"/>&payment_status=R" class="content-status order">
                        <span class="order-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lastMonthSummary.rCnt}" /></strong>
                            <span class="data-unit">배송중</span>
                        </span>
                </a>
            </div>
            <div class="status">
                <a href="/Manager/order?start_date=<fmt:formatDate value="${lastMonth}" pattern="YYYY-MM-dd"/>&payment_status=O" class="content-status order">
                        <span class="order-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lastMonthSummary.oCnt}" /></strong>
                            <span class="data-unit">배송완료</span>
                        </span>
                </a>
            </div>
        </div>
        <div class="main-title clearfix">
            <h3>취소 / 교환 / 반품 / 환불현황</h3>
            <span class="desc">(최근 1개월 기준)</span>
        </div>
        <div class="main-content-section clearfix">
            <div class="status">
                <a href="/Manager/order?start_date=<fmt:formatDate value="${lastMonth}" pattern="YYYY-MM-dd"/>&payment_status=C" class="content-status cs">
                        <span class="order-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lastMonthSummary.cCnt}" /></strong>
                            <span class="data-unit">취소</span>
                        </span>
                </a>
            </div>
            <div class="status">
                <a href="/Manager/order?start_date=<fmt:formatDate value="${lastMonth}" pattern="YYYY-MM-dd"/>&payment_status=S" class="content-status cs">
                        <span class="order-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lastMonthSummary.sCnt}" /></strong>
                            <span class="data-unit">교환</span>
                        </span>
                </a>
            </div>
            <div class="status">
                <a href="/Manager/order?start_date=<fmt:formatDate value="${lastMonth}" pattern="YYYY-MM-dd"/>&payment_status=H" class="content-status cs">
                        <span class="order-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lastMonthSummary.hCnt}" /></strong>
                            <span class="data-unit">반품</span>
                        </span>
                </a>
            </div>
            <div class="status">
                <a href="/Manager/order?start_date=<fmt:formatDate value="${lastMonth}" pattern="YYYY-MM-dd"/>&payment_status=G" class="content-status cs">
                        <span class="order-data">
                            <strong class="data-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${lastMonthSummary.gCnt}" /></strong>
                            <span class="data-unit">환불</span>
                        </span>
                </a>
            </div>
        </div>
        <div class="more-section clearfix">
            <div class="notice-section clearfix">
                <ul class="notice-section-ul clearfix">
                    <li class="ul-tab on" data-tab="tab-li1">공지사항 게시판</li>
                    <li class="ul-tab" data-tab="tab-li2">1:1 문의</li>
                </ul>
                <div class="ul-tab-box on" id="tab-li1">
                    <div class="ul-tab1-nodata nodata-none">
                        <p>최근 판매된 상품이 없습니다.</p>
                    </div>
                    <ul class="content-section-ul">
                        <c:if test="${not empty noticeListView}">
                            <c:forEach var="noticeListView" items="${noticeListView}" varStatus="status">
                                <li><a href="/Manager/boardRead?brdno=${noticeListView.brdno}" class="font-weight">${noticeListView.brdtitle}</a><span class="new-icon">new</span><span class="new-date">${noticeListView.brddate}</span></li>
                            </c:forEach>
                        </c:if>
<%--                        <li><a href="#" class="font-weight">[필독]  원조이라이프 2월 오프라인 창업 교육 취소</a><span class="new-icon">new</span><span class="new-date">2020.02.10</span></li>--%>

                    </ul>
                    <a href="/Manager/boardList?bgno=9" class="tab-more">더보기 ></a>
                </div>
                <div class="ul-tab-box" id="tab-li2">
                    <div class="ul-tab1-nodata nodata-none">
                        <p>최근 판매된 상품이 없습니다.</p>
                    </div>
                    <ul class="content-section-ul">
                        <c:if test="${not empty listOneOne}">
                            <c:forEach var="listOneOne" items="${listOneOne}" varStatus="status">
                                <li><a href="/Manager/boardRead?brdno=${listOneOne.brdno}" class="font-weight">${listOneOne.brdtitle}</a><span class="new-icon">new</span><span class="new-date">${listOneOne.brddate}</span></li>
                            </c:forEach>
                        </c:if>
<%--                        <li><a href="#" class="font-weight">[필독]  1:1 문의하기</a><span class="new-icon">new</span><span class="new-date">2020.02.10</span></li>--%>

                    </ul>
                    <a href="/Manager/boardList?bgno=15" class="tab-more">더보기 ></a>
                </div>
            </div>
            <div class="setting-section">
                <a href="/Manager/info-join" class="setting info">
                    이용약관 설정
                </a>
                <a href="#" class="setting epoint">
                    Epoint 설정
                </a>
                <a href="/Manager/Delivery" class="setting charge">
                    배송비 설정
                </a>
                <a href="#" class="setting service">
                    택배사 관리
                </a>
            </div>
        </div>
    </div>
</main>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
