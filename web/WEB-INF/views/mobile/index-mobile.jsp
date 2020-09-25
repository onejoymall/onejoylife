<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/main-header"/>

    <div class="main-slider mt-1">
        <ul class="main-slider-wrap">
            <c:if test="${not empty categoryBannerList}">
                <c:forEach var="categoryBannerList" items="${categoryBannerList}" varStatus="status">
<%--                    <li><a href="<c:url value="/product?product_ct=${categoryBannerList.pd_category_id}"/>"><img src="${categoryBannerList.file_link2}" alt="메인이벤트1"></a></li>--%>
                    <li style="background:url(${categoryBannerList.file_link2}) no-repeat center / cover;background-size: 700px" onclick="location.href='<c:url value="/product?product_ct=${categoryBannerList.pd_category_id}"/>'">
<%--                        <a href="<c:url value="/product?product_ct=${categoryBannerList.pd_category_id}"/>"> </a>--%>
                    </li>
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
            <a href="${lineBannerList1.url}" class="img-box">
            <img src="${lineBannerList1.file_1}" onerror="this.src='http://placehold.it/200x30'"/></a>
        </div>
    </div>
    <div class="mainList-wrap mt-1">
        <div class="wrap bg_grey2">
            <h2 ><a href="/mall/today" class="red"> ${afn:getMessage("todayPrice_cate",sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></h2>
            <h4 class="mt-05">${afn:getMessage("msg.main.m_today_stxt",sessionScope.locale)}</h4>
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty productSpList}">
                <c:forEach var="productSpList" items="${productSpList}" varStatus="status" end="5">
                    <li>
                        <a href="/product/productDetail?product_cd=${productSpList.product_cd}">
                            <div class="img-box">
                                <img src='${productSpList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
<%--                                <p class="saleBox">35%</p>--%>
  
 							<p class="sale-percent">${productSpList.percent_discount} <span>%</span></p>
                               
                            </div>
                            <div class="mainList-sm-text">
                                <p class="list-title">${productSpList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productSpList.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</ins>
                                <del><fmt:formatNumber value="${productSpList.product_user_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</del></p>
                                <p class="info-score"><i class="star-ic"></i>
                                
                                <c:if test="${productSpList.review_score == 0 }"><span class="score-number">0.0</span></c:if>
    							<c:if test="${productSpList.review_score != NULL and productSpList.review_score != 0 }"><span class="score-number" >${productSpList.review_score}</span></c:if>
                       
                      			<c:if test="${productSpList.review_cnt == NULL }"><span class="score-text">(0)</span></c:if>
                        		<c:if test="${productSpList.review_cnt != NULL }"><span class="score-text">(${productSpList.review_cnt})</span></c:if>
                      			   <input type="hidden" name="product_option_yn" value="${productSpList.product_option_yn}" />
                      			 <a href="#" class="share-ic" onclick="share_product('${productSpList.product_cd}', '${productSpList.product_name}')"></a>
                      			  <a href="#"  onclick="addShoppingBasketF('${productSpList.product_cd}')"class="list-cartic"></a>
                      			  
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty productSpList}">
                <li>${afn:getMessage("msg.none_content",sessionScope.locale)}</li>
            </c:if>
        </ul>
    </div>
    <div class="mt-1">
        <div class="img-box">
        	<a href="${lineBannerList2.url}" class="img-box">
            <img src="${lineBannerList2.file_1}" onerror="this.src='http://placehold.it/200x30'"/></a>
            
        </div>
    </div>
    <div class="mainList-wrap mt-1 clearfix">
        <div class="wrap bg_grey2">
            <h2 class="red">${afn:getMessage("reco_pro_tit",sessionScope.locale)}</h2>
            <h4 class="mt-05">${afn:getMessage("msg.main.m_reco_stxt",sessionScope.locale)}</h4>
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty productMDList}">
                <c:forEach var="productList" items="${productMDList}" varStatus="status" end="5">
                    <li>
                        <a href="/product/productDetail?product_cd=${productList.product_cd}">
                            <div class="img-box">
                                <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
<%--                                <p class="saleBox">35%</p>--%>
 							<p class="sale-percent">${productList.percent_discount}<span>%</span></p>
                            </div>
                            <div class="mainList-sm-text">
                                <p class="list-title">${productList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</ins><del><fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</del></p>
                                <p class="info-score">
                                <i class="star-ic"></i>
								<c:if test="${productList.review_score == NULL }"><span class="score-number">0.0</span></c:if>
	    						<c:if test="${productList.review_score != NULL }"><span class="score-number">${productList.review_score}</span></c:if>
	                       		<c:if test="${productList.review_cnt == NULL }"><span class="score-text">(0)</span></c:if>
	                        	<c:if test="${productList.review_cnt != NULL }"><span class="score-text">(${productList.review_cnt})</span></c:if>
	                        	<input type="hidden" name="product_option_yn" value="${productList.product_option_yn}" />
                                <a href="#" class="share-ic" onclick="share_product('${productList.product_cd}', '${productList.product_name}')"></a>
	                        	<a href="#"  onclick="addShoppingBasketF('${productList.product_cd}')"class="list-cartic"></a>
							</p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty productMDList}">
                <li>${afn:getMessage("msg.none_content",sessionScope.locale)}</li>
            </c:if>
        </ul>
    </div>
    <div class="mt-1">
        <div class="img-box">
            <a href="${lineBannerList3.url}" class="img-box">
            <img src="${lineBannerList3.file_1}" onerror="this.src='http://placehold.it/200x30'"/></a>
        </div>
    </div>
    <div class="mt-1 bg_grey2 clearfix">
        <div class="wrap">
            <h2 class="red"><a href="/mall/eventList" class="red"> ${afn:getMessage("QA_event",sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></h2>
        </div>
        <ul class="mainList-sm2">
        <c:if test="${not empty eventList}">
            <c:forEach var="eventList" items="${eventList}" varStatus="status">
                <li>
                    <a href="/product?product_ct=${eventList.pd_category_id}">
                        <div class="img-box"><img src="${eventList.file_link5}" /></div>
                        <p class="event-title">${eventList.event_title}</p>
                    </a>
                </li>
            </c:forEach>
        </c:if>
        </ul>
    </div>
    <div class="mainList-wrap mt-1 clearfix">
        <div class="wrap bg_grey2">
            <h2 class="red">${afn:getMessage("popular_pro",sessionScope.locale)}</h2>
            <h4 class="mt-05">${afn:getMessage("msg.main.m_popular_stxt",sessionScope.locale)}</h4>
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty productPopularList}">
                <c:forEach var="productList" items="${productPopularList}" varStatus="status" end="5">
                    <a href="/product/productDetail?product_cd=${productList.product_cd}">
                        <li>
                            <div class="img-box">
                                <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
<%--                                <p class="saleBox">35%</p>--%>
                                <p class="sale-percent">${productList.percent_discount} <span>%</span></p>
                            </div>
                            <a href="#" class="mainList-sm-text">
                                <p class="list-title">${productList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</ins><del><fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</del></p>
                                <p class="info-score"><i class="star-ic"></i>
                                	<c:if test="${productList.review_score == NULL }"><span class="score-number">0.0</span></c:if>
			    					<c:if test="${productList.review_score != NULL }"><span class="score-number">${productList.review_score}</span></c:if>
			                        <c:if test="${productList.review_cnt == NULL }"><span class="score-text">0${afn:getMessage("reviewCount",sessionScope.locale)}</span></c:if>
			                        <c:if test="${productList.review_cnt != NULL }"><span class="score-text">${productList.review_cnt}${afn:getMessage("reviewCount",sessionScope.locale)}</span></c:if>
			                        <input type="hidden" name="product_option_yn" value="${productList.product_option_yn}" />
                                <a href="#" class="share-ic" onclick="share_product('${productList.product_cd}', '${productList.product_name}')"></a>
			                        <a href="#"  onclick="addShoppingBasketF('${productList.product_cd}')"class="list-cartic"></a>
                                
                                </p>
                            </a>
                        </li>
                    </a>
                </c:forEach>
            </c:if>
            <c:if test="${empty productPopularList}">
                <li>${afn:getMessage("msg.none_content",sessionScope.locale)}</li>
            </c:if>
        </ul>
    </div>
    <div class="mainList-wrap mt-1 clearfix">
        <div class="wrap bg_grey2">
            <h2 class="red">${afn:getMessage("new_tit",sessionScope.locale)}</h2>
            <!-- <h4 class="mt-05">망설이면 후회하는 원조이몰 인기 상품!</h4> -->
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty productNewList}">
                <c:forEach var="productList" items="${productNewList}" varStatus="status" end="5">
                    <a href="/product/productDetail?product_cd=${productList.product_cd}">
                        <li>
                            <div class="img-box">
                                <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
<%--                                <p class="saleBox">35%</p>--%>
                                 <p class="sale-percent">${productList.percent_discount} <span>%</span></p>
                            </div>
                            <a href="#" class="mainList-sm-text">
                                <p class="list-title">${productList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</ins><del><fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</del></p>
                                <p class="info-score"><i class="star-ic"></i>
                           			<c:if test="${productList.review_score == NULL }"><span class="score-number">0.0</span></c:if>
			    					<c:if test="${productList.review_score != NULL }"><span class="score-number">${productList.review_score}</span></c:if>
			                        <c:if test="${productList.review_cnt == NULL }"><span class="score-text">0${afn:getMessage("reviewCount",sessionScope.locale)}</span></c:if>
			                        <c:if test="${productList.review_cnt != NULL }"><span class="score-text">${productList.review_cnt}${afn:getMessage("reviewCount",sessionScope.locale)}</span></c:if>
			                         <input type="hidden" name="product_option_yn" value="${productList.product_option_yn}" />
                                <a href="#" class="share-ic" onclick="share_product('${productList.product_cd}', '${productList.product_name}')"></a>
			                        <a href="#"  onclick="addShoppingBasketF('${productList.product_cd}')"class="list-cartic"></a>
                                </p>
                            </a>
                        </li>
                    </a>
                </c:forEach>
            </c:if>
            <c:if test="${empty productList}">
                <li>${afn:getMessage("msg.none_content",sessionScope.locale)}</li>
            </c:if>
        </ul>
    </div>
    <div class="mt-1 bg_grey2 clearfix">
        <div class="wrap">
            <h2 class="red">${afn:getMessage("exhibitions",sessionScope.locale)}</h2>
        </div>
        <ul class="mainList-big2">
            <c:if test="${not empty categoryEventList}">
                <c:forEach var="categoryEventList" items="${categoryEventList}" varStatus="status">
                <li>
                        <a href="/product?product_ct=${categoryEventList.pd_category_id}">
                            <div class="img-box" id="exhibition-img1">
                                <img src="${categoryEventList.file_link}" onerror="this.src='http://placehold.it/190x190'" style="height:158px;">
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
                                <img src="${categoryEventListSub.file_link}" onerror="this.src='http://placehold.it/190x190'" style="height:158px;">
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
        </ul>
    </div>
    <div class="mainList-wrap mt-1 clearfix">
        <div class="wrap bg_grey2">
            <h2 class="red"><a href="/giveaway" class="red"> ${afn:getMessage("giveaway_tit",sessionScope.locale)} <i class="ri-arrow-right-s-line"></i></a></h2>
            <h4 class="mt-05">${afn:getMessage("msg.main.m_giveaway_stxt",sessionScope.locale)}</h4>
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty giveawaylist}">
                <c:forEach var="list" items="${giveawaylist}" varStatus="status">
                    <li>
                        <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id="/>${list.giveaway_id}">
                            <div class="img-box">
                                   <img src='${list.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
            <!--                    <p class="saleBox">35%</p>-->
                            </div>
                            <div class="mainList-sm-text">
                                <p class="list-title">${list.giveaway_name}</p>
                                <p><ins><fmt:formatNumber value="${list.giveaway_payment}" groupingUsed="true" /> ${afn:getMessage("korea_won",sessionScope.locale)}</ins></p>
                                <div class="progress-wrap">
                                    <p class="progress-now">${afn:getMessage("parti_rate",sessionScope.locale)} <b class="red">${list.parti_rate}%</b></p>
                                    <div class="progress-bar">
                                        <div class="progress-bar-active" style="width:${list.parti_rate}%"></div>
                                    </div>
                                    <p class="parti"><span><fmt:formatNumber value="${list.player_count}" groupingUsed="true" /></span>${afn:getMessage("partiPeople_count",sessionScope.locale)}</p>
                                <a href="#" class="share-ic2" onclick="share_giveaway('${list.giveaway_id}', '${list.giveaway_name}')"></a>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty giveawaylist}">
                <li>${afn:getMessage("msg.none_content",sessionScope.locale)}</li>
            </c:if>
        </ul>
    </div>
    <div class="mt-1">
        <div class="img-box">
            <a href="${lineBannerList4.url}" class="img-box">
            <img src="${lineBannerList4.file_1}" onerror="this.src='http://placehold.it/200x30'"/></a>
        </div>
    </div>
    <div>
        <ul class="flexaround border-n">
            <li>
                <a href="<c:url value="/sign/signup"/>" class="link-a"><i class="icon join i-big"></i>${afn:getMessage("join",sessionScope.locale)}</a>
            </li>
            <li>
                <a href="<c:url value="/Help/usePointGuid"/>"><i class="icon epoint i-big"></i>${afn:getMessage("epoint_announ",sessionScope.locale)}</a>
            </li>
            <li>
                <a href="<c:url value="/Help/faqCenter?bgno=16&question_type=F"/>"><i class="icon faq i-big"></i>${afn:getMessage("faq_tit",sessionScope.locale)}</a>
            </li>
        </ul>
    </div>

    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>


<script type="text/javascript">
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
        });

        
    </script>