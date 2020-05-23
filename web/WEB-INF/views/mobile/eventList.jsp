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
<c:import url="/mobile/layout/main-header"/>
<div class="mt-1 bg_grey2 clearfix">

    <ul class="mainList-sm2">
        <c:if test="${not empty eventList}">
            <c:forEach var="eventList" items="${eventList}" varStatus="status">
                <li>
                    <a href="/product?product_ct=${eventList.pd_category_id}">
                        <div class="img-box"><img src="${eventList.file_link5}" /></div>
                        <p class="event-title">${eventList.event_title}</p>
                    </a>
                </li>
            </c:forEach>
        </c:if>
    </ul>
</div>

<script>
    $('.order-select').on("change",function () {
        $('#form1').submit();
    })
</script>
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>