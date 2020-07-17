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
                                <col style="width: 200px;">
                                <col style="width: 100px;">
                                <col style="width: 100px;">
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
                                <td><span><fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /></span>원</td>
                                <td><span>1</span></td>
                                <td><span>${delivery.giveaway_play_cd}</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="l-sec1">
                        <p class="sec-h1">결제 정보</p>
                        <div class="sec2-box">
                            <div class="sec2-p1">결제수단</div>
                            <div class="sec2-p2">
                                <input type="radio" id="sec2-ra" name="payment_type_cd" value="card" checked>
                                <label for="sec2-ra"><span class="ra-txt">신용카드</span></label>
                                <input type="radio" id="sec2-ra2" name="payment_type_cd" value="trans">
                                <label for="sec2-ra2"><span class="ra-txt">실시간 계좌이체</span></label>
                                <input type="radio" id="sec2-ra3" name="payment_type_cd" value="vbank">
                                <label for="sec2-ra3"><span class="ra-txt">가상계좌</span></label>
<%--                                <input type="radio" id="sec2-ra4" name="payment_type_cd">--%>
<%--                                <label for="sec2-ra4"><span class="ra-txt">예시4</span></label>--%>
<%--                                <input type="radio" id="sec2-ra5" name="payment_type_cd">--%>
<%--                                <label for="sec2-ra5"><span class="ra-txt">예시5</span></label>--%>
                            </div>
                        </div>
                    </div>
                    <div class="l-sec2">
                        <p class="sec-h1">당첨자 정보</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 620px;">
                            </colgroup>
                            <tbody class="sec2-tbody">
                            <tr>
                                <td>주민등록번호</td>
                                <td>
                                    <input type="number" class="sec2-in1" name="reg_no1" maxlength="6"> <span>-</span>
                                    <input type="number" class="sec2-in1" name="reg_no2" maxlength="7">
                                    <input type="hidden" name="reg_no">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
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
                                    <input type="hidden" name="payment_user_id" value="${delivery.order_user_id}">
                                    <input type="hidden" name="order_no" value="${delivery.order_no}">
                                    <input type="hidden" name="giveaway_cd" value="${delivery.giveaway_cd}">
                                    <input type="hidden" name="product_order_name" value="${detail.giveaway_name}">
                                    <input type="hidden" name="giveaway_play_cd" value="${delivery.giveaway_play_cd}">
                                    <input type="hidden" name="payment_order_quantity" value="1"/>
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
	var regCheck = true;
	var regExp1 = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
	var regExp2 = /^[1-4][0-9]{6}$/;
	$(document).on('input','input[name=reg_no1],input[name=reg_no2]',function () {
		regCheck = true;
    	var reg1 = $('input[name=reg_no1]').val();
    	var reg2 = $('input[name=reg_no2]').val();

		if(!regExp1.test(reg1) || !regExp2.test(reg2)){
			regCheck = true;
		}else{
			regCheck = false;
		}
    })
    
    var IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init("imp78484974");
    $("#submitPayment").on("click",function() {
        if(!$('#le-ck').is(":checked")){
            $.toast({
                text: "이용약관 동의 는 필수 항목입니다.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }else if(regCheck){
        	$.toast({
                text: "주민등록번호를 확인해주세요.",
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                heading: 'Error',
                icon: 'error'
            });
        }else{
        	var formData = $('#defaultForm').serialize()
            				+'&payment_class=GIVEAWAY';
            
        	jQuery.ajax({
                type: "POST",
                url: "/SavePayment",
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
                                position: 'bottom-right',
                                heading: 'Error',
                                icon: 'error'
                            });
                        });
                    } else {
                    	IMP.request_pay({ // param
                            pg: "kcp",
                            pay_method:$('input[name=payment_type_cd]:checked').val(),
                            merchant_uid: "${delivery.order_no}",
                            name: "${detail.giveaway_name}",
                            amount: ${detail.giveaway_delivery_payment+texSum},
                            buyer_email: "${sessionScope.email}",
                            buyer_name: "${delivery.order_user_name}",
                            buyer_tel: "${delivery.delivery_user_phone}",
                            buyer_addr: "${delivery.roadAddress}${delivery.extraAddress}",
                            buyer_postcode: "${delivery.postcode}"
                        }, function (rsp) {
                            if(rsp.success){
                            	location.href=data.redirectUrl;
                            }else{
                                $.toast({
                                    text: rsp.error_msg,
                                    showHideTransition: 'plain', //펴짐
                                    position: 'bottom-right',
                                    heading: 'Error',
                                    icon: 'error'
                                });
                            }
                        });
                    }
                },
                error: function (xhr, status, error) {
                    alert("error");
                }
            });
        }
    });
    </script>
    <c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>