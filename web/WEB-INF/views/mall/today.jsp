<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-01
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <h3>오늘의 특가</h3>
            <div class="txt-box">
                <ul class="txt-box-ul">
                    <li class="active"><a href="#" >전체</a></li>
                    <li><a href="#" >가구/리빙/반려</a></li>
                    <li><a href="#" >스포츠</a></li>
                    <li><a href="#" >의류</a></li>
                    <li><a href="#" >식품</a></li>
                    <li><a href="#" >컴퓨터/디지털</a></li>
                    <li><a href="#" >뷰티</a></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
            <div class="banner-box">

            </div>
            <p class="gift-amount">오늘의 특가 전체 카테고리에 <span class="gift-amount-number">1,017</span>개의 상품이 등록되어 있습니다.</p>
            <div class="sort-tab">
                <div class="sort-tab-left">
                    <button type="button" class="sort-tab-item active">랭킹순</button>
                    <button type="button" class="sort-tab-item">낮은가격순</button>
                    <button type="button" class="sort-tab-item">높은가격순</button>
                    <button type="button" class="sort-tab-item">판매량</button>
                    <button type="button" class="sort-tab-item">최신순</button>
                </div>
                <div class="sort-tab-right">
                    <select name="order" class="order-select">
                        <option value="32">32개씩 보기</option>
                        <option value="60">60개씩 보기</option>
                        <option value="92">92개씩 보기</option>
                    </select>
                </div>
            </div>
            <div class="point-product-list">
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="gift-view.html">
                            <img src="../assets/img/e-point-img1.png" />
                            <p class="sale-percent">35<span>%</span></p>
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                        </a>
                        <p class="info-price">
                            <span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원
                        </p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item">
                        <a href="#">
                            <img src="../assets/img/e-point-img2.png" />
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>
                        </a>
                        <p class="info-price">15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item">
                        <a href="#">
                            <img src="../assets/img/e-point-img3.png" />
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="info-price">15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item mar-r">
                        <a href="#">
                            <img src="../assets/img/e-point-img3.png" />
                            <p class="sale-percent">35<span>%</span></p>
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="gift-view.html">
                            <img src="../assets/img/e-point-img1.png" />
                            <p class="sale-percent">35<span>%</span></p>
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                        </a>
                        <p class="info-price">
                            <span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원
                        </p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item">
                        <a href="#">
                            <img src="../assets/img/e-point-img2.png" />
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>
                        </a>
                        <p class="info-price">15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item">
                        <a href="#">
                            <img src="../assets/img/e-point-img3.png" />
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="info-price">15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item mar-r">
                        <a href="#">
                            <img src="../assets/img/e-point-img3.png" />
                            <p class="sale-percent">35<span>%</span></p>
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="gift-view.html">
                            <img src="../assets/img/e-point-img1.png" />
                            <p class="sale-percent">35<span>%</span></p>
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                        </a>
                        <p class="info-price">
                            <span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원
                        </p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item">
                        <a href="#">
                            <img src="../assets/img/e-point-img2.png" />
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>
                        </a>
                        <p class="info-price">15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item">
                        <a href="#">
                            <img src="../assets/img/e-point-img3.png" />
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="info-price">15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item mar-r">
                        <a href="#">
                            <img src="../assets/img/e-point-img3.png" />
                            <p class="sale-percent">35<span>%</span></p>
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="gift-view.html">
                            <img src="../assets/img/e-point-img1.png" />
                            <p class="sale-percent">35<span>%</span></p>
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                        </a>
                        <p class="info-price">
                            <span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원
                        </p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item">
                        <a href="#">
                            <img src="../assets/img/e-point-img2.png" />
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>
                        </a>
                        <p class="info-price">15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item">
                        <a href="#">
                            <img src="../assets/img/e-point-img3.png" />
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="info-price">15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
                    <div class="point-product-item mar-r">
                        <a href="#">
                            <img src="../assets/img/e-point-img3.png" />
                            <p class="sale-percent">35<span>%</span></p>
                            <i class="share-ic"></i>
                            <p class="info-production">삼성전자</p>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">5,324개 평가</span>
                        </p>
                    </div>
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


</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

