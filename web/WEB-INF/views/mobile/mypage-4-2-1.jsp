<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>

<section class="subheader">
    <div class="subTitle">주문/결제</div>
</section>

<section class="wrap">
    <form name="defaultFormGiveaway" id="defaultFormGiveaway" method="POST">
    	<input name="product_cd"  type="hidden" value="">
	    <input name="giveaway_cd1"  type="hidden" value="${giveaway_cd}">
	    <input name="giveaway_play_cd1"  type="hidden" value="${giveaway_play_cd}">
	    <input name="order_no"  type="hidden" value="${order_no}">
    <h2 class="pb-1">주문자 정보</h2>
    <hr>
    <p class="text-md mt-2 mb-05">주문하시는 분</p>
    <input type="text" name="order_user_name" id="order_user_name" class="width-100 mb-05" value="<c:out value="${userInfo.username}"/>">
    <p class="text-md mt-2 mb-05">이메일 주소</p>
    <input type="text" name="order_user_email" id="order_user_email" class="width-100 mb-05" value="<c:out value="${sessionScope.email}"/>">
    <p class="text-md mt-2 mb-05">휴대폰 번호
    <!-- Map 선언 -->
    <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
    <c:if test="${empty userInfo.phone}">
        <c:set var="phoneNumber" value="${latestDelivery.order_user_phone}" />
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
    <input type="text" name="order_user_phone_b" id="order_user_phone_b" class="width-30 mb-05" value="${phoneMap.key2}" class="order_user_phone" maxlength="4">
    <span> - </span>
    <input type="text" name="order_user_phone_c" id="order_user_phone_c" class="width-30 mb-05" value="${phoneMap.key3}" class="order_user_phone" maxlength="4">
    <input type="hidden" name="order_user_phone" id="order_user_phone" class="width-30 mb-05" value="<c:out value="${latestDelivery.order_user_phone}"/> ">

    <h2 class="pb-1 mt-4">배송지 정보</h2>
    <hr>
    <p class="text-md mt-2 mb-05">배송지 선택</p>
    <div class="my-1">
        <input type="radio" name="selectAddress" id="ra1-1" checked value="OLD"><label for="ra1-1">기본 배송지</label>
        <input type="radio" name="selectAddress" id="ra1-2" value="LAST"><label for="ra1-2">최신 배송지</label>
        <input type="radio" name="selectAddress" id="ra1-3" value="NEW"><label for="ra1-3">새로입력</label>
    </div>
    <p class="text-md mt-2 mb-05">받으시는 분</p>
    <input type="text" class="width-100 mb-05" name="delivery_user_name" id="delivery_user_name" value="${latestDelivery.order_user_name}">

    <p class="text-md mt-2 mb-05">휴대폰 번호
        <!-- Map 선언 -->
        <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
        <c:if test="${empty userInfo.phone}">

        </c:if>
        <c:if test="${not empty userInfo.phone}">
            <c:set var="phoneNumber" value="${latestDelivery.delivery_user_phone}" />
        </c:if>
        <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
            <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
            <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
        </c:forEach>
    </p>
    <select name="delivery_user_phone_a" id="delivery_user_phone_a" class="width-30 mb-05">
        <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
        <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
        <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
        <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
        <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
        <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
    </select>
    <span> - </span>
    <input type="text" name="delivery_user_phone_b" id="delivery_user_phone_b" class="width-30 mb-05" value="${phoneMap.key2}" class="delivery_user_phone" maxlength="4">
    <span> - </span>
    <input type="text" name="delivery_user_phone_c" id="delivery_user_phone_c" class="width-30 mb-05" value="${phoneMap.key3}" class="delivery_user_phone" maxlength="4">
    <input type="hidden" name="delivery_user_phone" id="delivery_user_phone" class="width-30 mb-05" value="${latestDelivery.delivery_user_phone}">

    <p class="text-md mt-2 mb-05">전화 번호
        <!-- Map 선언 -->
        <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
        <c:if test="${empty userInfo.phone}">

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
    <input type="text" name="delivery_user_tel_b" id="delivery_user_tel_b" class="width-30 mb-05" value="${phoneMap.key2}" class="delivery_user_tel" maxlength="4">
    <span> - </span>
    <input type="text" name="delivery_user_tel_c" id="delivery_user_tel_c" class="width-30 mb-05" value="${phoneMap.key3}" class="delivery_user_tel" maxlength="4">
    <input type="hidden" name="delivery_user_tel" id="delivery_user_tel" class="width-30 mb-05" value="${latestDelivery.delivery_user_tel}">

    <p class="text-md mt-2 mb-05">주소</p>
    <div class="input-group mb-05">
        <input type="text"  name="postcode" id="postcode" value="${latestDelivery.postcode}">
        <button type="button" class="grey" id="daumMapCall">우편번호 찾기</button>
     </div>
     <input type="text" class="width-100 mb-05" name="roadAddress" id="roadAddress" value="${latestDelivery.roadAddress}">
     <input type="text" class="width-100 mb-05" name="extraAddress" id="extraAddress" value="${latestDelivery.extraAddress}">
        <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>
     <p class="text-md mt-2 mb-05">배송시 요청사항</p>
        <select name="delivery_message_select" class="full mt-05 mb-05" id="delivery_message_select" >
            <option value="">배송시 요청사항 (선택사항)</option>
            <option value="">직접 받고 부재 시 문 앞</option>
            <option value="self">직접입력</option>
        </select>
        <p class="mar-p2 hidden" id="delivery_message_box"><input type="text" class="sec2-in2" name="delivery_message" id="delivery_message"></p>
    </form>
</section>
<hr>
<section class="wrap bg_grey">
    <h2 class="text-center pb-1">꼭 확인해주세요!</h2>
    <p class="text-md">※ 소득세법에 의해 경품금액 5만원 이상 경우 제세공과금 (소득세 및 주민세) 22%와 부가세10%는 고객(본인) 부담 입니다.</p>
</section>
<div class="bottomBtns">
    <ul>
       <li><a href="#" id="formSubmitGiveaway" class="btn ">다음단계</a></li>
    </ul>
</div>

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
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>