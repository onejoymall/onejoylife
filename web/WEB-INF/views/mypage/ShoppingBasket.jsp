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
<div class="wrap">
    <div class="page-box">

        <main class="clearfix main-tab">
            <h2 class="head-h2">장바구니</h2>
            <div class="tab-box">
                <p class="tab on" data-tab="t-box1">일반 <span>(${searchVO.totRow})</span></p>
<%--                <p class="tab" data-tab="t-box2">경품 <span>(5)</span></p>--%>
            </div>
            <div class="box on" id="t-box1">
                <form name="defaultform" id="defaultForm" method="POST">
                    <input type="hidden" name="table_name" value="product_cart">
                    <input type="hidden" name="pk" value="cart_cd">

                    <div class="click-txt">
<%--                        <p class="txt1">선택 찜하기</p>--%>
                        <p class="txt2 commonlistDelete">선택 삭제</p>
                    </div>
                    <table class="box1-table">
                        <colgroup>
                            <col style="width: 50px;">
                            <col style="width: 150px;">
                            <col style="width: 370px;">
                            <col style="width: 120px;">
                            <col style="width: 120px;">
                            <col style="width: 290px;">
                            <col style="width: 170px;">
<%--                            <col style="width: 50px;">--%>
                        </colgroup>
                        <thead>
                        <tr class="head-tr">
                            <td><input type="checkbox" id="tr-ck1-1"><label for="tr-ck1-1" class="tr-icon"></label></td>
                            <td></td>
                            <td>상품정보</td>
<%--                            <td>옵션병경</td>--%>
                            <td>수량</td>
                            <td>소비자가</td>
                            <td>상품가격</td>
<%--                            <td>배송비</td>--%>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody class="body-t">

                        <c:if test="${not empty list}">
                            <c:forEach var="list" items="${list}" varStatus="status">
                                <tr>
                                    <td>
                                        <input type="hidden" name="cart_cd" value="${list.cart_cd}">
                                        <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.cart_cd}"><label for="body-ck1-${status.index}"></label>
                                    </td>
                                    <td>
                                        <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                                        </a>
                                    </td>
                                    <td class="p-box">
                                        <p>${list.product_brand}</p>
                                        <p>${list.product_name}</p>
                                        <p>${list.product_model_name}</p>
<%--                                        <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
                                    </td>
<%--                                    <td><p class="op-td1">옵션변경</p></td>--%>
                                    <td>
                                        <input type="number" name="payment_order_quantity" value="${list.payment_order_quantity}" class="num-box payment_order_quantity" data-id="${list.cart_cd}">
                                    </td>
                                    <td>
                                        <div class="price-number before-price">
                                            <fmt:formatNumber value="${list.product_user_payment*list.payment_order_quantity}" groupingUsed="true" />원
                                        </div>
                                    </td>
                                    <td><span><fmt:formatNumber value="${list.product_payment*list.payment_order_quantity}" groupingUsed="true" /></span>원</td>
<%--                                    <td><span><fmt:formatNumber value="${list.product_delivery_payment}" groupingUsed="true" /></span>원</td>--%>
                                    <td><button class="x" data-id="${list.product_cd}"></button></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="8">
                                    표시할 내용이 없습니다.
                                </td>
                            </tr>

                        </c:if>
                        </tbody>
                    </table>
                    <table class="box1-table table-none">
                        <colgroup>
                            <col style="width: 50px;">
                            <col style="width: 150px;">
                            <col style="width: 370px;">
                            <col style="width: 120px;">
                            <col style="width: 120px;">
                            <col style="width: 120px;">
                            <col style="width: 120px;">
                            <col style="width: 50px;">
                        </colgroup>
                        <thead>

                        <tr class="head-tr">
                            <td>
<%--                                <input type="checkbox" id="all-chk" name="all-chk">--%>
                                <input type="checkbox" id="all-chk" name="all-chk"><label for="all-chk" class="tr-icon"></label>
                            </td>
                            <td></td>
                            <td>상품정보</td>
                            <td>옵션병경</td>
                            <td>수량</td>
                            <td>상품가격</td>
                            <td>배송정보</td>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody class="body-t">
                        <tr>
                            <td colspan="8">장바구니에 담긴 상품이 없습니다.</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="click-txt">
<%--                        <p class="txt1">선택 찜하기</p>--%>
                        <p class="txt2 commonlistDelete">선택 삭제</p>
                    </div>
                    <div class="sum">
                        <div class="sum-in">
                            <p><span>총 주문금액</span><br><span class="font-s sum-span1"><fmt:formatNumber value="${getCartSum.total_ori_payment}" groupingUsed="true" /></span><span>원</span></p>
                            <div class="sum-icon1"></div>
                            <p><span>총 할인금액</span><br><span class="font-s sum-span2"><fmt:formatNumber value="${getCartSum.total_ori_payment-getCartSum.total_payment}" groupingUsed="true" /></span><span>원</span></p>
                            <div class="sum-icon2"></div>
                            <p><span>배송비</span><br><span class="font-s sum-span3"><fmt:formatNumber value="${getCartSum.total_delivery_payment}" groupingUsed="true" /></span><span>원</span></p>
                            <div class="sum-icon3"></div>
                            <p><span>결제예정금액</span><br><span class="font-s  sum-span4"><fmt:formatNumber value="${getCartSum.total_payment+getCartSum.total_delivery_payment}" groupingUsed="true" /></span><span>원</span></p>
                        </div>
                    </div>
                    <div class="but-box">
                        <button type="button" class="but1" id="allOrder">전체 주문하기</button>
                        <button type="button" class="but2" id="selectOrder">선택 주문하기</button>
                    </div>
                </form>
            </div>
<%--            <div class="box" id="t-box2">--%>
<%--                <form action="">--%>
<%--                    <table class="box1-table">--%>
<%--                        <colgroup>--%>
<%--                            <col style="width: 50px;">--%>
<%--                            <col style="width: 150px;">--%>
<%--                            <col style="width: 370px;">--%>
<%--                            <col style="width: 176px;">--%>
<%--                            <col style="width: 176px;">--%>
<%--                            <col style="width: 176px;">--%>
<%--                        </colgroup>--%>
<%--                        <thead>--%>
<%--                        <tr class="head-tr">--%>
<%--                            <td><input type="checkbox" id="tr-ck2-1"><label for="tr-ck2-1" class="tr-icon"></label></td>--%>
<%--                            <td></td>--%>
<%--                            <td>상품정보</td>--%>
<%--                            <td>상품가격</td>--%>
<%--                            <td>배송정보</td>--%>
<%--                            <td>선택</td>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody class="body-t">--%>
<%--                        <tr>--%>
<%--                            <td><input type="checkbox" id="body-ck2-1"><label for="body-ck2-1"></label></td>--%>
<%--                            <td><div class="img-01"></div></td>--%>
<%--                            <td class="p-box">--%>
<%--                                <p>브라운</p>--%>
<%--                                <p>쿠쿠 10인용 IH전기압력밥솥</p>--%>
<%--                                <p>VR25G66G98UWS</p>--%>
<%--                                <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
<%--                            </td>--%>
<%--                            <td><span>3,999,000</span>원</td>--%>
<%--                            <td><span>국내배송 (배송비 상이)</span></td>--%>
<%--                            <td><a href=""><p class="op-td2">경품신청</p></a></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td><input type="checkbox" id="body-ck2-1"><label for="body-ck2-1"></label></td>--%>
<%--                            <td><div class="img-01"></div></td>--%>
<%--                            <td class="p-box">--%>
<%--                                <p>브라운</p>--%>
<%--                                <p>쿠쿠 10인용 IH전기압력밥솥</p>--%>
<%--                                <p>VR25G66G98UWS</p>--%>
<%--                                <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
<%--                            </td>--%>
<%--                            <td><span>3,999,000</span>원</td>--%>
<%--                            <td><span>국내배송 (배송비 상이)</span></td>--%>
<%--                            <td><a href=""><p class="op-td2">경품신청</p></a></td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                    <table class="box1-table table-none">--%>
<%--                        <colgroup>--%>
<%--                            <col style="width: 50px;">--%>
<%--                            <col style="width: 150px;">--%>
<%--                            <col style="width: 370px;">--%>
<%--                            <col style="width: 176px;">--%>
<%--                            <col style="width: 176px;">--%>
<%--                            <col style="width: 176px;">--%>
<%--                        </colgroup>--%>
<%--                        <thead>--%>
<%--                        <tr class="head-tr">--%>
<%--                            <td><input type="checkbox" id="tr-ck"><label for="tr-ck" class="tr-icon"></label></td>--%>
<%--                            <td></td>--%>
<%--                            <td>상품정보</td>--%>
<%--                            <td>상품가격</td>--%>
<%--                            <td>배송정보</td>--%>
<%--                            <td>선택</td>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody class="body-t">--%>
<%--                        <tr>--%>
<%--                            <td colspan="6">아직 당첨된 경품이 없습니다.</td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                    <div class="but-box">--%>
<%--                        <button type="submit" class="but1">더 많은 경품 구경하기</button>--%>
<%--                        <button type="submit" class="but2">배송정보 입력하기</button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
        </main>

    </div>
</div>
<script>
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

        $('.tab-box p').click(function(){
            var tab_id = $(this).attr('data-tab');

            $('.tab-box p').removeClass('on');
            $('.main-tab .box').removeClass('on');

            $(this).addClass('on');
            $("#"+tab_id).addClass('on');
        })
        $(function(){
            $('#tr-ck1-1').click(function(){
                var chk = $(this).is(':checked');//.attr('checked');
                if(chk) $('.body-t input').prop('checked',true);
                else $('.body-t input').prop('checked',false);
            });
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



</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>