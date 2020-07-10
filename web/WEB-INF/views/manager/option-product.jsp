<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">상품 옵션 설정</h2>
                <div class="main-hd-btn-wrap">
                    <button type="button" name="detail">옵션 등록</button>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <button type="submit" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox"  name="searchType" value="product_option_name" id="chk1" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'product_option_name')}">checked</c:if>>
                            <label for="chk1">옵션 명</label>
                            <input type="checkbox" name="searchType" value="product_option_code" id="chk2" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'product_option_code')}">checked</c:if>>
                            <label for="chk2">옵션 코드</label>
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
                            <col width="7%">
                            <col width="9%">
                            <col width="24%">
                            <col width="25%">
                            <col width="6%">
                            <col width="6%">
                            <col width="6%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
                                <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                                <td>옵션코드</td>
                                <td>옵션명</td>
                                <td>옵션값</td>
                                <td>옵션설명</td>
                                <td>필수/선택</td>
                                <td>옵션스타일</td>
                                <td>등록일자</td>
                                <td>관리</td>
                            </tr>
                        </thead>
                        <tbody>
                    <c:if test="${not empty list}">
                        <c:forEach var="list" items="${list}">
                           <tr>
                                <td><input type="checkbox" id="chk" name="chk" value="${list.product_option_code}"></td>
                                <td>${list.product_option_code}</td>
                                <td>${list.product_option_set_name}</td>
                                <td>${list.product_option_input}</td>
                                <td>${list.product_option_memo}</td>
                                <td>${list.product_option_required}</td>
                                <td>${list.product_option_style}</td>
                                <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
                                <td>
                                    <button type="button" class="goods-list-btn" id="mgOptionDetail" data-id="${list.product_option_code}">옵션값 수정</button>
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
               <h2>상품 옵션 등록</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form action="mgOptionAdd" id="mgOptionAdd" method="POST">
                    <h3>상품 옵션 정보</h3>
                    <input type="hidden" name="product_option_code">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>옵션코드</th>
                                <td>자동생성</td>
                            </tr>
                            <tr>
                                <th>옵션명</th>
                                <td>
                                    <input type="text" name="product_option_set_name">
                                </td>
                            </tr>
    <%--                        <tr>--%>
    <%--                            <th>품목 구성 방식</th>--%>
    <%--                            <td>--%>
    <%--                                <input type="radio" id="goods-compType-t" name="goods-compType" value="T">--%>
    <%--                                <label for="goods-compType-t">조합형</label>--%>
    <%--                                <input type="radio" id="goods-compType-e" name="goods-compType" value="E">--%>
    <%--                                <label for="goods-compType-e">상품연동형</label>--%>
    <%--                                <input type="radio" id="goods-compType-f" name="goods-compType" value="F">--%>
    <%--                                <label for="goods-compType-f">독립선택형</label>--%>
    <%--                            </td>--%>
    <%--                        </tr>--%>
    <%--                        <tr class="goods-compType-t-detail" style="display:none">--%>
    <%--                            <th>옵션 표시 방식</th>--%>
    <%--                            <td>--%>
    <%--                                <input type="radio" id="goods-optionType-c" name="goods-optionType" value="C">--%>
    <%--                                <label for="goods-optionType-c">일체선택형</label>--%>
    <%--                                <input type="radio" id="goods-optionType-s" name="goods-optionType" value="S">--%>
    <%--                                <label for="goods-optionType-s">분리선택형</label>--%>
    <%--                            </td>--%>
    <%--                        </tr>--%>
    <%--                        <tr class="goods-compType-e-detail" style="display:none">--%>
    <%--                            <th>옵션 세트명</th>--%>
    <%--                            <td>--%>
    <%--                                <input type="text" id="goods-optionSet-name" name="goods-optionSet-name">--%>
    <%--                            </td>--%>
    <%--                        </tr>--%>
    <%--                        <tr>--%>
    <%--                            <th>옵션 불러오기</th>--%>
    <%--                            <td>--%>
    <%--                                <button type="button" class="option-mo" name="mo-btn">옵션 추가</button>--%>
    <%--                            </td>--%>
    <%--                        </tr>--%>
                            <tr>
                                <th>옵션 스타일</th>
                                <td><p class="cc2">셀렉트박스: P, 텍스트버튼: B, 라디오버튼: R<br>
                                    <span class="cc">* 빈 값이거나 옵션의 개수보다 적게 입력되었을 경우 남은 순서대로 '셀렉트박스(S)'로 저장됩니다.</span><br>
                                    <input type="text" name="product_option_style" placeholder="ex) P,B,R">
                                </td>
                            </tr>
                            <tr>
                                <th>옵션 값</th>
                                <td>
                                    <p class="cc2">옵션 입력 방식 : 옵션값 명A&#123;옵션값a|옵션값b|옵션값c&#125;//옵션값 명B&#123;옵션값d|옵션값e|옵션값f&#125;</p>
                                    <input type="text"  name="product_option_input" placeholder="ex) 색상&#123;빨강|파랑|초록&#125;//사이즈&#123;55|66|77&#125;">
                                </td>
                            </tr>
                            <tr>
                                <th>색상 설정</th>
                                <td>
                                    <p class="cc2">옵션 입력 방식 : &#123;색상값a|색상값b|색상값c&#125;//&#123;색상값d|색상값e|색상값f&#125;<br>
                                    <input type="text" name="product_option_color" placeholder="ex) &#123;#ff0000|#0033cc&#125;//&#123;#da294a|#000000|#e9e9e9&#125;">
                                </td>
                            </tr>
                            <tr>
                                <th>필수 여부</th>
                                <td>
                                    <p class="cc2">필수: T, 선택: F<br>
                                    <span class="cc">* 옵션 입력의 옵션명 개수만큼 bar(|)형태로 구분해 입력합니다.</span><br>
                                    <span class="cc">* 품목 구성 방식이 상품연동형, 독립선택형일 경우에만 입력합니다.</span><br>
                                    </p>
                                    <input type="text" name="product_option_required" placeholder="ex) T|F|T">
                                </td>
                            </tr>
                            <tr>
                                <th>가격 노출 관리</th>
                                <td>
                                    <p class="cc2">-: -1000, +: 1000<br>
                                        <span class="cc">* 옵션 입력의 옵션 값 명 개수만큼 bar(|)형태로 구분해 입력합니다.</span><br>
                                    </p>
                                    <input type="text" name="product_option_payment" placeholder="ex) -1000|1000|-1000">
                                </td>
                            </tr>
                            <tr>
                                <th>옵션설명</th>
                                <td>
                                    <input type="text" name="product_option_memo">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red" id="mgOptionAddSubmit">등록하기</button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>옵션값 수정</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form action="" method="GET">
                    <h3>상품 옵션 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>옵션코드</th>
                            <td>B000000C</td>
                        </tr>
                        <tr>
                            <th>옵션명</th>
                            <td>
                                색상
                            </td>
                        </tr>
                        <tr>
                            <th>품목 구성 방식</th>
                            <td>
                                <input type="radio" id="goods-compType-t2" name="goods-compType2" value="T2" checked>
                                <label for="goods-compType-t2">조합형</label>
                                <input type="radio" id="goods-compType-e2" name="goods-compType2" value="E2">
                                <label for="goods-compType-e2">상품연동형</label>
                                <input type="radio" id="goods-compType-f2" name="goods-compType2" value="F2">
                                <label for="goods-compType-f2">독립선택형</label>
                            </td>
                        </tr>
                        <tr class="goods-compType-t-detail2">
                            <th>옵션 표시 방식</th>
                            <td>
                                <input type="radio" id="goods-optionType-c2" name="goods-optionType2" value="C2" checked>
                                <label for="goods-optionType-c2">일체선택형</label>
                                <input type="radio" id="goods-optionType-s2" name="goods-optionType2" value="S2">
                                <label for="goods-optionType-s2">분리선택형</label>
                            </td>
                        </tr>
                        <tr class="goods-compType-e-detail2" style="display:none">
                            <th>옵션 세트명</th>
                            <td>
                                <input type="text" id="goods-optionSet-name" name="goods-optionSet-name">
                            </td>
                        </tr>
                        <tr>
                            <th>옵션 불러오기</th>
                            <td>
                                <button type="button" class="option-mo" name="mo-btn">옵션 추가</button>
                            </td>
                        </tr>
                        <tr>
                            <th>옵션 입력</th>
                            <td>
                                <p class="cc2">옵션 입력 방식 : 옵션명A&#123;옵션값a|옵션값b|옵션값c&#125;//옵션명B&#123;옵션값d|옵션값e|옵션값f&#125;</p>
                                <input type="text" id="goods-option-detail" name="goods-option-detail" placeholder="ex) 색상&#123;빨강|파랑|초록&#125;//사이즈&#123;55|66|77&#125;">
                            </td>
                        </tr>
                        <tr>
                            <th>옵션 스타일</th>
                            <td><p class="cc2">셀렉트박스: S, 미리보기 : P, 텍스트버튼: B, 라디오버튼: R<br>
                                <span class="cc">* '옵션입력'의 미리보기 옵션 순서대로 값이 저장됩니다.</span><br>
                                <span class="cc">* 빈 값이거나 옵션의 개수보다 적게 입력되었을 경우 남은 순서대로 '셀렉트박스(S)'로 저장됩니다.</span><br>
                                <span class="cc">* 미리보기(P)로 입력한 옵션은 색상 설정을 필수 입력해야 합니다.</span></p>
                                <input type="text" id="goods-option-style" name="goods-option-style" placeholder="ex) P,B,S">
                            </td>
                        </tr>
                        <tr>
                            <th>색상 설정</th>
                            <td>
                                <p class="cc2">옵션 입력 방식 : &#123;색상값a|색상값b|색상값c&#125;//&#123;색상값d|색상값e|색상값f&#125;<br>
                                <span class="cc">* '옵션입력'의 미리보기 옵션 순서대로 값이 저장됩니다.</span></p>
                                <input type="text" id="goods-option-color" name="goods-option-color" placeholder="ex) &#123;#ff0000|#0033cc&#125;//&#123;#da294a|#000000|#e9e9e9&#125;">
                            </td>
                        </tr>
                        <tr>
                            <th>필수 여부</th>
                            <td>
                                <p class="cc2">필수: T, 선택: F<br>
                                <span class="cc">* 옵션 입력의 옵션명 개수만큼 bar(|)형태로 구분해 입력합니다.</span><br>
                                <span class="cc">* 품목 구성 방식이 상품연동형, 독립선택형일 경우에만 입력합니다.</span><br>
                                </p>
                                <input type="text" id="goods-option-mandatory2" name="goods-option-mandatory2" placeholder="ex) T|F|T">
                            </td>
                        </tr>
                        <tr>
                            <th>가격 노출 관리</th>
                            <td>
                                <input type="radio" name="price-rd1" id="price-rd1-1">
                                <label for="price-rd1-1">노출</label>
                                <input type="radio" name="price-rd1" id="price-rd1-2" checked>
                                <label for="price-rd1-2">노출 안 함</label>
                            </td>
                        </tr>
                        <tr>
                            <th>옵션설명</th>
                            <td>
                                <p class="cc2"><span class="cc">* 문자, 숫자 200Byte 이내 입력</span></p>
                                <input type="text" name="" id="">
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red">등록하기</button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal2">
        <div class="modal-content">
            <form action="" method="GET">
                <div class="goods-list-wrap1">
                    <div class="modal-header">
                        <h2>옵션 불러오기</h2>
                        <button type="button" class="modal-close4">×</button>
                    </div>
                    <div class="search-form1">
                        <form name="listSrcForm" id="listSrcForm1" method="get">
                            <div class="keyword-src-wrap">
                                <input type="text" class="keyword-src" name="keyword-src">
                                <button type="button" class="keyword-src-button">검색</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-body clearfix">
                        <h3>옵션 정보</h3>
                        <div class="list-sort-wrap">
                            <div class="right">
                                <select name="order" class="order-select">
                                    <option value="32">10개씩 보기</option>
                                    <option value="60">50개씩 보기</option>
                                    <option value="92">100개씩 보기</option>
                                </select>
                            </div>
                        </div>
                        <table>
                            <colgroup>
                                <col width="2%">
                                <col width="5%">
                                <col width="10%">
                                <col width="21%">
                                <col width="21%">
                                <col width="21%">
                                <col width="10%">
                                <col width="10%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                                    <td name="detail">번호</td>
                                    <td name="detail">옵션코드</td>
                                    <td>옵션명</td>
                                    <td>옵션값</td>
                                    <td>옵션설명</td>
                                    <td>옵션스타일</td>
                                    <td>등록일자</td>
                                </tr>
                            </thead>
                            <tbody>
                            <tr>
                                    <td><input type="checkbox" id="chk10" name="chk10"></td>
                                    <td>1</td>
                                    <td>O000000A</td>
                                    <td>색상</td>
                                    <td>블랙,화이트</td>
                                    <td>설명</td>
                                    <td>셀렉트박스</td>
                                    <td>2020.02.21</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk9" name="chk9"></td>
                                    <td>1</td>
                                    <td>O000000A</td>
                                    <td>색상</td>
                                    <td>블랙,화이트</td>
                                    <td>설명</td>
                                    <td>셀렉트박스</td>
                                    <td>2020.02.21</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk8" name="chk8"></td>
                                    <td>1</td>
                                    <td>O000000A</td>
                                    <td>사이즈</td>
                                    <td>S, M, L</td>
                                    <td>설명</td>
                                    <td>셀렉트박스</td>
                                    <td>2020.02.21</td>
                                </tr>
                            </tbody>
                        </table>
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">≪</a></li>
                            <li class="page-item"><a class="page-link" href="#">＜</a></li>
                            <li class="page-item"><a class="page-link active" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">6</a></li>
                            <li class="page-item"><a class="page-link" href="#">7</a></li>
                            <li class="page-item"><a class="page-link" href="#">8</a></li>
                            <li class="page-item"><a class="page-link" href="#">9</a></li>
                            <li class="page-item"><a class="page-link" href="#">10</a></li>
                            <li class="page-item"><a class="page-link" href="#">＞</a></li>
                            <li class="page-item"><a class="page-link" href="#">≫</a></li>
                        </ul>
                    </div>
                </div>
                <button type="button" name="detail" class="btn-red">추가</button>
            </form>
        </div>
    </div>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>