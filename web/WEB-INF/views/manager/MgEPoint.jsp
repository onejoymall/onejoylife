<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">회원 포인트 관리</h2>
<%--            <div class="main-hd-btn-wrap">--%>
<%--                <button type="button" name="detail">회원등급 설정</button>--%>
<%--            </div>--%>
        </div>
        <div class="search-form">
            <form name="listSrcForm" id="listSrcForm" method="get">

                <div class="keyword-src-wrap">
                    <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                    <button type="submit" class="keyword-src-button">검색</button>
                    <div class="src-filter-wrap">
                        <input type="checkbox" name="searchType" value="point_paid_memo" id="chk2" checked>
                        <label for="chk2">내역</label>
<%--                        <input type="checkbox"  name="searchType" value="username" id="chk1">--%>
<%--                        <label for="chk1"></label>--%>

                    </div>
                </div>
<%--                <table class="keyword-src-table">--%>
<%--                    <colgroup>--%>
<%--                        <col width="10%">--%>
<%--                        <col width="23%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="23%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="24%">--%>
<%--                    </colgroup>--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <th></th><td></td>--%>
<%--                        <th>등급</th>--%>
<%--                        <td>--%>
<%--                            <select name="src-grade">--%>
<%--                                <option value="전체">전체</option>--%>
<%--                                <option value="1">일반회원</option>--%>
<%--                                <option value="10">관리자</option>--%>
<%--                            </select>--%>
<%--                        </td>--%>

<%--                        <th>성별</th>--%>
<%--                        <td class="age-margin">--%>
<%--                            <input type="radio" name="sex" id="age-all" checked="">--%>
<%--                            <label for="age-all">전체</label>--%>
<%--                            <input type="radio" name="sex" id="age-wom" value="여자">--%>
<%--                            <label for="age-wom">여자</label>--%>
<%--                            <input type="radio" name="asex" id="age-man" value="남자">--%>
<%--                            <label for="age-man">남자</label>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
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
<%--                        <col width="2%">--%>
<%--                        <col width="8%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="10%">--%>
<%--                        <col width="10%">--%>
                    </colgroup>
                    <thead>
                    <tr>
                        <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                        <td>거래일시</td>
                        <td>내역</td>
                        <td>구분</td>
                        <td>소멸예정일</td>
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
            <form id="form1" name="form1"  method="post">
                <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
            </form>
        </div>

    </div>
</main>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>