<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>

    <section class="subheader">
        <div class="subTitle">새 배송지 등록</div>
    </section>
    
    <section class="wrap">
    	<form id="form1">
    	<p class="text-md mt-2 mb-05">배송지 별명</p>
        <input type="text" name="delivery_alias" class="width-100 mb-05"/>
        
        <p class="text-md mt-2 mb-05">받으시는 분</p>
        <input type="text" name="delivery_user_name" class="width-100 mb-05"/>
        <input type="hidden" name="order_no"/>
        <input type="hidden" name="product_delivery_International_type" value="A"/>
        
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
            <option value="02">02</option>
			<option value="031">031</option>
			<option value="032">032</option>
			<option value="033">033</option>
			<option value="041">041</option>
			<option value="042">042</option>
			<option value="043">043</option>
			<option value="044">044</option>
			<option value="051">051</option>
			<option value="052">052</option>
			<option value="053">053</option>
			<option value="054">054</option>
			<option value="055">055</option>
			<option value="061">061</option>
			<option value="062">062</option>
			<option value="063">063</option>
			<option value="064">064</option>
        </select> -
        <input type="text" name="delivery_user_tel_b" class="width-30 mb-05" maxlength="4"> -
        <input type="text" name="delivery_user_tel_c" class="width-30 mb-05" maxlength="4">
        
        <p class="text-md mt-2 mb-05">주소</p>
        <div class="input-group mb-05">
            <input placeholder="우편번호" type="text" name="postcode" id="postcode" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
            <button type="button" class="grey" id="daumMapCall">우편번호 찾기</button>
         </div>
         <input placeholder="도로명주소" type="text" class="width-100 mb-05" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>">
         <input placeholder="상세주소" type="text" class="width-100 mb-05" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>">
         <p>* 위 칸에 상세주소를 추가로 입력하세요</p>
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