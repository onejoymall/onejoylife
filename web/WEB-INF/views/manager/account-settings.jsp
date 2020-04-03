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
    <link href="../assets/css/account-settings.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css" rel="stylesheet">
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
                    <li class="active"><a href="account-settings.jsp">계정관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="account-settings.jsp">사용권한 설정</a></li>
                            <li><a href="account-set.jsp">사용자 계정관리</a></li>
                        </ul>
                    </li>
                    <li><a href="">정산관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">업체별 정산내역</a>
                                <ul>
                                    <li><a href="">업체별 정산내역</a></li>
                                    <li><a href="">크리에이터 정산내역</a></li>
                                </ul>
                            </li>
                            <li><a href="">경품관리</a></li>
                        </ul>
                    </li>
                    <li><a href="">CS관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">상품 Q&amp;A</a></li>
                            <li><a href="">상담관리</a>
                                <ul>
                                    <li><a href="">1:1 메일문의 게시판</a></li>
                                    <li><a href="">입점 및 제휴문의</a></li>
                                    <li><a href="">공지사항</a></li>
                                </ul>
                            </li>
                            <li><a href="">상품평관리</a></li>
                            <li><a href="">FAQ</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">사용권한 설정</h2>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="src-id" id="src-id">
                            <label for="src-id">아이디</label>
                            <input type="checkbox" name="src-name" id="src-name">
                            <label for="src-name">이름</label>
                            <input type="checkbox" name="src-phone" id="src-phone">
                            <label for="src-phone">전화번호</label>
                            <input type="checkbox" name="src-mail" id="src-mail">
                            <label for="src-mail">이메일</label>
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
                                   <label for="src-q1">일반회원</label>
                                   <input type="checkbox" name="src-q2" id="src-q2" checked>
                                   <label for="src-q2">관리자회원</label>
                                </td>
                                <th>등록일</th>
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
                        <button type="button" class="btn-default" name="copy">선택 삭제</button>
                        <button type="button" class="btn-default" name="detail">선택 관리자등록</button>
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
                        <col width="4%">
                        <col width="12%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="18%">
                        <col width="15%">
                        <col width="15%">
                        <col width="6%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>구분</td>
                            <td>아이디</td>
                            <td>이름</td>
                            <td>전화번호</td>
                            <td>이메일</td>
                            <td>최근 접속일</td>
                            <td>등록일</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>관리자 회원</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">권한설정</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>일반회원</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="">권한설정</button>
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
               <h2>관리자 등록</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form action="" method="POST">
                <div class="modal-body clearfix">
                    <div class="goods-detail-wrap">
                        <h3>기본설정</h3>
                        <table class="goods-detail-table">
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>접근허용 메뉴</th>
                                    <td>
                                        <input type="checkbox" name="authority-ck" id="authority-ck">
                                        <label for="authority-ck">상품 등록시 분류 선택 권한</label>
                                        <input type="checkbox" name="authority-ck" id="authority-ck2">
                                        <label for="authority-ck2">상품수정 권한</label>
                                        <input type="checkbox" name="authority-ck" id="authority-ck3">
                                        <label for="authority-ck3">상품진열 권한</label> <br>
                                        <input type="checkbox" name="authority-ck" id="authority-ck4">
                                        <label for="authority-ck4">상품판매 권한</label>
                                        <input type="checkbox" name="authority-ck" id="authority-ck5">
                                        <label for="authority-ck5">등록상품 삭제권한</label>
                                        <input type="checkbox" name="authority-ck" id="authority-ck6">
                                        <label for="authority-ck6">게시판 권한</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <button type="button"class="btn-red on">확인</button>
                        <button type="button"class="btn-red on">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>관리자 권한설정</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form action="" method="POST">
                <div class="modal-body clearfix">
                    <div class="goods-detail-wrap">
                        <h3>기본설정</h3>
                        <table class="goods-detail-table">
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>관리자명</th>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <th>관리자 ID</th>
                                    <td>
                                        <input type="text"> <button type="button">중복확인</button>
                                        <p class="p-none cc-red">* 중복된 아이디입니다.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>관리자 PW</th>
                                    <td><input type="password"><p class="">* 영문 대소문자/숫자/특수문자 중 두가지 이상 조합으로 10자리~16자리 또는 세가지 이상 조합으로 8자리~16자리를 입력해야 합니다.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>관리자 PW 확인</th>
                                    <td><input type="password"><p class="p-none cc-red">* 비밀번호가 일치하지 않습니다.</p></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text"></td>
                                </tr>
                            </tbody>
                        </table>
                        <h3>권한설정</h3>
                        <table class="goods-detail-table">
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>상품 등록시 분류 선택 권한</th>
                                    <td>
                                        <input type="radio" name="authority-rd" id="authority-rd-y" checked>
                                        <label for="authority-rd-y">허용</label>
                                        <input type="radio" name="authority-rd" id="authority-rd-n">
                                        <label for="authority-rd-n">허용안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>상품수정 권한</th>
                                    <td>
                                        <input type="radio" name="authority-rd2" id="authority-rd2-y" checked>
                                        <label for="authority-rd2-y">허용</label>
                                        <input type="radio" name="authority-rd2" id="authority-rd2-n">
                                        <label for="authority-rd2-n">허용안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>상품진열 권한</th>
                                    <td>
                                        <input type="radio" name="authority-rd3" id="authority-rd3-y" checked>
                                        <label for="authority-rd3-y">허용</label>
                                        <input type="radio" name="authority-rd3" id="authority-rd3-n">
                                        <label for="authority-rd3-n">허용안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>상품판매 권한</th>
                                    <td>
                                        <input type="radio" name="authority-rd4" id="authority-rd4-y" checked>
                                        <label for="authority-rd4-y">허용</label>
                                        <input type="radio" name="authority-rd4" id="authority-rd4-n">
                                        <label for="authority-rd4-n">허용안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>등록상품 삭제권한</th>
                                    <td>
                                        <input type="radio" name="authority-rd5" id="authority-rd5-y" checked>
                                        <label for="authority-rd5-y">허용</label>
                                        <input type="radio" name="authority-rd5" id="authority-rd5-n">
                                        <label for="authority-rd5-n">허용안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th rowspan="2">게시판 권한설정</th>
                                    <td>
                                        <input type="radio" name="authority-rd6" id="authority-rd6-y" checked>
                                        <label for="authority-rd6-y">허용</label>
                                        <input type="radio" name="authority-rd6" id="authority-rd6-n" value="T2">
                                        <label for="authority-rd6-n">허용안함</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="noti-ck-box">
                                        <input type="checkbox" name="noticeboard-ck" id="noti-ck1" checked>
                                        <label for="noti-ck1">읽기</label>
                                        <input type="checkbox" name="noticeboard-ck" id="noti-ck2" checked>
                                        <label for="noti-ck2">등록</label>
                                        <input type="checkbox" name="noticeboard-ck" id="noti-ck3" checked>
                                        <label for="noti-ck3">수정</label>
                                        <input type="checkbox" name="noticeboard-ck" id="noti-ck4" checked>
                                        <label for="noti-ck4">답변</label>
                                        <input type="checkbox" name="noticeboard-ck" id="noti-ck5" checked>
                                        <label for="noti-ck5">삭제/복원</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <button type="button"class="btn-red on">저장</button>
                        <button type="button"class="btn-red on">취소</button>
                    </div>
                </div>
            </form>
            
        </div>
    </div>
    <script type="text/javascript" src="../assets/js/index.js"></script>
</body>
</html>