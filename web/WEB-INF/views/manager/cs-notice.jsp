<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<!--    <meta name="viewport" content="user-scalable=yes, width=1200, target-densitydpi=medium-dpi" />-->
    <link href="../assets/css/reset.css" rel="stylesheet" type="text/css">      
    <link href="../assets/css/common-admin.css" rel="stylesheet" type="text/css">
    <link href="../assets/css/header-admin.css" rel="stylesheet" type="text/css">
    <link href="../assets/css/cs-notice.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
</head>
<body>
    <header class="clearfix">
        <div class="header-in">
            <div class="header-snb clearfix">
                <a href="index.html"><h1 class="header-logo"><span>onejoylife</span></h1></a>
                <div class="header-snb-right">
                    <ul class="header-snb-nav">
                        <li><a href="">로그인</a></li>
                        <li><a href="">비밀번호 변경</a></li>
                        <li class="language-nav"><a href="">국가선택</a>
                            <ul>
                                <li><a href="">한국</a></li>
                                <li><a href="">미국</a></li>
                                <li><a href="">중국</a></li>
                                <li><a href="">일본</a></li> 
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="header-in">
            <div class="header-gnb">
                <ul class="gnb-out-ul">
                    <li><a href="">운영관리</a></li>
                    <li><a href="">상품관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">상품관리</a>
                                <ul>
                                    <li><a href="">상품리스트</a></li>
                                    <li><a href="">상품등록</a></li>
                                    <li><a href="">업체가격 수정승인</a></li>
                                </ul>
                            </li>
                            <li><a href="">경품관리</a>
                                <ul>
                                    <li><a href="">경품리스트</a></li>
                                    <li><a href="">상품등록</a></li>
                                </ul>
                            </li>
                            <li><a href="">프로모션관리</a>
                                <ul>
                                    <li><a href="">쿠폰 등록 및 관리</a></li>
                                    <li><a href="">메인페이지, 기획전/이벤트 관리</a></li>
                                </ul>
                            </li>
                            <li><a href="">상품속성관리</a>
                                <ul>
                                    <li><a href="">상품옵션설정</a></li>
                                    <li><a href="">서비스 안내관리</a></li>
                                    <li><a href="">브랜드등록</a></li>
                                </ul>
                            </li>
                            <li><a href="">카테고리관리</a></li>
                        </ul>
                    </li>
                    <li><a href="">업체관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">업체관리</a>
                                <ul>
                                    <li><a href="">업체신청현황</a></li>
                                    <li><a href="">업체현황조회</a></li>
                                </ul>
                            </li>
                            <li><a href="">공지사항관리</a></li>
                        </ul>
                    </li>
                    <li><a href="">주문관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">주문관리</a>
                                <ul>
                                    <li><a href="">주문현황관리</a></li>
                                    <li><a href="">주문취소관리</a></li>
                                    <li><a href="">교환/반품처리</a></li>
                                </ul>
                            </li>
                            <li><a href="">배송관리</a>
                                <ul>
                                    <li><a href="">배송준비중 처리</a></li>
                                    <li><a href="">송장번호 입력</a></li>
                                    <li><a href="">배송정보 변경</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="">매출관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">분류별 매출현황</a></li>
                            <li><a href="">상품별 매출현황</a></li>
                            <li><a href="">날짜별 매출현황</a></li>
                        </ul>
                    </li>
                    <li><a href="">회원관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">일반 회원관리</a></li>
                            <li><a href="">회원 마케팅관리</a></li>
                        </ul>
                    </li>
                    <li><a href="">계정관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">사용권한 설정</a></li>
                            <li><a href="">사용자 계정관리</a></li>
                        </ul>
                    </li>
                    <li><a href="calculate-company.html">정산관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="calculate-company.html">업체별 정산내역</a>
                                <ul>
                                    <li><a href="calculate-company.html">업체별 정산내역</a></li>
                                    <li><a href="calculate-creators.html">크리에이터 정산내역</a></li>
                                </ul>
                            </li>
                            <li><a href="calculate-gift.html">경품관리</a></li>
                        </ul>
                    </li>
                    <li class="active"><a href="cs-qna.jsp">CS관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="cs-qna.jsp">상품 Q&amp;A</a></li>
                            <li><a href="cs-mail.jsp">상담관리</a>
                                <ul>
                                    <li><a href="cs-mail.jsp">1:1 메일문의 게시판</a></li>
                                    <li><a href="cs-enquiry.jsp">입점 및 제휴문의</a></li>
                                    <li><a href="cs-notice.jsp">공지사항</a></li>
                                </ul>
                            </li>
                            <li><a href="cs-review.jsp">상품평관리</a></li>
                            <li><a href="cs-faq.jsp">FAQ</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">쇼핑몰 공지사항</h2>
                <div class="main-hd-btn-wrap">
                    <button type="button" name="detail">게시글 등록</button>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button><div class="src-filter-wrap">
                            <input type="checkbox" id="src-id">
                            <label for="src-id">작성자</label>
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
                                <th>분류</th>
                                <td>
                                   <input type="checkbox" name="src-q1" id="src-q1" checked>
                                   <label for="src-q1">공지</label>
                                   <input type="checkbox" name="src-q2" id="src-q2" checked>
                                   <label for="src-q2">이벤트</label>
                                   <input type="checkbox" name="src-q3" id="src-q3" checked>
                                   <label for="src-q3">긴급공지</label>
                                </td>
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
                        <col width="50%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>번호</td>
                            <td>분류</td>
                            <td>작성자</td>
                            <td>제목</td>
                            <td>등록일</td>
                            <td>조회수</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>01</td>
                            <td>공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>01</td>
                            <td>이벤트</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>01</td>
                            <td>긴급공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>01</td>
                            <td>공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>01</td>
                            <td>공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>01</td>
                            <td>공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>01</td>
                            <td>공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>01</td>
                            <td>공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>01</td>
                            <td>공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">수정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>01</td>
                            <td>공지</td>
                            <td>관리자</td>
                            <td>공지사항입니다.</td>
                            <td>2020-03-04</td>
                            <td>0</td>
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
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>게시글 등록</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form action="" method="POST">
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
                                    <p><input type="checkbox" id="date-ck1" value="T" checked><label for="date-ck1">공지글 입니다.</label></p>
                                    <div class="check-in1">
                                        <p><input type="radio" name="date-ra" id="date-rd1"><label for="date-rd1">공지글 영역과 리스트 영역에 해당 글이 보여집니다.</label></p>
                                        <p class="cla-box">
                                            <input type="radio" name="date-ra" id="date-rd2">
                                            <label for="date-rd2">공지글 영역에서 특정기간동안(설정 시)만 해당 글이 보여집니다.</label> 
                                        </p>
                                        <div class="input-box3">
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
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red">수정하기</button>
                </div>
            </form>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>게시글 수정</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form action="" method="POST">
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
                                    <p><input type="checkbox" id="date-ck2" value="T2" checked><label for="date-ck2">공지글 입니다.</label></p>
                                    <div class="check-in2">
                                        <p><input type="radio" name="date1-ra" id="date1-rd1"><label for="date1-rd1">공지글 영역과 리스트 영역에 해당 글이 보여집니다.</label></p>
                                        <p class="cla-box">
                                            <input type="radio" name="date1-ra" id="date1-rd2">
                                            <label for="date1-rd2">공지글 영역에서 특정기간동안(설정 시)만 해당 글이 보여집니다.</label> 
                                        </p>
                                        <div class="input-box3">
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
                                    <input type="text" id="goods-stock2" name="goods-stock" placeholder="제목을 입력해 주세요." value="게시글 제목입니다.">
                                </td>
                            </tr>
                            <tr>
                                <th class="modal-td-head">내용</th>
                                <td>
                                    <textarea name="user-notice" id="summernote2">게시글 내용입니다.</textarea>
                                </td>
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
</body>
</html>