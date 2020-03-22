<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-title">
            <h2>이용 설정 안내</h2>
        </div>
        <%--        <a href="index.html" class="goback clearfix">이전 페이지</a>--%>
        <div class="join-form-box">
            <form id="defaultForm" name="defaultForm" method="POST">
                <input type="hidden" name="market_config_code" value="info-change">
                <ul class="info-tab clearfix">
                    <li><a href="/Manager/info-join" >회원가입 이용약관</a></li>
                    <li><a href="/Manager/info-order">주문안내</a></li>
                    <li><a href="/Manager/info-pay">결제안내</a></li>
                    <li><a href="/Manager/info-service">배송안내</a></li>
                    <li><a href="/Manager/info-refund">교환/반품안내</a></li>
                    <li><a href="/Manager/info-change" class="active">환불안내</a></li>
                    <li><a href="/Manager/info-point">적립금 및 포인트 안내</a></li>
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
