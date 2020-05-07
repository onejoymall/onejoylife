<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>


    <section class="subheader">
        <div class="subTitle">주문/결제</div>
    </section>
    
    <section class="wrap">
    <form name="defaultForm" id="defaultForm" method="POST">
        <h2 class="pb-1">주문자 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">주문하시는 분</p>
        <input type="text" class="width-100 mb-05" name="order_user_name" id="order_user_name" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>">
        <p class="text-md mt-2 mb-05">이메일 주소</p>
        <input type="text" class="width-100 mb-05" name="order_user_email" id="order_user_email" value="<c:if test="${not empty sessionScope.email}">${sessionScope.email}</c:if>">

        <p class="text-md mt-2 mb-05">휴대폰 번호
        <!-- Map 선언 -->
            <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />

            <c:if test="${empty userInfo.phone}">
                <c:set var="phoneNumber" value="" />
            </c:if>
            <c:if test="${not empty userInfo.phone}">
                <c:set var="phoneNumber" value="${userInfo.phone}" />
            </c:if>

            <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
                <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
            </c:forEach>
        </p>
            <select name="order_user_phone_a" id="order_user_phone_a" class="width-30 mb-05">
            <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
            <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
            <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
            <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
            <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
            <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
            </select>
            <span> - </span>
            <input type="text" class="width-30 mb-05" name="order_user_phone_b" id="order_user_phone_b" value="${phoneMap.key2}" class="order_user_phone" maxlength="4">
            <span> - </span>
            <input type="text" class="width-30 mb-05" name="order_user_phone_c" id="order_user_phone_c" value="${phoneMap.key3}" class="order_user_phone" maxlength="4">
            <input type="hidden" name="order_user_phone" id="order_user_phone" value="<c:if test="${not empty sessionScope.email}"><c:out value="${phoneNumber}"/> </c:if>">
        <c:set var="doneLoop" value="false"/>
        <c:forEach var="cartPaymentList" items="${cartPaymentList}" varStatus="status">
        <c:if test="${cartPaymentList.product_delivery_International_type eq 'B' || cartPaymentList.product_delivery_International_type eq 'C'}">
        <c:if test="${not doneLoop}">
            <p class="text-md mt-2 mb-05">통관고유번호</p>
            <input type="text" name="customs_clearance_number" id="customs_clearance_number" class="sec1-in1" />
            <c:set var="doneLoop" value="true"/>
        </c:if>
        </c:if>
        </c:forEach>
        <c:if test="${empty sessionScope.email}">
            <p class="text-md mt-2 mb-05">주문확인용 비밀번호 입력</p>
                <input type="password" name="password" class="sec1-in1">
                <p id="passwordValidation" style="float:right;line-height: 33px;color: red"></p>
            <p class="text-md mt-2 mb-05">주문확인용 비밀번호 입력 확인</p>
                <input type="password"  name="password_cf" class="sec1-in1">
                <p id="password_cfValidation" style="float:right;line-height: 33px;color: red"></p>
        </c:if>
        
        <h2 class="pb-1 mt-4">배송지 정보</h2>
        <hr>
        <p class="text-md mt-2 mb-05">배송지 선택</p>
        <div class="my-1">
            <input type="radio" name="selectAddress" id="shipping01" checked value="OLD"><label for="shipping01">기본 배송지</label>
            <input type="radio" id="shipping02" name="selectAddress" value="LAST"><label for="shipping02">최신 배송지</label>
            <input type="radio" id="shipping03" name="selectAddress" value="NEW"><label for="shipping03">새로입력</label>
        </div>
        <p class="text-md mt-2 mb-05">받으시는 분</p>
        <input type="text" class="width-100 mb-05"  name="delivery_user_name" id="delivery_user_name" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.order_user_name}</c:if>">
        
        <p class="text-md mt-2 mb-05">휴대폰 번호
        <!-- Map 선언 -->
        <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
        <c:if test="${empty userInfo.phone}">
            <c:set var="phoneNumber" value="" />
        </c:if>
        <c:if test="${not empty userInfo.phone}">
            <c:set var="phoneNumber" value="${latestDelivery.delivery_user_tel}" />
        </c:if>
        <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
            <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
            <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
        </c:forEach>
        </p>

        <select name="delivery_user_tel_a" id="delivery_user_tel_a" class="width-30 mb-05">
            <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
            <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
            <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
            <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
            <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
            <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
        </select>
        <span> - </span>
        <input type="text" name="delivery_user_tel_b" id="delivery_user_tel_b" value="${phoneMap.key2}" class="delivery_user_tel width-30 mb-05" maxlength="4">
        <span> - </span>
        <input type="text" name="delivery_user_tel_c" id="delivery_user_tel_c" value="${phoneMap.key3}" class="delivery_user_tel width-30 mb-05" maxlength="4">
        <input type="hidden" name="delivery_user_tel" id="delivery_user_tel" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.delivery_user_tel}</c:if>">

        <p class="text-md mt-2 mb-05">전화 번호
        <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
            <c:if test="${empty userInfo.phone}">
                <c:set var="phoneNumber" value="" />
            </c:if>
            <c:if test="${not empty userInfo.phone}">
                <c:set var="phoneNumber" value="${latestDelivery.delivery_user_tel}" />
            </c:if>
            <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
                <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
            </c:forEach>
        </p>
        <select name="delivery_user_tel_a" id="delivery_user_tel_a" class="width-30 mb-05">
            <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
            <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
            <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
            <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
            <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
            <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
        </select>
        <span> - </span>
        <input type="text" name="delivery_user_tel_b" id="delivery_user_tel_b" value="${phoneMap.key2}" class="delivery_user_tel width-30 mb-05" maxlength="4">
        <span> - </span>
        <input type="text" name="delivery_user_tel_c" id="delivery_user_tel_c" value="${phoneMap.key3}" class="delivery_user_tel width-30 mb-05" maxlength="4">
        <input type="hidden" name="delivery_user_tel" id="delivery_user_tel" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.delivery_user_tel}</c:if>">

        <p class="text-md mt-2 mb-05">주소</p>
        <div class="input-group mb-05">
            <input type="text" name="postcode" id="postcode" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
            <button type="button" id="daumMapCall" class="grey">우편번호 찾기</button>
         </div>
         <input type="text" class="width-100 mb-05" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>">
         <input type="text" class="width-100 mb-05" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>">
        <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>
         
         <p class="text-md mt-2 mb-05">배송시 요청사항</p>
         <select class="full mt-05 mb-05" name="delivery_message_select" id="delivery_message_select" >
             <option value="" disabled selected>요청사항</option>
             <option value="">직접 받고 부재 시 문 앞</option>
                          <option value="self">직접입력</option>
         </select>
        <p class="mar-p2 hidden" id="delivery_message_box"><input type="text" class="sec2-in2" name="delivery_message" id="delivery_message"></p>
         
         <h2 class="pb-1 mt-4">주문상품 정보</h2>
         <hr>

<c:if test="${not empty cartPaymentList}">
    <c:forEach var="cartPaymentList" items="${cartPaymentList}" varStatus="status">
        <input type="hidden" name="cart_cd" value="${cartPaymentList.cart_cd}">
        <input type="hidden" name="chk" value="${cartPaymentList.cart_cd}">
        <ul class="product pt-1 pb-0">
            <ul class="pdinfo py-0">
                <li>
                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                        <img src='${cartPaymentList.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                    </a>
                </li>
                <li>
                    <p>${cartPaymentList.product_made_company_name}</p>
                    <h5>${cartPaymentList.product_name}</h5>
                    <p class="grey">${cartPaymentList.product_model}</p>

                    <input type="hidden" name="allprice" value="${cartPaymentList.product_user_payment*cartPaymentList.payment_order_quantity}"/>
                    <input type="hidden" name="price" value="${cartPaymentList.product_payment*cartPaymentList.payment_order_quantity}"/>
                    <input type="hidden" name="delivery" value="${cartPaymentList.product_delivery_payment}"/>
                    <input type="hidden" name="payment" value="${cartPaymentList.product_payment}">
                    <input type="hidden" name="product_name" value="${cartPaymentList.product_name}">
                    <input type="hidden" name="product_cd" value="${cartPaymentList.product_cd}">
                </li>
                <li><button class="del">삭제</button></li>
            </ul>
            <ul class="options">
                <li>상품금액</li>
                <li><fmt:formatNumber value="${cartPaymentList.product_payment}" groupingUsed="true" /> <span>원</span></li>
               </ul>
            <ul class="options">
                <li>수량</li>
                <li><span>${cartPaymentList.payment_order_quantity}<input type="hidden" name="payment_order_quantity" value="${cartPaymentList.payment_order_quantity}"></span><span>개</span></li>
            </ul>
            <hr class="grey my-1">
            <ul class="options mb-1">
                <li>주문금액</li>
                <li><fmt:formatNumber value="${cartPaymentList.product_payment*cartPaymentList.payment_order_quantity}" groupingUsed="true" /> <span>원</span></li>

                <input type="hidden" name="payment_order_quantity" value="${cartPaymentList.payment_order_quantity}">
            </ul>
        </ul>
    </c:forEach>
</c:if>
        <%--<h2 class="mt-4">할인 정보</h2>
        <hr class="my-1">
        <ul class="calculator">
            <li>총 주문금액</li>
            <li>13,090,000 <span>원</span></li>
        </ul>
        <p class="text-md mt-1 mb-05">배송시 요청사항</p>
         <select class="full mt-05 mb-05">
            <option value="" disabled selected>첫 구매 고객 특별할이 20% ( ~ 2020.04.30)</option>
         </select>
         <ul class="calculator">
            <li>보유 쿠폰</li>
            <li>3 <span>장</span></li>
        </ul>--%>
        
        <h2 class="pb-1 mt-4">결제 정보</h2>
        <hr>
        <div class="ck-box">
            <input type="checkbox" id="escrow">
            <label for="escrow"><span class="le-ck-txt"> 에스크로 사용</span></label>
        </div>
        <p class="text-md mt-2 mb-05">결제수단</p>
        <div class="my-1">
            <input type="radio" id="purchase01" name="payment_type_cd" checked value="card"><label for="purchase01">신용카드</label>
            <input type="radio" id="purchase02" name="payment_type_cd" value="trans"><label for="purchase02">실시간계좌이체</label>
            <input type="radio" id="purchase03" name="payment_type_cd" value="vbank"><label for="purchase03">가상계좌</label>
            <%--<input type="radio" id="purchase03" name="purchase"><label for="purchase03">휴대폰결제</label>--%>
        </div>
    </section>
    <hr>
    <section class="wrap bg_grey">
        <h1 class="pb-1">최종 결제 금액 확인</h1>
        <hr>
        <ul class="calculator pt-2 pb-1">
            <li class="text-lg">총 상품 금액</li>
            <li><span class="in1-font2"><fmt:formatNumber value="${getCartSum.total_ori_payment}" groupingUsed="true" /> <span>원</span></li>
        </ul>
       <ul class="calculator pb-1">
            <li>할인</li>
            <li>- <span class="in1-font3 discount"><fmt:formatNumber value="${getCartSum.total_ori_payment-getCartSum.total_payment}" groupingUsed="true" /><span>원</span></li>
        </ul>
<%--        <ul class="calculator pb-1">--%>
<%--            <li>할인쿠폰</li>--%>
<%--            <li>- 9,000 <span>원</span></li>--%>
<%--        </ul>--%>
        <c:if test="${not empty getCartSum.total_delivery_payment}">
            <ul class="calculator pb-1">
                <li>배송비</li>
                <li class="delivery"><fmt:formatNumber value="${getCartSum.total_delivery_payment}" groupingUsed="true" /> <span>원</span></li>
            </ul>
        </c:if>

        <hr class="grey my-1">
        <ul class="calculator pb-1">
            <li>최종 결제 금액</li>
            <li class="text-lg red total"><fmt:formatNumber value="${getCartSum.total_payment+getCartSum.total_delivery_payment}" groupingUsed="true" /> <span>원</span></li>
        </ul>
        <ul class="calculator pb-1">
            <li>E-POINT 적립예정</li>
            <li class="text-md red"><fmt:formatNumber value="${getCartSum.point_add}" groupingUsed="true" /> <span>원</span></li>
        </ul>
        <hr class="my-1">
        <input type="checkbox" id="replysns" class="b8 mb-2">
        <label for="replysns"><span class="red text-bold">필수</span> 주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?</label>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" class="btn btn-redcover" id="submitPayment">결제하기</a></li>
            <input type="hidden" name="product_payment_pg" value="sumtotal">
        </ul>
    </div>

    <input type="hidden" name="order_no" value="${order_no}">

    </form>


<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${fn:replace(req.requestURL, req.requestURI, '')}" />
<c:set var="requestPath" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="noParamUrl" value="${baseURL}${requestPath}"/>

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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    //주문페이지 상품 삭제
    var allprice = ${getCartSum.total_ori_payment};
    var alldiscount = ${getCartSum.total_ori_payment-getCartSum.total_payment};
    var alldelivery = ${getCartSum.total_delivery_payment};
    var sumtotal = ${getCartSum.total_payment+getCartSum.total_delivery_payment};
    $(document).on("click","button.del",function(){
        $(this).parent().parent().parent().remove();
        sumtotal = ${getCartSum.total_payment+getCartSum.total_delivery_payment};
        var before_price = $(this).parent().prev().children('input[name=allprice]').val();
        var totalprice = allprice - before_price;
        var price = $(this).parent().prev().children('input[name=price]').val();
        var discount = before_price - price;
        var totaldiscount = alldiscount - discount;
        var delivery = $(this).parent().prev().children('input[name=delivery]').val();
        var totaldelivery = alldelivery - delivery;
        allprice = totalprice;
        alldiscount = totaldiscount;
        alldelivery = totaldelivery;
        sumtotal = totalprice - totaldiscount + totaldelivery;
        $('.in1-font2').text(totalprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $('.discount').text(totaldiscount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $('.delivery').text(totaldelivery.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $('.total').text(sumtotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        $('input[name=product_payment_pg]').attr('value', sumtotal);
    })
    sumtotal = ${getCartSum.total_payment+getCartSum.total_delivery_payment};
    $('input[name=product_payment_pg]').attr('value', sumtotal);

    var IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init("imp78484974");
    var formData = $('#defaultForm').serialize();
    //여러건의 결제
    var product_name ='';
    var orderSize = $('input[name=product_cd]').length;
    if(orderSize >= 0){
        product_name = $('input[name=product_name]').eq(1).val()+"외 "+orderSize+" 건";
    }else{
        product_name = $('input[name=product_name]').eq(0).val();
    }

    $("#submitPayment").on("click",function() {
        if(!$('#replysns').is(":checked")){
            var filter = "win16|win32|win64|macintel|mac|";
            if(navigator.platform){
                if(filter.indexOf(navigator.platform.toLowerCase()) < 0){
                    $.toast({
                        text: "이용약관 동의는 필수 항목입니다.",
                        showHideTransition: 'plain', //펴짐
                        position: 'mid-center',
                        heading: 'Error',
                        icon: 'error'
                    });
                } else {
                    $.toast({
                        text: "이용약관 동의는 필수 항목입니다.",
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                }
            }
        }else{

            // loginAuth(data.access_token);
            // location.href=data.redirectUrl;
            IMP.request_pay({ // param
                pg: "kcp",
                pay_method:$('input[name=payment_type_cd]:checked').val(),
                merchant_uid:$('input[name=order_no]').val(),
                name: product_name,
                amount: $('input[name=product_payment_pg]').val(),
                <%--amount: ${getCartSum.total_payment+getCartSum.total_delivery_payment},--%>
                buyer_email: "${sessionScope.email}",
                buyer_name: $('#order_user_name').val(),
                buyer_tel: $('#order_user_phone').val(),
                buyer_addr: $('#roadAddress').val() + $('#extraAddress').val(),
                buyer_postcode: $('#postcode').val(),
                escrow:$('#escrow').is(":checked"),
                kcpProducts : [
                    {
                        "orderNumber" : $('input[name=order_no]').val(),
                        "name" : '${detail.product_name}',
                        "quantity" : $('input[name=payment_order_quantity]').val(),
                        "amount" : ${detail.product_payment+deliveryPayment},
                    },
                ],
            }, function (rsp) { // callback
                var formData = $('#defaultForm').serialize()
                    +'&payment_class=PRODUCT'
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
                    commonAjaxCall("POST","/Save/PaymentOrders",formData)
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

    $(".order_user_phone").on("focusout",function () {
        var phoneA = $("#order_user_phone_a").val();
        var phoneB = $("#order_user_phone_b").val();
        var phoneC = $("#order_user_phone_c").val();
        $("#order_user_phone").val(phoneA+"-"+phoneB+"-"+phoneC);
    })
    $(".delivery_user_phone").on("focusout",function () {
        var phoneA = $("#delivery_user_phone_a").val();
        var phoneB = $("#delivery_user_phone_b").val();
        var phoneC = $("#delivery_user_phone_c").val();
        $("#delivery_user_phone").val(phoneA+"-"+phoneB+"-"+phoneC);
        console.log(phoneA+"-"+phoneB+"-"+phoneC)
    })
    $(".delivery_user_tel").on("focusout",function () {
        var phoneA = $("#delivery_user_tel_a").val();
        var phoneB = $("#delivery_user_tel_b").val();
        var phoneC = $("#delivery_user_tel_c").val();
        $("#delivery_user_tel").val(phoneA+"-"+phoneB+"-"+phoneC);
        console.log(phoneA+"-"+phoneB+"-"+phoneC)
    })

    var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
    //패스워드 체크
    $(document).on('keyup','input[name=password]',function () {
        if(!$(this).val().match(mathPassword)){
            $("#passwordValidation").text(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.")
            $("#passwordValidation").removeClass("text-success");
        }else{
            $("#passwordValidation").addClass("text-success");
        }
    })
    $(document).on('keyup','input[name=password_cf]',function () {
        if(!$(this).val().match($('input[name=password]').val())){
            $("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.")
            $("#password_cfValidation").removeClass("text-success");
        }else{
            $("#password_cfValidation").addClass("text-success");
        }
    })
</script>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>