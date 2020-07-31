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
        <h3 class="main-title hide">${afn:getMessage("product_area",sessionScope.locale)}</h3>
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
                        <span class="progress-now">${afn:getMessage("participation_rate",sessionScope.locale)} <b class="progress-now-number"> ${detail.parti_rate}%</b><span class="parti-ppl"> <%--&#40;<span class="parti-ppl-number"><fmt:formatNumber value="${detail.player_count}" groupingUsed="true" /></span>명 참여 중&#41;--%></span></span>
                        <span class="progress">100%</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-bar-active" style="width:${detail.parti_rate}%"></div>
                    </div>
                    <div class="parti-point-wrap">
                        <p><span class="parti-point-now"><fmt:formatNumber value="${detail.sum_play_point}" groupingUsed="true" /></span>/<fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /> E-point</p>
                        <p>&#40;${afn:getMessage("msg_giveawaypointinfo",sessionScope.locale)}&#41;</p>
                    </div>
                </div>
                <div class="shipping-fee-wrap">
                    <div class="shipping-fee-row">
                        <div class="shipping-title text-gray">
                           ${afn:getMessage("delivery_info",sessionScope.locale)}
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
                            <c:if test="${sessionScope.login}"> ${afn:getMessage("mypoint",sessionScope.locale)} <fmt:formatNumber value="${point_amount}" groupingUsed="true" /> Point
                            </c:if>
                            <c:if test="${!sessionScope.login}">
                                <a href="<c:url value="/sign/login"/>"> ${afn:getMessage("lgpointchk",sessionScope.locale)}</a>
                            </c:if>
                            / ${afn:getMessage("applPoint",sessionScope.locale)}</span>
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
                        <div class="total-price-title">t${afn:getMessage("applE-Point",sessionScope.locale)}</div>
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
                    <button class="buynow" type="button" id="giveaway_apply">${afn:getMessage("applPrizeNow",sessionScope.locale)}</button>
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
            <h2>${afn:getMessage("relate_prize",sessionScope.locale)}</h2>
            <ul class="related-goods">
            	<c:if test="${not empty relatedProductList}">
            	<c:forEach var="list" items="${relatedProductList}">
	            	<li><a href="<c:url value="/giveaway/giveawaydetail?giveaway_id=${list.giveaway_id}"/>">
	                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
	                    <p class="goods-name">${list.giveaway_name}</p>
	                    <p class="goods-price"><span><fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /></span>${afn:getMessage("korea_won",sessionScope.locale)}</p>
	                </a></li>
                </c:forEach>
            	</c:if>
            	<c:if test="${empty relatedProductList}">
            		${afn:getMessage("msg_noPrizemsg",sessionScope.locale)}
            	</c:if>
            </ul>
        </div>
    </article>
    <article class="goods-detail-section">
        <div class="inner">
            <div class="goods-detail-wrap" id="goods-description">
                <ul class="detail-nav">
                    <li><a href="#goods-description" class="active"><span>${afn:getMessage("product_description",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-information"><span>${afn:getMessage("product_information",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-shipping"><span>${afn:getMessage("prize_guide_info",sessionScope.locale)}</span></a></li>
                </ul>
                <div class="description-img">
                    ${detail.giveaway_html}
                </div>
            </div>
			<div class="also-viewed-goods">
                <h5>${afn:getMessage("otherUserSeen",sessionScope.locale)}</h5>
                <ul class="related-goods">
                    <c:if test="${not empty serialProductList}">
	            	<c:forEach var="list" items="${serialProductList}">
		            	<li><a href="<c:url value="/giveaway/giveawaydetail?giveaway_id=${list.giveaway_id}"/>">
		                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
		                    <p class="goods-name">${list.giveaway_name}</p>
		                    <p class="goods-price"><span><fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /></span>${afn:getMessage("korea_won",sessionScope.locale)}</p>
		                </a></li>
	                </c:forEach>
	            	</c:if>
	            	<c:if test="${empty serialProductList}">
	            		${afn:getMessage("msg_seenNoOtherPrize",sessionScope.locale)}
	            	</c:if>
                </ul>
            </div>
            <div class="goods-detail-wrap" id="goods-information">
                <ul class="detail-nav">
                    <li><a href="#goods-description"><span>${afn:getMessage("product_description",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-information" class="active"><span>${afn:getMessage("product_information",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-shipping"><span>${afn:getMessage("prize_guide_info",sessionScope.locale)}</span></a></li>
                </ul>
                <div class="goods-information-wrap">
                    <h5>${afn:getMessage("prod_es_info",sessionScope.locale)}</h5>
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
	                        <tr><th>1. ${afn:getMessage("giveaway_item",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("giveaway_color",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("giveaway_size",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("giveaway_manu",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'882')}">
							<tr><th>1. ${afn:getMessage("giveaway_itemname",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("giveaway_certi",sessionScope.locale)}(${afn:getMessage("msg_giveaway_certi",sessionScope.locale)})</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. </th><td>${afn:getMessage("giveaway_color",sessionScope.locale)}</td></tr>
							<tr><th>4. </th><td>${afn:getMessage("giveaway_components",sessionScope.locale)}</td></tr>
							<tr><th>5. </th><td>${afn:getMessage("giveaway_main_mat",sessionScope.locale)}</td></tr>
							<tr><th>6. ${afn:getMessage("giveaway_manu",sessionScope.locale)}, ${afn:getMessage("msg_giveaway_manu1-1",sessionScope.locale)} (${afn:getMessage("msg_giveaway_manu1-2",sessionScope.locale)})</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th> ＊ ${afn:getMessage("msg_giveaway_manu1-3",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7. ${afn:getMessage("giveaway_orgin_coun",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th> ＊ ${afn:getMessage("msg_giveaway_orgin_coun1",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							
							
							<tr><th>8. ${afn:getMessage("giveaway_size",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>9. ${afn:getMessage("giveaway_deliv_inst",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>10. ${afn:getMessage("giveaway_quality",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>11. ${afn:getMessage("giveaway_AS_ph",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'32')}">
							<tr><th>1. ${afn:getMessage("msg_giveaway_rules_1-1",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-1. ${afn:getMessage("giveaway_foodtype",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-2. ${afn:getMessage("msg_giveaway_rules_1-2",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-3. ${afn:getMessage("msg_giveaway_rules_1-3",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-4. ${afn:getMessage("msg_giveaway_rules_1-4",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-5. ${afn:getMessage("msg_giveaway_rules_1-5",sessionScope.locale)}(${afn:getMessage("msg_giveaway_rules_1-6",sessionScope.locale)})</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-6. ${afn:getMessage("giveaway_nutrient",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-7. ${afn:getMessage("giveaway_Functioninfo",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-8. ${afn:getMessage("msg_giveaway_rules_1-7",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-9. ${afn:getMessage("msg_giveaway_rules_1-8",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-10. ${afn:getMessage("msg_giveaway_rules_1-9",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-11. ${afn:getMessage("msg_giveaway_rules_1-10",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-12. ${afn:getMessage("msg_giveaway_rules_1-11",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2.	 ${afn:getMessage("msg_giveaway_rules_1-12",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'126') ||
									  afn:contains(product_ct_arr,'174')}">
							<tr><th>1. ${afn:getMessage("name_modelN",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("msg_giveaway_energy1-1",sessionScope.locale)}(${afn:getMessage("msg_giveaway_energy1-2",sessionScope.locale)})</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("msg_giveaway_energy1-3",sessionScope.locale)}(${afn:getMessage("msg_giveaway_energy1-4",sessionScope.locale)})</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("sameModelcmyear",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5. ${afn:getMessage("msg_giveaway_energy1-5",sessionScope.locale)} (${afn:getMessage("msg_giveaway_energy1-6",sessionScope.locale)})</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>6. ${afn:getMessage("giveaway_orgin_coun",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7. ${afn:getMessage("size_shape",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>8. ${afn:getMessage("acArea",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>9. ${afn:getMessage("addsetupPrize",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>10. ${afn:getMessage("qualityQuarantee",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>11. ${afn:getMessage("giveaway_AS_ph",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'122')}">
							<tr><th>1. ${afn:getMessage("typesOf",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("giveaway_item",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("disparity",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("msg_giveaway_energy1-5",sessionScope.locale)} (${afn:getMessage("msg_giveaway_energy1-6",sessionScope.locale)})</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5. ${afn:getMessage("giveaway_orgin_coun",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>6. ${afn:getMessage("giveaway_handle",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7. ${afn:getMessage("qualityQuarantee",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>8. ${afn:getMessage("giveaway_AS_ph",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'27')}">
							<tr><th>1. ${afn:getMessage("name_modelN",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("msg_giveaway_rules1-13",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("giveaway_orgin_coun2",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("msg_giveaway_rules1-14",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5. ${afn:getMessage("msg_giveaway_rules1-15",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'461')}">
							<tr><th>1. ${afn:getMessage("volume_weight",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("msg_giveaway_product1-1",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("msg_giveaway_product1-2",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("howtoUse",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5. ${afn:getMessage("orgin_coun_seller",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>6. ${afn:getMessage("giveaway_orgin_coun",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7. ${afn:getMessage("msg_giveaway_product1-3",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>8. ${afn:getMessage("msg_giveaway_product1-4",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>9. ${afn:getMessage("whenUseWarn",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>10. ${afn:getMessage("qualityQuarantee",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>11. ${afn:getMessage("counselNum",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th colspan="2">※${afn:getMessage("msg_giveaway_product1-5",sessionScope.locale)} 
							<br>※ ${afn:getMessage("msg_giveaway_product1-6",sessionScope.locale)}</th></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'906')}">
							<tr><th>1. ${afn:getMessage("msg_giveaway_product1-7",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("weight",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("msg_giveaway_product1-8",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("msg_giveaway_product1-9",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5. ${afn:getMessage("disparity",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>6. ${afn:getMessage("wearWarn",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7. ${afn:getMessage("wearNoti",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7-1. ${afn:getMessage("msg_giveaway_product1-10",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7-2. ${afn:getMessage("msg_giveaway_product1-11",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>8. ${afn:getMessage("guaranteeYN",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>9. ${afn:getMessage("qualityQuarantee",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>10. ${afn:getMessage("giveaway_AS_ph",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'25')}">
							<tr><th>1. ${afn:getMessage("foodSanActLaw",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-1. ${afn:getMessage("giveaway_foodtype",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-2. ${afn:getMessage("msg_giveaway_rules_1-2",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-3. ${afn:getMessage("msg_giveaway_rules_1-3",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-4. ${afn:getMessage("msg_giveaway_rules_1-4",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-5. ${afn:getMessage("msg_giveaway_rules_1-5",sessionScope.locale)}(${afn:getMessage("msg_giveaway_rules_1-6",sessionScope.locale)})</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-6. ${afn:getMessage("msg_giveaway_rules_1-16",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-7. ${afn:getMessage("msg_giveaway_rules_1-17",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-8. ${afn:getMessage("msg_giveaway_rules_1-18",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>1-9. ${afn:getMessage("msg_giveaway_rules_1-19",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2.  ${afn:getMessage("msg_giveaway_rules_1-12",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'152')}">
							<tr><th>1. ${afn:getMessage("name_modelN",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("sameModelcmyear",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("msg_giveaway_rules_1-20",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("msg_giveaway_energy1-5",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5. ${afn:getMessage("giveaway_orgin_coun",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>6. ${afn:getMessage("giveaway_size",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7. ${afn:getMessage("moreinfoPg",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>8. ${afn:getMessage("qualityQuarantee",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>9. ${afn:getMessage("giveaway_AS_ph",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'50') ||
									  afn:contains(product_ct_arr,'51')}">
							<tr><th>1. ${afn:getMessage("msg_giveaway_rules_1-4-1",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("msg_giveaway_rules_1-21",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("msg_giveaway_rules_1-22",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("msg_giveaway_rules_1-23",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5. ${afn:getMessage("relate_law",sessionScope.locale)}</th><td>{afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5-1. ${afn:getMessage("msg_giveaway_rules_1-24",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5-2. ${afn:getMessage("msg_giveaway_rules_1-25",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5-3. ${afn:getMessage("msg_giveaway_rules_1-26",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5-4. ${afn:getMessage("msg_giveaway_rules_1-27",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>6. ${afn:getMessage("productMakeups",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7. ${afn:getMessage("howTOHandle2",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>8. ${afn:getMessage("msg_giveaway_rules_1-12",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'815')}">
							<tr><th>1. ${afn:getMessage("name_modelN",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>2. ${afn:getMessage("itemquality",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>3. ${afn:getMessage("giveaway_components",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>4. ${afn:getMessage("giveaway_size",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>5. ${afn:getMessage("sameModelcmyear",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>6. ${afn:getMessage("msg_giveaway_product1-8",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>7. ${afn:getMessage("giveaway_orgin_coun",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>8. ${afn:getMessage("msg_giveaway_rules_1-28",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>9. ${afn:getMessage("qualityQuarantee",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
							<tr><th>10. ${afn:getMessage("giveaway_AS_ph",sessionScope.locale)}</th><td>${afn:getMessage("moreinfoPg",sessionScope.locale)}</td></tr>
						</c:if>
                    </table>
                </div>
            </div>
            <div class="goods-detail-wrap" id="goods-shipping">
                <ul class="detail-nav">
                    <li><a href="#goods-description"><span>${afn:getMessage("product_description",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-information"><span>${afn:getMessage("product_information",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-shipping" class="active"><span>${afn:getMessage("prize_guide_info",sessionScope.locale)}</span></a></li>
                </ul>
                <div class="shipping-wrap">
                    <h5>${afn:getMessage("prizeAppl_system_tax",sessionScope.locale)}</h5>
                    <div class="shipping-box">
                        <h6>${afn:getMessage("prizeAppl",sessionScope.locale)}<i class="arrow-down"></i></h6>
                        <table class="shipping-table">
                            <tr>
                                <th>${afn:getMessage("deliv_area",sessionScope.locale)}</th>
                                <td>${afn:getMessage("deliv_allPlace",sessionScope.locale)}&#40;${afn:getMessage("deliv_excep",sessionScope.locale)}&#41;</td>
                            </tr>
                            <tr>
                                <th>${afn:getMessage("shippingFee",sessionScope.locale)}</th>
                                <td>
                                   ${afn:getMessage("msg_shipping_info1-1",sessionScope.locale)} &#40;${afn:getMessage("msg_shipping_info1-2",sessionScope.locale)}&#41;${afn:getMessage("msg_shipping_info1-3",sessionScope.locale)}<br>
                                    ${afn:getMessage("msg_shipping_info1-4",sessionScope.locale)}<br>
                                  ${afn:getMessage("msg_shipping_info1-5",sessionScope.locale)}<br>
                                   ${afn:getMessage("msg_shipping_info1-6",sessionScope.locale)}&#41;${afn:getMessage("msg_shipping_info1-7",sessionScope.locale)}&#41;<br>
                                  ${afn:getMessage("msg_shipping_info1-8",sessionScope.locale)}<br>
                                    &#40;${afn:getMessage("msg_shipping_info1-9",sessionScope.locale)}&#41; ${afn:getMessage("msg_shipping_info1-10",sessionScope.locale)}&#41;
                                </td>
                            </tr>
                            <tr>
                                <th>${afn:getMessage("company_products",sessionScope.locale)}</th>
                                <td>
                                    ${afn:getMessage("msg_shipping_info1-11",sessionScope.locale)}<br><br>
                                    ${afn:getMessage("delivDirec",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-12",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-13",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-14",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-15",sessionScope.locale)}<br><br>
                                    ${afn:getMessage("itemToDeliv",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-16",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-17",sessionScope.locale)}
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="return-box">
                        <h6>${afn:getMessage("howToWin",sessionScope.locale)}<i class="arrow-down"></i></h6>
                        <table class="return-table">
                            <tr>
 							<th>${afn:getMessage("deliv_area",sessionScope.locale)}</th>
                                <td>${afn:getMessage("deliv_allPlace",sessionScope.locale)}&#40;${afn:getMessage("deliv_excep",sessionScope.locale)}&#41;</td>
                            </tr>
                            <tr>
                                <th>${afn:getMessage("shippingFee",sessionScope.locale)}</th>
                                <td>
                                   ${afn:getMessage("msg_shipping_info1-1",sessionScope.locale)} &#40;${afn:getMessage("msg_shipping_info1-2",sessionScope.locale)}&#41;${afn:getMessage("msg_shipping_info1-3",sessionScope.locale)}<br>
                                    ${afn:getMessage("msg_shipping_info1-4",sessionScope.locale)}<br>
                                  ${afn:getMessage("msg_shipping_info1-5",sessionScope.locale)}<br>
                                   ${afn:getMessage("msg_shipping_info1-6",sessionScope.locale)}&#41;${afn:getMessage("msg_shipping_info1-7",sessionScope.locale)}&#41;<br>
                                  ${afn:getMessage("msg_shipping_info1-8",sessionScope.locale)}<br>
                                    &#40;${afn:getMessage("msg_shipping_info1-9",sessionScope.locale)}&#41; ${afn:getMessage("msg_shipping_info1-10",sessionScope.locale)}&#41;
                                </td>
                            </tr>
                           <tr>
                                <th>${afn:getMessage("company_products",sessionScope.locale)}</th>
                                <td>
                                    ${afn:getMessage("msg_shipping_info1-11",sessionScope.locale)}<br><br>
                                    ${afn:getMessage("delivDirec",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-12",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-13",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-14",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-15",sessionScope.locale)}<br><br>
                                    ${afn:getMessage("itemToDeliv",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-16",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-17",sessionScope.locale)}
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="refund-box">
                        <h6>${afn:getMessage("prizeTaxInfo",sessionScope.locale)}<i class="arrow-down"></i></h6>
                        <table class="refund-table">
                           <tr>
                                <th>${afn:getMessage("deliv_area",sessionScope.locale)}</th>
                                <td>${afn:getMessage("deliv_allPlace",sessionScope.locale)}&#40;${afn:getMessage("deliv_excep",sessionScope.locale)}&#41;</td>
                            </tr>
                                                      <tr>
                                <th>${afn:getMessage("shippingFee",sessionScope.locale)}</th>
                                <td>
                                   ${afn:getMessage("msg_shipping_info1-1",sessionScope.locale)} &#40;${afn:getMessage("msg_shipping_info1-2",sessionScope.locale)}&#41;${afn:getMessage("msg_shipping_info1-3",sessionScope.locale)}<br>
                                    ${afn:getMessage("msg_shipping_info1-4",sessionScope.locale)}<br>
                                  ${afn:getMessage("msg_shipping_info1-5",sessionScope.locale)}<br>
                                   ${afn:getMessage("msg_shipping_info1-6",sessionScope.locale)}&#41;${afn:getMessage("msg_shipping_info1-7",sessionScope.locale)}&#41;<br>
                                  ${afn:getMessage("msg_shipping_info1-8",sessionScope.locale)}<br>
                                    &#40;${afn:getMessage("msg_shipping_info1-9",sessionScope.locale)}&#41; ${afn:getMessage("msg_shipping_info1-10",sessionScope.locale)}&#41;
                                </td>
                            </tr>
                            <tr>
                                <th>${afn:getMessage("company_products",sessionScope.locale)}</th>
                                <td>
                                    ${afn:getMessage("msg_shipping_info1-11",sessionScope.locale)}<br><br>
                                    ${afn:getMessage("delivDirec",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-12",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-13",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-14",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-15",sessionScope.locale)}<br><br>
                                    ${afn:getMessage("itemToDeliv",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-16",sessionScope.locale)}<br>
                                    -${afn:getMessage("msg_shipping_info1-17",sessionScope.locale)}
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