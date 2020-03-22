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
    <link href="../assets/css/creators-apply.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <!--   -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
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
                    <li><a href="index-creators.html">메인</a></li>
                    <li><a href="">크리에이터 정보관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="">크리에이터 정보수정</a></li>
                        </ul>
                    </li>
                    <li><a href="creators-goods.html">영상관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="creators-goods.html">컨텐츠 업로드 페이지</a></li>
                        </ul>
                    </li>
                    <li class="active"><a href="creators-calculate.html">수익관리</a>
                        <ul class="gnb-in-ul">
                            <li><a href="creators-calculate.html">판매관리 페이지</a>
                                <ul>
                                    <li><a href="creators-calculate.html">판매상품 현황조회</a></li>
                                    <li><a href="creators-apply.jsp">판매 행사 신청</a></li>
                                </ul>
                            </li>
                            <li><a href="creators-sale.html">정산</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">판매 행사 신청</h2>
                <div class="main-hd-btn-wrap">
                    <button type="button" name="detail">행사 신청</button>
                </div>
            </div>
            <div class="search-form">
                <form name="" id="" class="listSrcForm1" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="src-company-name" id="src-company-name">
                            <label for="src-company-name">크리에이터명</label>
                            <input type="checkbox" name="src-name" id="src-name">
                            <label for="src-name">상품명</label>
                            <input type="checkbox" name="src-code" id="src-code">
                            <label for="src-code">상품코드</label>
                            <input type="checkbox" name="src-name" id="src-name1">
                            <label for="src-name1">행사명</label>
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
                                <th>카테고리</th>
                                <td>
                                    <select name="src-category">
                                        <option value="전체">전체</option>
                                        <option value="뷰티">뷰티</option>
                                        <option value="식품">식품</option>
                                    </select>
                                    <select name="src-category">
                                        <option value="전체">전체</option>
                                        <option value="수입">수입</option>
                                        <option value="명품">명품</option>
                                        <option value="매스티지">매스티지</option>
                                        <option value="트렌드">트렌드</option>
                                        <option value="해외직구">해외직구</option>
                                    </select>
                                    <select name="src-category">
                                        <option value="전체">전체</option>
                                        <option value="스킨케어">스킨케어</option>
                                        <option value="메이크업">메이크업</option>
                                        <option value="향수">향수</option>
                                        <option value="남성화장품">남성화장품</option>
                                    </select>
                                </td>
                                <th>브랜드</th>
                                <td>
                                    <select name="src-brand">
                                        <option value="전체">전체</option>
                                        <option value="분류1">분류1</option>
                                        <option value="분류2">분류2</option>
                                    </select>
                                    <select name="src-brand">
                                        <option value="전체">전체</option>
                                        <option value="분류1">분류1</option>
                                        <option value="분류2">분류2</option>
                                    </select>
                                    <select name="src-brand">
                                        <option value="전체">전체</option>
                                        <option value="분류1">분류1</option>
                                        <option value="분류2">분류2</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>기간</th>
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
                                <td></th>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="goods-list-wrap creators-align">
                <div class="list-box clearfix">
                    <div class="list-sort-wrap">
                        <div class="left">
                            <button type="button" class="btn-default" name="copy">선택 삭제</button>
                        </div>
                        <div class="right">
                            <select name="order" class="order-select">
                                <option value="32">10개씩 보기</option>
                                <option value="60">50개씩 보기</option>
                                <option value="92">100개씩 보기</option>
                            </select>
                        </div>
                    </div>
                    <table class="sort-wrap-table1">
                        <colgroup>
                            <col width="3%">
                            <col width="5%">
                            <col width="9%">
                            <col width="10%">
                            <col width="16%">
                            <col width="21%">
                            <col width="16%">
                            <col width="17%">
                        </colgroup>
                        <thead>
                            <tr>
                                <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                                <td>번호</td>
                                <td>크리에이터명</td>
                                <td>상품코드</td>
                                <td>상품명/옵션</td>
                                <td>행사명</td>
                                <td>행사기간</td>
                                <td>관리</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" id="chk10" name="chk10"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk9" name="chk9"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk8" name="chk8"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk7" name="chk7"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk6" name="chk6"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk5" name="chk5"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk4" name="chk4"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk3" name="chk3"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk2" name="chk2"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" id="chk1" name="chk1"></td>
                                <td>1</td>
                                <td>원조이라이프</td>
                                <td>000000</td>
                                <td>스킨</td>
                                <td>행사명</td>
                                <td>2020-03-01 ~ 2020-03-30</td>
                                <td>
                                    <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
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
        <!-- 모달 -->
        <div class="modal">
            <div class="modal-content">
                <div class="modal-header">
                   <h2>판매 행사 신청</h2>
                    <button type="button" class="modal-close">×</button>
                </div>
                <div class="modal-body clearfix">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>크리에이터명</th>
                                <td><input type="text" id="" name=""></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td><input type="text" id="" name=""></th>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td><input type="text" id="" name=""></td>
                            </tr>
                            <tr>
                                <th>상품코드</th>
                                <td><input type="text" id="" name=""></td>
                            </tr>
                            <tr>
                                <th>행사명</th>
                                <td><input type="text" id="" name=""></td>
                            </tr>
                            <tr>
                                <th>행사기간</th>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="from_date1" name="from_date1" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="to_date1" name="to_date1" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>판매지정경로</th>
                                <td><input type="text" id="" name=""></td>
                            </tr>
                            <tr>
                                <th>수수료지정</th>
                                <td><input type="text" id="" name=""></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red">신청하기</button>
                </div>
            </div>
        </div>
        <div class="modal1">
            <div class="modal-content">
                <div class="modal-header">
                   <h2>판매 행사 신청</h2>
                    <button type="button" class="modal-close">×</button>
                </div>
                <div class="modal-body clearfix">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>크리에이터명</th>
                                <td><span>-</span></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td><span>-</span></th>
                            </tr>
                            <tr>
                                <th>상품명</th>
                                <td><span>-</span></td>
                            </tr>
                            <tr>
                                <th>상품코드</th>
                                <td><span>-</span></td>
                            </tr>
                            <tr>
                                <th>행사명</th>
                                <td><span>-</span></td>
                            </tr>
                            <tr>
                                <th>행사기간</th>
                                <td><span>2020-03-13</span> ~ <span>2020-03-31</span></td>
                            </tr>
                            <tr>
                                <th>판매지정경로</th>
                                <td><span>-</span></td>
                            </tr>
                            <tr>
                                <th>수수료지정</th>
                                <td><span>-</span></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red">확인</button>
                </div>
            </div>
        </div>
    </main>
   <script type="text/javascript" src="../assets/js/index.js"></script>
</body>
</html>