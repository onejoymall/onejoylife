<%--
  Created by IntelliJ IDEA.
  User: YEYD
  Date: 2020-05-27
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>


    <div class="out-box">
        <a href="/MyPage/ShoppingBasket"><p class="out-h">${afn:getMessage('cart',sessionScope.locale)}</p></a>
        <div class="out-in">
            <p>${afn:getMessage('recent_product',sessionScope.locale)} <span></span></p>
            <div id="todaySlider" class="out-in-box">
            <c:if test="${not empty todayList}">
                <c:forEach var="todayList" items="${todayList}" varStatus="status">
                    <div class="img1"><a href="/product/productDetail?product_cd=${todayList.product_cd}"><img src="${todayList.file_1}" onerror="this.src='http://placehold.it/68'" alt=""></a></div>

                </c:forEach>
            </c:if>
            </div>

            <div class="arr-box">
                <div class="left-ar "></div>
                <div class="ar-num"><span>1</span>/<span>1</span></div>
                <div class="right-ar bx-prev"></div>
            </div>
        </div>
        <div class="fo-box ">
            <a href="" class="top-but">
            <div>${afn:getMessage('top',sessionScope.locale)}</div>
            <div class="ar-top"></div>
            </a>
            <a href="" class="down-but">
            <div>${afn:getMessage('down',sessionScope.locale)}</div>
            <div class="ar-down"></div>
            </a>
        </div>
    </div>
    <script>
    $(document).ready(function() {


    //오늘본 상품
    $('#todaySlider').bxSlider({
        auto:false,
        mode:'vertical',
        moveSlides:3,
        maxslides:3,
        minSlides:3,
        infiniteLoop:false,
        hideControlOnEnd:false,
        autoControls:true,
        pager:true,
        pagerType:'short',
        controls:true,
        nextSelector:'.right-ar',
        prevSelector:'.left-ar',
        pagerCustom:'.ar-num',
        useCSS:false,
        touchEnabled : false,
    });
    $(".top-but").click(function() {
        $('html, body').animate({
        scrollTop : 0
        }, 400);
        return false;
    });
    $(".down-but").click(function(){
        $('html, body').animate({
        scrollTop:($('body').height())
        }, 400);
        return false;
    });
    });
     var floatPosition = parseInt($(".out-box").css('top'));
        $(window).scroll(function() {
            var scrollTop = $(window).scrollTop();
            var newPosition = scrollTop + floatPosition + "px";

            /*
            $(".out-box").css('top', newPosition);
            */
            $(".out-box").stop().animate({
                "top" : newPosition
            }, 500);

        }).scroll();
    </script>