<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>

<div class="wrap">
	<div class="page-box">
		<main>
			<div class="main-content">
				<div class="main-header">
					<h2 name="detail">${bgInfo.bgname}</h2>
				</div>
				<div class="goods-list-wrap">
					<div class="list-box clearfix">
						<div class="list-sort-wrap">
							<div class="left">
<%--								<button type="button" class="goods-list-btn" name="copy">선택 삭제</button>--%>
<%--								<button type="button" class="goods-list-btn" name="detail">공지사항 글쓰기</button>--%>
								<c:if test="${searchVO.bgno == 9 && sessionScope.level == 10}">
								<a class="goods-list-btn" href="/Manager/boardForm?bgno=<c:out value="${searchVO.bgno}"/>">글쓰기</a>
								</c:if>
								<c:if test="${searchVO.bgno != 9}">
								<a class="goods-list-btn" href="/Manager/boardForm?bgno=<c:out value="${searchVO.bgno}"/>">글쓰기</a>
								</c:if>
							</div>
							<div class="right">

							</div>
						</div>
						<table class="sort-wrap-table1">
						<colgroup>
							<col width="5%">
							<col width="5%">
							<col width="70%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
						</colgroup>
						<thead>
						<tr>
							<td><input type="checkbox" id="all-chk1" name="all-chk1"></td>
							<td>번호</td>
							<td>제목</td>
							<td>등록자</td>
							<td>등록일</td>
							<td>조회수</td>
							<td>첨부</td>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="listview" items="${listview}" varStatus="status">
							<c:url var="link" value="/Manager/boardRead">
								<c:param name="brdno" value="${listview.brdno}" />
							</c:url>

							<tr>
								<td><input type="checkbox" name="chk"></td>
								<td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></td>
								<td>
									<a href="${link}"><c:out value="${listview.brdtitle}"/></a>
									<c:if test="${listview.replycnt>0}">
										(<c:out value="${listview.replycnt}"/>)
									</c:if>
								</td>
								<td><c:out value="${listview.brdwriter}"/></td>
								<td><c:out value="${listview.brddate}"/></td>
								<td><c:out value="${listview.brdhit}"/></td>
								<td><c:out value="${listview.filecnt}"/></td>
							</tr>

						</c:forEach>
						</tbody>
					</table>
						<form id="form1" name="form1"  method="get">
							<jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />

						</form>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>
<script>
    $('.main-title-box').click(function(){
        $(this).parent($('.notice-data-box')).toggleClass('active');
    })
    $('.notice-sort-item a').click(function(){
        event.preventDefault();
        $(this).parents($('.notice-sort-list')).find($('a')).removeClass('active');
        $(this).addClass('active');
    })
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
