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
            <div class="goods-slider-wrap">
                <ul class="goods-slider">
                    <li><img src='${list.file_1}'  ></li>
                <c:if test="${not empty list.file_5}">
                    <li><img src='${list.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
                </c:if>
<%--                    <li><img src='${productList.file_6}' onerror="this.src='http://placehold.it/550'" class="product_list_image_sm"></li>--%>
<%--                    <li><img src='${productList.file_7}' onerror="this.src='http://placehold.it/550'" class="product_list_image_sm"></li>--%>
<%--                    <li><img src='${productList.file_8}' onerror="this.src='http://placehold.it/550'" class="product_list_image_sm"></li>--%>
                </ul>
                <div id="bx-pager">
                    <a data-slide-index="0" href=""><img src='${list.file_1}' onerror="this.src='http://placehold.it/80'" ></a>
                    <c:if test="${not empty list.file_5}">
                    <a data-slide-index="1" href=""><img src='${list.file_5}' onerror="this.src='http://placehold.it/80'" ></a>
<%--                    <a data-slide-index="2" href=""><img src='${productList.file_3}' onerror="this.src='http://placehold.it/80'" class="product_list_image_sm"></a>--%>
<%--                    <a data-slide-index="2" href=""><img src='${productList.file_4}' onerror="this.src='http://placehold.it/80'" class="product_list_image_sm"></a>--%>
<%--                    <a data-slide-index="2" href=""><img src='${productList.file_5}' onerror="this.src='http://placehold.it/80'" class="product_list_image_sm"></a>--%>
                    </c:if>
                </div>

                <div class="share-list">
                    <a href="#none"><i class="facebook-ic"></i></a>
                    <a href="#none"><i class="twitter-ic"></i></a>
                    <a href="#none"><i class="kakao-ic"></i></a>
                </div>
            </div>
            <div class="goods-info-wrap">
                <form name="defaultForm" id="defaultForm" method="POST" action="/product/productPayment">
                    <input type="hidden" name="product_delivery_payment" value="${deliveryPayment}">
                    <div class="goods-name-wrap">
                        <p class="goods-name">
<%--                            <span class="tag-sale">세일</span>--%>
<%--                            <span class="tag-coupon">쿠폰</span>--%>
                            <br>
                            ${list.product_brand_name}<br> ${list.product_name}
                        </p>
                    </div>
                    <div class="goods-price-wrap">
                        <div class="goods-price-row text-gray">
                            <div class="price-title">
                                소비자가
                            </div>
                            <div class="price-number before-price">
                                <fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원
                            </div>
                        </div>
    <%--                    <div class="goods-price-row text-gray">--%>
    <%--                        <div class="price-title">--%>
    <%--                            세일--%>
    <%--                        </div>--%>
    <%--                        <div class="price-number before-price">--%>
    <%--                            31,900원--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
                        <div class="goods-price-row text-gray">
                            <div class="price-title">
                                판매가<br>
    <%--                            <span class="coupon-rate">20% 쿠폰</span><span class="coupon-date">19.03.18-19.04.17</span>--%>
                            </div>
                            <div class="price-number">
                                <span class="real-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</span>
                            </div>
                        </div>
                        <div class="goods-price-row">
                            <div class="price-title">
    <%--                            카드할인혜택--%>
    <%--                            <span class="more-info" tabindex="0">?--%>
    <%--                                <div class="card-info-box"></div></span>--%>

                            </div>
                            <div class="price-number">
    <%--                            삼성카드 청구할인 5%--%>
                            </div>
                        </div>
                    </div>
                    <div class="goods-point-wrap">
                        <div class="goods-point-row">
                            <div class="point-title">ONEJOY 포인트 적립예상</div>
                            <div class="point-number">${list.product_point_rate}%</div>
                        </div>
                    </div>
                    <div class="shipping-fee-wrap">
                        <div class="shipping-fee-row">
                            <div class="shipping-title text-gray">
                                배송안내
                            </div>
                            <div class="shipping-number">
                                ${list.product_delivery_international_type_name} ${list.product_delivery_type_name} 
                                <br>${list.product_delivery_payment_type_name} ${delivery.get("delivery_payment")}
                            </div>
                        </div>
                    </div>
                    <div class="goods-point-wrap">
                        <div class="goods-point-row">
                            <div class="point-title">&nbsp;</div>
                        </div>
                    </div>
                    <div class="cart-option-wrap">


                        ${option}


                    </div>
                    <div class="quantity-box">
                        <span>구매수량</span>
                        <div class="total-quantity">
                            <div class="minus" tabindex="0">-</div>
                            <input type="hidden" name="payment_order_quantity" value="1">
                            <div class="number">1</div>
                            <div class="plus" tabindex="0">+</div>
                        </div>
                    </div>
                    <%--                    <div class="total-price">--%>
                    <%--                        <div class="total-price-title">상품 금액 합계</div>--%>
                    <%--                        <div class="total-price-number"><span>2,230,000</span>원</div>--%>
                    <%--                    </div>--%>



                    <div class="buy-wrap">
                        <button class="incart" type="button" onclick="addShoppingBasket('${list.product_cd}')">장바구니</button>
                        <button class="buynow" type="button" id="paymentSubmit">바로구매</button>
                        <input type="hidden" name="order_max" value="${list.product_max_limit}" />
                        <input type="hidden" name="order_min" value="${list.product_min_limit}" />
                        <input type="hidden" name="product_delivery_bundle_yn" value="${list.product_delivery_bundle_yn}" />
                        <input type="hidden" name="product_user_ud" value="${list.product_user_ud}" />
                        <button class="favorite" type="button" data-id="${list.product_cd}">

                                <i class="heart-empty <c:if test="${heart}">heart-full</c:if>"> </i>

                        </button>
                    </div>
                    <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
                </form>
            </div>
        </div>
    </article>
    <article class="banner-section">
        <div class="inner">
            <a href="${lineBannerList1.url}" class="img-box">
            <img src="${lineBannerList1.file_1}" /></a>
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
                    <li><a href="#goods-review"><span>상품평</span></a></li>
                    <li><a href="#goods-qna"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="description-img">
                    ${list.product_html}
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
                    <li><a href="goods-review"><span>상품평</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <c:out value="${configtop.market_config_value}" escapeXml="false"/>
                <div class="goods-information-wrap ">
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
                <c:out value="${configbot.market_config_value}" escapeXml="false"/>
            </div>
            <div class="goods-detail-wrap" id="goods-review">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information"><span>상품정보</span></a></li>
                    <li><a href="goods-review" class="active"><span>상품평</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <c:import url="/product/productDetailReview"/>

            <div class="goods-detail-wrap" id="goods-qna">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information"><span>상품정보</span></a></li>
                    <li><a href="goods-review"><span>상품평</span></a></li>
                    <li><a href="goods-qna" class="active"><span>상품Q &amp; A</span></a></li>
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
<%--                                <select name="order" class="order-select">--%>
<%--                                    <option value="all">전체</option>--%>
<%--                                    <option value="goods">상품</option>--%>
<%--                                    <option value="shipping">배송</option>--%>
<%--                                    <option value="refund">반품/환불/취소</option>--%>
<%--                                    <option value="etc">기타</option>--%>
<%--                                </select>--%>
                                <button type="button" class="write-review" id="productqna" data-id="${list.product_cd}">작성하기</button>
                            </div>
                        </div>
                        <ul class="qna-data-list">
                        </ul>
                    </div>
                    <ul class="pagination">

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
                    <li><a href="goods-review"><span>상품평</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping" class="active"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="shipping-wrap">
                    <h5>배송/결제/교환/환불</h5>
                    <div class="shipping-box">
                        <h6>배송 안내<i class="arrow-down"></i></h6>
                        ${list.product_delivery_info}
                        <br>
                        <b>상품 출고지</b>
                        <br>
                        ${store_delivery.forward_value}
                          <br>
                    </div>
                    <div class="return-box">
                        <h6>교환/반품 안내<i class="arrow-down"></i></h6>
                        <br>
                        <b>교환 및 반품 주소</b>
                        <br>
                        ${store_delivery.refund_value}
                          <br><br>
                        ${list.product_change_info}
                    </div>
                    <div class="refund-box">
                        <h6>환불 안내<i class="arrow-down"></i></h6>
                        ${list.product_service_info}
                    </div>
                </div>
            </div>
        </div>
    </article>
</section>
<script>
    $(document).ready(function(){
        callQnalist('${param.product_cd}',1);

        $('.goods-slider').bxSlider({
            // auto:false,
            // autoHover:true,
            speed:500,
            mode:'horizontal',
            // autoControls:true,
            // pager:true,
            // controls:true,
            // useCSS:false,
            pagerCustom: '#bx-pager',
            randomStart: false,
            // touchEnabled : (navigator.maxTouchPoints > 0),
        });
        $('.related-goods').bxSlider({
            // auto:false,
            mode:'horizontal',
            slideWidth:330,
            moveSlides:4,
            slideMargin:60,
            minSlides:4,
            maxSlides:4,
            speed:500,
            // pager:false,
            // autoControls:true,
            // controls:true,
            // useCSS:false,
            // touchEnabled : (navigator.maxTouchPoints > 0),
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
     /*   $('.option-box').click(function(){
//               $('.bnr-header').css('display','none');
            $('.arrow-down').toggleClass('arrow-up');
            $('.option-list').toggleClass('display-block')
        });*/
        $('.optionBtn').click(function(){
            $(this).siblings('.optionBtn').removeClass('on');
            $(this).addClass('on');
        })

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
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
