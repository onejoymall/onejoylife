<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <input type="checkbox" name="searchType" value="store_name" id="check2" checked>
                            <label for="check2">업체명</label>
                            <input type="checkbox" name="searchType" value="store_ceo_name" id="check1" <c:if test="${param.searchType eq 'store_ceo_name'}">checked</c:if>>
                            <label for="check1">담당자명</label>
                        </div>
                    </div>
                    <div class="keyword-ck-box">
<%--                        <p>상태</p>--%>
                        <div class="ck-box">
<%--                            <input type="radio" id="key-ck1" name="store_approval_status" value="T">--%>
<%--                            <label for="key-ck1">승인</label>--%>
<%--                            <input type="radio" id="key-ck2" name="store_approval_status" value="W">--%>
<%--                            <label for="key-ck2">승인대기</label>--%>
                        </div>
                    </div>
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
                <form id="form1" name="form1"  method="post">
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
                    <button type="button" class="modal-close">×</button>
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
                                </td>
                            </tr>
                            <tr>
                                <th>비밀번호 설정</th>
                                <td>
                                    <p><input type="password" name="store_password" placeholder="비밀번호"></p>
                                    <p><input type="password" name="store_passwordCf" placeholder="비밀번호 확인"></p>
                                    <p class="s-font">- 영문 대소문자 또는 숫자, 특수문자 중 2가지 이상 좋바으로 10-20자 미만</p>
                                    <p class="s-font">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</p>
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

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>