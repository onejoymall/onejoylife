<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">브랜드 등록</h2>
                <div class="main-hd-btn-wrap">
<%--                    <button type="button" name="detail">제조사 등록</button>--%>
<%--                    <button type="button" name="detail">공급사 등록</button>--%>
                    <button type="button" name="detail">브랜드 등록</button>
<%--                    <button type="button" name="detail">트랜드 등록</button>--%>
<%--                    <button type="button" name="detail">자체분류 등록</button>--%>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <button type="submit" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox"  name="searchType" value="product_brand_name" id="chk1" checked>
                            <label for="chk1">브랜드 명</label>
                            <input type="checkbox" name="searchType" value="product_brand" id="chk2" >
                            <label for="chk2">브랜드 코드</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="goods-list-wrap">
                <form name="defaultListForm" id="defaultListForm" method="POST">
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="btn-default" name="copy" id="listDelete">선택 삭제</button>
                    </div>
                </div>

                <input type="hidden" name="Pk" value="${Pk}">
                <input type="hidden" name="table_name" value="${table_name}">
                    <table>
                        <colgroup>
                            <col width="2%">
                            <col width="5%">
                            <col width="5%">
                            <col width="68%">
                            <col width="5%">
                            <col width="5%">
                            <col width="5%">
                            <col width="5%">
                        </colgroup>
                        <thead>
                            <tr>
                                <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                                <td>번호</td>
                                <td>브랜드코드</td>
                                <td>브랜드명</td>
                                <td>사용여부</td>
                                <td>등록 일자</td>
                                <td>관리</td>
                            </tr>
                        </thead>
                        <tbody>
                    <c:if test="${not empty list}">
                        <c:forEach var="list" items="${list}">
                           <tr>
                                <td><input type="checkbox" id="chk" name="chk" value="${list.product_brand}"></td>
                                <td>${list.no}</td>
                                <td>${list.product_brand}</td>
                                <td>${list.product_brand_name}</td>
                                <td>${list.product_brand_use_yn}</td>
                                <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
                                <td>
                                    <button type="button" class="goods-list-btn" id="mgBrandDetail" data-id="${list.product_brand}">상세보기</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                        </tbody>
                    </table>
                </form>
                <form id="form1" name="form1"  method="get">
                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
<%--                    <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">--%>
                </form>
            </div>
        </div>
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>브랜드 등록</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form name="mgBrandAdd" id="mgBrandAdd" method="post">
                <div class="modal-body clearfix">
                    <h3>브랜드 정보</h3>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>브랜드명 <span class="cc">&#40;필수&#41;</span></th>
                                <td>
                                    <input type="text"  name="product_brand_name" value="" placeholder="">
                                </td>

                            </tr>
                            <tr>
                                <th>브랜드코드</th>
                                <td><input type="hidden"  name="product_brand" value="" placeholder="">자동등록</td>
                            </tr>
                            <tr>
                                <th>사용여부</th>
                                <td>
                                    <input type="radio" id="brand1-ra1" name="product_brand_use_yn" checked value="Y">
                                    <label for="brand1-ra1" class="brand-label"><span>표시</span></label>
                                    <input type="radio" id="brand1-ra2" name="product_brand_use_yn" value="N">
                                    <label for="brand1-ra2"><span>표시 안함</span></label>
                                </td>
                            </tr>
    <%--                        <tr>--%>
    <%--                            <th>검색어 설정</th>--%>
    <%--                            <td>--%>
    <%--                                <input type="text" id="brand-name" name="brand-name" value="">--%>
    <%--                                <p>* 쉼표(,)로 구분</p>--%>
    <%--                            </td>--%>
    <%--                        </tr>--%>

                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red" id="mgBrandAddSubmit">등록하기</button>
                </div>
            </form>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>브랜드 상세보기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <h3>브랜드 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>브랜드명 <span class="cc">&#40;필수&#41;</span></th>
                            <td>
                                <span>원조이라이프</span>
                            </td>
                            
                        </tr>
                        <tr>
                            <th>브랜드코드</th>
                            <td><span>B000000C</span></td>
                        </tr>
                        <tr>
                            <th>사용여부</th>
                            <td>
                                <input type="radio" id="brand2-ra1" name="brand-radio2" checked>
                                <label for="brand2-ra1" class="brand-label"><span>표시</span></label>
                                <input type="radio" id="brand2-ra2" name="brand-radio2">
                                <label for="brand2-ra2"><span>표시 안함</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th>검색어 설정</th>
                            <td>
                                <input type="text" id="brand-name" name="brand-name" value="">
                                <p>* 쉼표(,)로 구분</p>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red">변경하기</button>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>