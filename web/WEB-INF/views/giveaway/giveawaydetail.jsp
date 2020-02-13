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
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="goods-main">
        <h3 class="main-title hide">상품영역</h3>
        <div class="inner">
            <div class="goods-slider-wrap">
                <ul class="goods-slider">
                    <li><img src="<c:url value="/assets/fileupload/giveaway/${detail.giveaway_list_image}"/>" /></li>
                    <li><img src="/assets/fileupload/giveaway/${detail.giveaway_list_image}" /></li>
                    <li><img src="/assets/fileupload/giveaway/${detail.giveaway_list_image}" /></li>
                </ul>
                <div id="bx-pager">
                    <a data-slide-index="0" href=""><img src="/assets/fileupload/giveaway/${detail.giveaway_list_image}" /></a>
                    <a data-slide-index="1" href=""><img src="/assets/fileupload/giveaway/${detail.giveaway_list_image}" /></a>
                    <a data-slide-index="2" href=""><img src="/assets/fileupload/giveaway/${detail.giveaway_list_image}" /></a>
                </div>

                <div class="share-list">
                    <a href="#none"><i class="facebook-ic"></i></a>
                    <a href="#none"><i class="twitter-ic"></i></a>
                    <a href="#none"><i class="kakao-ic"></i></a>
                </div>
            </div>
            <div class="goods-info-wrap">
                <div class="goods-name-wrap">
                    <p class="goods-name">
                        ${detail.get("giveaway_name")}
                    </p>
                </div>
                <div class="point-pdt-parti-wrap">
                    <div class="parti-percent-wrap">
                        <span class="progress">0%</span>
                        <span class="progress-now">참여율 <b class="progress-now-number"> ${detail.parti_rate}%</b><span class="parti-ppl"> &#40;<span class="parti-ppl-number"><fmt:formatNumber value="${detail.player_count}" groupingUsed="true" /></span>명 참여 중&#41;</span></span>
                        <span class="progress">100%</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-bar-active" style="width:${detail.parti_rate}%"></div>
                    </div>
                    <div class="parti-point-wrap">
                        <p><span class="parti-point-now"><fmt:formatNumber value="${detail.sum_play_point}" groupingUsed="true" /></span>/<fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /> E-point</p>
                        <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                    </div>
                </div>
                <div class="shipping-fee-wrap">
                    <div class="shipping-fee-row">
                        <div class="shipping-title text-gray">
                            배송안내
                        </div>
                        <div class="shipping-number">
                            ${delivery.get("delivery_payment")}
<%--                            현대택배 2,500원 &#40;결제금액 20,000원 이상 무료&#41;--%>
                        </div>
<%--                        <c:forEach items="${fn:split('1|2|3|4|5', '|') }" var="item">--%>
<%--                            ${item}<br/>--%>
<%--                        </c:forEach>--%>
                    </div>
                </div>
                <div class="cart-option-wrap">
                    <div class="quantity-box">
                        <span>
                            <c:if test="${sessionScope.login}">
                                보유포인트 <fmt:formatNumber value="${point_amount}" groupingUsed="true" /> Point
                            </c:if>
                            <c:if test="${!sessionScope.login}">
                                <a href="<c:url value="/sign/login"/>"> 로그인 후 포인트학인</a>
                            </c:if>
                            / 응모포인트</span>
                        <div class="total-quantity">
                            <form name="defaultForm" id="defaultForm" method="post">
                                <input type="number" id="point" name="point" value='${detail.giveaway_payment}'><span>  Point</span>
                                <input type="hidden" id="point_amount" name="point_amount" value='${point_amount}'><span>  Point</span>
                                <input type="hidden" id="giveaway_id" name="giveaway_id" value='${requestScope.giveaway_id}'>
                                <input type="hidden" id="giveaway_cd" name="giveaway_cd" value='${detail.giveaway_cd}'>
                            </form>
                        </div>
                    </div>
                    <div class="total-price">
                        <div class="total-price-title">응모 E-point</div>
                        <div class="total-price-number"><span><fmt:formatNumber value="${detail.giveaway_payment}" groupingUsed="true" /></span>point</div>
                    </div>
                </div>
                <div class="buy-wrap">
                    <button class="buynow" type="button" id="formSubmit">바로 응모하기</button>
                    <button class="favorite ready" type="button"><i class="heart-empty" ></i></button>
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
            <h2>비슷한 상품</h2>
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
                    <li><a href="#goods-shipping"><span>경품안내</span></a></li>
                </ul>
                <div class="description-img">
                    <img src="../assets/img/goods-view/details.jpg" />
                </div>
            </div>
            <div class="also-viewed-goods">
                <h5>함께 본 경품</h5>
                <ul class="related-goods">
                    <li><a href="#">
                        <img src="../assets/img/e-point-img1.png" />
                        <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                    </a>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">
                        <img src="../assets/img/e-point-img1.png" />
                        <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                    </a>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">
                        <img src="../assets/img/e-point-img1.png" />
                        <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                    </a>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">
                        <img src="../assets/img/e-point-img1.png" />
                        <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                    </a>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">
                        <img src="../assets/img/e-point-img1.png" />
                        <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                    </a>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">
                        <img src="../assets/img/e-point-img1.png" />
                        <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                    </a>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">
                        <img src="../assets/img/e-point-img1.png" />
                        <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                    </a>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="goods-detail-wrap" id="goods-information">
                <ul class="detail-nav">
                    <li><a href="#goods-description"><span>상품설명</span></a></li>
                    <li><a href="#goods-information" class="active"><span>상품정보</span></a></li>
                    <li><a href="#goods-shipping"><span>경품안내</span></a></li>
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
            <div class="goods-detail-wrap" id="goods-shipping">
                <ul class="detail-nav">
                    <li><a href="#goods-description"><span>상품설명</span></a></li>
                    <li><a href="#goods-information"><span>상품정보</span></a></li>
                    <li><a href="#goods-shipping" class="active"><span>경품안내</span></a></li>
                </ul>
                <div class="shipping-wrap">
                    <h5>경품응모/당첨방식/세금</h5>
                    <div class="shipping-box">
                        <h6>경품 응모<i class="arrow-down"></i></h6>
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
                        <h6>당첨 방식<i class="arrow-down"></i></h6>
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
                        <h6>경품 세금 안내<i class="arrow-down"></i></h6>
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
            touchEnabled : (navigator.maxTouchPoints > 0),
        });
        var relatedgoods = $('.related-goods').bxSlider({
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
            touchEnabled : (navigator.maxTouchPoints > 0),
            // 웹접근성 추가
            onSliderLoad: function(){
                $(".bx-clone").find("a").prop("tabIndex","-1");
            },
            onSlideAfter: function(){
                $(".related-goods").children("li").each(function(){
                    if($(this).attr("aria-hidden") == "false"){
                        $(this).find("a").attr("tabIndex","0");
                    }else{
                        $(this).find("a").attr("tabIndex","-1");
                    }
                });
            }
        });
    });

    // 웹 접근성
    $('.related-goods a').focusin(function () {
        relatedgoods.stopAuto();
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

</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>