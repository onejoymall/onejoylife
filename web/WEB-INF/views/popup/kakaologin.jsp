<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-02-17
  Time: 오후 6:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
${data}
<script>
    close();
    <c:if test="${not empty sessionScope.RefererUrl}">
        opener.location.href = '${sessionScope.RefererUrl}';
    </c:if>
    <c:if test="${empty sessionScope.RefererUrl}">
    opener.location.href = '/';
    </c:if>
</script>