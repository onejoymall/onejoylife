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
        <c:if test="${not empty categoryBannerList}">
            <c:forEach var="categoryBannerList" items="${categoryBannerList}" varStatus="status">
                <li id="main-slide-${status.index+1}" style="background:url(${categoryBannerList.file_link2}) no-repeat center / contain;"><a href="<c:url value="/product?product_ct=${categoryBannerList.pd_category_id}"/>"></a></li>
            </c:forEach>
        </c:if>
            </ul>
        </div>
        <div class="sub-slider-inner">
            <ul class="sub-slider-wrap">
            	<c:if test="${not empty subSlider}">
            	<c:forEach var="list" items="${subSlider}">
	                <li class="sub-slide" ><a href="${list.url}" style="background:url(${list.file_1}) no-repeat center center / cover;"></a></li>
                </c:forEach>
            	</c:if>
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
                                <img src='${list.file_1}' onerror="this.src='http://placehold.it/190x190'">
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
                    <a href="${lineBannerList1.url}">
                        <img src="${lineBannerList1.file_1}" onerror="this.src='http://placehold.it/200x30'"/>
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
                <c:if test="${not empty categoryEventList}">
                    <c:forEach var="categoryEventList" items="${categoryEventList}" varStatus="status">
                        <div class="exhibition-list-item-type1">
                            <a href="/product?product_ct=${categoryEventList.pd_category_id}">
                                <div class="img-box" id="exhibition-img1" style=" background:url(${categoryEventList.file_link}) center center no-repeat;"></div>
                                <p class="exhibition-list-item-title">${categoryEventList.pd_category_event_title}</p>
                                <p class="exhibition-list-item-date">${categoryEventList.pd_category_event_start}~${categoryEventList.pd_category_event_end}</p>
                                <p class="exhibition-list-item-text">${categoryEventList.pd_category_event_memo}</p>
                            </a>
                        </div>
                    </c:forEach>
                </c:if>
                </div>
                <div class="exhibition-row clearfix">
                    <c:if test="${not empty categoryEventListSub}">
                        <c:forEach var="categoryEventListSub" items="${categoryEventListSub}" varStatus="status">
                            <div class="exhibition-list-item-type2">
                                <a href="/product?product_ct=${categoryEventListSub.pd_category_id}">
                                    <div class="img-box" id="exhibition-img${status.index}" style=" background:url(${categoryEventListSub.file_link}) center center no-repeat;"></div>
                                    <p class="exhibition-list-item-title">${categoryEventListSub.pd_category_event_title}</p>
                                    <p class="exhibition-list-item-date">${categoryEventListSub.pd_category_event_start}~${categoryEventListSub.pd_category_event_end}</p>
                                    <p class="exhibition-list-item-text">${categoryEventListSub.pd_category_event_memo}</p>
                                </a>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-2">
            <div class="mini-bnr-inner">
                <a href="${lineBannerList2.url}">
                    <img src="${lineBannerList2.file_1}" onerror="this.src='http://placehold.it/200x30'"/>
                </a>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-3">
            <div class="mini-bnr-inner">
                <a href="${lineBannerList3.url}">
                    <img src="${lineBannerList3.file_1}" onerror="this.src='http://placehold.it/200x30'"/>
                </a>
            </div>
        </div>
    </article>
    <article class="selected-list-section">
        <h3 class="hide">추천 상품</h3>
        <div class="selected-list-inner">
            <ul class="nav-tabs clearfix">
                <li class="nav-item">
                    <a href="javascript:void(0)" class="nav-link active" data-tab="product_md_class">MD추천</a>
                </li>
                <li class="nav-item">
                    <a href="javascript:void(0)" class="nav-link" data-tab="product_sp_class">인기상품</a>
                </li>
                <li class="nav-item">
                    <a href="javascript:void(0)" class="nav-link" data-tab="product_new_class">신상품</a>
                </li>
            </ul>
            <div class="tab-content-wrap">
                <div class="tab-content-item active" id="tab1">
                    <div class="tab-content-item-inner">
                        <div class="category-wrap" id="selected-list-section-cate">
                            <div class="category-row">
                                <span class="active" onclick="mdSlideCategorySelect()">ALL</span>
                    <c:if test="${not empty categoryList}">
                        <c:forEach var="categoryList" items="${categoryList}" varStatus="status">
                        <c:set var="categoryLineCut" value="${status.count%6}"></c:set>
                                <span onclick="mdSlideCategorySelect('${categoryList.pd_category_id}')">${categoryList.pd_category_name}</span>
                        <c:if test="${categoryLineCut  == 0}">
                            </div>
                            <div class="category-row">
                        </c:if>
                        </c:forEach>
                    </c:if>
                            </div>
                        </div>
                        <div class="product-list-type2">
                            <ul class="selected-list">
                            <c:if test="${not empty productList}">
                                <c:forEach var="productList" items="${productList}" varStatus="status">
                                <li>
                                    <a href="/product/productDetail?product_cd=${productList.product_cd}">
                                        <div class="img-box">
                                            <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="190">
<%--                                            <p class="sale-percent">35<span>%</span></p>--%>
                                            <i class="share-ic"></i>
                                        </div>
                                        <div class="product-info">
                                            <p class="info-production">${productList.product_made_company_name}</p>
                                            <p class="info-product-name">${productList.product_name}</p>
                                            <p class="info-price"><span class="price-before">
                                                <fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />원</span>
                                                <i class="right-arrow"></i><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />원</p>
                                            <p class="info-score">
                                                <i class="star-ic"></i>
                                                <span class="score-number">4.5</span>
                                                <span class="score-text">5,324개 평가</span>
                                            </p>
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
                    </div>
                </div>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-2">
            <div class="mini-bnr-inner">
                <a href="${lineBannerList4.url}">
                    <img src="${lineBannerList4.file_1}" onerror="this.src='http://placehold.it/200x30'"/>
                </a>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-3">
            <div class="mini-bnr-inner">
                <a href="${lineBannerList5.url}">
                    <img src="${lineBannerList5.file_1}" onerror="this.src='http://placehold.it/200x30'"/>
                </a>
            </div>
        </div>
    </article>
    <article class="special-price-section">
        <h3 class="hide">특가 상품</h3>
        <div class="special-price-inner">
            <h4 class="main-section-h4">특가상품</h4>
            <p class="special-price-more"><a href="#">특가 상품 더보기<i class="right-arrow"></i></a></p>
<%--            <div class="category-wrap clearfix" id="special-price-section-cate">--%>
<%--                <div class="category-row-type2 clearfix">--%>
<%--                    <div class="category-item active">--%>
<%--                        <div class="img-box"><img src="assets/img/living-ic-ac.svg" /></div>--%>
<%--                        <span>가구/리빙/반려</span>--%>
<%--                    </div>--%>
<%--                    <div class="category-item">--%>
<%--                        <div class="img-box"><img src="assets/img/sports-ic.svg" /></div>--%>
<%--                        <span>스포츠</span>--%>
<%--                    </div>--%>
<%--                    <div class="category-item">--%>
<%--                        <div class="img-box"><img src="assets/img/cloth-ic.svg" /></div>--%>
<%--                        <span>의류</span>--%>
<%--                    </div>--%>
<%--                    <div class="category-item">--%>
<%--                        <div class="img-box"><img src="assets/img/food-ic.svg" /></div>--%>
<%--                        <span>식품</span>--%>
<%--                    </div>--%>
<%--                    <div class="category-item">--%>
<%--                        <div class="img-box"><img src="assets/img/digital-ic.svg" /></div>--%>
<%--                        <span>컴퓨터/디지털</span>--%>
<%--                    </div>--%>
<%--                    <div class="category-item">--%>
<%--                        <div class="img-box"><img src="assets/img/beauty-ic.svg" /></div>--%>
<%--                        <span>뷰티</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="product-list-type2">
                <ul class="special-price-list">
                    <c:if test="${not empty productSpList}">
                        <c:forEach var="productSpList" items="${productSpList}" varStatus="status">
                            <li>
                                <a href="/product/productDetail?product_cd=${productSpList.product_cd}">
                                    <div class="img-box">
                                        <img src='${productSpList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="190">
                                            <%--                                            <p class="sale-percent">35<span>%</span></p>--%>
                                        <i class="share-ic"></i>
                                    </div>
                                    <div class="product-info">
                                        <p class="info-production">${productSpList.product_made_company_name}</p>
                                        <p class="info-product-name">${productSpList.product_name}</p>
                                        <p class="info-price"><span class="price-before">
                                            <fmt:formatNumber value="${productSpList.product_user_payment}" groupingUsed="true" />원</span>
                                            <i class="right-arrow"></i><fmt:formatNumber value="${productSpList.product_payment}" groupingUsed="true" />원</p>
                                        <p class="info-score">
                                            <i class="star-ic"></i>
                                            <span class="score-number">4.5</span>
                                            <span class="score-text">5,324개 평가</span>
                                        </p>
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
        </div>
        <div class="mini-bnr-section mini-bnr-5">
            <div class="mini-bnr-inner">
                <a href="${lineBannerList6.url}">
                    <img src="${lineBannerList6.file_1}" onerror="this.src='http://placehold.it/200x30'"/>
                </a>
            </div>
        </div>
        <div class="mini-bnr-section mini-bnr-6">
            <div class="mini-bnr-inner">
                <a href="${lineBannerList7.url}">
                    <img src="${lineBannerList7.file_1}" onerror="this.src='http://placehold.it/200x30'"/>
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
                    <span class="active" onclick="categorySlideCategorySelect()">ALL</span>
                    <c:if test="${not empty categoryList}">
                    <c:forEach var="categoryList" items="${categoryList}" varStatus="status">
                    <c:set var="categoryLineCut" value="${status.count%6}"></c:set>
                    <span onclick="categorySlideCategorySelect('${categoryList.pd_category_id}')">${categoryList.pd_category_name}</span>
                    <c:if test="${categoryLineCut  == 0}">
                </div>
                <div class="category-row">
                    </c:if>
                    </c:forEach>
                    </c:if>
                </div>
            </div>
            <div class="product-list-type2">
                <ul class="category-list">
                    <c:if test="${not empty productList}">
                        <c:forEach var="productList" items="${productList}" varStatus="status">
                            <li>
                                <a href="/product/productDetail?product_cd=${productList.product_cd}">
                                    <div class="img-box">
                                        <img src='${productList.file_1}' onerror="this.src='http://placehold.it/190x190'" height="190">
                                            <%--                                            <p class="sale-percent">35<span>%</span></p>--%>
                                        <i class="share-ic"></i>
                                    </div>
                                    <div class="product-info">
                                        <p class="info-production">${productList.product_made_company_name}</p>
                                        <p class="info-product-name">${productList.product_name}</p>
                                        <p class="info-price"><span class="price-before">
                                                <fmt:formatNumber value="${productList.product_user_payment}" groupingUsed="true" />원</span>
                                            <i class="right-arrow"></i><fmt:formatNumber value="${productList.product_payment}" groupingUsed="true" />원</p>
                                        <p class="info-score">
                                            <i class="star-ic"></i>
                                            <span class="score-number">4.5</span>
                                            <span class="score-text">5,324개 평가</span>
                                        </p>
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
        </div>
    </article>
    <article class="event-section">
        <h3 class="hide">이벤트</h3>
        <div class="event-inner clearfix">
            <h4 class="main-section-h4">이벤트</h4>
            <p class="special-price-more"><a href="#">이벤트 더보기<i class="right-arrow"></i></a></p>
            <ul class="event-list">
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
    </article>
    <article class="qna-section">
        <h3 class="hide">ONEJOY 고객지원센터</h3>
        <div class="qna-inner">
            <h4 class="main-section-h4">ONEJOY 고객지원센터</h4>
            <div class="qna-wrap">
                <div class="qna-button">
                    <a href="/Help/csBoard">
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
            <p class="special-price-more"><a href="/Board/boardList?bgno=8">공지사항 더보기<i class="right-arrow"></i></a></p>
            <ul class="notice-list">
<c:if test="${not empty noticeListView}">
    <c:forEach var="noticeListView" items="${noticeListView}" varStatus="status">
                <li>

                    <div class="notice-title"><a>${noticeListView.brdtitle}</a></div>
                    <div class="notice-date"><span>${noticeListView.brddate}</span><i class="arrow-down" id="arrow"></i></div>
                    <div class="notice-content">
                            ${noticeListView.brdmemo}
                    </div>
                </li>
    </c:forEach>
</c:if>
            </ul>
        </div>
    </article>
</section>


<script>
    // 모달
    // $(document).on("click",".company-app",function(){
    //     event.preventDefault();
    //     $(".modal").attr("style", "display:block");
    //     $('body').css("overflow", "hidden");
    // });
    // $(".modal-close").click(function(){
    //     $(".modal").attr("style", "display:none");
    //     $('body').css("overflow", "auto");
    // });
    //
    // $(document).on("click",".company-app",function(){
    //     event.preventDefault();
    //     $(".modal").attr("style", "display:block");
    //     $('body').css("overflow", "hidden");
    // });
    // $(".modal-close").click(function(){
    //     $(".modal").attr("style", "display:none");
    //     $('body').css("overflow", "auto");
    // });
    //슬라이더 선언

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
        touchEnabled : false,
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
        touchEnabled : false,
    });
    var categoryList = $('.category-list').bxSlider({
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
        touchEnabled : false,
    });
    var selectedList = $('.selected-list').bxSlider({
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
        touchEnabled : false,
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
        });

    });
    $('.selected-list-inner .nav-item a').click(function(){
        $('.selected-list-inner .nav-item a').removeClass('active');
        $(this).addClass('active');
        mdSlideCategorySelect('',$(this).attr('data-tab'))
    });
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>