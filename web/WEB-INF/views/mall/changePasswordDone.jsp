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
    <div class="login-box">
        <div class="path">
            <ul>
                <li class="path-color">ㆍ</li>
                <li><a href="#">HOME ＞</a></li>
                <li><a href="#"> ${afn:getMessage("idPwdFind",sessionScope.locale)}</a></li>
            </ul>
        </div>
        <div class="h2-box">
            <h2>${afn:getMessage("idPwdFind",sessionScope.locale)}</h2>
            <p>${afn:getMessage("msg.finduserinfo.findTxt",sessionScope.locale)}</p>
        </div>
        <form action="" method="POST">
            <div class="tab-box">
                <input type="radio" name="rd" id="rd1" class="rd-box" <c:if test="${not empty id}">checked</c:if>>
                <label for="rd">${afn:getMessage("searchIdEmail",sessionScope.locale)}</label>
                <input type="radio" name="rd" id="rd2" class="rd-box" <c:if test="${empty id}">checked</c:if>>
                <label for="rd">${afn:getMessage("searchPswd",sessionScope.locale)}</label>
                <div class="for-id">
                    <div class="box-in">
                        <p class="tit-id">${afn:getMessage("msg.changePwdDone.resultId",sessionScope.locale)} <span>${id}</span> ${afn:getMessage("msg.changePwdDone.is",sessionScope.locale)}</p>
                        <div class="but-type2">
                            <a href="<c:url value="/sign/login"/>" class="but-1" id="redirectLogin">${afn:getMessage("login",sessionScope.locale)}</a>
                        </div>
                    </div>
                </div>
                <div class="for-pw">
                    <div class="box-in">
                        <p class="tit-id">${afn:getMessage("msg.changePwdDone.successMent",sessionScope.locale)}</p>
                        <div class="but-type2">
                            <a href="<c:url value="/sign/login"/>" class="but-1" id="redirectLogin">${afn:getMessage("login",sessionScope.locale)}</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
