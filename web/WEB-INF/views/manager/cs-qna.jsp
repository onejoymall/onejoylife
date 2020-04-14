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
    <link href="../assets/css/cs-qna.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
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
                <h2 name="detail">상품 Q&amp;A</h2>
            </div>
            <div class="dashboard-wrap">
                <div class="open-arrow"></div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="src-name" id="src-name">
                            <label for="src-name">상품명</label>
                            <input type="checkbox" name="src-code" id="src-code">
                            <label for="src-code">상품코드</label>
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
                                   <input type="checkbox" name="src-q1" id="src-q1" checked>
                                   <label for="src-q1">상품문의</label>
                                   <input type="checkbox" name="src-q2" id="src-q2" checked>
                                   <label for="src-q2">배송문의</label>
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
                                <th>질문일</th>
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
                            <td>상태</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td class="ok-color">답변전</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn on" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td>답변완료</td>
                            <td>2020-03-13</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td>답변완료</td>
                            <td>2020-03-13</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td>답변완료</td>
                            <td>2020-03-13</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td class="ok-color">답변전</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn on" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td class="ok-color">답변전</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn on" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td class="ok-color">답변전</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn on" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td class="ok-color">답변전</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn on" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td class="ok-color">답변전</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn on" name="detail">답변하기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>654988</td>
                            <td>2020-03-13</td>
                            <td>unknown01</td>
                            <td>제주 신선 한라봉/1KG</td>
                            <td class="ok-color">답변전</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn on" name="detail">답변하기</button>
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
</body>
</html>