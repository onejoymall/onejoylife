<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-16
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="main-slider">
        <h3 class="main-slider-title hide">main slider</h3>
        <div class="main-slider-inner">
            <ul class="main-slider-wrap">
                <li id="main-slide-1"><a href="#"></a></li>
                <li id="main-slide-2"><a href="#"></a></li>
                <li id="main-slide-3"><a href="#"></a></li>
                <li id="main-slide-4"><a href="#"></a></li>
            </ul>
        </div>
    </article>
    <article class="live-shopping-wrap">
        <div class="inner clearfix">
            <h3>라이브쇼핑</h3>
            <p class="gift-amount">라이브쇼핑에 <span class="gift-amount-number">1,017</span>개의 영상이 등록되어 있습니다.</p>
            <div class="sort-tab">
                <div class="sort-tab-left">
                    <button type="button" class="sort-tab-item active">최신순</button>
                    <button type="button" class="sort-tab-item">조회수순</button>
                    <button type="button" class="sort-tab-item">포인트순</button>
                    <button type="button" class="sort-tab-item">공유순</button>
                    <button type="button" class="sort-tab-item">가격순</button>
                </div>
            </div>
            <div class="live-shopping-list">
                <div class="row clearfix">
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img1.png" />
                                <span class="video-time">8:12</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">발뮤다 가습기 한달사용 솔직후기! 발뮤다 가습기가 인기 있는 이유는? </p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img2.png" />
                                <span class="video-time">5:25</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img3.png" />
                                <span class="video-time">12:36</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비해요</p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img1.png" />
                                <span class="video-time">8:12</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">발뮤다 가습기 한달사용 솔직후기! 발뮤다 가습기가 인기 있는 이유는? </p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img2.png" />
                                <span class="video-time">5:25</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img3.png" />
                                <span class="video-time">12:36</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비해요</p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img1.png" />
                                <span class="video-time">8:12</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">발뮤다 가습기 한달사용 솔직후기! 발뮤다 가습기가 인기 있는 이유는? </p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img2.png" />
                                <span class="video-time">5:25</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img3.png" />
                                <span class="video-time">12:36</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비해요</p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img1.png" />
                                <span class="video-time">8:12</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">발뮤다 가습기 한달사용 솔직후기! 발뮤다 가습기가 인기 있는 이유는? </p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img2.png" />
                                <span class="video-time">5:25</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="live-shopping-item">
                        <a href="/mall/live-view">
                            <div class="imgbox">
                                <img src="../assets/img/live-img3.png" />
                                <span class="video-time">12:36</span>
                            </div>
                            <i class="share-ic"></i>
                            <p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비해요</p>
                        </a>
                        <p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p>
                        <p class="live-shopping-user">Kate Ilacad</p>
                        <p class="live-shopping-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </article>
</section>
<script>


    $(document).ready(function(){
        $('.gnb>li:first-child').mouseover(function(){
            $('.gnb-submenu').show();
        });
        $('.gnb>li:first-child').mouseleave(function(){
            $('.gnb-submenu').hide();
        });
        $('.gnb-submenu>li').mouseover(function(){
            $(this).children('.gnb-submenu-2dp').show();
        });
        $('.gnb-submenu>li').mouseleave(function(){
            $(this).children('.gnb-submenu-2dp').hide();
        });
        $('.gnb-submenu-2dp>li').mouseover(function(){
            $(this).children('.gnb-submenu-3dp').show().animate({
                width: '200px'
            },100);
        });
        $('.gnb-submenu-2dp>li').mouseleave(function(){
            $(this).children('.gnb-submenu-3dp').hide().animate({
                width: '0px'
            },100);
        });
    });

    $('.main-slider-wrap').bxSlider({
        auto:true,
        autoHover:true,
        speed:500,
        mode:'horizontal',
        autoControls:true,
        pager:true,
        pagerType:'short',
        controls:true,
        useCSS:false,
        touchEnabled : false,
    });

    //헤더 sticky
    $(function(){
        var windowB = $(window),
            headerOffsetTop = $(".gnb-section").offset().top;
        windowB.on("scroll",function(){
            if(windowB.scrollTop()>headerOffsetTop) {
                $(".gnb-section").addClass("sticky");
                $('.header-logo').addClass('mgbt60')
            }else{
                $(".gnb-section").removeClass("sticky");
                $('.header-logo').removeClass('mgbt60')
            }

        });//scroll
        // 윈도우의 스크롤 이벤트를 발생시키는
        // (헤더의 초기 위치를 조정하기 위해)
        windowB.trigger('scroll');
    });//end
    var page = 1;

    $(window).scroll(function() {
        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
            console.log(++page);
            $(".live-shopping-list").append('<div class="row clearfix"><div class="live-shopping-item"><a href="/mall/live-view"><div class="imgbox"><img src="../assets/img/live-img1.png" /><span class="video-time">8:12</span></div><i class="share-ic"></i><p class="live-shopping-title">발뮤다 가습기 한달사용 솔직후기! 발뮤다 가습기가 인기 있는 이유는? </p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div><div class="live-shopping-item"><a href="#"><div class="imgbox"><img src="../assets/img/live-img2.png" /><span class="video-time">5:25</span></div><i class="share-ic"></i><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div><div class="live-shopping-item"><a href="#"><div class="imgbox"> <img src="../assets/img/live-img3.png" /><span class="video-time">12:36</span></div><i class="share-ic"></i><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비해요</p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div></div><div class="row clearfix"><div class="live-shopping-item"><a href="/mall/live-view"><div class="imgbox"><img src="../assets/img/live-img1.png" /><span class="video-time">8:12</span></div><i class="share-ic"></i><p class="live-shopping-title">발뮤다 가습기 한달사용 솔직후기! 발뮤다 가습기가 인기 있는 이유는? </p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div><div class="live-shopping-item"><a href="#"><div class="imgbox"><img src="../assets/img/live-img2.png" /><span class="video-time">5:25</span></div><i class="share-ic"></i><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div><div class="live-shopping-item"><a href="#"><div class="imgbox"> <img src="../assets/img/live-img3.png" /><span class="video-time">12:36</span></div><i class="share-ic"></i><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비해요</p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div></div><div class="row clearfix"><div class="live-shopping-item"><a href="/mall/live-view"><div class="imgbox"><img src="../assets/img/live-img1.png" /><span class="video-time">8:12</span></div><i class="share-ic"></i><p class="live-shopping-title">발뮤다 가습기 한달사용 솔직후기! 발뮤다 가습기가 인기 있는 이유는? </p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div><div class="live-shopping-item"><a href="#"><div class="imgbox"><img src="../assets/img/live-img2.png" /><span class="video-time">5:25</span></div><i class="share-ic"></i><p class="live-shopping-title">✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗</p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div><div class="live-shopping-item"><a href="#"><div class="imgbox"> <img src="../assets/img/live-img3.png" /><span class="video-time">12:36</span></div><i class="share-ic"></i><p class="live-shopping-title">eng) GRWM 겟레디윗미+Vlog 같이 준비해요</p></a><p class="live-shopping-price"><span class="price-before">469,000원</span><i class="right-arrow"></i>415,000원</p><p class="live-shopping-user">Kate Ilacad</p><p class="live-shopping-score"><i class="star-ic"></i><span class="score-number">4.5</span><span class="vid-view">조회수 <span class="vid-view-number">45,231</span></span><span class="score-text">5,324개 평가</span></p></div></div>');

        }
    });

</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>