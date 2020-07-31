<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<%--	<c:if test="${bgInfo.bgreadonly=='N'}">--%>
<%--		<a href="boardForm?bgno=<c:out value="${searchVO.bgno}"/>">글쓰기</a>--%>
<%--	</c:if>--%>

<div class="wrap">
	<div class="page-box">
		<main class="clearfix">
			<%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
			<div class="right-contain">
				<div class="r-sec1">
					<p class="sec1-h1"><c:out value="${bgInfo.bgname}"/></p>
					<ul class="notice-data-list">
						<li class="notice-data-title">
							<div class="notice-sort">${afn:getMessage("noti_sort",sessionScope.locale)}</div>
							<div class="notice-title">${afn:getMessage("noti_title",sessionScope.locale)}</div>
						</li>
<%--						<li class="notice-data-item" tabindex="0">--%>
<%--							<div class="main-title-box notice" tabindex="0">--%>
<%--								<div class="notice-sort">--%>
<%--									---%>
<%--								</div>--%>
<%--								<div class="notice-title"><span><span class="notice-span">긴급공지</span>원조이몰 사이트 긴급 점검 공지</span></div>--%>
<%--								<div class="notice-date">2020.02.11</div>--%>
<%--							</div>--%>
<%--							<div class="content-box">--%>
<%--								<div class="notice-setting-box">--%>
<%--									<span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>--%>
<%--								</div>--%>
<%--								<div class="notice-content-body">--%>
<%--									<div class="notice-content-body-a">--%>
<%--										<p>--%>
<%--											안녕하세요, 원조이몰 담당자입니다.<br>--%>
<%--											2020년 3월 10일 토요일 오전 03:08:00부터 약 5시간 동안 시스템 점검이 있겠습니다.<br>--%>
<%--											점검 시간 동안 서비스를 이용하지 못 하는 불편을 최소화 하기 위해, 최대한 빠른 시간 안에 마무리할 수 있도록 노력하겠습니다.--%>
<%--										</p>--%>
<%--									</div>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</li>--%>

						<c:forEach var="listview" items="${listview}" varStatus="status">
							<c:url var="link" value="/Board/boardList">
								<c:param name="brdno" value="${listview.brdno}" />
							</c:url>
							<c:url var="link" value="/Board/boardRead">
								<c:param name="brdno" value="${listview.brdno}" />
							</c:url>
							<li class="notice-data-item" tabindex="0" >
								<div class="main-title-box" tabindex="0" onclick="readBoard('${listview.bgtype}',${listview.brdno},$(this))">
									<div class="notice-sort">
										<span class="notice-number"><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></span>
									</div>
									<div class="notice-title">
<%--										<a href="${link}"><c:out value="${listview.brdtitle}"/></a>--%>
										<span><c:out value="${listview.brdtitle}"/> </span>
									</div>
									<c:if test="${not empty listview.question_type_name}">
									<div class="notice-date"><c:out value="${listview.question_type_name}"/></div>
									</c:if>
									<div class="notice-date"><c:out value="${listview.brdwriter}"/></div>
									<div class="notice-date"><c:out value="${listview.brddate}"/></div>
								</div>
								<div class="content-box">
									<div class="notice-setting-box">
										<span>${afn:getMessage("noti_file",sessionScope.locale)} : <i class="file-ic"></i>
											<%--<a href="#" class="file-name">설치신청서.DOC</a>--%>
											<a href="/Board/fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
											<c:out value="${listview.filename}"/></a><br/>
										</span>
									</div>
									<div class="notice-content-body">
										<div class="notice-content-body-a">
											<p id="boardMemoPrint">${listview.brdmemo}</p>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
						<form id="form1" name="form1"  method="get">
						    <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />

<%--							<div>--%>
<%--								<input type="checkbox" name="searchType" value="brdtitle" <c:if test="${fn:indexOf(searchVO.searchType, 'brdtitle')!=-1}">checked="checked"</c:if>/>--%>
<%--								<label class="chkselect" for="searchType1">제목</label>--%>
<%--								<input type="checkbox" name="searchType" value="brdmemo" <c:if test="${fn:indexOf(searchVO.searchType, 'brdmemo')!=-1}">checked="checked"</c:if>/>--%>
<%--								<label class="chkselect" for="searchType2">내용</label>--%>
<%--								<input type="text" name="searchKeyword" style="width:150px;" maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">--%>
<%--								<input name="btn_search" value="검색" class="btn_sch" type="button" onclick="fn_formSubmit()" />--%>
<%--							</div>--%>
						</form>

				</div>
			</div>
		</main>
	</div>
</div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
