<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

	<c:if test="${bgInfo.bgreadonly=='N'}">
		<a href="boardForm?bgno=<c:out value="${searchVO.bgno}"/>">글쓰기</a>
	</c:if>

<div class="wrap">
	<div class="page-box">
		<main class="clearfix">
			<div class="left-nav">
				<h2 class="left-tit"><a href="help-1.html">고객센터</a></h2>
				<ul class="outer-ul">
					<li class="outer-li"><a href="help-1.html">ONEJOYLIFE</a></li>
					<li class="outer-li"><a href="help-2.html">포인트 사용안내</a></li>
					<li class="outer-li"><a href="help-3.html">FAQ 센터</a></li>
					<li class="outer-li">1:1 문의하기
						<ul class="inner-ul">
							<li><a href="help-4.html">1:1 메일문의 작성</a></li>
							<li><a href="help-5.html">고객센터 전화번호 안내</a></li>
						</ul>
					</li>
					<li class="outer-li"><a href="help-6.html">채팅 문의하기</a></li>
					<li class="outer-li"><a href="help-7.html" class="active">공지사항</a></li>
				</ul>
			</div>
			<div class="right-contain">
				<div class="r-sec1">

					<p class="sec1-h1"><c:out value="${bgInfo.bgname}"/></p>
					<ul class="notice-data-list">
						<li class="notice-data-title">
							<div class="notice-sort">번호</div>
							<div class="notice-title">제목</div>
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
							<c:url var="link" value="/Board/boardRead">
								<c:param name="brdno" value="${listview.brdno}" />
							</c:url>
							<li class="notice-data-item" tabindex="0">
								<div class="main-title-box" tabindex="0">
									<div class="notice-sort">
										<span class="notice-number"><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></span>
									</div>
									<div class="notice-title">
<%--										<a href="${link}"><c:out value="${listview.brdtitle}"/></a>--%>
										<span><c:out value="${listview.brdtitle}"/></span>
									</div>
									<div class="notice-date"><c:out value="${listview.brddate}"/></div>
								</div>
								<div class="content-box">
<%--									<div class="notice-setting-box">--%>
<%--										<span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>--%>
<%--									</div>--%>
									<div class="notice-content-body">
										<div class="notice-content-body-a">
											<p><c:out value="${listview.brdmemo}"/></p>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
						<form id="form1" name="form1"  method="post">
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
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
