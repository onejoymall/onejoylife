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
            <c:if test="${not empty productSpList}">
                <c:forEach var="productSpList" items="${productSpList}" varStatus="status" end="1">
                    <li>
                        <a href="/product/productDetail?product_cd=${productSpList.product_cd}">
                            <div class="img-box">
                                <img src='${productSpList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
                                <p class="saleBox">35%</p>
                                <a href="#" class="share-ic"></a>
                            </div>
                            <div class="mainList-big-text">
                                <p class="list-title">${productSpList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productSpList.product_payment}" groupingUsed="true" />원</ins><del><fmt:formatNumber value="${productSpList.product_user_payment}" groupingUsed="true" />원</del></p>
                                <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                            </div>
                        </a>
                    </li>
            <%--<li>
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
            </li>--%>
                </c:forEach>
            </c:if>
            <c:if test="${empty productSpList}">
                <li>표시할 내용이 없습니다.</li>
            </c:if>
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
            <c:if test="${not empty productList}">
                <c:forEach var="productList" items="${productList}" varStatus="status" end="5">
                    <li>
                        <a href="/product/productDetail?product_cd=${productList.product_cd}">
                            <div class="img-box">
                                <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'">
                                <p class="saleBox">35%</p>
                                <a href="#" class="share-ic"></a>
                            </div>
                            <div class="mainList-sm-text">
                                <p class="list-title">${productList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />원</ins><del><fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />원</del></p>
                                <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty productList}">
                <li>표시할 내용이 없습니다.</li>
            </c:if>
            <%--<li>
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
            </li>--%>
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
            <c:if test="${not empty productList}">
                <c:forEach var="productList" items="${productList}" varStatus="status" end="5">
                    <a href="/product/productDetail?product_cd=${productList.product_cd}">
                        <li>
                            <div class="img-box">
                                <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'" >
                                <p class="saleBox">35%</p>
                                <a href="#" class="share-ic"></a>
                            </div>
                            <a href="#" class="mainList-sm-text">
                                <p class="list-title">${productList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />원</ins><del><fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />원</del></p>
                                <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                            </a>
                        </li>
                    </a>
                </c:forEach>
            </c:if>
            <c:if test="${empty productList}">
                <li>표시할 내용이 없습니다.</li>
            </c:if>
            <%--<li>
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
            </li>--%>
        </ul>
    </div>
    <div class="mt-1 bg_grey2 clearfix">
        <div class="wrap">
            <h2 class="red">기획전 <i class="ri-arrow-right-s-line"></i></h2>
        </div>
        <ul class="mainList-big2">
            <c:if test="${not empty categoryEventList}">
                <c:forEach var="categoryEventList" items="${categoryEventList}" varStatus="status">
                <li>
                        <a href="/product?product_ct=${categoryEventList.pd_category_id}">
                            <div class="img-box" id="exhibition-img1">
                                <img src="${categoryEventList.file_link}" onerror="this.src='http://placehold.it/190x190'">
                            </div>
                            <div class="mainList-big2-text">
                                <p class="list-title">${categoryEventList.pd_category_event_title}</p>
                                <p class="info-date">${categoryEventList.pd_category_event_start}~${categoryEventList.pd_category_event_end}</p>
                                <p>${categoryEventList.pd_category_event_memo}</p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${not empty categoryEventListSub}">
                <c:forEach var="categoryEventListSub" items="${categoryEventListSub}" varStatus="status">
                    <li>
                        <a href="/product?product_ct=${categoryEventListSub.pd_category_id}">
                            <div class="img-box" id="exhibition-img${status.index}">
                                <img src="${categoryEventListSub.file_link}" onerror="this.src='http://placehold.it/190x190'">
                            </div>
                            <div class="mainList-big2-text">
                                <p class="list-title">${categoryEventListSub.pd_category_event_title}</p>
                                <p class="info-date">${categoryEventListSub.pd_category_event_start}~${categoryEventListSub.pd_category_event_end}</p>
                                <p>${categoryEventListSub.pd_category_event_memo}</p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <%--<li>
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
            </li>--%>
        </ul>
    </div>
    <div class="mainList-wrap mt-1 clearfix">
        <div class="wrap bg_grey2">
            <h2 class="red">경품 추첨 <i class="ri-arrow-right-s-line"></i></h2>
            <h4 class="mt-05">E-POINT 행운의 주인공이 되어 보세요!</h4>
        </div>
        <ul class="mainList-big">
            <c:if test="${not empty giveawaylist}">
                <c:forEach var="list" items="${giveawaylist}" varStatus="status" end="2">
                    <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id="/>${list.giveaway_id}">
                        <li>
                            <div class="img-box">
                                   <img src='${list.file_1}' onerror="this.src='http://placehold.it/190x190'">
            <!--                    <p class="saleBox">35%</p>-->
                                <a href="#" class="share-ic"></a>
                            </div>
                            <div class="mainList-big-text">
                                <p class="list-title">${list.giveaway_name}</p>
                                <p><ins><fmt:formatNumber value="${list.giveaway_payment}" groupingUsed="true" /> E-point</ins></p>
                                <div class="progress-wrap">
                                    <p class="progress-now">참여율 <b class="red">${list.parti_rate}%</b></p>
                                    <div class="progress-bar">
                                        <div class="progress-bar-active" style="width:${list.parti_rate}%"></div>
                                    </div>
                                    <p class="parti"><span><fmt:formatNumber value="${list.player_count}" groupingUsed="true" /></span>명 참여 중</p>
                                </div>
                            </div>
                        </li>
                    </a>
                </c:forEach>
            </c:if>
            <c:if test="${empty giveawaylist}">
                <li>표시할 내용이 없습니다.</li>
            </c:if>
            <%--<li>
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
            </li>--%>
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


    <%@ include file="/WEB-INF/views/mobile/layout/fix-nav.jsp" %>

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