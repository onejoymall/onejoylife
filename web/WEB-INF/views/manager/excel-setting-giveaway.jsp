<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-title">
            <h2>엑셀다운로드 항목관리</h2>
        </div>
<%--        <a href="index.html" class="goback clearfix">이전 페이지</a>--%>
        <div class="join-form-box">
            <form id="defaultForm" name="defaultForm" method="POST">
            	<input type="hidden" value="giveaway" name="type_name">
                <input type="hidden" value="경품리스트" name="type_text">
                <ul class="info-tab clearfix">
                    <li><a href="/Manager/excelSettingProduct">상품리스트</a></li>
                    <li><a href="/Manager/excelSettingGiveaway" class="active">경품리스트</a></li>
                    <li><a href="/Manager/excelSettingGiveawayPart">경품참여내역</a></li>
                    <li><a href="/Manager/excelSettingCoupon">쿠폰리스트</a></li>
                    <li><a href="/Manager/excelSettingStore">입점업체리스트</a></li>
                    <li><a href="/Manager/excelSettingOrder">주문내역</a></li>
                    <li><a href="/Manager/excelSettingReturned">교환/반품내역</a></li>
                    <li><a href="/Manager/excelSettingCalculate">정산내역</a></li>
                    <li><a href="/Manager/excelSettingQna">Q&A리스트</a></li>
                    <li><a href="/Manager/excelSettingOnetoone">1:1문의리스트</a></li>
                </ul>
                <div class="text-editor clearfix column_name_div">
                	<div class="menu-depth-all"><input type="checkbox" name="column_name_all"> <b>전체선택</b></div><hr>
                	<c:forEach items="${excel_column_list}" var="list">
                		<div class="menu-depth">
                			<input type="checkbox" name="column_text" class="hidden" value="${list.code_name}" <c:if test="${fn:contains(detail.column_name, list.code_value)}">checked</c:if>>
                			<input type="checkbox" name="column_name" value="${list.code_value}" <c:if test="${fn:contains(detail.column_name, list.code_value)}">checked</c:if>> ${list.code_name}
               			</div>
                	</c:forEach>
                </div>
                <div class="btn-box">
                    <button type="button" class="save-btn" id ="formSubmit">저장</button>
                </div>
            </form>
        </div>
    </div>
</main>
<script type="text/javascript">
$(function(){
	$('input[name=column_name_all]').click(function() {
	  $('.column_name_div input[type=checkbox]').prop('checked',this.checked);
	});
	$('input[name=column_name]').on('input', function(){
		$(this).siblings('input[name=column_text]').prop('checked',this.checked);
	});
});
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
