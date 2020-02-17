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
        <div class="out-box">
            <a href="mypage-4.html"><p class="out-h">장바구니</p></a>
            <div class="out-in">
                <p>최근 본 상품 <span>5</span></p>
                <div class="out-in-box">
                    <div class="img1"><img src="../assets/img/my-4-img1.jpg" alt=""></div>
                    <div class="img1"><img src="../assets/img/my-4-img2.jpg" alt=""></div>
                    <div class="img1"><img src="../assets/img/my-4-img3.jpg" alt=""></div>
                </div>
                <div class="arr-box">
                    <div class="left-ar"></div>
                    <div class="ar-num"><span>1</span>/<span>1</span></div>
                    <div class="right-ar"></div>
                </div>
            </div>
            <div class="fo-box">
                <a href="" class="top-but">
                    <div>TOP</div>
                    <div class="ar-top"></div>
                </a>
                <a href="" class="down-but">
                    <div>DOWN</div>
                    <div class="ar-down"></div>
                </a>
            </div>
        </div>
        <main class="clearfix">
            <form action="" method="POST">
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
                                <td>상품 금액</td>
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
                                <td><span><fmt:formatNumber value="${detail.giveaway_payment_memo}" groupingUsed="true" /></span>원</td>
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
                                <input type="radio" id="sec2-ra">
                                <label for="sec2-ra"><span class="ra-txt">신용카드</span></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right-box">
                    <div class="right-line">
                        <p>최종 결제 금액 확인</p>
                        <div class="num-outer">
                            <div class="num-box1">
                                <div class="txt-in1">
                                    <p class="in1-font1">배송비</p>
                                </div>
                                <div class="txt-in2">
                                    <p><span class="in1-font2"><fmt:formatNumber value="${detail.giveaway_delivery_payment}" groupingUsed="true" /></span> 원</p>
                                </div>
                            </div>
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
                                </div>
                            </div>
                        </div>
                        <div class="ck-box">
                            <input type="checkbox" id="le-ck">
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
        IMP.request_pay({ // param
            pg: "inicis",
            pay_method: "card",
            merchant_uid: "${param.order_no}",
            name: "${detail.giveaway_name}",
            amount: ${detail.giveaway_delivery_payment+texSum},
            buyer_email: "${sessionScope.email}",
            buyer_name: "${delivery.order_user_name}",
            buyer_tel: "${delivery.delivery_user_phone}",
            buyer_addr: "${delivery.roadAddress}${delivery.extraAddress}",
            buyer_postcode: "${delivery.postcode}"
        }, function (rsp) { // callback
            console.log(rsp);
            if(rsp.success){

            }else{
                $.toast({
                    text: rsp.error_msg,
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
                    heading: 'Error',
                    icon: 'error'
                    // showHideTransition: 'slide', //슬라이드
                    // showHideTransition: 'fade' //서서히나타남
                    // position: 'top-left',
                    // position: 'bottom-right',
                    // position: 'bottom-left',

                });
            }
        });
    });
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>