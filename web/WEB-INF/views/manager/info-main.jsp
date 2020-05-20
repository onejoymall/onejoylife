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
                <input type="hidden" name="market_config_code" value="info-main">
                <ul class="info-tab clearfix">
                    <li><a href="/Manager/info-join" >회원가입</a></li>
                    <li><a href="/Manager/info-order">주문안내</a></li>
                    <li><a href="/Manager/info-pay">결제안내</a></li>
                    <li><a href="/Manager/info-service">배송안내</a></li>
                    <li><a href="/Manager/info-refund"  >교환/반품안내</a></li>
                    <li><a href="/Manager/info-change">환불안내</a></li>
                    <li><a href="/Manager/info-point">적립금 및 포인트 안내</a></li>
                    <li><a href="/Manager/info-main" class="active">이용약관 안내</a></li>
                    <li><a href="/Manager/info-privacy">개인정보처리방침 안내</a></li>
                    <li><a href="/Manager/info-main2">제3자동의 이용약관</a></li>
                    <li><a href="/Manager/info-privacy2">개인정보 수집 및 이용</a></li>
                    <li><a href="/Manager/info-privacy3">개인정보 제공</a></li>
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
