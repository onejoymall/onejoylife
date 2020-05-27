<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>


    <main>
        <div class="main-content">
            <div class="login-box">
                <div class="box-header">
                    <div class="login-logo"></div>
                    <h2>관리자페이지 로그인 하기</h2>
                </div>
                <form name="defaultForm" id="defaultForm" class="loginForm" method="POST" onsubmit="return false;">
                    <fieldset>
                        <input type="text" id="email" name="email" placeholder="관리자 아이디">
                        <input type="password" id="password" name="password" placeholder="비밀번호">
                        <button type="submit" id="formSubmit">로그인</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </main>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
