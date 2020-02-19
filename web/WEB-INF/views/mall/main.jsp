<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
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
                <li id="main-slide-1"><a href="<c:url value="/product"/>"></a></li>
                <li id="main-slide-2"><a href="<c:url value="/product"/>"></a></li>
                <li id="main-slide-3"><a href="<c:url value="/product"/>"></a></li>
                <li id="main-slide-4"><a href="<c:url value="/product"/>"></a></li>
            </ul>
        </div>
        <div class="sub-slider-inner">
            <ul class="sub-slider-wrap">
                <li id="sub-slide-1"><a href="#"></a></li>
                <li id="sub-slide-2"><a href="#"></a></li>
                <li id="sub-slide-3"><a href="#"></a></li>
                <li id="sub-slide-4"><a href="#"></a></li>
                <li id="sub-slide-5"><a href="#"></a></li>
                <li id="sub-slide-6"><a href="#"></a></li>
            </ul>
        </div>
    </article>
    <article class="e-point-section">
        <h3 class="e-point-title hide">E-point 경품 추첨</h3>
        <div class="point-bnr">
            <div class="point-bnr-inner">
                <a href="<c:url value="/giveaway"/>"><img src="assets/img/e-point-bg.png" alt="E-point 경품 추첨. 망설이면 후회해요!" /></a>
            </div>
        </div>
        <div class="point-product-wrap">
            <div class="point-product-inner clearfix">
                <h4 class="main-section-h4">E-point 경품추천</h4>
                <p class="special-price-more"><a href="<c:url value="/giveaway"/>">경품 더보기<i class="right-arrow"></i></a></p>
                <ul class="point-product-list">
                <c:if test="${not empty giveawaylist}">
                    <c:forEach var="list" items="${giveawaylist}" varStatus="status">
                        <li>
                            <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id="/>${list.giveaway_id}">
                                <img src="<c:url value="/assets/img/"/>${list.giveaway_list_image}" />
                                <i class="share-ic"></i>
                                <p class="point-pdt-title"> ${list.giveaway_name}</p>
                            </a>
                            <p class="point-pdt-price"><fmt:formatNumber value="${list.giveaway_payment}" groupingUsed="true" /> E-point</p>
                            <p class="deadline">
                                <c:set var="deadline" value="${fn:split(list.giveaway_validity,'~')}"/>
                                <c:out value='~${deadline[1]}'/>
                            </p>
                            <div class="point-pdt-parti-wrap">
                                <div class="parti-percent-wrap">
                                    <span class="progress">${list.parti_rate}%</span>
                                    <span class="progress-now">참여율 <span class="progress-now-number">${list.parti_rate}%</span><span class="parti-ppl"> &#40;<span class="parti-ppl-number"><fmt:formatNumber value="${list.player_count}" groupingUsed="true" /></span>명 참여 중&#41;</span></span>
                                    <span class="progress">100%</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-bar-active" style="width:${list.parti_rate}%"></div>
                                </div>
                                <div class="parti-point-wrap">
                                    <p><span class="parti-point-now"><fmt:formatNumber value="${list.sum_play_point}" groupingUsed="true" /></span>/<fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /> E-point</p>
                                    <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
                <c:if test="${empty giveawaylist}">
                    <li>표시할 내용이 없습니다.</li>
                </c:if>
                </ul>
            </div>
            <div class="mini-bnr-section">
                <div class="mini-bnr-inner">
                    <a href="#">
                        <img src="assets/img/mini-banner1.png" alt="프리미엄 리뷰 상품평 쓰고 30만원 받자"/>
                    </a>
                </div>
            </div>
        </div>
    </article>
    <article class="exhibition-section">
        <h3 class="exhibition-title hide">기획전</h3>
        <div class="exhibition-inner clearfix">
            <h4 class="main-section-h4">기획전</h4>
            <div class="exhibition-list-wrap clearfix">
                <div class="exhibition-row clearfix">
                    <div class="exhibition-list-item-type1">
                        <a href="#">
                            <div class="img-box" id="exhibition-img1"></div>
                            <p class="exhibition-list-item-title">fashion season off</p>
                            <p class="exhibition-list-item-date">2019/12/01~2020/01/31</p>
                            <p class="exhibition-list-item-text">100개 패션 브랜드의 최대 95% 연말 세일</p>
                        </a>
                    </div>
                    <div class="exhibition-list-item-type1">
                        <a href="#">
                            <div class="img-box" id="exhibition-img2"></div>
                            <p class="exhibition-list-item-title">fashion season off</p>
                            <p class="exhibition-list-item-date">2019/12/01~2020/01/31</p>
                            <p class="exhibition-list-item-text">100개 패션 브랜드의 최대 95% 연말 세일</p>
                        </a>
                    </div>
                </div>
                <div class="exhibition-row clearfix">
                    <div class="exhibition-list-item-type2">
                        <a href="#">
                            <div class="img-box" id="exhibition-img3"></div>
                            <p class="exhibition-list-item-title">달달한게 먹고싶어</p>
                            <p class="exhibition-list-item-date">2019/12/01~2020/01/31</p>
                            <p class="exhibition-list-item-text">100개 패션 브랜드의 최대 95% 연말 세일</p>
                        </a>
                    </div>
                    <div class="exhibition-list-item-type2">
                        <a href="#">
                            <div class="img-box" id="exhibition-img4"></div>
                            <p class="exhibition-list-item-title">안다르 따뜻한 연말을 위한 기모상품 추천</p>
                            <p class="exhibition-list-item-date">2019/12/01~2020/01/31</p>
                            <p class="exhibition-list-item-text">100개 패션 브랜드의 최대 95% 연말 세일</p>
                        </a>
                    </div>
                    <div class="exhibition-list-item-type2">
                        <a href="#">
                            <div class="img-box" id="exhibition-img5"></div>
                            <p class="exhibition-list-item-title">RIDI BOOKS 기획전</p>
                            <p class="exhibition-list-item-date">2019/12/01~2020/01/31</p>
                            <p class="exhibition-list-item-text">100개 패션 브랜드의 최대 95% 연말 세일</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-2">
            <div class="mini-bnr-inner">
                <a href="#">
                    <img src="assets/img/mini-banner2.png" alt="해외직구가 어려운 이들을 위한 돌직구 백서"/>
                </a>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-3">
            <div class="mini-bnr-inner">
                <a href="#">
                    <img src="assets/img/mini-banner3.png" alt="리디셀렉트 10개월권 50% 할인+1개월 추가"/>
                </a>
            </div>
        </div>
    </article>
    <article class="selected-list-section">
        <h3 class="hide">추천 상품</h3>
        <div class="selected-list-inner">
            <ul class="nav-tabs clearfix">
                <li class="nav-item">
                    <a class="nav-link active" data-tab="tab1">MD추천</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-tab="tab2">인기상품</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-tab="tab2">신상품</a>
                </li>
            </ul>
            <div class="tab-content-wrap">
                <div class="tab-content-item active" id="tab1">
                    <div class="tab-content-item-inner">
                        <div class="category-wrap" id="selected-list-section-cate">
                            <div class="category-row">
                                <span class="active">채소</span>
                                <span>과일/견과/쌀</span>
                                <span>수산/해산/건어물</span>
                                <span>정육/계란</span>
                                <span>국/반찬/메인요리</span>
                                <span>샐러드/간편식</span>
                                <span>면/양념/오일</span>
                            </div>
                            <div class="category-row">
                                <span>음료/우유/떡/간식</span>
                                <span>베이커리/치즈/델리</span>
                                <span>건강식품</span>
                                <span>생활용품</span>
                                <span>주방용품</span>
                                <span>가전제품</span>
                                <span>베이비/키즈</span>
                                <span>반려동물</span>
                            </div>
                        </div>
                        <div class="product-list-type2">
                            <ul class="selected-list">
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img.png" />
                                            <p class="sale-percent">35<span>%</span></p>
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img2.png" />
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price">15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img3.png" />
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price">15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img4.png" />
                                            <p class="sale-percent">35<span>%</span></p>
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price">15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img5.png" />
                                            <p class="sale-percent">35<span>%</span></p>
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img.png" />
                                            <p class="sale-percent">35<span>%</span></p>
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img2.png" />
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price">15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img3.png" />
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price">15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img4.png" />
                                            <p class="sale-percent">35<span>%</span></p>
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price">15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="img-box">
                                            <img src="assets/img/list-img5.png" />
                                            <p class="sale-percent">35<span>%</span></p>
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">삼성전자</p>
                                            <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                            <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-2">
            <div class="mini-bnr-inner">
                <a href="#">
                    <img src="assets/img/mini-banner2.png" alt="해외직구가 어려운 이들을 위한 돌직구 백서"/>
                </a>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-3">
            <div class="mini-bnr-inner">
                <a href="#">
                    <img src="assets/img/mini-banner3.png" alt="리디셀렉트 10개월권 50% 할인+1개월 추가"/>
                </a>
            </div>
        </div>
    </article>
    <article class="special-price-section">
        <h3 class="hide">특가 상품</h3>
        <div class="special-price-inner">
            <h4 class="main-section-h4">특가상품</h4>
            <p class="special-price-more"><a href="#">특가 상품 더보기<i class="right-arrow"></i></a></p>
            <div class="category-wrap clearfix" id="special-price-section-cate">
                <div class="category-row-type2 clearfix">
                    <div class="category-item active">
                        <div class="img-box"><img src="assets/img/living-ic-ac.svg" /></div>
                        <span>가구/리빙/반려</span>
                    </div>
                    <div class="category-item">
                        <div class="img-box"><img src="assets/img/sports-ic.svg" /></div>
                        <span>스포츠</span>
                    </div>
                    <div class="category-item">
                        <div class="img-box"><img src="assets/img/cloth-ic.svg" /></div>
                        <span>의류</span>
                    </div>
                    <div class="category-item">
                        <div class="img-box"><img src="assets/img/food-ic.svg" /></div>
                        <span>식품</span>
                    </div>
                    <div class="category-item">
                        <div class="img-box"><img src="assets/img/digital-ic.svg" /></div>
                        <span>컴퓨터/디지털</span>
                    </div>
                    <div class="category-item">
                        <div class="img-box"><img src="assets/img/beauty-ic.svg" /></div>
                        <span>뷰티</span>
                    </div>
                </div>
            </div>
            <div class="product-list-type2">
                <ul class="special-price-list">
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img.png" />
                                <p class="sale-percent">35<span>%</span></p>
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img2.png" />
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price">15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img3.png" />
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price">15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img4.png" />
                                <p class="sale-percent">35<span>%</span></p>
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price">15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img5.png" />
                                <p class="sale-percent">35<span>%</span></p>
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img.png" />
                                <p class="sale-percent">35<span>%</span></p>
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img2.png" />
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price">15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img3.png" />
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price">15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img4.png" />
                                <p class="sale-percent">35<span>%</span></p>
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price">15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="img-box">
                                <img src="assets/img/list-img5.png" />
                                <p class="sale-percent">35<span>%</span></p>
                                <i class="share-ic"></i>
                            </div>
                            <div class="product-info">
                                <p class="info-production">삼성전자</p>
                                <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                <p class="info-score">
                                    <i class="star-ic"></i>
                                    <span class="score-number">4.5</span>
                                    <span class="score-text">5,324개 평가</span>
                                </p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-5">
            <div class="mini-bnr-inner">
                <a href="#">
                    <img src="assets/img/mini-banner5.png" alt="코카콜라 1만원 이상 구매시 1천원 할인"/>
                </a>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-6">
            <div class="mini-bnr-inner">
                <a href="#">
                    <img src="assets/img/mini-banner6.png" alt="유제품 1만원 이상 구매시 10%"/>
                </a>
            </div>
        </div>
    </article>
    <article class="category-section">
        <h3 class="hide">카테고리</h3>
        <div class="category-inner">
            <h4 class="main-section-h4">카테고리</h4>
            <div class="category-wrap" id="category-section-cate">
                <div class="category-row">
                    <span class="active" data-tab="cate-tab1">채소</span>
                    <span data-tab="cate-tab2">과일/견과/쌀</span>
                    <span data-tab="cate-tab3">수산/해산/건어물</span>
                    <span>정육/계란</span>
                    <span>국/반찬/메인요리</span>
                    <span>샐러드/간편식</span>
                    <span>면/양념/오일</span>
                </div>
                <div class="category-row">
                    <span>음료/우유/떡/간식</span>
                    <span>베이커리/치즈/델리</span>
                    <span>건강식품</span>
                    <span>생활용품</span>
                    <span>주방용품</span>
                    <span>가전제품</span>
                    <span>베이비/키즈</span>
                    <span>반려동물</span>
                </div>
            </div>
            <div class="product-list-type2">
                <div class="category-tab-wrap active" id="cate-tab1">
                    <ul class="category-list">
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img.png" />
                                    <p class="sale-percent">탭1 35<span>%</span></p>
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img2.png" />
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price">15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img3.png" />
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price">15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img4.png" />
                                    <p class="sale-percent">35<span>%</span></p>
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price">15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img5.png" />
                                    <p class="sale-percent">35<span>%</span></p>
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img.png" />
                                    <p class="sale-percent">35<span>%</span></p>
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img2.png" />
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price">15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img3.png" />
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price">15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img4.png" />
                                    <p class="sale-percent">35<span>%</span></p>
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price">15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="img-box">
                                    <img src="assets/img/list-img5.png" />
                                    <p class="sale-percent">35<span>%</span></p>
                                    <i class="share-ic"></i>
                                </div>
                                <div class="product-info">
                                    <p class="info-production">삼성전자</p>
                                    <p class="info-product-name">갤럭시 버즈 SM-R170NZWAKOO</p>
                                    <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        <span class="score-number">4.5</span>
                                        <span class="score-text">5,324개 평가</span>
                                    </p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="category-tab-wrap">
                </div>
            </div>
        </div>
    </article>
    <article class="event-section">
        <h3 class="hide">이벤트</h3>
        <div class="event-inner clearfix">
            <h4 class="main-section-h4">이벤트</h4>
            <p class="special-price-more"><a href="#">이벤트 더보기<i class="right-arrow"></i></a></p>
            <ul class="event-list">
                <li>
                    <a href="#">
                        <div class="img-box"><img src="assets/img/event1.png" /></div>
                        <p class="event-title">미식가가 사랑하는 돼지고기 이베리코 최대 25% 할인</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img-box"><img src="assets/img/event2.png" /></div>
                        <p class="event-title">미식가가 사랑하는 돼지고기 이베리코 최대 25% 할인</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img-box"><img src="assets/img/event3.png" /></div>
                        <p class="event-title">미식가가 사랑하는 돼지고기 이베리코 최대 25% 할인</p>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img-box"><img src="assets/img/event4.png" /></div>
                        <p class="event-title">미식가가 사랑하는 돼지고기 이베리코 최대 25% 할인</p>
                    </a>
                </li>
            </ul>
        </div>
    </article>
    <article class="qna-section">
        <h3 class="hide">ONEJOY 고객지원센터</h3>
        <div class="qna-inner">
            <h4 class="main-section-h4">ONEJOY 고객지원센터</h4>
            <div class="qna-wrap">
                <div class="qna-button">
                    <a href="#">
                        <i class="chat-ic"></i>
                        <p class="qna-title">문의하기</p>
                        <p class="qna-subtitle">무엇이든 물어보세요</p>
                    </a>
                </div>
                <p class="qna-info">오전 10시 ~ 오후 6시 주말, 공휴일 휴무<br><span>&#40;점심시간: 12:00 ~ 13:00&#41;</span></p>
            </div>
        </div>
    </article>
    <article class="notice-section">
        <h3 class=hide>공지</h3>
        <div class="notice-inner">
            <h4 class="main-section-h4">공지합니다</h4>
            <p class="special-price-more"><a href="#">공지사항 더보기<i class="right-arrow"></i></a></p>
            <ul class="notice-list">
                <li>
                    <div class="notice-title"><a href="#">&#91;안내&#93; 개인정보처리방침 변경 안내</a></div>
                    <div class="notice-date"><span>2019.10.18</span><i class="arrow-down" id="arrow"></i></div>
                    <div class="notice-content">
                        개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경안내 개인정보처리방침 변경 안내 개인정 보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 <br>개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내 개인정보처리방침 변경 안내
                    </div>
                </li>
                <li>
                    <div class="notice-title"><a href="#">&#91;안내&#93; 전자금융거래약관 개정</a></div>
                    <div class="notice-date"><span>2019.10.18</span><i class="arrow-down" id="arrow"></i></div>
                    <div class="notice-content">
                        내용
                    </div>
                </li>
                <li>
                    <div class="notice-title"><a href="#">&#91;주의&#93; 식약처, 산란계 농가 계란 검사 결과, 부적합 계란 회수·폐기</a></div>
                    <div class="notice-date"><span>2019.10.18</span><i class="arrow-down" id="arrow"></i></div>
                    <div class="notice-content">
                        내용
                    </div>
                </li>
                <li>
                    <div class="notice-title"><a href="#">&#91;주의&#93; 식약처, 비멸균 의료용 겔 유통 판매 금지 및 회수 조치</a></div>
                    <div class="notice-date"><span>2019.10.18</span><i class="arrow-down" id="arrow"></i></div>
                    <div class="notice-content">
                        내용
                    </div>
                </li>
            </ul>
        </div>
    </article>
</section>

<script>
    $(document).ready(function(){
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
            touchEnabled : (navigator.maxTouchPoints > 0),
        });
        $('.sub-slider-wrap').bxSlider({
            auto:false,
            mode:'horizontal',
            slideWidth:330,
            moveSlides:3,
            slideMargin:30,
            minSlides:3,
            maxSlides:3,
            speed:500,
            pager:false,
            autoControls:true,
            controls:true,
            useCSS:false,
            touchEnabled : (navigator.maxTouchPoints > 0),
        });
        $('.selected-list').bxSlider({
            auto:false,
            mode:'horizontal',
            infiniteLoop:false,
            hideControlOnEnd:false,
            slideWidth:190,
            moveSlides:5,
            slideMargin:25,
            minSlides:5,
            maxSlides:5,
            speed:500,
            pager:false,
            autoControls:true,
            controls:true,
            useCSS:false,
            touchEnabled : (navigator.maxTouchPoints > 0),
        });
        $('.special-price-list').bxSlider({
            auto:false,
            mode:'horizontal',
            infiniteLoop:false,
            hideControlOnEnd:false,
            slideWidth:243,
            moveSlides:4,
            slideMargin:25,
            minSlides:4,
            maxSlides:4,
            speed:500,
            pager:false,
            autoControls:true,
            controls:true,
            useCSS:false,
            touchEnabled : (navigator.maxTouchPoints > 0),
        });
        $('.category-list').bxSlider({
            auto:false,
            mode:'horizontal',
            infiniteLoop:false,
            hideControlOnEnd:false,
            slideWidth:190,
            moveSlides:5,
            slideMargin:25,
            minSlides:5,
            maxSlides:5,
            speed:500,
            pager:false,
            autoControls:true,
            controls:true,
            useCSS:false,
            touchEnabled : (navigator.maxTouchPoints > 0),
        });
    });
    $(document).ready(function(){
        $('.notice-list>li').click(function(){
            $(this).children('.notice-content').slideToggle(300);
        });
        $('.notice-list>li').click(function(){
            $(this).children('.notice-date').children('#arrow').toggleClass('arrow-up');
        });
    });
    $(document).ready(function(){
        $('.bnr-header-close').click(function(){
//               $('.bnr-header').css('display','none');
            $('.bnr-header').slideUp(300);
        });
    });
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
        //windowB.trigger('scroll');
    });//end


    //탭메뉴
    $(document).ready(function(){


        $('.category-wrap span').on('click',function(){
            var tab_id = $(this).attr('data-tab');
            var arti = $(this).parents('article');

            arti.find('span').removeClass('active');
            arti.find('.category-tab-wrap').removeClass('active');

            $(this).addClass('active');
            $("#" + tab_id).addClass('active');

            cateslider.reloadSlider({});

        });

    });
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>