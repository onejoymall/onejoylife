<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">1:1 문의</h2>
            </div>
            <div class="dashboard-wrap">
                <div class="open-arrow"></div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                    	<input type="hidden" name="bgno" value="15"/>
                        <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <button type="submit" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
							<input type="checkbox" name="searchType" value="brdwriter" id="check2" checked>
	                        <label for="check2">작성자</label>
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
                                <th>질문 유형</th>
                                <td>
                                    <select name="question_type">
                                        <option value="" <c:if test="${param.question_type == ''}">selected</c:if>>선택</option>
                                        <option value="S" <c:if test="${param.question_type == 'S'}">selected</c:if>>대량주문</option>
                                        <option value="O" <c:if test="${param.question_type == 'O'}">selected</c:if>>주문/결제</option>
                                        <option value="C" <c:if test="${param.question_type == 'C'}">selected</c:if>>교환/반품/환불</option>
                                        <option value="E" <c:if test="${param.question_type == 'E'}">selected</c:if>>이벤트</option>
                                        <option value="D" <c:if test="${param.question_type == 'D'}">selected</c:if>>배송</option>
                                        <option value="G" <c:if test="${param.question_type == 'G'}">selected</c:if>>기타</option>
                                    </select>
                                </td>
                                <th>답변 상태</th>
                                <td>
                                   <input type="checkbox" name="answer_yn" id="src-before" value="N" <c:if test="${fn:contains(searchVO.answer_yn, 'N')}">checked</c:if>>
                                   <label for="src-before">답변전</label>
                                   <input type="checkbox" name="answer_yn" id="src-after" value="Y" <c:if test="${fn:contains(searchVO.answer_yn, 'Y')}">checked</c:if>>
                                   <label for="src-after">답변완료</label>
                                </td>
                            </tr>

                            <tr>
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
                        <button type="button" class="goods-list-btn" name="copy">선택 삭제</button>
                        <button type="button" class="btn-default excelBtn" name="copy" data-id="oneToOne"><i class="exel-ic"></i>다운로드</button>
                    </div>

                </div>
                <table>
                    <colgroup>
                        <col width="4%">
                        <col width="6%">
                        <col width="10%">
                        <col width="10%">
                        <col width="30%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>번호</td>
                            <td>작성일</td>
                            <td>작성자</td>
                            <td>상품명/옵션</td>
                            <td>답변여부</td>
                            <td>답변일</td>
<%--                            <td>상태</td>--%>
                        </tr>
                    </thead>
                    <tbody>
                <c:forEach var="listview" items="${listview}" varStatus="status">
                    <c:url var="link" value="/Manager/boardRead">
                        <c:param name="brdno" value="${listview.brdno}" />
                    </c:url>
                       <tr>
                            <td><input type="checkbox" name="chk" value="${listview.brdno}"></td>
                            <td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></td>
                           <td><c:out value="${listview.brddate}"/></td>
                           <td><c:out value="${listview.brdwriter}"/></td>

                            <td>
                                <a href="${link}"><c:out value="${listview.brdtitle}"/></a>

                            </td>
                            <td class="ok-color">
                                <c:if test="${listview.replycnt>0}">
                                    답변완료
                                </c:if>
                                <c:if test="${listview.replycnt<=0}">
                                    -
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${not empty listview.redate}">
                                    ${listview.redate}
                                </c:if>
                                <c:if test="${empty listview.redate}">
                                    -
                                </c:if>
                            </td>
<%--                            <td>--%>
<%--                                <button type="button" class="goods-list-btn on" name="detail">답변하기</button>--%>
<%--                            </td>--%>
                        </tr>
                </c:forEach>
                    </tbody>
                </table>
                <form id="form1" name="form1"  method="get">
                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                    <input type="hidden" name="bgno" value="${bgInfo.bgno}">
                </form>
            </div>
        </div>
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>상품 Q&amp;A 답변</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form action="" method="POST">
                <div class="modal-body clearfix">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>작성자</th>
                                <td><span>unknown01</span></td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td><span>2020-03-04</span> <span>(00:00:00)</span></td>
                            </tr>
                            <tr>
                                <th>상품 Q&amp;A 제목</th>
                                <td><span>상품문의합니다.</span></td>
                            </tr>
                            <tr>
                                <th>상품 Q&amp;A 내용</th>
                                <td><span>상품문의에 대한 내용입니다.</span></td>
                            </tr>
                            <tr>
                                <th>답변제목</th>
                                <td><input type="text" placeholder="답변제목을 입력해 주세요."></td>
                            </tr>
                            <tr>
                                <th>답변내용</th>
                                <td><textarea name="mem-push" id="summernote"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red">답변하기</button>
                </div>
            </form>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>상품 Q&amp;A 상세보기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form action="" method="POST">
                <div class="modal-body clearfix">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>작성자</th>
                                <td><span>unknown01</span></td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td><span>2020-03-04</span> <span>(00:00:00)</span></td>
                            </tr>
                            <tr>
                                <th>상품 Q&amp;A 제목</th>
                                <td><span>상품문의합니다.</span></td>
                            </tr>
                            <tr>
                                <th>상품 Q&amp;A 내용</th>
                                <td><span>상품문의에 대한 내용입니다.</span></td>
                            </tr>
                            <tr>
                                <th>답변제목</th>
                                <td><input type="text" placeholder="답변제목을 입력해 주세요."></td>
                            </tr>
                            <tr>
                                <th>답변일</th>
                                <td><span>2020-03-04</span> <span>(00:00:00)</span></td>
                            </tr>
                            <tr>
                                <th>답변내용</th>
                                <td><textarea name="mem-push" id="summernote2"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red">수정하기</button>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="../assets/js/index.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
    <script>
        //summernote
        $(document).ready(function (){
            $('#summernote').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
            $('#summernote2').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
        });
    </script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>