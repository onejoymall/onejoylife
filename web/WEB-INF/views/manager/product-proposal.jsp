<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">상품 제안 관리</h2>
            <div class="main-hd-btn-wrap">
                <button type="button" name="detail" id="proposalInsertBtn">상품 제안</button>
<%--                <button type="button"><i class="exel-ic"></i>일괄 등록/수정</button>--%>
            </div>
        </div>
        <div class="search-form">
            <form name="listSrcForm" id="listSrcForm" method="get">
                <div class="keyword-src-wrap">
                    <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                    <button type="submit" class="keyword-src-button">검색</button>
                    <div class="src-filter-wrap">
                        <input id="src-name" type="checkbox" name="searchType" value="A.product_cd" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'A.product_cd')}">checked</c:if>>
                        <label for="src-name">상품코드</label>
                        <input id="src-name" type="checkbox" name="searchType" value="D.product_name" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'D.product_name')}">checked</c:if>>
                        <label for="src-name">상품명</label>
                        <input id="src-code" type="checkbox" name="searchType" value="B.store_name" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'B.store_name')}">checked</c:if>>
                        <label for="src-code">제안한 업체명</label>
                        <input id="src-code" type="checkbox" name="searchType" value="B.store_id" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'B.store_id')}">checked</c:if>>
                        <label for="src-code">제안한 업체아이디</label>
                        <input id="src-code" type="checkbox" name="searchType" value="C.store_name" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'C.store_name')}">checked</c:if>>
                        <label for="src-code">제안받은 업체명</label>
                        <input id="src-code" type="checkbox" name="searchType" value="C.store_id" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'C.store_id')}">checked</c:if>>
                        <label for="src-code">제안받은 업체아이디</label>
                    </div>
                </div>
				<table class="keyword-src-table">
                        <colgroup>
                            <col width="80px">
                            <col width="420px">
                            <col width="80px">
                            <col width="420px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>구분</th>
                                <td>
                                   <select name="proposal_type">
                                   		<option value="">제안한 상품</option>
                                   		<option value="O" <c:if test="${param.proposal_type == 'O'}">selected</c:if>>제안받은 상품</option>
                                   </select>
                                </td>
                                <th>등록일</th>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="start_date" name="start_date" class="date_pick" value="${param.start_date}">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="end_date" name="end_date" class="date_pick" value="${param.end_date}">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </form>
        </div>
        <div class="goods-list-wrap">
            <div class="list-sort-wrap">
               	<div class="left">
                    <!-- <button type="button" class="btn-default" name="copy" id="listDelete">선택 삭제</button> -->
                    <!-- <button type="button" class="btn-default " name="copy" id="couponBatchUpdateBtn">선택 일괄수정</button> -->
                   <!-- <button type="button" class="btn-default" name="copy">선택 복사 등록</button>
                   <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button> -->
                   <!-- <button type="button" class="btn-default excelBtn" name="copy" data-id="coupon"><i class="exel-ic"></i>다운로드</button> -->
                </div><!-- 
                <div class="right">
                    <select name="order" class="order-select">
                        <option value="32">10개씩 보기</option>
                        <option value="60">50개씩 보기</option>
                        <option value="92">100개씩 보기</option>
                    </select>
                </div> -->
            </div>
            <form name="defaultListForm" id="defaultListForm" method="POST">
	            <input type="hidden" name="Pk" value="${Pk}">
	            <input type="hidden" name="table_name" value="${table_name}">
	            <table>
	                <colgroup>
	                    <col width="2%">
	                    <col width="28%">
	                    <col width="12%">
	                    <col width="12%">
	                    <col width="12%">
	                    <col width="10%">
	                    <col width="12%">
	                    <col width="12%">
	                </colgroup>
	                <thead>
	                <tr>
	                    <td><input type="checkbox" id="all-chk" name="all-chk"></td>
	                    <td>상품명</td>
	                    <td>제안한업체</td>
	                    <td>제안받은업체</td>
	                    <td>수수료</td>
	                    <td>수락여부</td>
	                    <td>등록일</td>
	                    <td>관리</td>
	                </tr>
	                </thead>
	                <tbody>
	                <c:if test="${not empty list}">
	                <c:forEach var="list" items="${list}">
		                <tr>
		                    <td>
		                    	<input type="checkbox" id="chk" name="chk" value="${list.proposal_id}">
                                <input type="hidden" name="proposal_id" value="${list.proposal_id}">
                            </td>
		                    <!-- <td>01</td> -->
		                    <td>${list.product_name}</td>
		                    <td>${list.store_name}</td>
		                    <td>${list.target_store_name}</td>
		                    <td><fmt:formatNumber value="${list.proposal_fee}" groupingUsed="true" />원</td>
		                    <td>
		                    	<c:if test="${list.accept_yn == 'Y'}">수락</c:if>
		                    	<c:if test="${list.accept_yn != 'Y'}">미수락</c:if>
		                    </td>
		                    <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
		                    <td>
		                        <button type="button" class="goods-list-btn proposalDetailBtn" name="detail" data-id="${list.proposal_id}">상세보기</button>
		                    </td>
		                </tr>
	                </c:forEach>
	                </c:if>
	                </tbody>
	            </table>
            </form>
            <form id="form1" name="form1"  method="get">
                <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
            </form>
        </div>
    </div>
</main>
<!--모달팝업창-->
<div class="modal">
    <div class="modal-content">
        <form id="insertForm" method="POST">
            <div class="modal-header">
                <h2>상품제안 <span id="proposalTitle">등록</span></h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
<%--                <div class="right">--%>
<%--                    <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>쿠폰 정보 다운로드</button>--%>
<%--                </div>--%>
                <h3>상품제안</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>상품명 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                        	<p class="cc2"><a href="#" class="productModalBtn" >&#91;상품명 조회&#93;</a>
                            </p>
                            <input type="text" id="product_name" name="product_name" value="" placeholder="상품명" readonly="readonly">
                            <input type="hidden" id="proposal_id" name="proposal_id">                            
                            <input type="hidden" id="accept_yn" name="accept_yn">                            
                        </td>
                    </tr>
                    <tr>
                        <th>상품코드 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" id="product_cd" name="product_cd" value="" placeholder="상품코드" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>제안받는 업체(크리에이터)</th>
                        <td>
                        	<p class="cc2"><a href="#" class="storeModalBtn" >&#91;업체명 조회&#93;</a>
                            </p>
                            <input type="text" id="target_store_id" name="target_store_id" value="" placeholder="대상업체" readonly="readonly">
                        </td>
                    </tr>
                    <tr>
                        <th>제안수수료 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            1개 판매당<input type="text" id="proposal_fee" name="proposal_fee" value="" placeholder="" >원
                        </td>
                    </tr>
                    <tr>
                        <th>제안내용</th>
                        <td>
                            <textarea name="proposal_html" id="summernote">제안 상세 설명을 적어주세요.</textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <button type="button" name="proposal-confirm-btn" class="btn-red" id="proposal-insert-btn">확인</button>
            </div>
        </form>
    </div>
</div><!-- 등록 끝 -->

<!-- 상품 모달 -->
<div class="modal2 productModal" >
    <div class="modal-content">
        <div class="modal-header">
            <h2>상품 정보조회</h2>
            <button type="button" class="modal-close2">×</button>
        </div>
        <div class="modal-body">
            <div class="wrap">
                <table class="codeSrcTable">
                    <colgroup>
                        <col width="5%">
                        <col width="15%">
                        <col width="50%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                    <td></td>
                    <td>상품코드</td>
                    <td>상품명</td>
                    <td>판매가</td>
                    </thead>
                    <tbody class="dataListView sotreProductTable">

                    </tbody>
                </table>
            </div>
            <button class="btn-red mr-10" id="code-com">입력하기</button>
        </div>
    </div>
</div>

<!-- 상품 모달 -->
<div class="modal2 storeModal" >
    <div class="modal-content">
        <div class="modal-header">
            <h2>업체조회</h2>
            <button type="button" class="modal-close2">×</button>
        </div>
        <div class="modal-body">
            <div class="wrap">
                <table class="codeSrcTable">
                    <colgroup>
                        <col width="10%">
                        <col width="45%">
                        <col width="45%">
                    </colgroup>
                    <thead>
                    <td></td>
                    <td>업체(크리에이터)명</td>
                    <td>업체(크리에이터)아이디</td>
                    </thead>
                    <tbody class="dataListView storeTable">

                    </tbody>
                </table>
            </div>
            <button class="btn-red mr-10" id="code-com">입력하기</button>
        </div>
    </div>
</div>
<script type="text/javascript" src="/assets/js/promotion-coupon.js"></script>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>


