<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
            <h1><a href="../../index-mobile.html">원조이몰</a></h1>
            <div class="h-cart">
                <a href="mypage-4.html" class="cart-inner">
                    <i class="cart"></i>
                    <span class="cart-num">100</span>
                </a>
            </div>
        </div>
    </header>
    <section class="subheader">
        <div class="subTitle">주문/결제</div>
    </section>
    
    <section class="wrap">
        <h2 class="pb-1">주문자 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">주문하시는 분</p>
        <input type="text" class="width-100 mb-05" value="홍길동">
        <p class="text-md mt-2 mb-05">이메일 주소</p>
        <input type="text" class="width-90" value="gildonghong"><i class="ri-at-line ml-1 my-1"></i>
        <input type="text" class="width-49 mt-05 mb-05" value="onejoy.co.kr">
        <select class="width-49 mt-05 mb-05">
            <option value="" disabled selected>직접입력</option>
        </select>
        <p class="text-md mt-2 mb-05">휴대폰 번호</p>
        <input type="text" class="width-100 mb-05">
        
        <h2 class="pb-1 mt-4">배송지 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">배송지 선택</p>
        <div class="my-1">
            <input type="radio" id="shipping01" name="shipping"><label for="shipping01">기본 배송지</label>
            <input type="radio" id="shipping02" name="shipping"><label for="shipping02">최신 배송지</label>
            <input type="radio" id="shipping03" name="shipping"><label for="shipping03">새로입력</label>
        </div>
        <p class="text-md mt-2 mb-05">받으시는 분</p>
        <input type="text" class="width-100 mb-05" value="김말자">
        
        <p class="text-md mt-2 mb-05">휴대폰 번호</p>
        <input type="text" class="width-100 mb-05">
        
        <p class="text-md mt-2 mb-05">전화 번호</p>
        <input type="text" class="width-100 mb-05">
        
        <p class="text-md mt-2 mb-05">주소</p>
        <div class="input-group mb-05">
            <input type="text">
            <button class="grey">우편번호 찾기</button>
         </div>
         <input type="text" class="width-100 mb-05">
         <input type="text" class="width-100 mb-05">
         
         <p class="text-md mt-2 mb-05">배송시 요청사항</p>
         <select class="full mt-05 mb-05">
            <option value="" disabled selected>요청사항</option>
         </select>
         
         <h2 class="pb-1 mt-4">주문상품 정보</h2>
         <hr>
         <ul class="product pt-1 pb-0">
            <ul class="options">
                <li>당첨번호</li>
                <li class="red">123456</li>
            </ul>
            <ul class="py-0">
                <li><img src="../../assets/img/cam-img.jpg" alt=""></li>
                <li>
                    <p>브라운</p>
                    <h5>쿠쿠 10인용 IH전기압력밥솥</h5>
                    <p class="grey">VR25G66G98UWS</p>
                    <p class="option"><span>구성품</span> <br>
                    · 30mm 1.4 여친렌즈 <br>
                    · 추가배터리</p>
                </li>
            </ul>
            <ul class="options">
                <li>상품금액</li>
                <li>3,099,000 <span>원</span></li>
            </ul>
            <ul class="options">
                <li>수량</li>
                <li>2 <span>개</span></li>
            </ul>
            <hr class="grey my-1">
            <ul class="options mb-1">
                <li>주문금액</li>
                <li>3,099,000 <span>원</span></li>
            </ul>
        </ul>
        
        <h2 class="mt-4">할인 정보</h2>
        <hr class="my-1">
        <ul class="calculator">
            <li>총 주문금액</li>
            <li>13,090,000 <span>원</span></li>
        </ul>
        <p class="text-md mt-1 mb-05">배송시 요청사항</p>
         <select class="full mt-05 mb-05">
            <option value="" disabled selected>첫 구매 고객 특별할이 20% ( ~ 2020.04.30)</option>
         </select>
         <ul class="calculator">
            <li>보유 쿠폰</li>
            <li>3 <span>장</span></li>
        </ul>
        
        <h2 class="pb-1 mt-4">결제 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">결제수단</p>
        <div class="my-1">
            <input type="radio" id="purchase01" name="purchase"><label for="purchase01">신용카드</label>
            <input type="radio" id="purchase02" name="purchase"><label for="purchase02">현금결제</label>
            <input type="radio" id="purchase03" name="purchase"><label for="purchase03">휴대폰결제</label>
        </div>
    </section>
    <hr>
    <section class="wrap bg_grey">
        <h1 class="pb-1">최종 결제 금액 확인</h1>
        <hr>
        <ul class="calculator pt-2 pb-1">
            <li class="text-lg">총 상품 금액</li>
            <li>1,949,000 <span>원</span></li>
        </ul>
        <ul class="calculator pb-1">
            <li>VIP 회원할인</li>
            <li>- 9,000 <span>원</span></li>
        </ul>
        <ul class="calculator pb-1">
            <li>할인쿠폰</li>
            <li>- 9,000 <span>원</span></li>
        </ul>
        <ul class="calculator pb-1">
            <li>배송비</li>
            <li>+ 2,500 <span>원</span></li>
        </ul>
        <hr class="grey my-1">
        <ul class="calculator pb-1">
            <li>최종 결제 금액</li>
            <li class="text-lg red">1,949,000 <span>원</span></li>
        </ul>
        <ul class="calculator pb-1">
            <li>E-POINT 적립예정</li>
            <li class="text-md red">9,500 <span>원</span></li>
        </ul>
        <hr class="my-1">
        <input type="checkbox" id="replysns" class="b8 mb-2">
        <label for="replysns"><span class="red text-bold">필수</span> 주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</label>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" class="btn btn-redcover">결제하기</a></li>
        </ul>
    </div>
<!--
    <nav class="nav">
        <ul>
            <li><a href="#"><span></span></a></li>
            <li><a href="#">홈</a></li>
            <li><a href="#">검색</a></li>
            <li><a href="#">마이페이지</a></li>
        </ul>
    </nav>
-->
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