<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>

<section class="subheader">
    <div class="subTitle">세금결제</div>
</section>

<form name="defaultForm" ID="defaultForm" method="POST">
    <section class="wrap">
         <h2 class="pb-1">주문상품 정보</h2>
         <hr>
         <ul class="product pt-1 pb-0">
            <ul class="options">
                <li>당첨번호</li>
                <li class="red">${delivery.giveaway_play_cd}</li>
            </ul>
            <ul class="py-0">
                <li><div style="    width: 100px; height: 100px; margin: 0 auto; background: url(<c:url value="/assets/fileupload/giveaway/${detail.giveaway_list_image}"/>) no-repeat center / cover;"></div></li>
                <li>
                    <p>${detail.giveaway_brand}</p>
                    <h5>${detail.giveaway_name}</h5>
                    <p class="grey">${detail.giveaway_model_name}</p>
                    <%--<p class="option"><span>구성품</span> <br>
                    · 30mm 1.4 여친렌즈 <br>
                    · 추가배터리</p>--%>
                </li>
            </ul>
            <ul class="options">
                <li>상품 공급가</li>
                <li><fmt:formatNumber value="${detail.giveaway_user_payment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
            <ul class="options">
                <li>최대응모포인트</li>
                <li><fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /> <span>P</span></li>
            </ul>
            <%--<hr class="grey my-1">
            <ul class="options mb-1">
                <li>주문금액</li>
                <li>3,099,000 <span>원</span></li>
            </ul>--%>
        </ul>

        <h2 class="pb-1 mt-4">주문상품 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">결제수단</p>
        <div class="my-1">
            <input type="radio" id="purchase01" name="purchase"><label for="purchase01">신용카드</label>
        </div>
    </section>
    <hr>
    <section class="wrap bg_grey">
        <h1 class="pb-1">최종 결제 금액 확인</h1>
        <hr>
        <ul class="calculator pt-2 pb-1">
            <li>총 상품 금액</li>
            <li>1,949,000 <span>원</span></li>
        </ul>
        <ul class="calculator pb-1">
            <li>최종 결제 금액</li>
            <li class="text-lg red">1,949,000 <span>원</span></li>
        </ul>
        <hr class="grey my-1">
        <input type="checkbox" id="replysns" class="b8 mb-2">
        <label for="replysns"><span class="red text-bold">필수</span> 주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</label>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" class="btn btn-redcover">결제하기</a></li>
        </ul>
    </div>
</form>


<script>
$(document).ready(function(){
    $('#write').show();
    $('#list').hide();
    $('.qna').on('click',function(){
        $(this).addClass('active');
        $('.qna').not($(this)).removeClass('active');
    })
    $('#date li a').on('click',function(){
        $(this).addClass('active');
        $('#date li a').not($(this)).removeClass('active');
    })
});
/**
 * 탭 function
 */
function show(num){
    if(num == 1){
        $('#write').show();
        $('#list').hide();
        $('#tap1').addClass('active');
        $('#tap2').removeClass('active');
    } else if (num == 2) {
        $('#write').hide();
        $('#list').show();
        $('#tap1').removeClass('active');
        $('#tap2').addClass('active');
    }
}
</script>
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>