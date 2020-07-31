<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 7:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box clearfix">
       <main>
            <c:import url="/layout/scrollRight"/>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <%--                <%@ include file="/WEB-INF/views/layout/MyPageRightHeader.jsp" %>--%>
                <c:import url="/MyPage/RightHeader"/>
                    <%--<div class="r-input-box">
                        <p class="r-in-p1">공유현황</p>
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
                    </div>--%>
                    <div class="con on" id="con1" style="margin-top: 45px;">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <p class="txt-tit">${afn:getMessage('shared_product',sessionScope.locale)}</p>
                                <p class="mor-a">
<%--                                    <a href="">더보기 ></a>--%>
                                </p>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
<%--                                    <col style="width: 160px;">--%>
                                    <col style="width: 600px;">
                                    <col style="width: 200px;">
                                    <col style="width: 200px;">
                                </colgroup>
                                <thead class="lis-head">
                                    <tr>
<%--                                        <th>번호</th>--%>
                                        <th>${afn:getMessage('product_information',sessionScope.locale)}</th>
                                        <th>${afn:getMessage('shared_date',sessionScope.locale)}</th>
                                        <th>${afn:getMessage('shared_sns',sessionScope.locale)}</th>
                                    </tr>
                                </thead>
                                <tbody class="lis-body">
                                    <c:if test="${not empty list}">
                                    <c:forEach var="list" items="${list}">
                                    <tr>
                                        <%--<td class="my-lis-1">
                                            <p>${list.no}</p>
                                        </td>--%>
                                        <td class="my-lis-2">
                                            <c:if test="${not empty list.giveaway_id}">
                                                <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id="/>${list.giveaway_id}">
                                            </c:if>
                                            <c:if test="${not empty list.product_cd}">
                                                <a href="<c:url value="/product/productDetail?product_cd="/>${list.product_cd}">
                                            </c:if>
                                                <div class="my-lis-img1" style="width: 22%;height: 90px;background: url(${list.file_1}) no-repeat center / cover;"></div>
                                                <div class="my-lis-txt">
                                                    <p class="lis-font-w">${list.product_name}</p>
			                                    </div>
                                            </a>
                                        </td>
                                        <td class="lis-font-w"><span><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></span></td>
                                        <td class="lis-font-w"><span>${list.type}</span></td>
                                    </tr>
                                    </c:forEach>
                                    </c:if>

                                    <c:if test="${empty list}">
                                        <tr>
                                            <td colspan="8">${afn:getMessage('msg.none_content',sessionScope.locale)}</td>
                                        </tr>
                                    </c:if>

                                </tbody>
                            </table>
                            <form id="form1" name="form1"  method="get">
	                            <jsp:include page="/WEB-INF/views/common/pagingforSubmitList.jsp" />
	                            <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                            </form>
                        </div>
                    </div>
                </div>
            </main>

    </div>
</div>

<c:import url="/layout/footer"/>