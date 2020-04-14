<!DOCTYPE html>

    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">공지사항 관리</h2>
            </div>
            <div class="main-tab-box">
                <p class="main-tab on" data-tab="tab-on1">업체 공지사항관리</p>
                <p class="main-tab" data-tab="tab-on2">고객 공지사항관리</p>
            </div>
            <div class="tab-box on" id="tab-on1">
                <div class="search-form">
                    <form name="listSrcForm" id="listSrcForm" method="get">
                        <div class="keyword-src-wrap">
                            <input type="text" class="keyword-src" name="keyword-src">
                            <button type="button" class="keyword-src-button">검색</button>
                        </div>
                    </form>
                </div>
                <div class="goods-list-wrap">
                    <div class="list-box clearfix">
                        <div class="list-sort-wrap">
                            <div class="left">
                                <button type="button" class="goods-list-btn" name="copy">선택 삭제</button>
                                <button type="button" class="goods-list-btn" name="detail">공지사항 글쓰기</button>
                            </div>
                            <div class="right">
                                
                            </div>
                        </div>
                        <table class="sort-wrap-table1">
                            <colgroup>
                                <col width="2%">
                                <col width="2%">
                                <col width="5%">
                                <col width="5%">
                                <col width="74%">
                                <col width="5%">
                                <col width="2%">
                                <col width="5%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <td><input type="checkbox" id="all-chk1" name="all-chk1"></td>
                                    <td>번호</td>
                                    <td>작성자</td>
                                    <td>분류</td>
                                    <td>제목</td>
                                    <td>등록일</td>
                                    <td>조회수</td>
                                    <td>관리</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" id="chk1-10" name="chk1-10"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-9" name="chk1-9"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-8" name="chk1-8"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-7" name="chk1-7"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-6" name="chk1-6"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-5" name="chk1-5"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-4" name="chk1-4"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-3" name="chk1-3"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-2" name="chk1-2"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" id="chk1-1" name="chk1-1"></td>
                                    <td>01</td>
                                    <td>원조이라이프</td>
                                    <td>공지사항</td>
                                    <td>공지사항 입니다.</td>
                                    <td>2020.02.12</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
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
            <div class="tab-box" id="tab-on2">
                <div class="search-form">
                    <form name="listSrcForm" id="listSrcForm" method="get">
                        <div class="keyword-src-wrap">
                            <input type="text" class="keyword-src" name="keyword-src">
                            <button type="button" class="keyword-src-button">검색</button>
                        </div>
                    </form>
                </div>
                <div class="goods-list-wrap">
                    <div class="list-sort-wrap">
                        <div class="left">
                            <button type="button" class="goods-list-btn" name="copy">선택 삭제</button>
                            <button type="button" class="goods-list-btn" name="detail">공지사항 글쓰기</button>
                        </div>
                        <div class="right">
                            
                        </div>
                    </div>
                    <table class="sort-wrap-table2">
                        <colgroup>
                            <col width="2%">
                            <col width="2%">
                            <col width="5%">
                            <col width="5%">
                            <col width="74%">
                            <col width="5%">
                            <col width="2%">
                            <col width="5%">
                        </colgroup>
                        <thead>
                            <tr>
                                <td><input type="checkbox" id="all-chk1" name="all-chk1"></td>
                                <td>번호</td>
                                <td>작성자</td>
                                <td>분류</td>
                                <td>제목</td>
                                <td>등록일</td>
                                <td>조회수</td>
                                <td>관리</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" id="chk1-10" name="chk1-10"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-9" name="chk1-9"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-8" name="chk1-8"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-7" name="chk1-7"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-6" name="chk1-6"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-5" name="chk1-5"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-4" name="chk1-4"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-3" name="chk1-3"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-2" name="chk1-2"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1-1" name="chk1-1"></td>
                                <td>01</td>
                                <td>원조이라이프</td>
                                <td>공지사항</td>
                                <td>공지사항 입니다.</td>
                                <td>2020.02.12</td>
                                <td>1</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">수정</button>
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
        </div>
         <!-- 모달 -->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>게시글 등록</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="10%">
                        <col width="90%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>작성자</th>
                            <td><span>원조이라이프</span></td>
                        </tr>
                        <tr>
                            <th class="modal-td-head">분류</th>
                            <td>
                                <select name="" id="">
                                    <option value="-분류선택-">-분류선택-</option>
                                    <option value="공지">공지</option>
                                    <option value="이벤트">이벤트</option>
                                    <option value="긴급공지">긴급공지</option>
                                </select>
                                <span style="display: none;" class="err-color">!분류를 선택해 주세요.</span>
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-td-head">공지글 여부</th>
                            <td>
                                <p><input type="checkbox" id="date-ck1"><label for="date-ck1">공지글 입니다.</label></p>
                                <div class="check-in">
                                    <p><input type="radio" name="date-ra" id="date-rd1"><label for="date-rd1">공지글 영역과 리스트 영역에 해당 글이 보여집니다.</label></p>
                                    <p class="cla-box">
                                        <input type="radio" name="date-ra" id="date-rd2">
                                        <label for="date-rd2">공지글 영역에서 특정기간동안(설정 시)만 해당 글이 보여집니다.</label> 
                                    </p>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="from_date" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="to_date" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </div>
                                
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-td-head">제목</th>
                            <td>
                                <input type="text" id="goods-stock" name="goods-stock" placeholder="제목을 입력해 주세요.">
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-td-head">내용</th>
                            <td>
                                <textarea name="company-notice" id="summernote"></textarea>
                            </td>
                        </tr>
                        <tr class="modal-tr">
                            <td colspan="2" class="modal-td-head" >
                                저장후
                                <input type="radio" name="save-rd" id="save-rd1"><label for="save-rd1">목록으로 이동</label>
                                <input type="radio" name="save-rd" id="save-rd2"><label for="save-rd2">본문으로 이동</label>
                                <input type="radio" name="save-rd" id="save-rd3"><label for="save-rd3">이 화면 유지</label>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red">수정하기</button>
            </div>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
                <h2>게시글 수정</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="10%">
                        <col width="90%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>작성자</th>
                            <td><span>원조이라이프</span></td>
                        </tr>
                        <tr>
                            <th class="modal-td-head">분류</th>
                            <td>
                                <select name="" id="">
                                    <option value="-분류선택-">-분류선택-</option>
                                    <option value="공지">공지</option>
                                    <option value="이벤트">이벤트</option>
                                    <option value="긴급공지">긴급공지</option>
                                </select>
                                <span style="display: none;" class="err-color">!분류를 선택해 주세요.</span>
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-td-head">공지글 여부</th>
                            <td>
                                <p><input type="checkbox" id="date-ck2"><label for="date-ck2">공지글 입니다.</label></p>
                                <div class="check-in">
                                    <p><input type="radio" name="date1-ra" id="date1-rd1"><label for="date1-rd1">공지글 영역과 리스트 영역에 해당 글이 보여집니다.</label></p>
                                    <p class="cla-box">
                                        <input type="radio" name="date1-ra" id="date1-rd2">
                                        <label for="date1-rd2">공지글 영역에서 특정기간동안(설정 시)만 해당 글이 보여집니다.</label> 
                                    </p>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="from_date1" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="to_date1" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </div>
                                
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-td-head">제목</th>
                            <td>
                                <input type="text" id="goods-stock2" name="goods-stock" placeholder="제목을 입력해 주세요.">
                            </td>
                        </tr>
                        <tr>
                            <th class="modal-td-head">내용</th>
                            <td>
                                <textarea name="user-notice" id="summernote2"></textarea>
                            </td>
                        </tr>
                        <tr class="modal-tr">
                            <td colspan="2" class="modal-td-head" >
                                저장후
                                <input type="radio" name="save1-rd" id="save1-rd1"><label for="save1-rd1">목록으로 이동</label>
                                <input type="radio" name="save1-rd" id="save1-rd2"><label for="save1-rd2">본문으로 이동</label>
                                <input type="radio" name="save1-rd" id="save1-rd3"><label for="save1-rd3">이 화면 유지</label>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red">수정하기</button>
            </div>
        </div>
    </div>
    </main>
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
    <script type="text/javascript" src="../assets/js/index.js"></script>
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
