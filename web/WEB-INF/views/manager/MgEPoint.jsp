<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">회원 포인트 관리</h2>

        </div>
        <div class="search-form">
            <form name="listSrcForm" id="listSrcForm" method="get">
                <div class="keyword-src-wrap">
                    <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                    <button type="submit" class="keyword-src-button">검색</button>
                    <div class="src-filter-wrap">
                        <input type="checkbox" name="searchType" value="point_paid_memo" id="chk2" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'point_paid_memo')}">checked</c:if>>
                        <label for="chk2">내역</label>
                         <input type="checkbox" name="searchType" value="username" id="chk1" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'username')}">checked</c:if>>
                        <label for="chk1">고객명</label>
                        <input type="checkbox" name="searchType" value="email" id="chk3" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'email')}">checked</c:if>>
                        <label for="chk3">email</label>
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
	                               <th>기간별 선택</th>
	                               <td>
	                                <div class="input-box1">
	                                    <button type="button" class="ra-num" data-id="con1">오늘</p>
	                                    <button type="button" class="ra-num" data-id="con2">1주일</p>
	                                    <button type="button" class="ra-num" data-id="con3">1개월</p>
	                                    <button type="button" class="ra-num" data-id="con4">3개월</p>
	                                    <button type="button" class="ra-num" data-id="con5">6개월</p>
	                                </div>
	                            </td>
	                           
	                           </tr>
	                           <tr>
	                           	<th></th>
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
        <div class="goods-list-wrap txt-align1">
            <h4 class="list-tit">회원 포인트 리스트</h4>
            <div class="list-sort-wrap">
                <div class="left">
                    <button type="button" class="goods-list-btn big" name="copy" id="listDelete">선택 삭제</button>
                </div>
            </div>
            <form name="defaultListForm" id="defaultListForm" method="POST">
                <input type="hidden" name="Pk" value="${Pk}">
                <input type="hidden" name="table_name" value="${table_name}">
                <table>
                    <colgroup>

                    </colgroup>
                    <thead>
                    <tr>
                        <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                        <td>거래일시</td>
                        <td>내역</td>
                        <td>구분</td>
                        <td>소멸예정일</td>
                        <td>고객명</td>
                        <td>이메일</td>
                        <td>사용포인트</td>
                        <td>적립포인트</td>
                        <td>잔여포인트</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty list}">
                        <c:forEach var="list" items="${list}">
                            <tr>
                                <td><input type="checkbox" id="chk" name="chk" value="${list.point_id}"></td>

                                <td><p><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/><br><fmt:formatDate value="${list.reg_date}" pattern="HH:mm"/></p></td>
                                <td><p>${list.point_paid_memo}</p></td>
                                <td>${list.point_paid_type_name}</td>
                                <td>${list.point_end_date}</td>
                                 <td>${list.username}</td>
                                <td>${list.email}</td>
                                <td>-<fmt:formatNumber value="${list.point_use}" groupingUsed="true" /></td>
                                <td>+<fmt:formatNumber value="${list.point_add}" groupingUsed="true" /></td>
                                <td><fmt:formatNumber value="${list.point_amount}" groupingUsed="true" /></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </form>
            <form id="form1" name="form1"  method="get">
                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                    <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                    <input type="hidden" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                     <c:forEach items="${params.searchTypeArr}" var="list">
                    	<input type="hidden" name="searchType" value="${list}">	
                    </c:forEach>
                    <input type="hidden" name="start_date" value="${param.start_date}">
                    <input type="hidden" name="end_date" value="${param.end_date}">
                </form>
        </div>

    </div>
</main>

<script>


</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>