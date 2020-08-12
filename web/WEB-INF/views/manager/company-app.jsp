<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">업체신청현황</h2>
                <div class="main-hd-btn-wrap">
                    <button type="button" name="detail0">업체 등록</button>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <button type="submit" class="keyword-src-button">검색</button>

                        <div class="src-filter-wrap">
                            <input type="checkbox" name="searchType" value="store_name" id="check2" <c:if test="${fn:contains(searchVO.searchType, 'store_name')}">checked</c:if>>
                            <label for="check2">업체명</label>
                            <input type="checkbox" name="searchType" value="store_ceo_name" id="check1" <c:if test="${fn:contains(searchVO.searchType, 'store_ceo_name')}">checked</c:if>>
                            <label for="check1">담당자명</label>
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
                                <th>상태</th>
                                <td>
                                   <input type="checkbox" name="store_approval_status" value="T" id="src-q1" <c:if test="${fn:contains(searchVO.store_approval_status, 'T')}">checked</c:if>>
                                   <label for="src-q1">승인</label>
                                   <input type="checkbox" name="store_approval_status" value="W" id="src-q2" <c:if test="${fn:contains(searchVO.store_approval_status, 'W')}">checked</c:if>>
                                   <label for="src-q2">승인대기</label>
                                </td>
                                <th>승인일</th>
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
                        <button type="button" class="goods-list-btn" name="copy" id="listDelete">선택 삭제</button>
                    </div>

                </div>
                <form name="defaultListForm" id="defaultListForm" method="POST">
                    <input type="hidden" name="Pk" value="${Pk}">
                    <input type="hidden" name="table_name" value="${table_name}">
                    <table>
                        <colgroup>
                            <col width="2%">
                            <col width="5%">
                            <col width="20%">
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
                                <td name="detail">번호</td>
                                <td name="detail">신청 업체명</td>
                                <td>담당자명</td>
                                <td>연락처</td>
                                <td>신청일</td>
                                <td>승인일</td>
                                <td name="detail">상태</td>
                                <td>관리</td>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty list}">
                            <c:forEach var="list" items="${list}" varStatus="status">
                           <tr>
                                <td>
                                    <input type="checkbox" id="chk" name="chk" value="${list.store_id}">
                                    <input type="hidden" name="store_id" value="${list.store_id}">
                                </td>
                                <td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></td>
                                <td>${list.store_name}</td>
                                <td>${list.store_ceo_name}</td>
                                <td>${list.store_tel}</td>
                                <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
                                <td><fmt:formatDate value="${list.store_approval_date}" pattern="yyyy.MM.dd"/></td>
                                <td>${list.store_approval_status_name}</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail" onclick="defaultModalStore('${list.store_id}')" >상세보기</button>
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

    <div class="modal1">
        <div class="modal-content">
            <form name="defaultForm" id="defaultForm" method="multipart/form-data">
                <div class="modal-header">
                   <h2>입점업체 등록</h2>
                    <button type="button" class="modal-close" id="modal-close1">×</button>
                </div>
                <div class="modal-body clearfix">
                    <h3>기본정보</h3>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>입점사 ID</th>
                                <td>
                                    <input type="text" id="store_id" name="store_id">
                                    <button type="button" class="btn_file" id="storIdDupCheck">중복확인</button>
                                    <input type="hidden" name="storIdDupCheck" value="">
                                </td>
                            </tr>
                            <tr class="store_pwd">
                                <th>비밀번호 설정</th>
                                <td>
                                    <p><input type="password" name="store_password" placeholder="비밀번호"><span class="er" id="passwordValidation"></span></p>
                                    <p><input type="password" name="store_passwordCf" placeholder="비밀번호 확인"><span class="er" id="password_cfValidation"></span></p>
                                    <p class="s-font">- 6~20자의 영문,숫자를 조합하여 입력하여 주세요.</p>
<%--                                    <p class="s-font">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</p>--%>
                                </td>
                            </tr>
                            <tr>
                                <th>입점업체/크리에이터</th>
                                <td>
                                    <input type="radio" name="store_creator_yn" id="store_creator_yn1" value="N" checked/>
                                    <label for="store_creator_yn1">입점업체</label>
                                    <input type="radio" name="store_creator_yn" id="store_creator_yn2" value="Y"/>
                                    <label for="store_creator_yn2">크리에이터</label>
                                </td>
                            </tr>
       
                           

                        </tbody>
                    </table>
                    <h3>판매자</h3>
                    <table class="goods-detail-table">
                            <colgroup>
                                <col width="142px">
                                <col width="800px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>상호</th>
                                    <td>
                                        <input type="text" id="store_name" name="store_name">
                                    </td>
                                </tr>
                                <tr>
                                    <th>사업자등록번호</th>
                                    <td>
<%--                                        <input type="radio" id="table-ra1" name="store_reg_type" value="D">--%>
<%--                                        <label for="table-ra1">개인</label>--%>
<%--                                        <input type="radio" id="table-ra2" name="store_reg_type" VALUE="C">--%>
<%--                                        <label for="table-ra2">법인</label>--%>
                                        <input type="text" id="store_reg" name="store_reg">
                                        <button type="button" class="btn_file" id="storRegDupCheck">중복확인</button>
                                        <input type="hidden" name="storRegDupCheck" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>대표자</th>
                                    <td>
                                        <input type="text" id="store_ceo_name" name="store_ceo_name">
                                    </td>
                                </tr>
                                <tr>
                                    <th>업태/업종</th>
                                    <td>
                                        <input type="text" id="store_type" name="store_type"> / <input type="text" id="store_item" name="store_item">
                                    </td>
                                </tr>
    						 <tr> 
                                <tr>
		                           <th>매입/위탁</th>
		                                <td>
		                                    <input type="radio" name="store_pur_com" id="store_pur_com1" value="A" checked >
		                                    <label for="store_pur_com1">매입</label>
		                                    <input type="radio" name="store_pur_com" id="store_pur_com2" value="B" >
		                                    <label for="store_pur_com2">위탁</label>
		                                </td>
		                            </tr>
                                <tr>
                                    <th>사업자등록증 사본</th>
                                    <td>
                                        <div class="fileBox">
                                            <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">
                                            <label for="uploadBtn" class="btn_file">파일찾기</label>
                                            <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
                                            <div class="fileDownload">

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>통신판매신고번호</th>
                                    <td>
                                        <input type="text" id="store_online_reg" name="store_online_reg">
                                    </td>
                                </tr>
                                <tr>
                                    <th>전화</th>
                                    <td>
                                        <input type="text" id="store_tel" name="store_tel">
                                    </td>
                                </tr>
                                <tr>
                                    <th>메일</th>
                                    <td>
                                        <input type="text" id="store_mail" name="store_mail">
                                    </td>
                                </tr>
                                <tr>
                                    <th>팩스</th>
                                    <td>
                                        <input type="text" id="store_fax" name="store_fax">
                                    </td>
                                </tr>
                                <tr>
                                    <th>사업장 주소</th>
                                    <td class="address-td">
                                        <p><input type="text" id="postcode" name="postcode"><button type="button" class="ad-but" id="daumMapCall">우편번호</button></p>
                                        <p><span>(도로명)</span><input type="text" id="roadAddress" name="roadAddress" class="ad-input"></p>
                                        <p><span>(지번)</span><input type="text" id="jibunAddress" name="jibunAddress" class="ad-input"></p>
                                        <p><span>(공통상세)</span><input type="text" id="extraAddress" name="extraAddress" class="ad-input"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>계산서 수신메일</th>
                                    <td>
                                        <input type="text" id="tex_email" name="tex_email">
                                    </td>
                                </tr>
                                <tr>
                                    <th>계좌번호</th>
                                    <td>
                                        <input type="text" id="store_bank_account" name="store_bank_account">
                                    </td>
                                </tr>
                                <tr>
                                    <th>예금주</th>
                                    <td>
                                        <input type="text" id="store_bank_holder" name="store_bank_holder">
                                    </td>
                                </tr>
                                <tr>
                                    <th>은행명</th>
                                    <td>
                                        <input type="text" id="store_bank_name" name="store_bank_name">
                                    </td>
                                </tr>
                            <c:if test="${sessionScope.adminLogin == 'admin' && sessionScope.level == 10}">
                                <tr id="menuGrant">
                                    <th>사용가능 메뉴</th>
                                    <td>
                                    <c:if test="${not empty depthList}">
                                        <div class="menu-depth-all"><input type="checkbox" name="enable_menu_all"/> <b>전체선택</b></div>
                                        <hr>
                                        <c:forEach var="list" items="${depthList}">
                                        <div class="menu-depth"><input type="checkbox" name="enable_menu" value="${list.menu_id}"/> ${list.menu_name}</div>
                                        </c:forEach>
<%--                                        <button class="modal-enable-menu-btn" type="button">사용메뉴 설정</button>--%>
                                    </c:if>
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    <button type="button" id="formStoreSubmit" class="btn-red">등록하기</button>
                    <div class="updateBtn hidden">
                        <button type="button" id="storeApproval" class="btn-red">승인</button>
                        <button type="button" id="storeUpdateSubmit" class="btn-red">수정</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<script>
$(function(){
	$('input[name=enable_menu_all]').click(function() {
	  $('input[name=enable_menu]').prop('checked',this.checked);
	});
});

$("#modal-close1").click(function(){
    $(".modal").attr("style", "display:none");
    location.reload();
});


</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>