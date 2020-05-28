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
                <li><div style="    width: 80px; height: 80px; margin: 0 auto; background: url(<c:url value="/assets/fileupload/giveaway/${detail.giveaway_list_image}"/>) no-repeat center / cover;"></div></li>
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

        <h2 class="pb-1 mt-4">결제 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">결제수단</p>
        <div class="my-1">
            <input type="radio" id="sec2-ra" name="payment_type_cd" value="card" checked>
            <label for="sec2-ra"><span class="ra-txt">신용카드</span></label>
            <input type="radio" id="sec2-ra2" name="payment_type_cd" value="trans">
            <label for="sec2-ra2"><span class="ra-txt">실시간 계좌이체</span></label>
            <input type="radio" id="sec2-ra3" name="payment_type_cd" value="vbank">
            <label for="sec2-ra3"><span class="ra-txt">가상계좌</span></label>
        </div>

        <h2 class="pb-1 mt-4">당첨자 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">주민등록번호</p>
        <div class="my-1">
            <input type="number" class="width-40 mb-05"> <span>-</span>
            <input type="number" class="width-40 mb-05">
            <input type="hidden" name="reg_no">
        </div>
    </section>
    <hr>
    <section class="wrap bg_grey">
        <h1 class="pb-1">최종 결제 금액 확인</h1>
        <hr>
        <ul class="calculator pt-2 pb-1">
            <li>세금</li>
            <li><fmt:formatNumber value="${texSum}" groupingUsed="true" /> <span>원</span></li>
        </ul>
        <ul class="calculator pb-1">
            <li>총 결제 금액</li>
            <li class="text-lg red"><fmt:formatNumber value="${detail.giveaway_delivery_payment+texSum}" groupingUsed="true" /> <span>원</span></li>
            <input type="hidden" name="payment" value="${detail.giveaway_delivery_payment+texSum}">
            <input type="hidden" name="order_no" value="${delivery.order_no}">
            <input type="hidden" name="giveaway_cd" value="${delivery.giveaway_cd}">
            <input type="hidden" name="giveaway_play_cd" value="${delivery.giveaway_play_cd}">
        </ul>
        <hr class="grey my-1">
        <input type="checkbox" id="replysns" class="b8 mb-2">
        <label for="replysns"><span class="red text-bold">필수</span> 주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</label>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" class="btn btn-redcover" id="submitPayment">결제하기</a></li>
        </ul>
    </div>
</form>

<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, req.requestURI, '')}" />
<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="noParamUrl" value="${baseURL}${requestPath}"/>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    var IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init("imp78484974");
    $("#submitPayment").on("click",function() {
        if(!$('#replysns').is(":checked")){
            $.toast({
                text: "이용약관 동의 는 필수 항목입니다.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        }else{
            IMP.request_pay({ // param
                pg: "inicis",
                pay_method:$('input[name=payment_type_cd]:checked').val(),
                merchant_uid: "${delivery.order_user_id}",
                name: "${detail.giveaway_name}",
                amount: ${detail.giveaway_delivery_payment+texSum},
                buyer_email: "${sessionScope.email}",
                buyer_name: "${delivery.order_user_name}",
                buyer_tel: "${delivery.delivery_user_phone}",
                buyer_addr: "${delivery.roadAddress}${delivery.extraAddress}",
                buyer_postcode: "${delivery.postcode}",
                m_redirect_url: "${baseURL}/SavePaymentMobile?"+$('#defaultForm').serialize()+'&payment_class=GIVEAWAY'
            }, function (rsp) { // callback
                var formData = $('#defaultForm').serialize()
                    +'&payment_class=GIVEAWAY'
                    +'&success='+rsp.success
                    +'&imp_uid='+rsp.imp_uid
                    +'&merchant_uid='+rsp.merchant_uid
                    +'&pg_provider='+rsp.pg_provider
                    +'&pay_method='+rsp.pay_method
                    +'&pg_type='+rsp.pg_type
                    +'&error_msg='+rsp.error_msg;

                var alertType;
                var showText;
                if(rsp.success){
                    jQuery.ajax({
                        type: "POST",
                        url: postUrl,
                        data: formData,
                        success: function (data) {

                            if (data.validateError) {
                                $('.validateError').empty();
                                $.each(data.validateError, function (index, item) {
                                    if(index == "Error"){//일반에러메세지
                                        alertType = "error";
                                        showText = item;
                                    }else{
                                        alertType = "error";
                                        showText = index + " (은) " + item;
                                    }
                                    // $.toast().reset('all');//토스트 초기화
                                    $.toast({
                                        text: showText,
                                        showHideTransition: 'plain', //펴짐
                                        position: 'top-right',
                                        heading: 'Error',
                                        icon: 'error'
                                    });
                                });

                            } else {
                                // loginAuth(data.access_token);
                                location.href=data.redirectUrl;
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("error");
                        }
                    });
                }else{
                    $.toast({
                        text: rsp.error_msg,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                }
            });
        }

    });

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