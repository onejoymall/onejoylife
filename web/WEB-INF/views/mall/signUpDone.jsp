<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="mem-box">
        <div class="h2-box"><h2><span>ONEJOY</span>life ${afn:getMessage("join",sessionScope.locale)}</h2></div>
        <div class="txt-box">
            <h2>${afn:getMessage("msg.signupDone.successJoin",sessionScope.locale)}</h2>
            <p><span class="mem-name"></span> ONEJOYlife ${afn:getMessage("msg.signupDone.joinCong",sessionScope.locale)}</p>
            <p>${afn:getMessage("msg.signupDone.enjoyMsg",sessionScope.locale)}</p>
            <div class="login-box">
                <a href="<c:url value="/sign/login"/>">${afn:getMessage("login",sessionScope.locale)}</a>
            </div>
        </div>
    </div>
</div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>