<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-31
  Time: 오후 3:21
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
            <h3>수입</h3>
            <div class="txt-box">
                <ul class="txt-box-ul">
                    <li class="ul-line"><a href="#" >전체</a></li>
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
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
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
            </section>
            <p class="gift-amount">수입 전체 카테고리에 <span class="gift-amount-number">1,017</span>개의 상품이 등록되어 있습니다.</p>
            <div class="nav-tit clearfix">
                <p class="active">MD추천</p>
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="gift-view.html">
                            <img src="../assets/img/list-img.png" />
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
                            <img src="../assets/img/list-img2.png" />
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
                            <img src="../assets/img/list-img3.png" />
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
                            <img src="../assets/img/list-img4.png" />
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
            </div>
            <div class="nav-tit clearfix">
                <p class="active">인기상품</p>
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="gift-view.html">
                            <img src="../assets/img/list-img.png" />
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
                            <img src="../assets/img/list-img2.png" />
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
                            <img src="../assets/img/list-img3.png" />
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
                            <img src="../assets/img/list-img4.png" />
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
            </div>
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
    $('.order-select').on("change",function () {
        $('#staticRowEnd').val($(this).val())
        $('#form1').submit();
    })
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>