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
<%@ include file="/WEB-INF/views/layout/header.jsp" %>'
<div class="wrap">
    <div class="page-box">
        <main class="clearfix">
            <form name="defaultForm" ID="defaultForm" method="POST">
                <h2 class="head-h2">세금결제</h2>
                <div class="left-box">
                    <div class="l-sec1">
                        <p class="sec-h1">주문상품 정보</p>
                        <table class="box1-table">
                            <colgroup>
                                <col style="width: 150px;">
                                <col style="width: 260px;">
                                <col style="width: 130px;">
                                <col style="width: 130px;">
                                <col style="width: 130px;">
                            </colgroup>
                            <thead>
                            <tr class="head-tr">
                                <td></td>
                                <td>상품정보</td>
                                <td>상품 공급가</td>
                                <td>수량</td>
                                <td>당첨번호</td>
                            </tr>
                            </thead>
                            <tbody class="body-tr">
                            <tr>
                                <td><div style="    width: 100px; height: 100px; margin: 0 auto; background: url(<c:url value="/assets/fileupload/giveaway/${detail.giveaway_list_image}"/>) no-repeat center / cover;"></div></td>
                                <td class="p-box">
                                    <p>${detail.giveaway_brand}</p>
                                    <p>${detail.giveaway_name}</p>
                                    <p>${detail.giveaway_model_name}</p>
<%--                                    <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
                                </td>
                                <td><span><fmt:formatNumber value="${detail.giveaway_user_payment}" groupingUsed="true" /></span>원</td>
                                <td><span>1</span></td>
                                <td><span>${delivery.giveaway_play_cd}</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="l-sec2">
                        <p class="sec-h1">주문상품 정보</p>
                        <div class="sec2-box">
                            <div class="sec2-p1">결제수단</div>
                            <div class="sec2-p2">
                                <p>
                                    <input type="radio" id="sec2-ra1" name="payment_type_cd" checked value="card">
                                    <label for="sec2-ra1"><span class="ra-txt">신용카드</span></label>
                                </p>
                                <p>
                                    <input type="radio" id="sec5-ra2" name="payment_type_cd" value="trans">
                                    <label for="sec5-ra2"><span class="ra-txt">실시간계좌이체</span></label>
                                </p>
                                <p>
                                    <input type="radio" id="sec5-ra3" name="payment_type_cd" value="vbank">
                                    <label for="sec5-ra3"><span class="ra-txt">가상계좌</span></label>
                                </p>
                            </div>
                        </div>
                    </div>
                    <input type="text" name="reg_no">
                </div>
                <div class="right-box">
                    <div class="right-line">
                        <p>최종 결제 금액 확인</p>
                        <div class="num-outer">
<%--                            <div class="num-box1">--%>
<%--                                <div class="txt-in1">--%>
<%--                                    <p class="in1-font1">배송비</p>--%>
<%--                                </div>--%>
<%--                                <div class="txt-in2">--%>
<%--                                    <p><span class="in1-font2"><fmt:formatNumber value="${detail.giveaway_delivery_payment}" groupingUsed="true" /></span> 원</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="num-box1">
                                <div class="txt-in1">
                                    <p class="in1-font1">세금</p>
                                </div>
                                <div class="txt-in2">
                                    <p><span class="in1-font2"><fmt:formatNumber value="${texSum}" groupingUsed="true" /></span> 원</p>
                                </div>
                            </div>
                            <div class="num-box2">
                                <div class="txt-in1">
                                    <p>총 결제 금액</p>
                                </div>
                                <div class="txt-in2 in2-color">
                                    <p><span class="in2-font2"><fmt:formatNumber value="${detail.giveaway_delivery_payment+texSum}" groupingUsed="true" /></span> 원</p>
                                    <input type="hidden" name="payment" value="${detail.giveaway_delivery_payment+texSum}">
                                    <input type="hidden" name="order_no" value="${delivery.order_no}">
                                    <input type="hidden" name="giveaway_cd" value="${delivery.giveaway_cd}">
                                    <input type="hidden" name="giveaway_play_cd" value="${delivery.giveaway_play_cd}">

                                </div>
                            </div>
                        </div>
                        <div class="ck-box">
                            <input type="checkbox" name="service_terms_of_use" id="le-ck" value="Y">
                            <label for="le-ck"><span class="le-ck-txt"><span class="le-ck-color">(필수)</span> 주문 상품정보 및 결제대행<br>서비스 이용약관에 모두 동의하십니까?</span></label>
                        </div>
                    </div>
                    <div class="but-box">
                        <button type="button" id="submitPayment">결제하기</button>
                    </div>
                </div>
            </form>
        </main>
    </div>
</div>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    var IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init("imp78484974");
    $("#submitPayment").on("click",function() {
        if(!$('#le-ck').is(":checked")){
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
                pay_method: "card",
                merchant_uid: "${delivery.order_user_id}",
                name: "${detail.giveaway_name}",
                amount: ${detail.giveaway_delivery_payment+texSum},
                buyer_email: "${sessionScope.email}",
                buyer_name: "${delivery.order_user_name}",
                buyer_tel: "${delivery.delivery_user_phone}",
                buyer_addr: "${delivery.roadAddress}${delivery.extraAddress}",
                buyer_postcode: "${delivery.postcode}"
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
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>