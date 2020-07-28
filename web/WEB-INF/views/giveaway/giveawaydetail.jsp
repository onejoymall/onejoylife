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
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="goods-main">
        <h3 class="main-title hide">상품영역</h3>
        <div class="inner">
            <c:import url="/layout/scrollRight"/>
            <div class="goods-slider-wrap">
                <ul class="goods-slider">
                    <li><img src='${detail.file_1}'  ></li>
                    <c:if test="${detail.file_5}">
                        <li><img src='${detail.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
                    </c:if>

                </ul>
                <div id="bx-pager">
                    <a data-slide-index="0" href=""><img src='${detail.file_1}'  ></a>
                    <c:if test="${detail.file_5}">
                    <a data-slide-index="1" href=""><img src='${detail.file_5}' onerror="this.src='http://placehold.it/80'" ></a>
                    </c:if>
                </div>

                <div class="share-list">
                    <a href="#none" onclick="snsSubmit('fackbook', '');"><i class="facebook-ic" onclick="share_giveaway('${detail.giveaway_id}', '${detail.giveaway_name}')"></i></a>
<%--                    <a href="#none"><i class="twitter-ic"></i></a>--%>
<%--                    <a href="#none"><i class="kakao-ic"></i></a>--%>
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
                        <span class="progress-now">참여율 ${afn:getMessage("korea_won",sessionScope.locale)} <b class="progress-now-number"> ${detail.parti_rate}%</b><span class="parti-ppl"> <%--&#40;<span class="parti-ppl-number"><fmt:formatNumber value="${detail.player_count}" groupingUsed="true" /></span>명 참여 중&#41;--%></span></span>
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
                                <a href="<c:url value="/sign/login"/>"> 로그인 후 포인트확인</a>
                            </c:if>
                            / 응모포인트</span>
                        <div class="total-quantity">
                            <form name="defaultForm" id="defaultForm" method="post">
                                <input type="number" id="point" name="point" value='${detail.giveaway_play_winner_point - detail.sum_play_point}'><span>  Point</span>
                                <input type="hidden" id="point_amount" name="point_amount" value='${point_amount}'><span></span>
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
                <c:if test="${not empty detail.email}">
                <div class="winner-wrap">
                    <h3><i class="win-icon"></i></h3>
                    <p class="winner">${detail.email}</p>
                </div>
                </c:if>
                <c:if test="${empty detail.email}">
                <div class="buy-wrap">
                    <button class="buynow" type="button" id="giveaway_apply">바로 응모하기</button>
                    <button class="favorite ready" type="button"><i class="heart-empty" ></i></button>
                </div>
                </c:if>
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
            <h2>관련 경품</h2>
            <ul class="related-goods">
            	<c:if test="${not empty relatedProductList}">
            	<c:forEach var="list" items="${relatedProductList}">
	            	<li><a href="<c:url value="/giveaway/giveawaydetail?giveaway_id=${list.giveaway_id}"/>">
	                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
	                    <p class="goods-name">${list.giveaway_name}</p>
	                    <p class="goods-price"><span><fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /></span>원</p>
	                </a></li>
                </c:forEach>
            	</c:if>
            	<c:if test="${empty relatedProductList}">
            		관련경품이 없습니다.
            	</c:if>
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
                    ${detail.giveaway_html}
                </div>
            </div>
			<div class="also-viewed-goods">
                <h5>함께 본 경품</h5>
                <ul class="related-goods">
                    <c:if test="${not empty serialProductList}">
	            	<c:forEach var="list" items="${serialProductList}">
		            	<li><a href="<c:url value="/giveaway/giveawaydetail?giveaway_id=${list.giveaway_id}"/>">
		                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
		                    <p class="goods-name">${list.giveaway_name}</p>
		                    <p class="goods-price"><span><fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /></span>원</p>
		                </a></li>
	                </c:forEach>
	            	</c:if>
	            	<c:if test="${empty serialProductList}">
	            		함께 본 경품이 없습니다.
	            	</c:if>
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
                    <!-- <p class="goods-name">SM-G05-ZR/SS</p>
                    <p class="goods-subtitle">일반세탁기 WA15M6551KS [15KG / 워블세탁기 / 회오리세탁 / 다이아몬드필터 / 인버터모터 / 무세제통세척]</p> -->
                    <table class="goods-information-table">
                    	<c:if test="${!afn:contains(product_ct_arr,'882') &&
                    				  !afn:contains(product_ct_arr,'32') &&
                    				  !afn:contains(product_ct_arr,'815') &&
                    				  !afn:contains(product_ct_arr,'51') &&
                    				  !afn:contains(product_ct_arr,'50') &&
                    				  !afn:contains(product_ct_arr,'152') &&
                    				  !afn:contains(product_ct_arr,'25') &&
                    				  !afn:contains(product_ct_arr,'461') &&
                    				  !afn:contains(product_ct_arr,'27') &&
                    				  !afn:contains(product_ct_arr,'122') &&
                    				  !afn:contains(product_ct_arr,'126') &&
                    				  !afn:contains(product_ct_arr,'906') &&
                    				  !afn:contains(product_ct_arr,'174')}">
	                        <tr><th>1. 소재</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 색상</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'882')}">
							<tr><th>1. 품명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. KC 인증 필 유뮤(품질경영 및 공산품안전관리법상 안전º품질표시대상공산품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 색상</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 구성품</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 주요 소재</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th> ＊ 구성품 별 제조자가 다른 경우 각 구성품의 제조자, 수입자</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th> ＊ 구성품 별 제조자가 다른 경우 각 구성품의 제조자, 수입자</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 배송º설치비용</th><td>상세페이지 참조</td></tr>
							<tr><th>10. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>11. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'32')}">
							<tr><th>1. 건강기능식품에 관한 법률에 따른 표시사항</th><td>상세페이지 참조</td></tr>
							<tr><th>1-1. 식품의 유형</th><td>상세페이지 참조</td></tr>
							<tr><th>1-2. 생산자 및 소재지, 수입품의 경우 수입자를 함께 표기</th><td>상세페이지 참조</td></tr>
							<tr><th>1-3. 제조연월일, 유통기한 또는 품질유지기한</th><td>상세페이지 참조</td></tr>
							<tr><th>1-4. 포장단위별 용량(중량), 수량</th><td>상세페이지 참조</td></tr>
							<tr><th>1-5. 원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함)</th><td>상세페이지 참조</td></tr>
							<tr><th>1-6. 영양성분</th><td>상세페이지 참조</td></tr>
							<tr><th>1-7. 기능정보</th><td>상세페이지 참조</td></tr>
							<tr><th>1-8. 섭취량, 섭취방법 및 섭취 시 주의사항</th><td>상세페이지 참조</td></tr>
							<tr><th>1-9. 질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현</th><td>상세페이지 참조</td></tr>
							<tr><th>1-10. 유전자재조합식품에 해당하는 경우의 표시</th><td>상세페이지 참조</td></tr>
							<tr><th>1-11. 표시광고 사전심의필</th><td>상세페이지 참조</td></tr>
							<tr><th>1-12. 수입식품에 해당하는 경우 "건강기능식품에 관한 법률에 따른 수입신고를 필함"의 문구</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 소비자상담 관련 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'126') ||
									  afn:contains(product_ct_arr,'174')}">
							<tr><th>1. 품명 및 모델명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 전기용품 안전인증 필 유무(전기용품안전관리법상 안전인증대상전기용품, 자율안전확인대상전기용품, 공급자적합성확인대상전기용품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 정격전압, 소비전력, 에너지소비효율등급(에너지이용합리화법상 의무대상상품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 동일모델의 출시년월</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 크기(형태 및 실외기 포함)</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 냉난방면적</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 추가설치비용</th><td>상세페이지 참조</td></tr>
							<tr><th>10. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>11. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'122')}">
							<tr><th>1. 종류</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 소재</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 치수</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자, 수입품의 경우 수입자들 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 재조국</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 취급시 주의사항</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 품질보증기준</th><td>상세페이지 참조</td></tr>
							<tr><th>8. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'27')}">
							<tr><th>1. 품명 및 모델명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 법에 의한 인증, 허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 제조국 또는 원산지</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자, 수입품의 경우 수입자들 함께 표기</th><td>상세페이지 참조</td></tr>
							<tr><th>5. A/S 책임자와 전화번호 또는 소비자상담 관련 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'461')}">
							<tr><th>1. 용량 또는 중량</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 제품 주용 사양(피부타입, 색상(호,번) 등)</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 사용기한 또는 개봉 후 사용기간(개봉 후 사용기 간을 기재할 경우에는 제조연월일을 병행표기)</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 사용방법</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 제조자 및 제조판매업자</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 주요성분(유기농 화장품의 경우 유기농 원료 함량 표함)</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 기능성 화장품의 경우 화장품법에 따른 식품의약 품안전청 심사 필 유무(미백, 주름개선, 자외선차단 등)</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 사용할 때 주의사항</th><td>상세페이지 참조</td></tr>
							<tr><th>10. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>11. 소비자상담관련 전화번호</th><td>상세페이지 참조</td></tr>
							<tr><th colspan="2">※ 사용기한을 기재하는 경우 ex)2013.10, 2013.10~2014.8., 2013.10~, 주문일로부터 1 년 이상 남음
							<br>※ 제조연월일과 개봉 후 사용기간을 기재하는 경우 ex) 제조일 2011.10~2012.4, 개봉후 2 년내 사용 / 주문일로부터 1 년 이내, 개봉후 2 년내 사용</th></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'906')}">
							<tr><th>1. 소재/순도/밴드재질(시계의 경우)</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 중량</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 제조자, 수입품의 수입자를 함께 표기 (병행수입 의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조국(원산지와 가공지 등이 다를 경우 함께 표기)</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 치수</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 착용 시 주의사항</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 주요사양</th><td>상세페이지 참조</td></tr>
							<tr><th>7-1. 귀금속, 보석류 - 등급</th><td>상세페이지 참조</td></tr>
							<tr><th>7-2. 시계-기능, 방수 등</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 보증서 제공여부</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>10. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'25')}">
							<tr><th>1. 식품위생버에 따른 표시사항</th><td>상세페이지 참조</td></tr>
							<tr><th>1-1. 식품의 유형</th><td>상세페이지 참조</td></tr>
							<tr><th>1-2. 생산자 및 소재지, 수입품의 경우 수입자를 함께 표기</th><td>상세페이지 참조</td></tr>
							<tr><th>1-3. 제조연월일, 유통기한 또는 품질유지기한</th><td>상세페이지 참조</td></tr>
							<tr><th>1-4. 포장단위별 용량(중량), 수량</th><td>상세페이지 참조</td></tr>
							<tr><th>1-5. 원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함)</th><td>상세페이지 참조</td></tr>
							<tr><th>1-6. 영양성분(식품위생법에 따른 영양성분 표시대상식품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>1-7. 유전자재조합식품에 해당하는 경우에 표시</th><td>상세페이지 참조</td></tr>
							<tr><th>1-8. 영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필</th><td>상세페이지 참조</td></tr>
							<tr><th>1-9. 수입식품에 해당하는 경우 '식품위생법에 따른 수입신고를 필함'의 문구</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 소비자상담 관련 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'152')}">
							<tr><th>1. 품명 및 모델명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 동일모델의 출시년월</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 자동차관리법에 따른 자동차부품 자기인증 유무(인증 대상 자동차부품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 적용차종</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>9. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'50') ||
									  afn:contains(product_ct_arr,'51')}">
							<tr><th>1. 포장단위별 용량(중량), 수량, 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 생산자. 수입품의 경우 수입자를 함께 표기</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 농수산물의 원산지 표시에 관한 법률에 따른 원산지</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조연월일(포장지 또는 생산연도), 유통기한 또는 품질유지기한</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 관련벙상 표시사항</th><td>상세페이지 참조</td></tr>
							<tr><th>5-1. 농산물 - 농산물품질관리법상 유전자변형농산물 표시, 지리적표시</th><td>상세페이지 참조</td></tr>
							<tr><th>5-2. 축산물 - 축산법에 따른 등급 표시, 쇠고기의 경우 이력관리에 따른 표시 유무</th><td>상세페이지 참조</td></tr>
							<tr><th>5-3. 수산물 -  수산물품질관리법상 유전자변형수산물 표시, 지리적표시</th><td>상세페이지 참조</td></tr>
							<tr><th>5-4. 수입식품에 해당하는 경우 '식품위생법에 따른 수입신고를 필함'의 문구</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 상품구성</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 보관방법 또는 취급방법</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 소비자상담 관련 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'815')}">
							<tr><th>1. 품명 및 모델명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 재질</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 구성품</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 동일모델의 출시년월</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 제조자, 수입품의 수입자를 함께 표기 (병행수입 의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 식품위생법에 따른 수입 기구-용기의 경우 '식품위생법에 따른 수입신고를 필함'의 문구</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>10. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
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
            touchEnabled : false,
        });
        var relatedgoods = $('.related-goods').bxSlider({
            auto:false,
            mode:'horizontal',
            slideWidth:202,
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
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>