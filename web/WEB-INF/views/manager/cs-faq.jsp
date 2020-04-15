<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">FAQ 관리</h2>
                <div class="main-hd-btn-wrap">
                    <button type="button" name="detail">게시글 등록</button>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button><div class="src-filter-wrap">
                            <input type="checkbox" id="src-name">
                            <label for="src-name">FAQ</label>
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
                                <th>분류</th>
                                <td colspan="3">
                                   <input type="checkbox" name="src-q1" id="src-q1" checked>
                                   <label for="src-q1">회원정보관련</label>
                                   <input type="checkbox" name="src-q2" id="src-q2" checked>
                                   <label for="src-q2">주문결제</label>
                                   <input type="checkbox" name="src-q3" id="src-q3" checked>
                                   <label for="src-q3">배송안내</label>
                                   <input type="checkbox" name="src-q4" id="src-q4" checked>
                                   <label for="src-q4">주문취소</label>
                                   <input type="checkbox" name="src-q5" id="src-q5" checked>
                                   <label for="src-q5">환불요청</label>
                                   <input type="checkbox" name="src-q6" id="src-q6" checked>
                                   <label for="src-q6">상품관련</label>
                                   <input type="checkbox" name="src-q7" id="src-q7" checked>
                                   <label for="src-q7">포인트/이벤트</label>
                                   <input type="checkbox" name="src-q8" id="src-q8" checked>
                                   <label for="src-q8">기타</label>
                                </td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="from_date" name="from_date" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="to_date" name="to_date" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </td>   
                                <th></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="goods-list-wrap">
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="goods-list-btn" name="copy">선택 삭제</button>
                    </div>
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
                        <col width="5%">
                        <col width="10%">
                        <col width="50%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>번호</td>
                            <td>작성자</td>
                            <td>분류</td>
                            <td>FAQ</td>
                            <td>등록일</td>
                            <td>조회수</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>회원정보관련</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>주문결제</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>배송안내</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>주문취소</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>환불요청</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>상품관련</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>포인트/이벤트</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>기타</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>기타</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>01</td>
                            <td>관리자</td>
                            <td>기타</td>
                            <td>자주묻는질문입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
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
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>FAQ 작성</h2>
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
                                <td><span>관리자</span></td>
                            </tr>
                            <tr>
                                <th>분류</th>
                                <td>
                                    <input type="radio" id="faq-rd1" name="faq-rd">
                                    <label for="faq-rd1">회원정보관련</label>
                                    <input type="radio" id="faq-rd2" name="faq-rd">
                                    <label for="faq-rd2">주문결제</label>
                                    <input type="radio" id="faq-rd3" name="faq-rd">
                                    <label for="faq-rd3">배송안내</label>
                                    <input type="radio" id="faq-rd4" name="faq-rd">
                                    <label for="faq-rd4">주문취소</label>
                                    <input type="radio" id="faq-rd5" name="faq-rd" checked>
                                    <label for="faq-rd5">환불요청</label>
                                    <input type="radio" id="faq-rd6" name="faq-rd" checked>
                                    <label for="faq-rd6">상품관련</label>
                                    <input type="radio" id="faq-rd7" name="faq-rd" checked>
                                    <label for="faq-rd7">포인트/이벤트</label>
                                    <input type="radio" id="faq-rd8" name="faq-rd" checked>
                                    <label for="faq-rd8">기타</label>
                                </td>
                            </tr>
                            <tr>
                                <th>FAQ 질문</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th>FAQ 답변</th>
                                <td><textarea name="mem-push" id="summernote"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red">등록하기</button>
                </div>
            </form>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>FAQ 상세보기</h2>
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
                                <td><span>관리자</span></td>
                            </tr>
                            <tr>
                                <th>분류</th>
                                <td>
                                    <input type="radio" id="faq1-rd1" name="faq1-rd">
                                    <label for="faq1-rd1">회원정보관련</label>
                                    <input type="radio" id="faq1-rd2" name="faq1-rd">
                                    <label for="faq1-rd2">주문결제</label>
                                    <input type="radio" id="faq1-rd3" name="faq1-rd">
                                    <label for="faq1-rd3">배송안내</label>
                                    <input type="radio" id="faq1-rd4" name="faq1-rd">
                                    <label for="faq1-rd4">주문취소</label>
                                    <input type="radio" id="faq1-rd5" name="faq1-rd" checked>
                                    <label for="faq1-rd5">환불요청</label>
                                    <input type="radio" id="faq1-rd6" name="faq1-rd" checked>
                                    <label for="faq1-rd6">상품관련</label>
                                    <input type="radio" id="faq1-rd7" name="faq1-rd" checked>
                                    <label for="faq1-rd7">포인트/이벤트</label>
                                    <input type="radio" id="faq1-rd8" name="faq1-rd" checked>
                                    <label for="faq1-rd8">기타</label>
                                </td>
                            </tr>
                            <tr>
                                <th>FAQ 질문</th>
                                <td><input type="text"></td>
                            </tr>
                            <tr>
                                <th>FAQ 답변</th>
                                <td><textarea name="mem-push" id="summernote2"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red">수정하기</button>
                </div>
            </form>
        </div>
    </div>

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