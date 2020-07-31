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
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<main class="clearfix">
    <div class="header-top">
        <p>${afn:getMessage("delivery_check",sessionScope.locale)}</p>
    </div>
    <div class="body-mar">
        <div class="txt-box1">
            <c:forEach var="companyList" items="${companyList}" varStatus="status">
                <c:if test="${companyList.Code eq deliveryInfoVO.delivery_t_code}">
                    <c:set var="t_code_name" value="${companyList.Name}"/>
                </c:if>
            </c:forEach>
            <p>${afn:getMessage("delivery_t_invoice",sessionScope.locale)}<span class="bar"></span><span>${deliveryInfoVO.delivery_t_invoice}</span><span> / <c:out value="${t_code_name}"/></span></p>
<%--            <p>판매자 정보<span class="bar"></span><span>대우전자 </span><span>(1577-1234)</span></p>--%>
        </div>
<%--        <div class="txt-box2 dis-none">--%>
<%--            <h2>배송이 완료되었습니다.</h2>--%>
<%--            <p>배송담당자 : <span>홍길동</span></p>--%>
<%--        </div>--%>
        <table>
            <colgroup>
                <col style="width: 180px;">
                <col style="width: 180px;">
                <col style="width: 140px;">
                <col style="width: 140px;">
            </colgroup>
            <thead>
            <tr class="h-tr">
                <td>${afn:getMessage("disposeDate",sessionScope.locale)}</td>
                <td>${afn:getMessage("locatedArea",sessionScope.locale)}</td>
                <td>${afn:getMessage("cur_status",sessionScope.locale)}</td>
                <td>${afn:getMessage("contact_num",sessionScope.locale)}</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${list.trackingDetails}" varStatus="status">
                <tr class="b-tr">
                    <td>${list.timeString}</td>
                    <td>${list.where}</td>
                    <td>${list.kind}</td>
                    <td>${list.telno}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
