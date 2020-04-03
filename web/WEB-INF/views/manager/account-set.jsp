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
    <link href="../assets/css/account-set.css" rel="stylesheet" type="text/css">
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
                    <li class="active"><a href="">계정관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">사용권한 설정</a></li>
                            <li><a href="">사용자 계정관리</a></li>
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
                <h2 name="detail">사용자 계정 관리</h2>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="src-name" id="src-name">
                            <label for="src-name">아이디</label>
                            <input type="checkbox" name="src-code" id="src-code">
                            <label for="src-code">관리자명</label>
                            <input type="checkbox" name="src-phone" id="src-phone">
                            <label for="src-phone">전화번호</label>
                            <input type="checkbox" name="src-mail" id="src-mail">
                            <label for="src-mail">이메일</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="goods-list-wrap">
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
                            <td>관리자명</td>
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
                            <td>대표관리자</td>
                            <td>unknown01</td>
                            <td>홍길동</td>
                            <td>010-0000-0000</td>
                            <td>unknown01@gmail.com</td>
                            <td>2020-03-30</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>관리자</td>
                            <td>unknown01</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>관리자</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>관리자</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>관리자</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>관리자</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>관리자</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>관리자</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>관리자</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>관리자</td>
                            <td>unknown02</td>
                            <td>김철수</td>
                            <td>010-0000-0000</td>
                            <td>unknown02@gmail.com</td>
                            <td>2020-03-21</td>
                            <td>2019-11-05</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">수정하기</button>
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
               <h2>관리자 계정 수정</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <div class="goods-detail-wrap">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>구분</th>
                                <td>
                                    <select id="admin-grade" name="admin-grade">
                                        <option value="대표관리자">대표관리자</option>
                                        <option value="관리자">관리자</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td>unknown01</td>
                            </tr>
                            <tr>
                                <th>관리자명</th>
                                <td>홍길동</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>010-0000-0000</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>unknown01@gmail.com</td>
                            </tr>
                            <tr>
                                <th>최근 접속일</th>
                                <td>2020-03-15</td>
                            </tr>
                            <tr>
                                <th>등록일</th>
                                <td>2020-03-15</td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="cancel" class="btn-red cancelbtn on">수정하기</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../assets/js/index.js"></script>
</body>
</html>