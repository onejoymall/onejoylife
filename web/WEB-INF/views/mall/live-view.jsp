<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="goods-main">
        <h3 class="main-title hide">상품영역</h3>
        <div class="inner">
            <div class="main-left">
                <div class="iframebox">
                    <iframe src="https://www.youtube.com/embed/udirCMIxs_c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
            <div class="goods-info-wrap">
                <div class="goods-name-wrap">
                    <p class="goods-name">
                        ✨아르댓 2020 신상 라인 코트✨ 20% 할인 받아서 구매했어요💗
                    </p>
                </div>
                <div class="goods-price-wrap">
                    <div class="goods-price-row">
                        <p class="goods-name2">아르댓 양털기모 울코트 EK-23912</p>
                    </div>
                    <div class="goods-price-row text-gray">
                        <div class="price-title">
                            판매가
                        </div>
                        <div class="price-number before-price">
                            319,000원
                        </div>
                    </div>
                    <div class="goods-price-row text-gray">
                        <div class="price-title">
                            세일
                        </div>
                        <div class="price-number before-price">
                            31,900원
                        </div>
                    </div>
                    <div class="goods-price-row text-gray">
                        <div class="price-title">
                            쿠폰가<br>
                            <span class="coupon-rate">20% 쿠폰</span><span class="coupon-date">19.03.18-19.04.17</span>
                        </div>
                        <div class="price-number">
                            <span class="real-price"><span>223,000</span>원</span>
                        </div>
                    </div>
                    <div class="goods-price-row">
                        <div class="price-title">
                            카드할인혜택
                            <span class="more-info" tabindex="0">?
                                <div class="card-info-box"></div></span>

                        </div>
                        <div class="price-number">
                            삼성카드 청구할인 5%
                        </div>
                    </div>
                </div>
                <div class="goods-point-wrap">
                    <div class="goods-point-row">
                        <div class="point-title">ONEJOY 포인트 적립예상</div>
                        <div class="point-number">2%</div>
                    </div>
                </div>
                <div class="shipping-fee-wrap">
                    <div class="shipping-fee-row">
                        <div class="shipping-title text-gray">
                            배송비
                        </div>
                        <div class="shipping-number">
                            현대택배 2,500원 &#40;결제금액 20,000원 이상 무료&#41;
                        </div>
                    </div>
                </div>
                <div class="cart-option-wrap">
                    <div class="option-box">
                        <button type="button">
                            옵션 선택
                            <i class="arrow-down"></i>
                        </button>
                        <ul class="option-list">
                            <li><a href="#none">Samsung Galaxy S9</a></li>
                            <li><a href="#none">Samsung Galaxy S9+</a></li>
                            <li><a href="#none">Samsung Galaxy S9 5G</a></li>
                        </ul>
                    </div>
                    <div class="quantity-box">
                        <span>구매수량</span>
                        <div class="total-quantity">
                            <div class="minus" tabindex="0">-</div>
                            <div class="number">10</div>
                            <div class="plus" tabindex="0">+</div>
                        </div>
                    </div>
                    <div class="total-price">
                        <div class="total-price-title">상품 금액 합계</div>
                        <div class="total-price-number"><span>2,230,000</span>원</div>
                    </div>
                </div>
                <div class="buy-wrap">
                    <button class="incart" type="button">장바구니</button>
                    <button class="buynow" type="button">바로구매</button>
                    <button class="favorite" type="button"><i class="heart-empty"></i></button>
                </div>
            </div>
        </div>
    </article>
    <article class="banner-section">
        <div class="inner">
            <a href="#" class="img-box"><img src="../assets/img/goods-view/bnr1.jpg" alt="매일 100% 당첨 행운의 룰렛" /></a>
        </div>
    </article>
    <article class="related-goods-section">
        <div class="inner">
            <h2>관련 상품</h2>
            <ul class="related-goods">
                <li><a href="#">
                    <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                    <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                    <p class="goods-price"><span>92,344</span>원</p>
                </a></li>
                <li><a href="#">
                    <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                    <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                    <p class="goods-price"><span>92,344</span>원</p>
                </a></li>
                <li><a href="#">
                    <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                    <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                    <p class="goods-price"><span>92,344</span>원</p>
                </a></li>
                <li><a href="#">
                    <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                    <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                    <p class="goods-price"><span>92,344</span>원</p>
                </a></li>
                <li><a href="#">
                    <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                    <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                    <p class="goods-price"><span>92,344</span>원</p>
                </a></li>
                <li><a href="#">
                    <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                    <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                    <p class="goods-price"><span>92,344</span>원</p>
                </a></li>
                <li><a href="#">
                    <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                    <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                    <p class="goods-price"><span>92,344</span>원</p>
                </a></li>
            </ul>
        </div>
    </article>
    <article class="goods-detail-section">
        <div class="inner">
            <div class="goods-detail-wrap" id="goods-description">
                <ul class="detail-nav">
                    <li><a href="#goods-description" class="active"><span>상품설명</span></a></li>
                    <li><a href="#goods-information"><span>상품정보</span></a></li>
                    <li><a href="#goods-review"><span>상품평&#40;<span class="review-count">65</span>&#41;</span></a></li>
                    <li><a href="#goods-qna"><span>상품Q &amp; A&#40;<span class="review-count">26</span>&#41;</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="description-img">
                    <img src="../assets/img/goods-view/details.jpg" />
                </div>
            </div>
            <div class="also-viewed-goods">
                <h5>함께 본 상품</h5>
                <ul class="related-goods">
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                </ul>
            </div>
            <div class="goods-detail-wrap" id="goods-information">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information" class="active"><span>상품정보</span></a></li>
                    <li><a href="goods-review"><span>상품평&#40;<span class="review-count">65</span>&#41;</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A&#40;<span class="review-count">26</span>&#41;</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="goods-information-wrap">
                    <h5>상품 필수정보</h5>
                    <p class="goods-name">SM-G05-ZR/SS</p>
                    <p class="goods-subtitle">일반세탁기 WA15M6551KS [15KG / 워블세탁기 / 회오리세탁 / 다이아몬드필터 / 인버터모터 / 무세제통세척]</p>
                    <table class="goods-information-table">
                        <tr>
                            <th>정격전압 (v)</th>
                            <td>220</td>
                        </tr>
                        <tr>
                            <th>소비전력 (W)</th>
                            <td>420</td>
                        </tr>
                        <tr>
                            <th>에너지소비효율등급</th>
                            <td>3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음</td>
                        </tr>
                        <tr>
                            <th>동일모델 출시년월</th>
                            <td>2017년 10월</td>
                        </tr>
                        <tr>
                            <th>품질보증기준</th>
                            <td>관련법 및 소비자 분쟁해결 기준에 따름</td>
                        </tr>
                        <tr>
                            <th>크기 &#40;mm&#41;</th>
                            <td>가로 : 630, 세로 : 690, 높이 : 1050</td>
                        </tr>
                        <tr>
                            <th>무게 &#40;kg&#41;</th>
                            <td>47</td>
                        </tr>
                        <tr>
                            <th>색상</th>
                            <td>실버</td>
                        </tr>
                        <tr>
                            <th>제조사</th>
                            <td>삼성전자</td>
                        </tr>
                        <tr>
                            <th>제조국가</th>
                            <td>태국</td>
                        </tr>
                        <tr>
                            <th>수입자</th>
                            <td>삼성전자</td>
                        </tr>
                        <tr>
                            <th>A / S 책임자 &#40;전화번호&#41;</th>
                            <td>삼성전자 &#40;1588-3366&#41;</td>
                        </tr>
                        <tr>
                            <th>사양</th>
                            <td>태국</td>
                        </tr>
                        <tr>
                            <th>KC 전파적합성 인증</th>
                            <td>kc마크MSIP-REI-WAF700SD</td>
                        </tr>
                        <tr>
                            <th>KC 전기용품 안전인증</th>
                            <td>kc마크HU07310-17049C</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="goods-detail-wrap" id="goods-review">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information"><span>상품정보</span></a></li>
                    <li><a href="goods-review" class="active"><span>상품평&#40;<span class="review-count">65</span>&#41;</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A&#40;<span class="review-count">26</span>&#41;</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="total-review">
                    <h5>평가 및 리뷰</h5>
                    <div class="total-review-box">
                        <div class="total-star">
                            <div class="total-star-left">
                                <div class="star-box">
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-half"></i>
                                    <i class="y-star-empty"></i>
                                </div>
                                <p><span>225</span>개의 상품평이 있습니다.</p>
                            </div>
                            <div class="total-star-right">
                                <div class="score-box">
                                    <p class="score">4.5</p>
                                </div>
                            </div>
                        </div>
                        <div class="total-review-star">
                            <div class="total-review-star-item">
                                <p>상품</p>
                                <div class="star-box">
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                </div>
                                <p class="score">5.0</p>
                            </div>
                            <div class="total-review-star-item">
                                <p>가격</p>
                                <div class="star-box">
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-half"></i>
                                    <i class="y-star-empty"></i>
                                </div>
                                <p class="score">3.5</p>
                            </div>
                            <div class="total-review-star-item">
                                <p>배송</p>
                                <div class="star-box">
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-empty"></i>
                                </div>
                                <p class="score">4.0</p>
                            </div>
                            <div class="total-review-star-item">
                                <p>친절도</p>
                                <div class="star-box">
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-full"></i>
                                    <i class="y-star-half"></i>
                                </div>
                                <p class="score">4.5</p>
                            </div>
                        </div>
                    </div>
                    <div class="review-list">
                        <div class="review-data-container">
                            <div class="review-data-option-box">
                                    <span class="all active">
                                        <a href="#none">전체&#40;<span>24</span>&#41;</a>
                                    </span>
                                <span class="pic-only">
                                        <a href="#none"><i class="pic-ic"></i>사진 상품평&#40;<span>5</span>&#41;</a>
                                    </span>
                                <span class="vid-only">
                                        <a href="#none"><i class="vid-ic"></i>동영상 상품평&#40;<span>2</span>&#41;</a>
                                    </span>
                                <div class="review-data-option-box-right">
                                    <select name="order" class="order-select">
                                        <option value="recently">최근 등록 순</option>
                                        <option value="high">별점 높은 순</option>
                                        <option value="row">별점 낮은 순</option>
                                    </select>
                                    <button type="button" class="write-review" onclick="window.open('write-review.html','상품평 작성하기','width=700, height=850,loaction=no,status=no,scrollbars=yes');">상품평 작성하기</button>
                                </div>
                            </div>
                            <ul class="review-data-list">
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="review-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <div class="review-title"><span>굉장히 만족스럽습니다.</span><i class="pic-ic"></i></div>
                                        <div class="review-author"><span>김*주</span></div>
                                        <div class="review-date"><span>2020.01.12</span></div>
                                    </div>
                                    <div class="content-box">
                                        <div class="each-star">
                                            <div class="each-star-item">
                                                <span>상품</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>가격</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>배송</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                            <div class="each-star-item">
                                                <span>친절도</span>
                                                <div class="star-box">
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                    <i class="y-star-full"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="review-setting-box">
                                            <button type="button" class="report">신고하기</button>
                                            <button type="button" class="modify">수정</button>
                                            <button type="button" class="delete">삭제</button>
                                        </div>
                                        <div class="review-content-body">
                                            카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서<br>
                                            친절히 답해주셔서 감사하구요,<br>
                                            아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^<br>
                                            감사합니다
                                            <div class="review-content-body-media-box">
                                                <img src="http://placehold.it/600x300" alt="후기이미지" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
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
            </div>
            <div class="goods-detail-wrap" id="goods-qna">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information"><span>상품정보</span></a></li>
                    <li><a href="goods-review"><span>상품평&#40;<span class="review-count">65</span>&#41;</span></a></li>
                    <li><a href="goods-qna" class="active"><span>상품Q &amp; A&#40;<span class="review-count">26</span>&#41;</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="qna-wrap">
                    <h5>상품 Q&amp;A</h5>
                    <div class="qna-data-container">
                        <div class="qna-data-option-box">
                                <span class="all active">
                                    <a href="#none">전체&#40;<span>24</span>&#41;</a>
                                </span>
                            <div class="qna-data-option-box-right">
                                <select name="order" class="order-select">
                                    <option value="all">전체</option>
                                    <option value="goods">상품</option>
                                    <option value="shipping">배송</option>
                                    <option value="refund">반품/환불/취소</option>
                                    <option value="etc">기타</option>
                                </select>
                                <button type="button" class="write-review" onclick="window.open('write-qna.html','상품평 작성하기','width=700, height=550,loaction=no,status=no,scrollbars=yes');">작성하기</button>
                            </div>
                        </div>
                        <ul class="qna-data-list">
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        상품
                                    </div>
                                    <div class="qna-title"><span>지금 구매시 제품 제조일 알수있을까요?</span></div>
                                    <div class="qna-answer"><span class="waiting">답변대기</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        기타
                                    </div>
                                    <div class="qna-title"><span>최신 시리얼 번호 제품으로 부탁 드립니다.</span></div>
                                    <div class="qna-answer"><span class="waiting">답변대기</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        반품/환불/취소
                                    </div>
                                    <div class="qna-title"><span>반품문의</span><i class="lock-ic"></i></div>
                                    <div class="qna-answer"><span class="waiting">답변대기</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        상품
                                    </div>
                                    <div class="qna-title"><span>상품문의 질문</span><i class="lock-ic"></i></div>
                                    <div class="qna-answer"><span class="complete">답변완료</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                        <div class="qna-content-body-a">
                                            <p class="a-sort">A</p>
                                            <p>
                                                안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                                문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                                감사합니다.
                                            </p>
                                        </div>
                                        <p class="answer-date">답변일 : 2020.01.12</p>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        배송
                                    </div>
                                    <div class="qna-title"><span>상품문의</span></div>
                                    <div class="qna-answer"><span class="complete">답변완료</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                        <div class="qna-content-body-a">
                                            <p class="a-sort">A</p>
                                            <p>
                                                안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                                문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                                감사합니다.
                                            </p>
                                        </div>
                                        <p class="answer-date">답변일 : 2020.01.12</p>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        반품/환불/취소
                                    </div>
                                    <div class="qna-title"><span>지금 구매시 제품 제조일 알수있을까요?</span></div>
                                    <div class="qna-answer"><span class="complete">답변완료</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                        <div class="qna-content-body-a">
                                            <p class="a-sort">A</p>
                                            <p>
                                                안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                                문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                                감사합니다.
                                            </p>
                                        </div>
                                        <p class="answer-date">답변일 : 2020.01.12</p>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        배송
                                    </div>
                                    <div class="qna-title"><span>최신 시리얼 번호 제품으로 부탁 드립니다.</span></div>
                                    <div class="qna-answer"><span class="complete">답변완료</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                        <div class="qna-content-body-a">
                                            <p class="a-sort">A</p>
                                            <p>
                                                안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                                문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                                감사합니다.
                                            </p>
                                        </div>
                                        <p class="answer-date">답변일 : 2020.01.12</p>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        상품
                                    </div>
                                    <div class="qna-title"><span>반품문의</span><i class="lock-ic"></i></div>
                                    <div class="qna-answer"><span class="complete">답변완료</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                        <div class="qna-content-body-a">
                                            <p class="a-sort">A</p>
                                            <p>
                                                안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                                문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                                감사합니다.
                                            </p>
                                        </div>
                                        <p class="answer-date">답변일 : 2020.01.12</p>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        상품
                                    </div>
                                    <div class="qna-title"><span>상품문의 질문</span></div>
                                    <div class="qna-answer"><span class="complete">답변완료</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                        <div class="qna-content-body-a">
                                            <p class="a-sort">A</p>
                                            <p>
                                                안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                                문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                                감사합니다.
                                            </p>
                                        </div>
                                        <p class="answer-date">답변일 : 2020.01.12</p>
                                    </div>
                                </div>
                            </li>
                            <li class="qna-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="qna-sort">
                                        상품
                                    </div>
                                    <div class="qna-title"><span>지금 구매시 제품 제조일 알수있을까요?</span><i class="lock-ic"></i></div>
                                    <div class="qna-answer"><span class="complete">답변완료</span></div>
                                    <div class="qna-author"><span>김*주</span></div>
                                    <div class="qna-date"><span>2020.01.12</span></div>
                                </div>
                                <div class="content-box">
                                    <div class="qna-setting-box">
                                        <button type="button" class="modify">수정</button>
                                        <button type="button" class="delete">삭제</button>
                                    </div>
                                    <div class="qna-content-body">
                                        <div class="qna-content-body-q">
                                            <p class="q-sort">Q</p>
                                            <p>
                                                매장에서 봤는데<br>
                                                화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요??<br>
                                            </p>
                                        </div>
                                        <div class="qna-content-body-a">
                                            <p class="a-sort">A</p>
                                            <p>
                                                안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                                문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                                감사합니다.
                                            </p>
                                        </div>
                                        <p class="answer-date">답변일 : 2020.01.12</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
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
            <div class="same-product-goods">
                <h5>같은 공급사 상품</h5>
                <ul class="related-goods">
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                    <li><a href="#">
                        <div class="img-box"><img src="../assets/img/goods-view/main-slider.jpg" /></div>
                        <p class="goods-name">STUDIO TOMBOY<br>봄맞이 트렌치코트, 자켓 외 30종 할인</p>
                        <p class="goods-price"><span>92,344</span>원</p>
                    </a></li>
                </ul>
            </div>
            <div class="goods-detail-wrap" id="goods-shipping">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information"><span>상품정보</span></a></li>
                    <li><a href="goods-review"><span>상품평&#40;<span class="review-count">65</span>&#41;</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A&#40;<span class="review-count">26</span>&#41;</span></a></li>
                    <li><a href="goods-shipping" class="active"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="shipping-wrap">
                    <h5>배송/결제/교환/환불</h5>
                    <div class="shipping-box">
                        <h6>배송 안내<i class="arrow-down"></i></h6>
                        <table class="shipping-table">
                            <tr>
                                <th>배송지역</th>
                                <td>전국&#40;일부 도서지역 제외&#41;</td>
                            </tr>
                            <tr>
                                <th>배송비</th>
                                <td>
                                    전국 무료배송 &#40;일부 도서지역 제외&#41;이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.<br>
                                    동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료<br>
                                    동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과<br>
                                    기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex&#41;제주 : 5,500원, 섬지역 7,000원&#41;<br>
                                    교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.<br>
                                    &#40;단, 일부 지역 추가 요금 발생 ex&#41; 제주 : 11,000원, 섬지역 14,000원&#41;
                                </td>
                            </tr>
                            <tr>
                                <th>업체상품</th>
                                <td>
                                    업체 배송 정책에 따라 업체 배송 기사가 직접 배송하거나 택배로 발송될 수 있습니다.<br><br>
                                    직접 배송 상품<br>
                                    -익일 배송이 원칙이며, 주문 시 희망 배송일을 신청하실 수 있습니다.<br>
                                    -업체 사정에 의해 상품수량이 부족하여 배송이 지연되거나 안 될 수 있습니다.<br>
                                    -도서산간 지역의 경우 반드시 자격을 갖춘 가스 사업소에서 설치해야 하므로 직접 설치에서 제외됩니다.<br>
                                    -설치 시 추가 설치 비용이 발생할 수 있습니다.<br><br>
                                    택배 배송 상품<br>
                                    -택배 상품은 결제 후 2~3일의 배송 기간이 소요됩니다.<br>
                                    -도서산간 지역의 경우 배송 기간이 지연될 수 있습니다.
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="return-box">
                        <h6>교환/반품 안내<i class="arrow-down"></i></h6>
                        <table class="return-table">
                            <tr>
                                <th>배송지역</th>
                                <td>전국&#40;일부 도서지역 제외&#41;</td>
                            </tr>
                            <tr>
                                <th>배송비</th>
                                <td>
                                    전국 무료배송 &#40;일부 도서지역 제외&#41;이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.<br>
                                    동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료<br>
                                    동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과<br>
                                    기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex&#41;제주 : 5,500원, 섬지역 7,000원&#41;<br>
                                    교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.<br>
                                    &#40;단, 일부 지역 추가 요금 발생 ex&#41; 제주 : 11,000원, 섬지역 14,000원&#41;
                                </td>
                            </tr>
                            <tr>
                                <th>업체상품</th>
                                <td>
                                    업체 배송 정책에 따라 업체 배송 기사가 직접 배송하거나 택배로 발송될 수 있습니다.<br><br>
                                    직접 배송 상품<br>
                                    -익일 배송이 원칙이며, 주문 시 희망 배송일을 신청하실 수 있습니다.<br>
                                    -업체 사정에 의해 상품수량이 부족하여 배송이 지연되거나 안 될 수 있습니다.<br>
                                    -도서산간 지역의 경우 반드시 자격을 갖춘 가스 사업소에서 설치해야 하므로 직접 설치에서 제외됩니다.<br>
                                    -설치 시 추가 설치 비용이 발생할 수 있습니다.<br><br>
                                    택배 배송 상품<br>
                                    -택배 상품은 결제 후 2~3일의 배송 기간이 소요됩니다.<br>
                                    -도서산간 지역의 경우 배송 기간이 지연될 수 있습니다.
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="refund-box">
                        <h6>환불 안내<i class="arrow-down"></i></h6>
                        <table class="refund-table">
                            <tr>
                                <th>배송지역</th>
                                <td>전국&#40;일부 도서지역 제외&#41;</td>
                            </tr>
                            <tr>
                                <th>배송비</th>
                                <td>
                                    전국 무료배송 &#40;일부 도서지역 제외&#41;이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.<br>
                                    동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료<br>
                                    동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과<br>
                                    기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex&#41;제주 : 5,500원, 섬지역 7,000원&#41;<br>
                                    교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.<br>
                                    &#40;단, 일부 지역 추가 요금 발생 ex&#41; 제주 : 11,000원, 섬지역 14,000원&#41;
                                </td>
                            </tr>
                            <tr>
                                <th>업체상품</th>
                                <td>
                                    업체 배송 정책에 따라 업체 배송 기사가 직접 배송하거나 택배로 발송될 수 있습니다.<br><br>
                                    직접 배송 상품<br>
                                    -익일 배송이 원칙이며, 주문 시 희망 배송일을 신청하실 수 있습니다.<br>
                                    -업체 사정에 의해 상품수량이 부족하여 배송이 지연되거나 안 될 수 있습니다.<br>
                                    -도서산간 지역의 경우 반드시 자격을 갖춘 가스 사업소에서 설치해야 하므로 직접 설치에서 제외됩니다.<br>
                                    -설치 시 추가 설치 비용이 발생할 수 있습니다.<br><br>
                                    택배 배송 상품<br>
                                    -택배 상품은 결제 후 2~3일의 배송 기간이 소요됩니다.<br>
                                    -도서산간 지역의 경우 배송 기간이 지연될 수 있습니다.
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </article>
</section>
<script>
    $(document).ready(function(){
        $('.goods-slider').bxSlider({
            auto:false,
            autoHover:true,
            speed:500,
            mode:'horizontal',
            autoControls:true,
            pager:true,
            controls:true,
            useCSS:false,
            pagerCustom: '#bx-pager',
            touchEnabled : false,
        });
        $('.related-goods').bxSlider({
            auto:false,
            mode:'horizontal',
            slideWidth:330,
            moveSlides:4,
            slideMargin:60,
            minSlides:4,
            maxSlides:4,
            speed:500,
            pager:false,
            autoControls:true,
            controls:true,
            useCSS:false,
            touchEnabled : false,
            randomStart: false,
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
        windowB.trigger('scroll');
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

    $(document).ready(function(){
        $('.option-box').click(function(){
//               $('.bnr-header').css('display','none');
            $('.arrow-down').toggleClass('arrow-up');
            $('.option-list').toggleClass('display-block')
        });

        $('.favorite').click(function(){
            $(this).children('i').toggleClass('heart-full');
        })

        $('.main-title-box').click(function(){
            $(this).parent($('.review-data-box')).toggleClass('active');
        })

        $('.shipping-wrap h6').click(function(){
            $(this).next('table').toggleClass('active');
            $(this).children('i').toggleClass('arrow-up');
        });

        //nav-click
        var menu=$('.detail-nav>li');
        var content=$('.goods-detail-section div.goods-detail-wrap')
        menu.click(function(e){
            e.preventDefault();
            var tg=$(this);
            var i=tg.index();
            var section=content.eq(i);
            var tt=section.offset().top-60;
            $('html,body').stop().animate({scrollTop:tt});
        });//click
    });


</script>

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
