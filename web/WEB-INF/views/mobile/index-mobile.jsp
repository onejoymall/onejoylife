<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link href="assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="assets/css/mobile/common-mobile.css" rel="stylesheet" type="text/css">
    <link href="assets/css/mobile/commonSub.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <link href="assets/css/jquery.bxslider.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src="assets/js/jquery.bxslider.min.js"></script>
</head>
<body class="pt-83">
    <header class="h-main">
        <div class="top-inner">
            <h1 class="main-logo"><a href="/">원조이몰</a></h1>
            <form name="search" action="" class="src-form">
                <div class="src-inner">
                    <input type="text" class="src-input" name="src-input">
                    <button type="button" class="src-btn"><span>검색</span></button>
                </div>
            </form>
            <div class="h-cart">
                <a href="#" class="cart-inner">
                    <i class="cart"></i>
                    <span class="cart-num">100</span>
                </a>
            </div>
        </div>
        <ul class="submenu">
            <li class="active"><a href="#">오늘의 특가</a></li>
            <li><a href="#">이벤트</a></li>
            <li><a href="#">라이브 쇼핑</a></li>
        </ul>
    </header>
    <div class="main-slider mt-1">
        <ul class="main-slider-wrap">
            <c:if test="${not empty categoryBannerList}">
                <c:forEach var="categoryBannerList" items="${categoryBannerList}" varStatus="status">
                    <li id="main-slide-${status.index+1}" style="background:url(${categoryBannerList.file_link2}) no-repeat center / contain;"><a href="<c:url value="/product?product_ct=${categoryBannerList.pd_category_id}"/>"></a></li>
                </c:forEach>
            </c:if>
        </ul>
<%--        <ul class="main-slider-wrap">
            <li><a href="#"><img src="assets/img/m-main-slider-img1.png" alt="메인이벤트1"></a></li>
            <li><a href="#"><img src="assets/img/m-main-slider-img2.png" alt="메인이벤트2"></a></li>
            <li><a href="#"><img src="assets/img/m-main-slider-img3.png" alt="메인이벤트3"></a></li>
        </ul>--%>
    </div>
    <div class="mt-1">
        <div class="img-box">
            <img src="assets/img/m-banner.png" alt="e point 경품참여">
        </div>
    </div>
    <div class="mainList-wrap mt-1">
        <div class="wrap bg_grey2">
            <h2 class="red">오늘의 특가 <i class="ri-arrow-right-s-line"></i></h2>
            <h4 class="mt-05">오늘의 특가 상품 구매시 E-POINT 적립 2배!</h4>
        </div>
        <ul class="mainList-big">
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-lists.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-big-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-lists.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-big-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
        </ul>
    </div>
    <div class="mt-1">
        <div class="img-box">
            <img src="assets/img/m-banner2.png" alt="행운의 경품당첨 주인공이 되세요!">
        </div>
    </div>
    <div class="mainList-wrap mt-1 clearfix">
        <div class="wrap bg_grey2">
            <h2 class="red">추천 상품 <i class="ri-arrow-right-s-line"></i></h2>
            <h4 class="mt-05">고민없이 선택하는 MD 강력 추천 상품!</h4>
        </div>
        <ul class="mainList-sm">
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
        </ul>
    </div>
    <div class="mt-1">
        <div class="img-box">
            <img src="assets/img/m-banner4.png" alt="행운의 경품당첨 주인공이 되세요!">
        </div>
    </div>
    <div class="mt-1 bg_grey2 clearfix">
        <div class="wrap">
            <h2 class="red">이벤트 <i class="ri-arrow-right-s-line"></i></h2>
        </div>
        <ul class="mainList-sm2">
            <li>
                <a href="#">
                   <div class="img-box">
                        <img src="assets/img/event1.png" alt="">
                    </div>
                    <p>미식가가 사랑하는 돼지고기 이베리코 최대 25% 할인</p>
                </a> 
            </li>
            <li>
                <a href="#">
                   <div class="img-box">
                        <img src="assets/img/event3.png" alt="">
                    </div>
                    <p>미식가가 사랑하는 돼지고기 이베리코 최대 25% 할인</p>
                </a> 
            </li>
            <li>
                <a href="#">
                   <div class="img-box">
                        <img src="assets/img/event2.png" alt="">
                    </div>
                    <p>미식가가 사랑하는 돼지고기 이베리코 최대 25% 할인</p>
                </a> 
            </li>
            <li>
                <a href="#">
                   <div class="img-box">
                        <img src="assets/img/event4.png" alt="">
                    </div>
                    <p>미식가가 사랑하는 돼지고기 이베리코 최대 25% 할인</p>
                </a> 
            </li>
        </ul>
    </div>
    <div class="mainList-wrap mt-1 clearfix">
        <div class="wrap bg_grey2">
            <h2 class="red">인기 상품 <i class="ri-arrow-right-s-line"></i></h2>
            <h4 class="mt-05">망설이면 후회하는 원조이몰 인기 상품!</h4>
        </div>
        <ul class="mainList-sm">
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-list-sm.png" alt="">
                    </a>
                    <p class="saleBox">35%</p>
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-sm-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins><del>23,200원</del></p>
                    <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                </a>
            </li>
        </ul>
    </div>
    <div class="mt-1 bg_grey2 clearfix">
        <div class="wrap">
            <h2 class="red">기획전 <i class="ri-arrow-right-s-line"></i></h2>
        </div>
        <ul class="mainList-big2">
            <li>
                <a href="#">
                   <div class="img-box">
                        <img src="assets/img/event1.png" alt="">
                    </div>
                </a>
                <div class="mainList-big2-text">
                    <p class="list-title"><a href="#">달달한게 먹고싶어</a></p>
                    <p class="info-date">2020/04/01~2020/05/01</p>
                    <p>100개 패션 브랜드의 최대 95% 연말 세일</p>
                </div>
            </li>
            <li>
                <a href="#">
                   <div class="img-box">
                        <img src="assets/img/event3.png" alt="">
                    </div>
                </a> 
                <div class="mainList-big2-text">
                    <p class="list-title"><a href="#">달달한게 먹고싶어</a></p>
                    <p class="info-date">2020/04/01~2020/05/01</p>
                    <p>100개 패션 브랜드의 최대 95% 연말 세일</p>
                </div>
            </li>
            <li>
                <a href="#">
                   <div class="img-box">
                        <img src="assets/img/event2.png" alt="">
                    </div>
                </a>
                <div class="mainList-big2-text">
                    <p class="list-title"><a href="#">안다르 따뜻한 겨울을 위한 기모상품</a></p>
                    <p class="info-date">2020/04/01~2020/05/01</p>
                    <p>100개 패션 브랜드의 최대 95% 연말 세일</p>
                </div>
            </li>
            <li>
                <a href="#">
                   <div class="img-box">
                        <img src="assets/img/event4.png" alt="">
                    </div>
                </a>
                <div class="mainList-big2-text">
                    <p class="list-title"><a href="#">달달한게 먹고싶어</a></p>
                    <p class="info-date">2020/04/01~2020/05/01</p>
                    <p>100개 패션 브랜드의 최대 95% 연말 세일</p>
                </div>
            </li>
        </ul>
    </div>
    <div class="mainList-wrap mt-1 clearfix">
        <div class="wrap bg_grey2">
            <h2 class="red">경품 추첨 <i class="ri-arrow-right-s-line"></i></h2>
            <h4 class="mt-05">E-POINT 행운의 주인공이 되어 보세요!</h4>
        </div>
        <ul class="mainList-big">
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-lists.png" alt="">
                    </a>
<!--                    <p class="saleBox">35%</p>-->
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-big-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins></p>
                    <div class="progress-wrap">
                        <p class="progress-now">참여율 <b class="red">80%</b></p>
                        <div class="progress-bar">
                            <div class="progress-bar-active" style="width:80%"></div>
                        </div>
                        <p class="parti"><span>150</span>명 참여 중</p>
                    </div>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-lists.png" alt="">
                    </a>
<!--                    <p class="saleBox">35%</p>-->
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-big-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins></p>
                    <div class="progress-wrap">
                        <p class="progress-now">참여율 <b class="red">80%</b></p>
                        <div class="progress-bar">
                            <div class="progress-bar-active" style="width:80%"></div>
                        </div>
                        <p class="parti"><span>150</span>명 참여 중</p>
                    </div>
                </a>
            </li>
            <li>
                <div class="img-box">
                    <a href="#">
                       <img src="assets/img/m-lists.png" alt="">
                    </a>
<!--                    <p class="saleBox">35%</p>-->
                    <a href="#" class="share-ic"></a>
                </div>
                <a href="#" class="mainList-big-text">
                    <p class="list-title">[간편즉석] 육개장600G+갈비탕600G+설렁탕600G+소내장탕600G</p>
                    <p><ins>15,080원</ins></p>
                    <div class="progress-wrap">
                        <p class="progress-now">참여율 <b class="red">80%</b></p>
                        <div class="progress-bar">
                            <div class="progress-bar-active" style="width:80%"></div>
                        </div>
                        <p class="parti"><span>150</span>명 참여 중</p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
    <div class="mt-1">
        <div class="img-box">
            <img src="assets/img/m-banner3.png" alt="행운의 경품당첨 주인공이 되세요!">
        </div>
    </div>
    <div>
        <ul class="flexaround border-n">
            <li>
                <a href="<c:url value="/sign/signup"/>" class="link-a"><i class="icon faq i-big"></i>회원가입</a>
            </li>
            <li>
                <a href="#"><i class="icon epoint i-big"></i>E-POINT 안내</a>
            </li>
            <li>
                <a href="#"><i class="icon faq i-big"></i>자주하는 질문</a>
            </li>
        </ul>
    </div>
    <footer class="pb-5 bg_grey2">
        <ul class="submenu bg_red">
            <li><a href="#">고객센터</a></li>
            <li><a href="#">쇼핑몰 입점/제휴문의</a></li>
        </ul>
        <ul class="submenu">
            <li><a href="#">개인정보처리방침</a></li>
            <li><a href="#">이용약관</a></li>
        </ul>
        <ul class="wrap">
            <li>주식회사 원조이</li>
            <li>대표 : 김수현</li>
            <li>전화 : 1811-9590 / 팩스 : 02-3472-0888</li>
            <li>06643 서울특별시 서초구 서리풀길 4 (서초동) 영호빌딩 4층</li>
            <li>사업자 등록번호 : 487-88-01223</li>
            <li>통신판매업신고 2019-서울서초-0844 <a href="#">[사업자정보확인]</a></li>
            <li>개인정보관리책임자 : <a href="mailto:cs@onejoy.co.kr">김수현(cs@onejoy.co.kr)</a></li>
            <li>고객센터 : 1811-9590 / onejoy@onejoy.co.kr</li>
            <li>Copyright ONEJOYlife. All rights reserved.</li>
        </ul>
    </footer>

    <nav class="nav">
        <ul>
            <li><a href="#" id="nav-cate"><i class="cate-ic">카테고리</i></a></li>
            <li><a href="#" id="nav-home"><i class="home-ic">홈</i></a></li>
            <li><a href="#" id="nav-src"><i class="src-ic">검색</i></a></li>
            <c:if test="${!sessionScope.login}">
                <li><a href="<c:url value="/sign/login"/>" id="nav-user"><i class="user-ic">마이페이지</i></a></li>
            </c:if>
            <c:if test="${sessionScope.login}">
                <li><a href="<c:url value="/MyPage/DashBoard"/>" id="nav-user"><i class="user-ic">마이페이지</i></a></li>
            </c:if>
        </ul>
    </nav>

    <script type="text/javascript">
        //메인 슬라이더
        $(document).ready(function(){
            $('.main-slider-wrap').bxSlider({
                auto:true,
                autoHover:true,
                speed:500,
                mode:'horizontal',
                autoControls:false,
                pager:true,
                pagerType:'short',
                controls:false,
                useCSS:false,
                touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
            });
            
            $(".back-arr").click(function(){
                window.history.back();
            });
            
            var scroll;
            var lastScrollTop = 0;
            var delta = 5;
            var navbarHeight = $('.header, .h-main').outerHeight();
            
            $(window).scroll(function(event){
                scroll = true;
            });
            setInterval(function(){
                if(scroll){
                  hasScrolled();
                    scroll = false;
                }
            }, 250);
            function hasScrolled(){
                var st=$(this).scrollTop();
                if(Math.abs(lastScrollTop - st) <= delta) return;
                
                if (st > lastScrollTop && st > navbarHeight){
                    // Scroll Down
                    $('.header, .h-main').removeClass('nav-down').addClass('nav-up'); }
                else {
                        // Scroll Up
                    if(st + $(window).height() < $(document).height()) {
                        $('.header, .h-main').removeClass('nav-up').addClass('nav-down');
                    }
                }
                lastScrollTop = st;
            }
        });
    </script>
</body>
</html>