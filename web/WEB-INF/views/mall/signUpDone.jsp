<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="mem-box">
        <div class="h2-box"><h2><span>ONEJOY</span>life 회원가입</h2></div>
        <div class="txt-box">
            <h2>회원가입이 완료되었습니다.</h2>
            <p><span class="mem-name"></span> ONEJOYlife 회원가입을 축하합니다.</p>
            <p>원조이몰에서 즐겁게 구입하시고 E-POINT의 특별한 혜택도 함께 누려보세요.</p>
            <div class="login-box">
                <a href="<c:url value="/sign/login"/>">로그인</a>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
