<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${searchVO.totPage>1}">
	<div class="num-box">
		<div class="num-box-in">
		<c:if test="${searchVO.page>1}">
			<div class="left-box"><a href="javascript:fnSubmitForm(${searchVO.page-1});" class="page-link" ></a></div>
		</c:if>
		<div class="num">
		<c:forEach var="i" begin="${searchVO.pageStart}" end="${searchVO.pageEnd}" step="1" varStatus="status">
            <c:choose>
                <c:when test="${i eq searchVO.page}">
					<a href=""><c:out value="${i}"/></a>
                </c:when>
                <c:otherwise>
					<a href="javascript:fnSubmitForm(${i});"><c:out value="${i}"/></a>
                </c:otherwise>
            </c:choose>
<%--            <c:if test="${not status.last}">|</c:if>--%>
        </c:forEach>
		</div>
		<c:if test="${searchVO.totPage > searchVO.page}">
			<div class="right-box"><a href="javascript:fnSubmitForm(${searchVO.page+1});"></a></div>
		</c:if>
		</div>
	</div>
	<input type="hidden" name="page" id="page" value="" />
		
	<script type="text/javascript">
	function fnSubmitForm(page){ 
		document.form1.page.value=page;
		document.form1.submit();
	}
	</script>
</c:if>
