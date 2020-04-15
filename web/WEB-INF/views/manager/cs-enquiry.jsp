<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">입점 및 제휴문의</h2>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button><div class="src-filter-wrap">
                            <input type="checkbox" id="src-type">
                            <label for="src-type">문의유형</label>
                            <input type="checkbox" id="src-id">
                            <label for="src-id">아이디</label>
                            <input type="checkbox" id="src-name">
                            <label for="src-name">제목</label>
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
                                <th>문의 유형</th>
                                <td>
                                   <input type="checkbox" name="src-q1" id="src-q1" checked>
                                   <label for="src-q1">입점문의</label>
                                   <input type="checkbox" name="src-q2" id="src-q2" checked>
                                   <label for="src-q2">제휴문의</label>
                                </td>
                                <th>답변 상태</th>
                                <td>
                                   <input type="checkbox" name="src-before" id="src-before" checked>
                                   <label for="src-before">답변전</label>
                                   <input type="checkbox" name="src-after" id="src-after" checked>
                                   <label for="src-after">답변완료</label>
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
                        <col width="5%">
                        <col width="10%">
                        <col width="30%">
                        <col width="10%">
                        <col width="5%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>번호</td>
                            <td>문의유형</td>
                            <td>업체명</td>
                            <td>담당자명</td>
                            <td>담당자 연락처</td>
                            <td>제목</td>
                            <td>작성일</td>
                            <td>상태</td>
                            <td>답변일</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>01</td>
                            <td>입점문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td class="ok-color">답변전</td>
                            <td> - </td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>01</td>
                            <td>입점문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td class="ok-color">답변전</td>
                            <td> - </td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>01</td>
                            <td>입점문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td class="ok-color">답변전</td>
                            <td> - </td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>01</td>
                            <td>입점문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td class="ok-color">답변전</td>
                            <td> - </td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>01</td>
                            <td>입점문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td class="ok-color">답변전</td>
                            <td> - </td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>01</td>
                            <td>입점문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td class="ok-color">답변전</td>
                            <td> - </td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>01</td>
                            <td>입점문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td class="ok-color">답변전</td>
                            <td> - </td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>01</td>
                            <td>입점문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td>답변완료</td>
                            <td>2020-03-05</td>
                            <td>
                                <button type="button" class="goods-list-btn color-gray" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>01</td>
                            <td>제휴문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td>답변완료</td>
                            <td>2020-03-05</td>
                            <td>
                                <button type="button" class="goods-list-btn color-gray" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>01</td>
                            <td>제휴문의</td>
                            <td>원조이라이프</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>입점문의 제목입니다.</td>
                            <td>2020-03-04</td>
                            <td>답변완료</td>
                            <td>2020-03-05</td>
                            <td>
                                <button type="button" class="goods-list-btn color-gray" name="detail1">상세보기</button>
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
               <h2>입점 및 제휴 문의답변</h2>
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
                                <td><span>onejoylife12</span></td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td><span>2020-03-04</span> <span>(00:00:00)</span></td>
                            </tr>
                            <tr>
                                <th>문의제목</th>
                                <td><span>입점 및 제휴 문의합니다.</span></td>
                            </tr>
                            <tr>
                                <th>문의내용</th>
                                <td><span>입점 및 제휴에 대한 내용입니다.</span></td>
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
               <h2>1:1문의답변</h2>
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
                                <td><span>onejoylife12</span></td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td><span>2020-03-04</span> <span>(00:00:00)</span></td>
                            </tr>
                            <tr>
                                <th>문의제목</th>
                                <td><span>입점 및 제휴 문의합니다.</span></td>
                            </tr>
                            <tr>
                                <th>문의내용</th>
                                <td><span>입점 및 제휴에 대한 내용입니다.</span></td>
                            </tr>
                            <tr>
                                <th>답변제목</th>
                                <td><input type="text" value="답변 제목입니다."></td>
                            </tr>
                            <tr>
                                <th>답변일</th>
                                <td><span>2020-03-04</span> <span>(00:00:00)</span></td>
                            </tr>
                            <tr>
                                <th>답변내용</th>
                                <td><textarea name="mem-push" id="summernote2">답변 내용입니다.</textarea></td>
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