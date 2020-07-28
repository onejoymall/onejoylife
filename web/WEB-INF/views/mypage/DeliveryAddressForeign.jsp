<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box clearfix">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <form action="" method="POST" id="myDeliveryForm">
                <input type="hidden" name="product_delivery_International_type" value="C"/>
                    <p class="sec1-h1">${afn:getMessage('delivery_manage',sessionScope.locale)}</p>
                    <div class="r-sec1">
                        <div class="sec1-ck">
                            <p class="ck-p on" data-id="/MyPage/DeliveryAddress">${afn:getMessage('domestic_delivery_addr',sessionScope.locale)}</p>
                            <p class="ck-p" data-id="/MyPage/DeliveryAddressForeign">${afn:getMessage('foreign_delivery_addr',sessionScope.locale)}</p>
                        </div>
                        <p class="sec1-p">${afn:getMessage('msg.delivery_addr_info',sessionScope.locale)}</p>
                        <table class="tab on" id="sec-ck1">
                            <colgroup>
                            	<col style="width: 115px;">
                                <col style=" width: 175px;">
                                <col style="width: 100px;">
                                <col style="width: 319px;">
                                <col style=" width: 195px;">
                            </colgroup>
                            <thead>
                            <tr class="sec1-tr">
                                <td>${afn:getMessage('check',sessionScope.locale)}</td>
                                <td>${afn:getMessage('delivery_align',sessionScope.locale)}</td>
                                <td>${afn:getMessage('delivery_user_name',sessionScope.locale)}</td>
                                <td>${afn:getMessage('address',sessionScope.locale)}</td>
                                <td>${afn:getMessage('contact_num',sessionScope.locale)}</td>
                            </tr>
                            </thead>
                            <tbody class="sec1-tbody">
                            <c:if test="${not empty list}">
            					<c:forEach var="list" items="${list}" varStatus="status">
            					<tr>
	                                <td>
	                                    <input type="radio" id="${list.order_no}" name="orderNo" value="${list.order_no}">
	                                    <label for="${list.order_no}" class="ra-icon"></label>
	                                </td>
	                                <td>
	                                	${list.delivery_alias}
	                                	<c:if test="${list.default_delivery_info_yn == 'Y'}">
                                		<span class="td-clolr">(${afn:getMessage('default',sessionScope.locale)})</span>
	                                	</c:if>
	                                </td>
	                                <td>
	                                	${list.delivery_user_name}
	                                </td>
	                                <td>
	                                	<span>
	                                		${list.postcode}
	                                		${list.roadAddress}
	                                		${list.extraAddress}
		                                </span>
	                                </td>
	                                <td>
	                                	<span>${list.delivery_user_phone}</span>
	                                	<br>
	                                	<span>${list.delivery_user_tel}</span>
                                	</td>
	                            </tr>
            					</c:forEach>
           					</c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <p style="cursor: pointer;" id="updateDeliveryInfo">${afn:getMessage('check_addr',sessionScope.locale)} ${afn:getMessage('update',sessionScope.locale)}</p>
                        <p style="cursor: pointer;" id="deleteDeliveryInfo">${afn:getMessage('check_addr',sessionScope.locale)} ${afn:getMessage('delete',sessionScope.locale)}</p>
                    </div>
                    <div class="r-sec3">
                        <button type="button" id="addDeliveryInfo">${afn:getMessage('new_addr',sessionScope.locale)}</button>
                        <button type="button" id="updateDefaultDeliveryInfo">${afn:getMessage('set_default_addr',sessionScope.locale)}</button>
                    </div>
                </form>
            </div>

        </main>

    </div>
</div>
<!-- 팝업창 -->
<div class="modal">
<form id="form1">
   <div class="modal-content">
       <div class="modal-close-address">
           <p>${afn:getMessage('new_addr',sessionScope.locale)}</p>
           <div class="close"></div>
       </div>
       <div class="content-in">
           <table>
               <colgroup>
                   <col style="width: 20%;">
                   <col style="width: 80%;">
               </colgroup>
                <thead>
                </thead>
                <tbody>
                	<tr class="body-tr">
                        <td class="body-td1">
                            ${afn:getMessage('delivery_align',sessionScope.locale)}
                        </td>
                        <td  class="body-td2">
                            <input type="text" name="delivery_alias"/>
                        </td>
                    </tr>
                    <tr class="body-tr">
                        <td class="body-td1">
                            ${afn:getMessage('delivery_user_name',sessionScope.locale)}
                        </td>
                        <td  class="body-td2">
                            <input type="text" name="delivery_user_name"/>
                            <input type="hidden" name="order_no"/>
                            <input type="hidden" name="product_delivery_International_type" value="C"/>
                        </td>
                    </tr>
                    <tr class="body-tr">
                        <td class="body-td1">
                            ${afn:getMessage('phone',sessionScope.locale)}
                        </td>
                        <td  class="body-td2 p-num">
                            <select name="delivery_user_phone_a" id="">
                                <option value="010" >010</option>
                                <option value="011" >011</option>
                                <option value="016" >016</option>
                                <option value="017" >017</option>
                                <option value="018" >018</option>
                                <option value="019" >019</option>
                            </select>
                            <span> - </span>
                            <input type="text" name="delivery_user_phone_b" id="delivery_user_tel_b"  maxlength="4">
                            <span> - </span>
                            <input type="text" name="delivery_user_phone_c" id="delivery_user_tel_c"  maxlength="4">
                        </td>
                    </tr>
                    <tr class="body-tr">
                        <td class="body-td1">
                            ${afn:getMessage('tel',sessionScope.locale)}
                        </td>
                        <td  class="body-td2 p-num">
                            <select name="delivery_user_tel_a" id="">
                                <option value="02" selected>02</option>
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
                            </select>
                            <span> - </span>
                            <input type="text" name="delivery_user_tel_b" id="delivery_user_tel_b"  maxlength="4">
                            <span> - </span>
                            <input type="text" name="delivery_user_tel_c" id="delivery_user_tel_c"  maxlength="4">
                        </td>
                    </tr>
                    <tr class="body-tr ">
                        <td class="body-td1">
                            ${afn:getMessage('addr',sessionScope.locale)}
                        </td>
                        <td class="body-td2 td-m">
                            <div class="input-group">
                                <input placeholder="${afn:getMessage('postcode',sessionScope.locale)}" type="text" name="postcode" id="postcode" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
                            </div>
                            <p class="mar-p2"><input placeholder="${afn:getMessage('road_name_address',sessionScope.locale)}" type="text" class="sec2-in2" name="roadAddress" id="roadAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>"></p>
                             <p class="mar-p2"><input placeholder="${afn:getMessage('extraAddress',sessionScope.locale)}" type="text" class="sec2-in2" name="extraAddress" id="extraAddress" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>"></p>
                             <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>
                             
                        </td>
                    </tr>
                    <tr class="body-tr ">
                        <td class="body-td1">
                        </td>
                        <td class="body-td2 td-m">
                            <div class="ck-box">
                                <input type="checkbox" id="le-ck1" name="defaultYn" value="Y">
                                <label for="le-ck1">
                                    <span class="le-ck-txt"></span>
                                    <span class="le-ck-color">${afn:getMessage('set_default_addr',sessionScope.locale)}</span>
                                </label>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-box">
                <button type="button" class="btn-redcover" id="newDeliveryBtn">${afn:getMessage('registration',sessionScope.locale)}</button>
             </div>
        </div>
    </div>
    </form>
</div>
<div class="modal2">
    <form id="form2">
   <div class="modal-content">
       <div class="modal-close-address">
           <p>${afn:getMessage('delivery_address',sessionScope.locale)} ${afn:getMessage('update',sessionScope.locale)}</p>
           <input type="hidden" name="product_delivery_International_type" value="C"/>
           <div class="close"></div>
       </div>
       <div class="content-in">
           <table>
               <colgroup>
                   <col style="width: 20%;">
                   <col style="width: 80%;">
               </colgroup>
                <thead>
                </thead>
                <tbody>
                	<tr class="body-tr">
                        <td class="body-td1">
                            ${afn:getMessage('delivery_align',sessionScope.locale)}
                        </td>
                        <td  class="body-td2">
                            <input type="text" name="delivery_alias"/>
                        </td>
                    </tr>
                    <tr class="body-tr">
                        <td class="body-td1">
                            ${afn:getMessage('delivery_user_name',sessionScope.locale)}
                        </td>
                        <td  class="body-td2">
                            <input type="text" name="delivery_user_name"/>
                            <input type="hidden" name="order_no"/>
                        </td>
                    </tr>
                    <tr class="body-tr">
                        <td class="body-td1">
                            ${afn:getMessage('phone',sessionScope.locale)}
                        </td>
                        <td  class="body-td2 p-num">
                            <select name="delivery_user_phone_a" id="">
                                <option value="010" >010</option>
                                <option value="011" >011</option>
                                <option value="016" >016</option>
                                <option value="017" >017</option>
                                <option value="018" >018</option>
                                <option value="019" >019</option>
                            </select>
                            <span> - </span>
                            <input type="text" name="delivery_user_phone_b"  maxlength="4">
                            <span> - </span>
                            <input type="text" name="delivery_user_phone_c"  maxlength="4">
                        </td>
                    </tr>
                    <tr class="body-tr">
                        <td class="body-td1">
                            ${afn:getMessage('tel',sessionScope.locale)}
                        </td>
                        <td  class="body-td2 p-num">
                            <select name="delivery_user_tel_a" id="">
                                <option value="02" selected>02</option>
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
                            </select>
                            <span> - </span>
                            <input type="text" name="delivery_user_tel_b"  maxlength="4">
                            <span> - </span>
                            <input type="text" name="delivery_user_tel_c"  maxlength="4">
                        </td>
                    </tr>
                    <tr class="body-tr ">
                        <td class="body-td1">
                            ${afn:getMessage('address',sessionScope.locale)}
                        </td>
                        <td class="body-td2 td-m">
                            <!-- <div class="input-group"> -->
                            <div>
                                <input placeholder="${afn:getMessage('postcode',sessionScope.locale)}" type="text" name="postcode" id="postcode" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
                                <!-- <button type="button" class="grey" id="daumMapCall">우편번호 찾기</button> -->
                            </div>
                            <p class="mar-p2"><input placeholder="${afn:getMessage('road_name_addr',sessionScope.locale)}" type="text" class="sec2-in2" name="roadAddress" id="roadAddress_modi" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>"></p>
                             <p class="mar-p2"><input placeholder="${afn:getMessage('extraAddress',sessionScope.locale)}" type="text" class="sec2-in2" name="extraAddress" id="extraAddress_modi" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>"></p>
                             <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>
                             
                        </td>
                    </tr>
                    <tr class="body-tr ">
                        <td class="body-td1">
                        </td>
                        <td class="body-td2 td-m">
                            <div class="ck-box">
                                <input type="checkbox" id="le-ck2" name="defaultYn" value="Y">
                                <label for="le-ck2">
                                    <span class="le-ck-txt"></span>
                                    <span class="le-ck-color">${afn:getMessage('set_default_addr',sessionScope.locale)}</span>
                                </label>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-box">
                <button type="button" class="btn-redcover btn-redcover1" id="updateDeliveryBtn">${afn:getMessage('update',sessionScope.locale)}</button>
             </div>
        </div>
    </div>
    </form>
</div>
<script type="text/javascript">
$(function(){
	$(".close").click(function(){
        $(".modal").attr("style", "display:none");
        $(".modal2").attr("style", "display:none");
    });
	
	$(".ck-p").click(function(){
        location.href=$(this).attr("data-id");
	});
});
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>