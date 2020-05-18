<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-title">
            <h2>서비스안내</h2>
        </div>
        <%--        <a href="index.html" class="goback clearfix">이전 페이지</a>--%>
        <div class="join-form-box">
            <form id="defaultForm" name="defaultForm" method="POST">
                <input type="hidden" name="market_config_code" value="market-config-partner-live">
                <ul class="info-tab clearfix">
                    <li><a href="/Manager/market-config-partner">상단</a></li>
                    <li><a href="/Manager/market-config-partner-bot" >하단</a></li>
                    <li><a href="/Manager/market-config-partner-live" class="active">라이브쇼핑</a></li>
                </ul>
                <div class="text-editor clearfix">
                    <textarea name="market_config_value" id="summernote">${config.market_config_value}</textarea>
                </div>
                <div class="btn-box">
                    <button type="button" class="save-btn" id ="formSubmit">저장</button>
                </div>
            </form>
        </div>
    </div>
</main>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
