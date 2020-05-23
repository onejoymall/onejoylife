<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            <h2 ><a href="/mall/today" class="red"> 오늘의 특가 <i class="ri-arrow-right-s-line"></i></a></h2>
            <h4 class="mt-05">오늘의 특가 상품 구매시 E-POINT 적립 2배!</h4>
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty productSpList}">
                <c:forEach var="productSpList" items="${productSpList}" varStatus="status" end="5">
                    <li>
                        <a href="/product/productDetail?product_cd=${productSpList.product_cd}">
                            <div class="img-box">
                                <img src='${productSpList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
<%--                                <p class="saleBox">35%</p>--%>
                                <a href="#" class="share-ic"></a>
                            </div>
                            <div class="mainList-sm-text">
                                <p class="list-title">${productSpList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productSpList.product_payment}" groupingUsed="true" />원</ins><del><fmt:formatNumber value="${productSpList.product_user_payment}" groupingUsed="true" />원</del></p>
                                <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty productSpList}">
                <li>표시할 내용이 없습니다.</li>
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
            <h2 class="red">추천 상품 </h2>
            <h4 class="mt-05">고민없이 선택하는 MD 강력 추천 상품!</h4>
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty productList}">
                <c:forEach var="productList" items="${productList}" varStatus="status" end="5">
                    <li>
                        <a href="/product/productDetail?product_cd=${productList.product_cd}">
                            <div class="img-box">
                                <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
<%--                                <p class="saleBox">35%</p>--%>
                                <a href="#" class="share-ic"></a>
                            </div>
                            <div class="mainList-sm-text">
                                <p class="list-title">${productList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />원</ins><del><fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />원</del></p>
                                <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty productList}">
                <li>표시할 내용이 없습니다.</li>
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
            <h2 class="red"><a href="/mall/eventList" class="red"> 이벤트 <i class="ri-arrow-right-s-line"></i></a></h2>
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
            <h2 class="red">인기 상품</h2>
            <h4 class="mt-05">망설이면 후회하는 원조이몰 인기 상품!</h4>
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty productList}">
                <c:forEach var="productList" items="${productList}" varStatus="status" end="5">
                    <a href="/product/productDetail?product_cd=${productList.product_cd}">
                        <li>
                            <div class="img-box">
                                <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
<%--                                <p class="saleBox">35%</p>--%>
                                <a href="#" class="share-ic"></a>
                            </div>
                            <a href="#" class="mainList-sm-text">
                                <p class="list-title">${productList.product_name}</p>
                                <p><ins><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />원</ins><del><fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />원</del></p>
                                <p class="info-score"><i class="star-ic"></i><span>4.5</span></p>
                            </a>
                        </li>
                    </a>
                </c:forEach>
            </c:if>
            <c:if test="${empty productList}">
                <li>표시할 내용이 없습니다.</li>
            </c:if>
        </ul>
    </div>
    <div class="mt-1 bg_grey2 clearfix">
        <div class="wrap">
            <h2 class="red">기획전</h2>
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
            <h2 class="red"><a href="/giveaway" class="red"> 경품 추첨 <i class="ri-arrow-right-s-line"></i></a></h2>
            <h4 class="mt-05">E-POINT 행운의 주인공이 되어 보세요!</h4>
        </div>
        <ul class="mainList-sm">
            <c:if test="${not empty giveawaylist}">
                <c:forEach var="list" items="${giveawaylist}" varStatus="status">
                    <li>
                        <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id="/>${list.giveaway_id}">
                            <div class="img-box">
                                   <img src='${list.file_1}' onerror="this.src='http://placehold.it/190x190'" height="200">
            <!--                    <p class="saleBox">35%</p>-->
                                <a href="#" class="share-ic"></a>
                            </div>
                            <div class="mainList-sm-text">
                                <p class="list-title">${list.giveaway_name}</p>
                                <p><ins><fmt:formatNumber value="${list.giveaway_payment}" groupingUsed="true" /> E-point</ins></p>
                                <div class="progress-wrap">
                                    <p class="progress-now">참여율 <b class="red">${list.parti_rate}%</b></p>
                                    <div class="progress-bar">
                                        <div class="progress-bar-active" style="width:${list.parti_rate}%"></div>
                                    </div>
                                    <p class="parti"><span><fmt:formatNumber value="${list.player_count}" groupingUsed="true" /></span>명 참여 중</p>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${empty giveawaylist}">
                <li>표시할 내용이 없습니다.</li>
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
                <a href="<c:url value="/sign/signup"/>" class="link-a"><i class="icon join i-big"></i>회원가입</a>
            </li>
            <li>
                <a href="<c:url value="/Help/usePointGuid"/>"><i class="icon epoint i-big"></i>E-POINT 안내</a>
            </li>
            <li>
                <a href="<c:url value="/Help/faqCenter?bgno=16&question_type=F"/>"><i class="icon faq i-big"></i>자주하는 질문</a>
            </li>
        </ul>
    </div>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>

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