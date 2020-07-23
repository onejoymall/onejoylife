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
            	<input type="hidden" value="${excel_setting_type.code_value}" name="type_value">
                <input type="hidden" value="${excel_setting_type.code_name}" name="type_name">
                <ul class="info-tab clearfix">
                    <li><a href="/Manager/excelSetting/product" <c:if test="${excel_setting_type.code_value == 'product'}">class="active"</c:if>>상품리스트</a></li>
                    <li><a href="/Manager/excelSetting/giveaway" <c:if test="${excel_setting_type.code_value == 'giveaway'}">class="active"</c:if>>경품리스트</a></li>
                    <li><a href="/Manager/excelSetting/giveawayPart" <c:if test="${excel_setting_type.code_value == 'giveawayPart'}">class="active"</c:if>>경품참여내역</a></li>
                    <li><a href="/Manager/excelSetting/coupon" <c:if test="${excel_setting_type.code_value == 'coupon'}">class="active"</c:if>>쿠폰리스트</a></li>
                    <li><a href="/Manager/excelSetting/store" <c:if test="${excel_setting_type.code_value == 'store'}">class="active"</c:if>>입점업체리스트</a></li>
                    <li><a href="/Manager/excelSetting/order" <c:if test="${excel_setting_type.code_value == 'order'}">class="active"</c:if>>주문내역</a></li>
                    <li><a href="/Manager/excelSetting/returned" <c:if test="${excel_setting_type.code_value == 'returned'}">class="active"</c:if>>교환/반품내역</a></li>
                    <li><a href="/Manager/excelSetting/calculate" <c:if test="${excel_setting_type.code_value == 'calculate'}">class="active"</c:if>>정산내역</a></li>
                    <li><a href="/Manager/excelSetting/qna" <c:if test="${excel_setting_type.code_value == 'qna'}">class="active"</c:if>>Q&A리스트</a></li>
                    <li><a href="/Manager/excelSetting/onetoone" <c:if test="${excel_setting_type.code_value == 'onetoone'}">class="active"</c:if>>1:1문의리스트</a></li>
                </ul>
                <div class="text-editor clearfix column_name_div">
                	<div class="menu-depth-all"><input type="checkbox" name="column_name_all"> <b>전체선택</b></div><hr>
                	<c:forEach items="${excel_column_list}" var="list">
                		<div class="menu-depth">
                			<input type="checkbox" name="column_name" class="hidden" value="${list.code_name}" <c:if test="${fn:contains(detail.column_value, list.code_value)}">checked</c:if>>
                			<input type="checkbox" name="column_value" value="${list.code_value}" <c:if test="${fn:contains(detail.column_value, list.code_value)}">checked</c:if>> ${list.code_name}
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
	$('input[name=column_value]').on('input', function(){
		$(this).siblings('input[name=column_name]').prop('checked',this.checked);
	});
});
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
