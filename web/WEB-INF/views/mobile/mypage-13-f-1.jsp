<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>

    <section class="subheader">
        <div class="subTitle">새 배송지 등록</div>
    </section>
    
    <section class="wrap">
    	<form id="form1">
        <p class="text-md mt-2 mb-05">받으시는 분</p>
        <input type="text" name="delivery_user_name" class="width-100 mb-05"/>
        <input type="hidden" name="order_no"/>
        <input type="hidden" name="product_delivery_International_type" value="C"/>
        
        <p class="text-md mt-2 mb-05">휴대폰 번호</p>
        <select name="delivery_user_phone_a" id="" class="width-25 mt-05 mb-05">
            <option value="010" >010</option>
            <option value="011" >011</option>
            <option value="016" >016</option>
            <option value="017" >017</option>
            <option value="018" >018</option>
            <option value="019" >019</option>
        </select> -
        <input type="text" class="width-30 mb-05" name="delivery_user_phone_b" id="delivery_user_tel_b"  maxlength="4"> -
        <input type="text" class="width-30 mb-05" name="delivery_user_phone_c" id="delivery_user_tel_b"  maxlength="4">
        
        <p class="text-md mt-2 mb-05">전화 번호</p>
        <select name="delivery_user_tel_a" id="" class="width-25 mt-05 mb-05">
            <option value="010" >010</option>
            <option value="011" >011</option>
            <option value="016" >016</option>
            <option value="017" >017</option>
            <option value="018" >018</option>
            <option value="019" >019</option>
        </select> -
        <input type="text" name="delivery_user_tel_b" class="width-30 mb-05" maxlength="4"> -
        <input type="text" name="delivery_user_tel_c" class="width-30 mb-05" maxlength="4">
        
        <p class="text-md mt-2 mb-05">주소</p>
        <div class="input-group mb-05">
            <input type="text" name="postcode" id="postcode" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
            <button type="button" class="grey" id="daumMapCall">우편번호 찾기</button>
         </div>
         <input type="text" class="width-100 mb-05" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>">
         <input type="text" class="width-100 mb-05" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>">
         <input type="hidden" name="jibunAddress" id="jibunAddress">

         <input type="checkbox" id="le-ck1" name="defaultYn" value="Y">
         <label for="le-ck1" class="mt-2">기본배송지로 설정</label>
         

         <div class="btn-box mt-4">
            <button type="button" class="btn btn-redcover width-100" id="newDeliveryBtn">등록</button>
         </div>
         </form>
    </section>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>