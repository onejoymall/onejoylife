<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>

    <section class="subheader">
        <div class="subTitle">${afn:getMessage('delivery_address',sessionScope.locale)} ${afn:getMessage('update',sessionScope.locale)}</div>
    </section>
    
    <section class="wrap">
    	<form id="form2">
    	<p class="text-md mt-2 mb-05">${afn:getMessage('delivery_align',sessionScope.locale)}</p>
        <input type="text" name="delivery_alias" class="width-100 mb-05"/>
        
        <p class="text-md mt-2 mb-05">${afn:getMessage('delivery_user_name',sessionScope.locale)}</p>
        <input type="text" name="delivery_user_name" class="width-100 mb-05"/>
        <input type="hidden" name="order_no" value="${param.orderNo}"/>
        <input type="hidden" name="orderNo" value="${param.orderNo}"/>
        <input type="hidden" name="product_delivery_International_type" value="A"/>
        
        <p class="text-md mt-2 mb-05">${afn:getMessage('phone',sessionScope.locale)}</p>
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
        
        <p class="text-md mt-2 mb-05">${afn:getMessage('tel',sessionScope.locale)}</p>
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
        
        <p class="text-md mt-2 mb-05">${afn:getMessage('address',sessionScope.locale)}</p>
        <div class="input-group mb-05">
            <input placeholder="${afn:getMessage('postcode',sessionScope.locale)}" type="text" name="postcode" id="postcode" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
            <button type="button" class="grey" id="daumMapCall">${afn:getMessage('postcode',sessionScope.locale)} ${afn:getMessage('search',sessionScope.locale)}</button>
         </div>
         <input placeholder="${afn:getMessage('road_name_addr',sessionScope.locale)}" type="text" class="width-100 mb-05" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>">
         <input placeholder="${afn:getMessage('extraAddress',sessionScope.locale)}" type="text" class="width-100 mb-05" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>">
         <p>* ${afn:getMessage('msg.detail_address_input',sessionScope.locale)}</p>
         <input type="hidden" name="jibunAddress" id="jibunAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.jibunAddress}</c:if>">

         <input type="checkbox" id="le-ck1" name="defaultYn" value="Y">
         <label for="le-ck1" class="mt-2">${afn:getMessage('set_default_addr',sessionScope.locale)}</label>
         

         <div class="btn-box mt-4">
            <button type="button" class="btn btn-redcover width-100" id="updateDeliveryBtn">${afn:getMessage('update',sessionScope.locale)}</button>
         </div>
         </form>
    </section>
    
    <script>
    $(function(){
    	var formData = $('#form2').serialize();
        jQuery.ajax({
            type: 'POST',
            url: '/MyPage/getDeliveryDetail',
            data: formData,
            success: function (data) {
            	$.each(data.deliveryInfo,function(index, item){
            		$("input[name="+index+"]").val(item);
            		if(index=="delivery_user_phone" || index=="delivery_user_tel"){
            			var number = item.split("-");
            			['a','b','c'].forEach(function(el,idx){
            				$("input[name="+index+"_"+el+"]").val(number[idx]);
            			});
            		}
            	});
            },
            error: function (xhr, status, error) {
                console.log(error,xhr,status );
            },
        });
    })
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>