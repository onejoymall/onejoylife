<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${searchVO.totPage>1}">
	<ul class="pagination">
		<c:if test="${searchVO.page>1}">
			<li class="page-item"><a href="javascript:fnSubmitForm(1);" class="page-link" >≪</a></li>
			<li class="page-item"><a href="javascript:fnSubmitForm(${searchVO.page-1});" class="page-link" ><</a></li>
		</c:if>
				
		<c:forEach var="i" begin="${searchVO.pageStart}" end="${searchVO.pageEnd}" step="1" varStatus="status">
            <c:choose>
                <c:when test="${i eq searchVO.page}">
					<li class="page-item"><a class="page-link active" href="#"><c:out value="${i}"/></a></li>
                </c:when>
                <c:otherwise>
					<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${i});"><c:out value="${i}"/></a></li>
                </c:otherwise>
            </c:choose>
<%--            <c:if test="${not status.last}">|</c:if>--%>
        </c:forEach>
        
		<c:if test="${searchVO.totPage > searchVO.page}">
			<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${searchVO.page+1});">＞</a></li>
			<li class="page-item"><a class="page-link" href="javascript:fnSubmitForm(${searchVO.totPage});">≫</a></li>
		</c:if>
	</ul>

		
	<input type="hidden" name="page" id="page" value="" />
		
	<script type="text/javascript">
	function fnSubmitForm(page){ 
		document.form1.page.value=page;
		document.form1.submit();
	}
	</script>
</c:if>
