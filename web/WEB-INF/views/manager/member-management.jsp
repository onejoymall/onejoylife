<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">일반 회원관리</h2>
                <div class="main-hd-btn-wrap">
                    <button type="button" name="detail">회원권한 설정</button>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">

                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <button type="submit" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="searchType" value="email" id="chk2" checked>
                            <label for="chk2">email</label>
                            <input type="checkbox"  name="searchType" value="username" id="chk1">
                            <label for="chk1">이름</label>

                        </div>
                    </div>
                    <table class="keyword-src-table">
                        <colgroup>
                            <col width="10%">
                            <col width="23%">
                            <col width="10%">
                            <col width="23%">
                            <col width="10%">
                            <col width="24%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th></th><td></td>
                                <th>등급</th>
                                <td>
                                    <select name="src-grade">
                                        <option value="전체">전체</option>
                                        <option value="1">일반회원</option>
                                        <option value="10">관리자</option>
                                    </select>
                                </td>

                                <th>성별</th>
                                <td class="age-margin">
                                    <input type="radio" name="sex" id="age-all" checked="">
                                    <label for="age-all">전체</label>
                                    <input type="radio" name="sex" id="age-wom" value="여자">
                                    <label for="age-wom">여자</label>
                                    <input type="radio" name="asex" id="age-man" value="남자">
                                    <label for="age-man">남자</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="goods-list-wrap txt-align1">
                <h4 class="list-tit">회원 리스트</h4>
                <form name="defaultListForm" id="defaultListForm" method="POST">
                    <div class="list-sort-wrap">
                        <div class="left">
                            <button type="button" class="goods-list-btn big" name="copy" id="listDelete">선택 삭제</button>

                                 <select name="user_grant" id="grade-change" class="coustomAdminSelect">
                                <c:if test="${not empty userGrantlist}">
                                    <c:forEach var="userGrantlist" items="${userGrantlist}">
                                    <option value="${userGrantlist.user_grant_no}">${userGrantlist.user_grant_name}</option>

                                    </c:forEach>
                                </c:if>
                                 </select>

                            <button type="button" class="goods-list-btn big" id="gradeChange">선택 권한 으로 변경</button>
                        </div>
                    </div>

                    <input type="hidden" name="Pk" value="${Pk}">
                    <input type="hidden" name="table_name" value="${table_name}">

                    <table>
                        <colgroup>
                            <col width="2%">
                            <col width="8%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
                                <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                                <td>이름</td>
                                <td>아이디</td>
                                <td>이메일</td>
                                <td>등급</td>
                                <td>권한</td>
                                <td>성별</td>
                                <td>생년월일</td>
                                <td>포인트</td>
                                <td>등록일</td>
                                <td>관리</td>
                            </tr>
                        </thead>
                        <tbody>
                    <c:if test="${not empty list}">
                        <c:forEach var="list" items="${list}">
                           <tr>
                                <td><input type="checkbox" id="chk" name="chk" value="${list.usr_id}"></td>

                                <td>${list.username}</td>
                                <td>${list.user_id}</td>
                                <td>${list.email}</td>
                                <td>${list.level_name}</td>
                               <td>${list.grant_name}</td>
                                <td>${list.sex}</td>
                                <td>${list.birth}</td>
                                <td><fmt:formatNumber value="${list.point_amount}" groupingUsed="true" /></td>
                                <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1" onclick="defaultModalUSer('${list.email}')">상세보기</button>
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
            <div class="modal-header">
               <h2>회원등급 설정</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form name="mgUserGrantList" id="mgUserGrantList" method="POST">
                    <input type="hidden" name="Pk" value="user_grant_no">
                    <input type="hidden" name="table_name" value="user_grant">
                    <h2>회원등급 목록</h2>
                    <div class="list-sort-wrap">
                        <div class="left">
                            <button type="button" class="goods-list-btn" id="mgUserGrantListSubmit">선택 삭제</button>

                        </div>
                        <div class="right">
                        </div>
                    </div>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="2%">
                            <col width="10%">
                            <col width="11%">
                            <col width="13%">
                            <col width="9%">
                            <col width="13%">
                            <col width="9%">
                            <col width="13%">
                            <col width="9%">
                            <col width="11%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th rowspan="2"><input type="checkbox" id="all-chk2" name="all-chk1"></th>
                                <th rowspan="2">등급명</th>
                                <th colspan="2">할인적용</th>
                                <th colspan="2">포인트 적립</th>
                                <th rowspan="2">관리</th>
                            </tr>
                            <tr>
                                <th>구매금액(이상)</th>
                                <th>할인 적용</th>
                                <th>구매금액(이상)</th>
                                <th>point 적립</th>
                            </tr>
                        <c:if test="${not empty userGrantlist}">
                            <c:forEach var="userGrantlist" items="${userGrantlist}">
                            <tr>
                                <td><input type="checkbox" name="chk" value="${userGrantlist.user_grant_no}"></td>
                                <td>${userGrantlist.user_grant_name}</td>
                                <td><fmt:formatNumber value="${userGrantlist.payment_limit}" groupingUsed="true" /></td>
                                <td><fmt:formatNumber value="${userGrantlist.payment_event_amount}" groupingUsed="true" /></td>
                                <td><fmt:formatNumber value="${userGrantlist.payment_point_limit}" groupingUsed="true" /></td>
                                <td><fmt:formatNumber value="${userGrantlist.event_point}" groupingUsed="true" /></td>
                                <td><button type="button" class="goods-list-btn" id="mgUserGrantListUpdateSubmit" data-id="${userGrantlist.user_grant_no}">선택 수정</button></td>
                            </tr>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red member-add" >회원등급 추가</button>
<%--                    <button type="button" class="btn-red">저장하기</button>--%>
                </form>
            </div>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <form name="mgPointForm" id="mgPointForm" method="POST">
            <div class="modal-header">
               <h2>상세보기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>회원명</th>
                            <td class="username"></td>
                        </tr>
                        <tr>
                            <th>회원 ID</th>
                            <td class="user_id"></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td class="email"></td>
                        </tr>
                        <tr>
                            <th>회원등급</th>
                            <td>
                            	<div class="level_name"></div>
                            	<div>
                            		<c:if test="${sessionScope.adminLogin == 'admin'}">
                            		<select name="level_name">
                            			<option value="1">사용자</option>
                            			<option value="9">매니저</option>
                            			<option value="10">관리자</option>
                            		</select>
                            		<button class="modal-level-btn" type="button">회원등급 설정</button>
                            		</c:if>
                            	</div>
                           	</td>
                        </tr>
                        <tr>
                            <th>포인트</th>
                            <td class="point_amount"></td>
                        </tr>
                        <tr>
                            <th>포인트 메모</th>
                            <td>
                                <input type="text" name="point_paid_memo">
                                <input type="hidden" name="point_paid_user_id">
                            </td>
                        </tr>

                        <tr>
                            <th>지급 포인트</th>
                            <td><input type="number" name="point_add" ><button type="button" class="point-btn mgPointPaid">지급</button></td>
                        </tr>
                        <tr>
                            <th>환수 포인트</th>
                            <td><input type="number" name="point_use" ><button type="button" class="point-btn mgPointPaid">환수</button></td>
                        </tr>
                        <c:if test="${sessionScope.adminLogin == 'admin'}">
                        <tr id="menuGrant" class="hidden">
                        	<th>사용가능 메뉴</th>
                        	<td>
                        	<c:if test="${not empty depthList}">
                        		<div class="menu-depth-all"><input type="checkbox" name="enable_menu_all"/> <b>전체선택</b></div>
                        		<hr>
		                        <c:forEach var="list" items="${depthList}">
		                        <div class="menu-depth"><input type="checkbox" name="enable_menu" value="${list.menu_id}"/> ${list.menu_name}</div>
		                        </c:forEach>
		                        <button class="modal-enable-menu-btn" type="button">사용메뉴 설정</button>
	                        </c:if>
                        	</td>
                        </tr>
                        </c:if>
                        <%--<tr>
                            <th>포인트 환수</th>
                            <td><input type="text"><button type="button" class="point-btn">환수</button></td>
                        </tr>--%>
                    </tbody>
                </table>
<%--                <button type="button" class="btn-red">저장</button>--%>
            </div>
            </form>
        </div>
    </div>
    <div class="modal2">
        <div class="modal-content">
            <div class="modal-header">
               <h2>회원등급</h2>
                <button type="button" class="modal2-close">×</button>
            </div>
            <div class="modal-body clearfix">
               <form name="userGrantAdd" id="userGrantAdd" method="POST">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>회원 등급명</th>
                                <td>
                                    <input type="text" name="user_grant_name">
                                    <input type="hidden" name="user_grant_no">
                                </td>
                            </tr>

                            <tr>
                                <th>할인적용</th>
                                <td class="in-txt-width">
                                    <input type="text" name="payment_limit"> 원 이상 구매시
                                    <input type="text" name="payment_event_amount"> 원 할인
                                </td>
                            </tr>
                            <tr>
                                <th>포인트 적립</th>
                                <td class="in-txt-width">
                                    <input type="text" name="payment_point_limit"> 원 이상 구매시
                                    <input type="text" name="event_point"> Point 적립
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red" id ="userGrantAddSubmit">저장하기</button>
               </form>
                
            </div>
        </div>
    </div>
    <div class="modal3">
        <div class="modal-content">
            <div class="modal-header">
               <h2>회원등급 수정</h2>
                <button type="button" class="modal3-close">×</button>
            </div>
            <div class="modal-body clearfix">
               <form name="mgUserGrantListForm" id="mgUserGrantListForm" method="POST">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>회원 등급명</th>
                                <td>
                                    <input type="text" value="일반회원">
                                </td>
                            </tr>
                            <tr>
                                <th>회원 등급설명</th>
                                <td>
                                    <input type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>혜택 결제 조건</th>
                                <td>
                                    <input type="radio" name="use-dc2" id="use-dc2-F" checked>
                                    <label for="use-dc2-F">모든 결제</label>
                                    <input type="radio" name="use-dc2" id="use-dc2-C">
                                    <label for="use-dc2-C">현금 결제(무통장)</label>
                                    <input type="radio" name="use-dc2" id="use-dc2-A">
                                    <label for="use-dc2-A">현금 결제 외 모든 결제</label>
                                </td>
                            </tr>
                            <tr>
                                <th>할인적용</th>
                                <td class="in-txt-width">
                                    <input type="text"> 원 이상 구매시
                                    <input type="text" placeholder="원 / %"> 적용
                                </td>
                            </tr>
                            <tr>
                                <th>포인트 적립</th>
                                <td class="in-txt-width">
                                    <input type="text"> 원 이상 구매시
                                    <input type="text" placeholder="원 / %"> 적립
                                </td>
                            </tr>
                            <tr>
                                <th>차등지급 가격</th>
                                <td class="in-txt-width">
                                    <input type="text"> 원 이상 구매시
                                    <input type="text" placeholder="원 / %"> 지급
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red">수정하기</button>
               </form>
                
            </div>
        </div>
    </div>
<script type="text/javascript">
$(function(){
	$('input[name=enable_menu_all]').click(function() {
	  $('input[name=enable_menu]').prop('checked',this.checked);
	});
});
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>