<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
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
                            <input type="checkbox" name="searchType" value="email" id="chk2" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'email')}">checked</c:if>>
                            <label for="chk2">email</label>
                            <input type="checkbox"  name="searchType" value="username" id="chk1" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'username')}">checked</c:if>>
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
                                    <select name="level">
                                        <option value="" <c:if test="${param.level == ''}">selected</c:if>>전체</option>
                                        <option value="1" <c:if test="${param.level == '1'}">selected</c:if>>사용자</option>
                                        <option value="9" <c:if test="${param.level == '9'}">selected</c:if>>매니저</option>
                                        <option value="10" <c:if test="${param.level == '10'}">selected</c:if>>관리자</option>
                                    </select>
                                </td>

                                <!-- <th>성별</th>
                                <td class="age-margin">
                                    <input type="radio" name="sex" id="age-all" checked="">
                                    <label for="age-all">전체</label>
                                    <input type="radio" name="sex" id="age-wom" value="여자">
                                    <label for="age-wom">여자</label>
                                    <input type="radio" name="asex" id="age-man" value="남자">
                                    <label for="age-man">남자</label>
                                </td> -->
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
                            <button type="button" class="big" name="detail4" id="mailsendbtn">메일 보내기</button>
                            <button type="button" class="big" name="detail5" id="smssendbtn">SMS 보내기</button>
<%--                            <button type="button" class="big" name="detail6">로그인 푸시보내기</button>--%>
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
                    <input type="hidden" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                    <input type="hidden" name="searchType" value="email" id="chk2" checked>
                    <input type="hidden" name="searchType" value="username" id="chk1">
                    <input type="hidden" name="user_grant" value="${param.user_grant}">
                    <input type="hidden" name="level" value="${param.level}">
                    <input type="hidden" name="sex" value="${param.sex}">
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
                            <th>전화번호</th>
                            <td class="phone"></td>
                        </tr>
                        <tr>
                            <th >주소</th>
                            <td class="roadAddress"></td>
                        </tr>
                        <tr>
                        	<th >상세 주소</th>
                        	<td class="extraAddress"></td>
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
    <div class="loading-bar-wrap hidden">
        <div class="loading-bar"></div>
    </div>
    <div class="modal4">
        <div class="modal-content">
            <div class="modal-header">
               <h2>이메일 보내기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form name="member-sendmail" id="member-sendmail" method="get">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th rowspan="7">받는사람</th>
                                <th>회원등급</th>
                                <td>
                                    <input type="checkbox" name="user_grant" value="1" id="mem-class-ck1">
                                    <label for="mem-class-ck1">일반회원</label>
                                    <input type="checkbox" name="user_grant" value="7" id="mem-class-ck2">
                                    <label for="mem-class-ck2">특별회원</label>
                                    <input type="checkbox" name="user_grant" value="41" id="mem-class-ck3">
                                    <label for="mem-class-ck3">VIP회원</label>
                                    <input type="checkbox" name="user_grant" value="42" id="mem-class-ck3">
                                    <label for="mem-class-ck3">나그네회원</label>
                                </td>
                            </tr>
                            
                            <tr>
                                <th>나이</th>
                                <td>
                                    <input type="checkbox" name="age_class" value="10" id="age-class-ck1">
                                    <label for="age-class-ck1">10대</label>
                                    <input type="checkbox" name="age_class" value="20" id="age-class-ck2">
                                    <label for="age-class-ck2">20대</label>
                                    <input type="checkbox" name="age_class" value="30" id="age-class-ck3">
                                    <label for="age-class-ck3">30대</label>
                                    <input type="checkbox" name="age_class" value="40" id="age-class-ck4">
                                    <label for="age-class-ck4">40대 이상</label>
                                </td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>
                                    <input type="checkbox" name="sex" value="02" id="sex-class-ck1">
                                    <label for="sex-class-ck1">여자</label>
                                    <input type="checkbox" name="sex" value="01" id="sex-class-ck2">
                                    <label for="sex-class-ck2">남자</label>
                                </td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <p class="cc2">해당 상품이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                    <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                    <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                    <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                                     <input type="text" id="goods-cate" name="goods-cate" value="" placeholder="ex) 24|29|30">
                                 </td>
                            </tr>
                            <tr>
                                <th>상품정보</th>
                                <td>
                                    <input type="radio" name="product_class" value="payment" id="prod-class-ck1">
                                    <label for="prod-class-ck1">구매상품</label>
                                    <input type="radio" name="product_class" value="product_cart" id="prod-class-ck2">
                                    <label for="prod-class-ck2">장바구니 상품</label>
                                </td>
                            </tr>
                            <tr>
                                <th>메일수신거부</th>
                                <td>
                                    <input type="radio" name="email_privacy_policy" value="inclusion" id="mail-class-ck1">
                                    <label for="mail-class-ck1">포함</label>
                                    <input type="radio" name="email_privacy_policy" value="exception" id="mail-class-ck2">
                                    <label for="mail-class-ck2">제외</label>
                                </td>
                            </tr>
                            <tr>
                                <th>메일 제목</th>
                                <td>
                                    <input type="text" name="mail_title" size="100%">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <textarea name="mem-text" id="summernote"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red" id="sendmail">발송하기</button>
                    <button type="button" class="btn-red cancle">취소</button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal5">
        <div class="modal-content">
            <div class="modal-header">
               <h2>SMS 보내기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form name="member-sms" id="member-sms" method="POST">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th rowspan="8">받는사람</th>
                                <th>회원등급</th>
                                <td>
                                    <input type="checkbox" name="user_grant" value="1" id="mem-class-ck1">
                                    <label for="mem-class-ck1">일반회원</label>
                                    <input type="checkbox" name="user_grant" value="7" id="mem-class-ck2">
                                    <label for="mem-class-ck2">특별회원</label>
                                    <input type="checkbox" name="user_grant" value="41" id="mem-class-ck3">
                                    <label for="mem-class-ck3">VIP회원</label>
                                    <input type="checkbox" name="user_grant" value="42" id="mem-class-ck3">
                                    <label for="mem-class-ck3">나그네회원</label>
                                </td>
                            </tr>
                            <tr>
                                <th>나이</th>
                                <td>
                                    <input type="checkbox" name="age_class" value="10" id="age-class-ck1">
                                    <label for="age-class-ck1">10대</label>
                                    <input type="checkbox" name="age_class" value="20" id="age-class-ck2">
                                    <label for="age-class-ck2">20대</label>
                                    <input type="checkbox" name="age_class" value="30" id="age-class-ck3">
                                    <label for="age-class-ck3">30대</label>
                                    <input type="checkbox" name="age_class" value="40" id="age-class-ck4">
                                    <label for="age-class-ck4">40대 이상</label>
                                </td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>
                                    <input type="checkbox" name="sex" value="02" id="sex-class-ck1">
                                    <label for="sex-class-ck1">여자</label>
                                    <input type="checkbox" name="sex" value="01" id="sex-class-ck2">
                                    <label for="sex-class-ck2">남자</label>
                                </td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <p class="cc2">해당 상품이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                    <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                    <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                    <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                                    <input type="text" id="goods-cate" name="goods-cate" placeholder="ex) 24|29|30">
                                 </td>
                            </tr>
                            <tr>
                                <th>상품정보</th>
                                <td>
                                    <input type="radio" name="product_class" value="payment" id="prod-class-ck1">
                                    <label for="prod-class-ck1">구매상품</label>
                                    <input type="radio" name="product_class" value="product_cart" id="prod-class-ck2">
                                    <label for="prod-class-ck2">장바구니 상품</label>
                                </td>
                            </tr>
                            <tr>
                                <th>SMS수신거부</th>
                                <td>
                                    <input type="radio" name="email_privacy_policy" value="inclusion" id="mail-class-ck1">
                                    <label for="mail-class-ck1">포함</label>
                                    <input type="radio" name="email_privacy_policy" value="exception" id="mail-class-ck2">
                                    <label for="mail-class-ck2">제외</label>
                                </td>
                            </tr>
                            <tr>
                                <th>SMS 종류 *</th>
                                <td>
                                    <input type="radio" name="sms_kind" id="sms-kind-ck1" value="S">
                                    <label for="sms-kind-ck1">SMS</label>
                                    <input type="radio" name="sms_kind" id="sms-kind-ck2" value="L">
                                    <label for="sms-kind-ck2">LMS</label>
                                    <%--<input type="radio" name="sms_kind" id="sms-kind-ck3" value="M">
                                    <label for="sms-kind-ck2">MMS</label>--%>
                                </td>
                            </tr>
                            <tr>
                                <th>SMS 제목</th>
                                <td>
                                    <p class="cc2">*제목은 LMS(장문 메시지)일 경우에만 입력해주세요.</p>
                                    <input type="text" name="sms_title" size="100%">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <textarea name="mem-text" style="height: 200px;width:100%"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red" id="sendsms">발송하기</button>
                    <button type="button" class="btn-red cancle">취소</button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal6">
        <div class="modal-content">
            <div class="modal-header">
               <h2>로그인 푸시보내기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form name="member-management" id="member-management" method="get">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th colspan="2">보내는 사람</th>
                                <td>이름: <input type="text" placeholder="원조이라이프">
                                    번호: <input type="text" placeholder="000-0000-0000">
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="6">받는사람</th>
                                <th>회원등급</th>
                                <td>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck1">
                                    <label for="mem-class-ck1">일반회원</label>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck2">
                                    <label for="mem-class-ck2">우수회원</label>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck3">
                                    <label for="mem-class-ck3">특별회원</label>
                                </td>
                            </tr>
                            <tr>
                                <th>나이</th>
                                <td>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck1">
                                    <label for="age-class-ck1">10대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck2">
                                    <label for="age-class-ck2">20대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck3">
                                    <label for="age-class-ck3">30대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck4">
                                    <label for="age-class-ck4">40대 이상</label>
                                </td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>
                                    <input type="checkbox" name="sex-class-ck" id="sex-class-ck1">
                                    <label for="">여자</label>
                                    <input type="checkbox" name="sex-class-ck" id="sex-class-ck2">
                                    <label for="sex-class-ck2">남자</label>
                                </td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <p class="cc2">해당 상품이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                    <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                    <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                    <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                                     <input type="text" id="goods-cate" name="goods-cate" placeholder="ex) 24|29|30">
                                 </td>
                            </tr>
                            <tr>
                                <th>상품정보</th>
                                <td>
                                    <input type="checkbox" name="product-class-ck" id="prod-class-ck1">
                                    <label for="prod-class-ck1">구매상품</label>
                                    <input type="checkbox" name="product-class-ck" id="prod-class-ck2">
                                    <label for="prod-class-ck2">장바구니 상품</label>
                                </td>
                            </tr>
                            <tr>
                                <th>SMS수신거부</th>
                                <td>
                                    <input type="checkbox" name="mail-class-ck" id="mail-class-ck1">
                                    <label for="mail-class-ck1">포함</label>
                                    <input type="checkbox" name="mail-class-ck" id="mail-class-ck2">
                                    <label for="mail-class-ck2">제외</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <textarea name="mem-push" id="summernote3"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red">발송하기</button>
                    <button type="button" class="btn-red cancle">취소</button>
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

//summernote
$(document).ready(function (){
    $('#summernote').summernote({
        tabsize: 2,
        height: 150,
        lang: 'ko-KR' // default: 'en-US'
    });
    $('#summernote2').summernote({
        tabsize: 2,
        height: 150,
        lang: 'ko-KR' // default: 'en-US'
    });
    $('#summernote3').summernote({
        tabsize: 2,
        height: 150,
        lang: 'ko-KR' // default: 'en-US'
    });
});
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>