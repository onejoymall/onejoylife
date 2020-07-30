<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-31
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <h3>이벤트</h3>

            <c:if test="${not empty categoryRowData.file_link3 and categoryRowData.pd_category_event_use_yn eq 'Y' || not empty categoryRowData.file_link5 and categoryRowData.event_use_yn eq 'Y'}">
            <section class="main-section">
                <h2 class="main-section-title hide">main section</h2>
                <article class="main-slider">
                    <h3 class="main-slider-title hide">main slider</h3>
                    <div class="main-slider-inner">
                        <ul class="main-slider-wrap">
                            <c:if test="${not empty categoryRowData.file_link3 and categoryRowData.pd_category_event_use_yn eq 'Y'}">
                                <li id="main-slide-1"><a href="#" style="background: url(${categoryRowData.file_link3}) no-repeat center / contain !important;"></a></li>
                            </c:if>

                            <c:if test="${not empty categoryRowData.file_link5 and categoryRowData.event_use_yn eq 'Y'}">
                                <li id="main-slide-1"><a href="#" style="background:url(${categoryRowData.file_link5}) no-repeat center / contain !important;"></a></li>
                            </c:if>
                        </ul>
                    </div>
                </article>
            </section>
            </c:if>
<%--            <p class="gift-amount">이벤트 전체 카테고리에 <span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span>개의 상품이 등록되어 있습니다.</p>--%>

            <form id="form1" name="form1"  method="get">
                <div class="point-product-list">
                <div class="row clearfix">
                    <c:if test="${not empty eventList}">
                        <c:forEach var="eventList" items="${eventList}" varStatus="status">
                        <c:set var="lineCut" value="${status.count%4}"></c:set>
                        <div class="point-product-item">
                            <a href="/product?product_ct=${eventList.pd_category_id}">
                                <div class="img-out">
                                    <img src="${eventList.file_link5}" />
                                </div>
                                <p class="point-pdt-title">${eventList.event_title}</p>
                            </a>
                        </div>
                        <c:if test="${lineCut  == 0}">
                </div>
                        <div class="row clearfix">
            </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${empty eventList}">
            ${afn:getMessage("msg.none_content",sessionScope.locale)}
        </c:if>
            </div>
        </div>

                <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
<%--                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">--%>
            </form>
    </article>
</section>
<script>
    $('.order-select').on("change",function () {
        $('#form1').submit();
    })
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>