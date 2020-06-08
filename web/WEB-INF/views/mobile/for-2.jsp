<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <link href="../../assets/css/reset.css" rel="stylesheet" type="text/css">      
    <link href="../../assets/css/mobile/common-mobile.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&display=swap&subset=korean" rel="stylesheet">
<!--
    [if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]
-->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src="../../assets/js/common-mobile.js"></script>
</head>
<body class="pt-48 pb-5">
    <header class="header clearfix">
        <div class="top-inner">
            <button class="back-arr"><i class="back-ic"></i></button>
            <p class="header-tit">아이디/비밀번호 찾기</p>
        </div>
    </header>
    <section class="subheader">
        <ul class="taps">
            <li><a href="javascript:show(1)" id="tap1" class="active">아이디 찾기</a></li>
            <li><a href="javascript:show(2)" id="tap2">비밀번호 찾기</a></li>
        </ul>
    </section>
    <section class="wrap clearfix" id="write">
        <form action="">
            <p class="text-md mt-2 mb-05">아이디 찾기 방법</p>
            <input type="radio" id="id-num-rd1" name="">
            <label for="id-num-rd1">등록된 휴대폰(가입 시 선택사항)</label>
            <!-- <hr class=" mt-2 mb-2"> -->
            <div class="id-num1">
                <p class="text-md mt-3 mb-05">등록한 휴대폰 번호</p>
                
                <div class="input-group">
                    <input type="text" placeholder="010-1234-1234"> 
                    <button type="button">인증번호 전송</button>
                </div>
                <p class="error mt-05">* 입력하신 번호로 계정을 찾을수 없습니다.</p>
            </div>
            <div class="id-num2" style="display: none;">
                <p class="text-md mt-3 mb-05">인증번호</p>
                <input type="text">
                <p class="error mt-05">* 입력하신 인증번호가 일치하지 않습니다.</p>
            </div>
            
            <button type="button" class="id-pw-btn">확인</button>
        </form>
    </section>
    <section class="wrap clearfix pw-num" id="list">
        <h2 class="pb-1 mt-3">신규 비밀번호 입력</h2>
        <hr class="">
        <form action="">
            <p class="text-md mt-2 mb-05">비밀번호</p>
            <input type="text">
            <p class="mt-05">
                * 6~20자의 영문, 숫자를 조합하여 입력하여 주세요.</p>
            <p class="error mt-05">
                * 6~20자의 영문, 숫자를 조합하여 입력하여 주세요.</p>
            <p class="text-md mt-3 mb-05">아이디(이메일)</p>
            <input type="text">
            <p class="error mt-05">* 입력하신 이메일로 신규비밀번호를 전송했습니다.</p>
            <button type="button" class="id-pw-btn">취소</button>
            <button type="button" class="id-pw-btn">확인</button>

        </form>
    </section>
    <nav class="nav">
        <ul>
            <li><a href="#" id="nav-cate"><i class="cate-ic">카테고리</i></a></li>
            <li><a href="../../index-mobile.html" id="nav-home"><i class="home-ic">홈</i></a></li>
            <li><a href="search" id="nav-src"><i class="src-ic">검색</i></a></li>
            <li><a href="mypage-main.html" id="nav-user"><i class="user-ic">마이페이지</i></a></li>
        </ul>
    </nav>
    <div class="category">
       <div class="cate-bg"></div>
        <div class="content">
            <div class="cate-close"><span></span></div>
            <header class="cate-hd">
                <div class="cate-hdTop">
                    <p><span>asiddfdfj@naver.com</span>님 환영합니다.</p>
<!--                    <a href="#" class="login">로그인 ＞</a>-->
                </div>
                <ul class="cate-hdBtm">
                    <li><a href="sub/mobile/mypage-main.html"><i class="user-ic"></i><p>마이페이지</p></a></li>
                    <li><a href="sub/mobile/mypage-6.html"><i class="ship-ic"></i><p>주문/배송</p></a></li>
                    <li><a href="sub/mobile/mypage-5.html"><i class="heart-ic"></i><p>위시리스트</p></a></li>
                    <li><a href="sub/mobile/help-4-2.html"><i class="call-ic"></i><p>고객센터</p></a></li>
                </ul>
            </header>
            <div class="cate-body">
                <h4 class="cate-ttl">카테고리</h4>
                <hr>
                <ul class="cateList">
                    <li>
                        <a href="#">뷰티</a>
                        <ul class="cateList-2dp">
                            <li>
                                <a href="#">수입</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">명품</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">매스티지</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">매스</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">트렌드</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">해외직구</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">식품</a>
                        <ul class="cateList-2dp">
                            <li>
                                <a href="#">과일</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">사과/배</a></li>
                                    <li><a href="#">감귤/한라봉</a></li>
                                    <li><a href="#">감</a></li>
                                    <li><a href="#">키위</a></li>
                                    <li><a href="#">토마토/자두/복숭아</a></li>
                                    <li><a href="#">수박/메론/참외</a></li>
                                    <li><a href="#">딸기/블루베리/기타</a></li>
                                    <li><a href="#">바나나/오렌지/수입과일</a></li>
                                    <li><a href="#">냉동과일</a></li>
                                    <li><a href="#">건조과일</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">채소</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">산/들/바다</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">쌀/잡곡</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">쌀</a></li>
                                    <li><a href="#">잡곡</a></li>
                                    <li><a href="#">혼합곡</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">정육/계란</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">소고기</a></li>
                                    <li><a href="#">돼지고기</a></li>
                                    <li><a href="#">닭/오리/양고기</a></li>
                                    <li><a href="#">계란/알류</a></li>
                                    <li><a href="#">양념/가공육</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">수산물/건어물</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">생선류</a></li>
                                    <li><a href="#">조개류</a></li>
                                    <li><a href="#">생선회</a></li>
                                    <li><a href="#">오징어/낙지</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">간편/냉장/냉동</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">만두/돈까스/떡갈비</a></li>
                                    <li><a href="#">면/떡/국/찌개</a></li>
                                    <li><a href="#">햄/어묵/맛살</a></li>
                                    <li><a href="#">빙과/디저트</a></li>
                                    <li><a href="#">밀키트</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">라면/즉석밥/통조림</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">라면</a></li>
                                    <li><a href="#">즉석식품</a></li>
                                    <li><a href="#">통조림</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">김치</a>
                            </li>
                            <li>
                                <a href="#">스낵/견과/빵/떡</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스낵</a></li>
                                    <li><a href="#">견과</a></li>
                                    <li><a href="#">빵</a></li>
                                    <li><a href="#">떡</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">밀가루/오일/소스/장류</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">밀가루/설탕/소금/조미료</a></li>
                                    <li><a href="#">장류</a></li>
                                    <li><a href="#">소스류</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">생수/음료/커피/유제품</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">생수</a></li>
                                    <li><a href="#">음료</a></li>
                                    <li><a href="#">커피</a></li>
                                    <li><a href="#">유제품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">건강/홍삼/선식</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">헬스/뷰티</a></li>
                                    <li><a href="#">홍삼/인삼/산삼</a></li>
                                    <li><a href="#">선식/대체식품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">전통주</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">반려동물</a>
                        <ul class="cateList-2dp">
                            <li>
                                <a href="#">강아지</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">사료</a></li>
                                    <li><a href="#">간식</a></li>
                                    <li><a href="#">건강</a></li>
                                    <li><a href="#">위생/배변</a></li>
                                    <li><a href="#">미용/목욕</a></li>
                                    <li><a href="#">급수기/급식기</a></li>
                                    <li><a href="#">하우스/울타리</a></li>
                                    <li><a href="#">이동장</a></li>
                                    <li><a href="#">의류/액세서리</a></li>
                                    <li><a href="#">목줄/인식표/리드줄</a></li>
                                    <li><a href="#">장난감</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">고양이</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">사료</a></li>
                                    <li><a href="#">간식</a></li>
                                    <li><a href="#">건강</a></li>
                                    <li><a href="#">위생/배변</a></li>
                                    <li><a href="#">미용/목욕</a></li>
                                    <li><a href="#">급수기/급식기</a></li>
                                    <li><a href="#">하우스/울타리</a></li>
                                    <li><a href="#">이동장</a></li>
                                    <li><a href="#">의류/액세서리</a></li>
                                    <li><a href="#">목줄/인식표/리드줄</a></li>
                                    <li><a href="#">장난감</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">모바일·디지털</a>
                        <ul class="cateList-2dp">
                            <li>
                                <a href="#">모바일</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">휴대폰</a></li>
                                    <li><a href="#">액세서리</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">가전</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">TV/영상가전</a></li>
                                    <li><a href="#">냉장고/김치냉장고/냉동고</a></li>
                                    <li><a href="#">세탁기</a></li>
                                    <li><a href="#">계절가전</a></li>
                                    <li><a href="#">주방가전</a></li>
                                    <li><a href="#">생활가전</a></li>
                                    <li><a href="#">이미용가전</a></li>
                                    <li><a href="#">건강가전</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">디지털·컴퓨터</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">게임 · 소프트웨어</a></li>
                                    <li><a href="#">노트북 · 데스크탑</a></li>
                                    <li><a href="#">PC부품 · 주변기기</a></li>
                                    <li><a href="#">저장장치</a></li>
                                    <li><a href="#">모니터</a></li>
                                    <li><a href="#">프린터 · 복합기 · 잉크</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#" class="noDp">여행 · 티켓</a></li>
                    <li><a href="#" class="noDp">렌탈</a></li>
                    <li><a href="#" class="noDp">경품</a></li>
                </ul>
                <div class="logoutWrap">
                   <hr>
                    <a href="#" class="logout">로그아웃 <i class="ri-logout-box-r-line"></i></a>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
$(document).ready(function(){
    $('#write').show();
    $('#list').hide();
    $('.qna').on('click',function(){
        $(this).addClass('active');
        $('.qna').not($(this)).removeClass('active');
    })
    $('#date li a').on('click',function(){
        $(this).addClass('active');
        $('#date li a').not($(this)).removeClass('active');
    })
});
/**
 * 탭 function
 */
function show(num){
    if(num == 1){
        $('#write').show();
        $('#list').hide();
        $('#tap1').addClass('active');
        $('#tap2').removeClass('active');
    } else if (num == 2) {
        $('#write').hide();
        $('#list').show();
        $('#tap1').removeClass('active');
        $('#tap2').addClass('active');
    }
}
</script>
</html>