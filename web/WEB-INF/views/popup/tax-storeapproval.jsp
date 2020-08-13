<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

    <main class="clearfix">
    <form id="taxInvoiceForm" name="taxInvoiceForm">
    	<input type="hidden" name="order_no" value="${param.order_no}"/>
    	<input type="hidden" name="amount_total" value="${supply_total}"/>
    	<input type="hidden" name="tax_total" value="${tax_total}"/>
    	<input type="hidden" name="total_amount" value="${supply_total + tax_total}"/>
    	<input type="hidden" name="reg_date" value="<fmt:formatDate value="${detail.reg_date}" pattern="yyyyMMdd"/>"/>
    
       
        <div class="header-top">
            <p>${afn:getMessage("taxSheet",sessionScope.locale)}</p>
        </div>
        <div class="body-mar">
           <table>
               <colgroup>
                   <col style="width:120px">
                   <col style="width:349px">
                   <col style="width:120px">
                   <col style="width:350px">
               </colgroup>
               <tbody class="t-body2">
                <c:forEach items="${storeInvoiceList}" var="info">
                   <tr>
                       <th class="tr-tit"> ${afn:getMessage("surtaxtype",sessionScope.locale)}</th>
                       <td>
                           <input type="radio" name="tax_type" id="vat1" value="${info.tax_type}" 
							<c:if test="${info.tax_type eq \"1\"}">checked</c:if>>
                           <label for="vat1">${afn:getMessage("taxation",sessionScope.locale)}</label>
                           
                           <input type="radio" name="tax_type" id="vat2" value="${info.tax_type}"
                           <c:if test="${info.tax_type eq \"2\"}">checked</c:if>>
                           <label for="vat2">${afn:getMessage("zeroTaxrate",sessionScope.locale)}</label>
                           
                           
                           
                           
                           
                       </td>
                       <th class="tr-tit">${afn:getMessage("supplier",sessionScope.locale)}</th>
                       <td>
                           <input type="radio" name="invoicee_party_type" id="buyer1" value="corp"
                            <c:if test="${info.invoicee_party_type eq 'corp'}">checked</c:if>>
                           <label for="buyer1">${afn:getMessage("licensee",sessionScope.locale)}</label>
                           
                           
                           <input type="radio" name="invoicee_party_type" id="buyer2" value="person" 
 							<c:if test="${info.invoicee_party_type eq  'person'}">checked</c:if>>
                           <label for="buyer2">${afn:getMessage("personal",sessionScope.locale)}</label>
                           
                           
                           <input type="radio" name="invoicee_party_type" id="buyer3" value="foreigner"
                            <c:if test="${info.invoicee_party_type eq  'foreigner'}">checked</c:if>>
                           <label for="buyer3">${afn:getMessage("foreigner",sessionScope.locale)}</label>
                       </td>
                   </tr>
                   </c:forEach>
               </tbody>
           </table>
            <table>
                <colgroup>
                    <col style="width: 25px;">
                    <col style="width: 80px;">
                    <col style="width: 142px;">
                    <col style="width: 80px;">
                    <col style="width: 142px;">
                    <col style="width: 25px;">
                    <col style="width: 80px;">
                    <col style="width: 142px;">
                    <col style="width: 80px;">
                    <col style="width: 143px;">
                </colgroup>
                <tbody class="t-body1">
                    <c:forEach items="${storeInvoiceList}" var="info">
                   <tr class>
                       <td colspan="5">${afn:getMessage("elecTaxSta",sessionScope.locale)}&#40;${afn:getMessage("forsupplier",sessionScope.locale)}&#41;</td>
                       <th colspan="2">${afn:getMessage("bookNum",sessionScope.locale)}</th>
                       <td>
                           <input type="text" id="volume" name="kwon" value="${info.kwon}" readonly>
                           <label for="volume">${afn:getMessage("ko1",sessionScope.locale)}</label>
                           <input type="text" id="issue" name="ho" value="${info.ho}" readonly>
                           <label for="issue">${afn:getMessage("ko2",sessionScope.locale)}</label>
                       </td>
                       <th>${afn:getMessage("corp_num",sessionScope.locale)}</th>
                       <td><input type="text" id="number" name="serial_num" value="${info.serial_num}" readonly></td>
                   </tr>
                    <tr class="tr-tit">
                        <td rowspan="5">${afn:getMessage("ko3",sessionScope.locale)}<br>
							                  ${afn:getMessage("ko4",sessionScope.locale)} <br>
							             ${afn:getMessage("ko5",sessionScope.locale)}  </td>
                        <td>${afn:getMessage("reservNum",sessionScope.locale)}</td>
                        <td colspan="3"><span>487-88-01223</span></td>
                        <td rowspan="5">
		                 ${afn:getMessage("ko6",sessionScope.locale)}<br>
		                 ${afn:getMessage("ko7",sessionScope.locale)}<br>
		           		 ${afn:getMessage("ko8",sessionScope.locale)}<br>
		                 ${afn:getMessage("ko9",sessionScope.locale)}<br>
		                 ${afn:getMessage("ko10",sessionScope.locale)}</td>
                        <td> ${afn:getMessage("reservNum",sessionScope.locale)}</td>
                        <td colspan="3"><span><input type="text" name="corp_num" value="${info.corp_num}" readonly></span></td>
                    </tr>
                    <tr>
                        <td> ${afn:getMessage("corpName",sessionScope.locale)}</td>
                        <td><span> ${afn:getMessage("onejoyName",sessionScope.locale)}</span></td>
                        <td> ${afn:getMessage("name",sessionScope.locale)}</td>
                        <td><span> ${afn:getMessage("ksy",sessionScope.locale)}</span></td>
                        <td> ${afn:getMessage("corpName",sessionScope.locale)}</td>
                        <td><span><input type="text" name="corp_name" value="${info.corp_name}" readonly></span></td>
                        <td> ${afn:getMessage("name",sessionScope.locale)}</td>
                        
                        <td><span><input type="text" name="ceo_name" value="${info.ceo_name}" readonly></span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td> ${afn:getMessage("store_address",sessionScope.locale)}</td>
                        <td colspan="3"><span> ${afn:getMessage("msg_cr_1-10-1",sessionScope.locale)}<br> (${afn:getMessage("msg_cr_1-10-2",sessionScope.locale)})</span></td>
                        <td> ${afn:getMessage("store_address",sessionScope.locale)}</td>
                        <td colspan="3"><span><input type="text" name="addr" value="${info.addr}" readonly></span></td>
                    </tr>
                    <tr>
                        <td> ${afn:getMessage("business_condition",sessionScope.locale)}</td>
                        <td><span> ${afn:getMessage("wholesaleretail",sessionScope.locale)}</span></td>
                        <td> ${afn:getMessage("event",sessionScope.locale)}</td>
                        <td><span> ${afn:getMessage("elecStores",sessionScope.locale)}</span></td>
                        <td> ${afn:getMessage("business_condition",sessionScope.locale)}</td>
                        <td><span><input type="text" name="biz_type" value="${info.biz_type}" readonly></span></td>
                        <td> ${afn:getMessage("event",sessionScope.locale)}</td>
                        <td><span><input type="text" name="biz_class" value="${info.biz_class}" readonly></span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td> ${afn:getMessage("ko6",sessionScope.locale)}</td>
                        <td colspan="3"><span>onejoy@onejoy.co.kr</span></td>
                        <td> ${afn:getMessage("ko6",sessionScope.locale)}</td>
                        <td colspan="3"><span><input type="text" name="taxemail" value="${info.taxemail}" readonly></span></td>
                    </tr>
                    
                    </c:forEach>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width:70px">
                    <col style="width:40px">
                    <col style="width:40px">
                    <col style="width:84px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:159px">
                </colgroup>
                <thead class="tr-tit t-body1">
                	<tr>
	                    <th colspan="3">${afn:getMessage("dayWrite",sessionScope.locale)}</th>
	                    <th colspan="12">${afn:getMessage("supplyValue",sessionScope.locale)}</th>
	                    <th colspan="10">${afn:getMessage("additionalPrice",sessionScope.locale)}</th>
	                    <th rowspan="2">${afn:getMessage("remark",sessionScope.locale)}</th>
                    </tr>
                    <tr>
 				<th>${afn:getMessage("year",sessionScope.locale)} </th>
				<th>${afn:getMessage("month",sessionScope.locale)}</th>
				<th>${afn:getMessage("day",sessionScope.locale)}  </th>
				<th>${afn:getMessage("blank",sessionScope.locale)}</th>
				<th>${afn:getMessage("num1",sessionScope.locale)} </th>
				<th>${afn:getMessage("num2",sessionScope.locale)} </th>
				<th>${afn:getMessage("num3",sessionScope.locale)} </th>
				<th>${afn:getMessage("num4",sessionScope.locale)} </th>
				<th>${afn:getMessage("num5",sessionScope.locale)} </th>
				<th>${afn:getMessage("num6",sessionScope.locale)} </th>
				<th>${afn:getMessage("num7",sessionScope.locale)} </th>
				<th>${afn:getMessage("num8",sessionScope.locale)} </th>
				<th>${afn:getMessage("num9",sessionScope.locale)} </th>
				<th>${afn:getMessage("num10",sessionScope.locale)}</th>
				<th>${afn:getMessage("num11",sessionScope.locale)}</th>
				<th>${afn:getMessage("num12",sessionScope.locale)}</th>
				<th>${afn:getMessage("num13",sessionScope.locale)}</th>
				<th>${afn:getMessage("num14",sessionScope.locale)}</th>
				<th>${afn:getMessage("num15",sessionScope.locale)}</th>
				<th>${afn:getMessage("num16",sessionScope.locale)}</th>
				<th>${afn:getMessage("num17",sessionScope.locale)}</th>
				<th>${afn:getMessage("num18",sessionScope.locale)}</th>
				<th>${afn:getMessage("num19",sessionScope.locale)}</th>
				<th>${afn:getMessage("num20",sessionScope.locale)}</th>
				<th>${afn:getMessage("num22",sessionScope.locale)}</th>
                    </tr>
                </thead>
                <tbody class="t-body1">
                  <c:forEach items="${storeInvoiceList}" var="info"> 
					<tr>
				
						<td><fmt:formatDate value="${detail.reg_date}" pattern="yyyy"/></td>
						<td><fmt:formatDate value="${detail.reg_date}" pattern="MM"/></td>
						<td><fmt:formatDate value="${detail.reg_date}" pattern="dd"/></td>
						<td>${empty_count}</td>
						<td>${fn:substring(supply_total_str,0,1)}</td>
						<td>${fn:substring(supply_total_str,1,2)}</td>
						<td>${fn:substring(supply_total_str,2,3)}</td>
						<td>${fn:substring(supply_total_str,3,4)}</td>
						<td>${fn:substring(supply_total_str,4,5)}</td>
						<td>${fn:substring(supply_total_str,5,6)}</td>
						<td>${fn:substring(supply_total_str,6,7)}</td>
						<td>${fn:substring(supply_total_str,7,8)}</td>
						<td>${fn:substring(supply_total_str,8,9)}</td>
						<td>${fn:substring(supply_total_str,9,10)}</td>
						<td>${fn:substring(supply_total_str,10,11)}</td>
						<td>${fn:substring(tax_total_str,0,1)}</td>
						<td>${fn:substring(tax_total_str,1,2)}</td>
						<td>${fn:substring(tax_total_str,2,3)}</td>
						<td>${fn:substring(tax_total_str,3,4)}</td>
						<td>${fn:substring(tax_total_str,4,5)}</td>
						<td>${fn:substring(tax_total_str,5,6)}</td>
						<td>${fn:substring(tax_total_str,6,7)}</td>
						<td>${fn:substring(tax_total_str,7,8)}</td>
						<td>${fn:substring(tax_total_str,8,9)}</td>
						<td>${fn:substring(tax_total_str,9,10)}</td>
						<td><input type="text" name="remark1" value="${info.remark1}"/></td>
					</tr>
					  </c:forEach>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 309px;">
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 110px;">
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 100px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                    
                        <td>${afn:getMessage("month",sessionScope.locale)}</td>
                        <td>${afn:getMessage("day",sessionScope.locale)}</td>
                        <td>${afn:getMessage("subject",sessionScope.locale)}</td>
                        <td>${afn:getMessage("standard",sessionScope.locale)}</td>
                        <td>${afn:getMessage("quantity",sessionScope.locale)}</td>
                        <td>${afn:getMessage("unitPrice",sessionScope.locale)}</td>
                        <td>${afn:getMessage("publicValue",sessionScope.locale)}</td>
                        <td>${afn:getMessage("taxAmount",sessionScope.locale)}</td>
                        <td>${afn:getMessage("remark",sessionScope.locale)}</td>
                    </tr>
                    <c:forEach items="${paymentBundleList}" var="list">
                    <input type="hidden" name="purchaseExpiry" value="<fmt:formatDate value="${detail.reg_date}" pattern="yyyyMMdd"/>"/>
                    <input type="hidden" name="name" value="${list.product_name}"/>
                    <input type="hidden" name="infomation" value="1"/>
                    <input type="hidden" name="chargeableUnit" value="${list.payment_order_quantity}"/>
                    <input type="hidden" name="unitPrice" value="${list.unit_price}"/>
                    <input type="hidden" name="no" value="${list.no}"/>
                    <input type="hidden" name="amount" value="${list.unit_supply_price}"/>
                    <input type="hidden" name="tax" value="${list.unit_price - list.unit_supply_price}"/>
                    <input type="hidden" name="description" value=""/>
                    	<tr>
	                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="MM"/></span></td>
							<td><span><fmt:formatDate value="${detail.reg_date}" pattern="dd"/></span></td>
	                        <td><span>${list.product_name}</span></td>
	                        <td><span>1</span></td>
	                        <td><span>${list.payment_order_quantity}</span></td>
	                        <td><span><fmt:formatNumber value="${list.unit_price}" groupingUsed="true" /></span></td>
	                        <td><span><fmt:formatNumber value="${list.unit_supply_price}" groupingUsed="true" /></span></td>
	                        <td><span><fmt:formatNumber value="${list.unit_price - list.unit_supply_price}" groupingUsed="true" /></span></td>
	                        <td><span></span></td>
	                    </tr>
                    </c:forEach>
                    <input type="hidden" name="purchaseExpiry" value="<fmt:formatDate value="${detail.reg_date}" pattern="yyyyMMdd"/>"/>
                    <input type="hidden" name="name" value="${afn:getMessage('shippingFee',sessionScope.locale)}"/>
                    <input type="hidden" name="infomation" value=""/>
                    <input type="hidden" name="chargeableUnit" value="1"/>
                    <input type="hidden" name="unitPrice" value="${delivery_payment}"/>
                    <input type="hidden" name="amount" value="${delivery_supply_payment}"/>
                    <input type="hidden" name="tax" value="${delivery_payment - delivery_supply_payment}"/>
                    <input type="hidden" name="description" value=""/>
                    <tr>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="MM"/></span></td>
						<td><span><fmt:formatDate value="${detail.reg_date}" pattern="dd"/></span></td>
                        <td><span>${afn:getMessage("shippingFee",sessionScope.locale)}</span></td>
                        <td><span>1</span></td>
                        <td><span>1</span></td>
                        <td><span><fmt:formatNumber value="${delivery_payment}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${delivery_supply_payment}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${delivery_payment - delivery_supply_payment}" groupingUsed="true" /></span></td>
                        <td><span></span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 289px;">
                </colgroup>
                <tbody class="t-body1">
                  <c:forEach items="${storeInvoiceList}" var="info">
                    <tr class="tr-tit">
                        <td>${afn:getMessage("shippingFee",sessionScope.locale)}</td>
                        <td>${afn:getMessage("totalPrice",sessionScope.locale)}</td>
                        <td>${afn:getMessage("cash",sessionScope.locale)}</td>
                        <td>${afn:getMessage("paycheck",sessionScope.locale)}</td>
                        <td>${afn:getMessage("AccountsRec",sessionScope.locale)}</td>
                        <td rowspan="2">${afn:getMessage("msg_tax1",sessionScope.locale)} 
                        <input type="radio" id="receiving" name="purpose_type" value="${info.purpose_type}"
                        <c:if test="${info.purpose_type eq \"1\"}">checked</c:if>>
                        <label for="receiving">${afn:getMessage("msg_tax2",sessionScope.locale)} </label>
                        
                        <input type="radio" id="requesting" name="purpose_type" value="${info.purpose_type}"
                        <c:if test="${info.purpose_type eq \"2\"}">checked</c:if>>
                        <label for="requesting" >${afn:getMessage("msg_tax3",sessionScope.locale)} </label>
                        ${afn:getMessage("msg_tax4",sessionScope.locale)}</td>
                    </tr>
                    <tr>
                        <td><fmt:formatNumber value="${supply_total + tax_total}" groupingUsed="true" /></td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div>
            	<p>※ ${afn:getMessage("msg_tax5",sessionScope.locale)}</p>
            	<p>※ ${afn:getMessage("msg_tax6",sessionScope.locale)}</p>
            	<p>※ ${afn:getMessage("msg_tax7",sessionScope.locale)}</p>
            </div>
            <div class="but-box">
                <button class="but2" type="button" onclick="window.print();">${afn:getMessage("print",sessionScope.locale)}</button>
                <%-- ${afn:getMessage("print",sessionScope.locale)} --%>
              <button class="but1" type="button" id="taxInvoceSendBtn1">${afn:getMessage("sendToNTS",sessionScope.locale)}</button>
              <button class="but2" type="button" id="taxInvoceNotSendBtn">${afn:getMessage("notSend",sessionScope.locale)}</button>
                <%-- ${afn:getMessage("sendToNTS",sessionScope.locale)} --%>
            </div>
        </div>
    </form>
    </main>
    <script>
 
    
    $(function(){
    	var order_no = '${param.order_no}';
    	$("input[name=tax_type]").on("input", function(){
    		if($("input[name=tax_type]:checked").val() == '2'){
    			location.href="/Popup/taxStoreInvoiceZero?order_no="+order_no;
    		}
    	});
    });
    
    $(document).on("click","#taxInvoceSendBtn1",function () {

    	var formData = $("#taxInvoiceForm").serialize();
    	
    	jQuery.ajax({
            type: 'post',
            url: "/api/taxInvoice3",
            data:formData,
            success: function (data) {
          
                if (data.validateError) {
                    $('.validateError').empty();
                    $.each(data.validateError, function (index, item) {
                        // $('#validateError'+index).removeClass('none');
                        // $('#validateError'+index).html('* '+item);
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
                	if (data.success){
                		alert("처리되었습니다.");
                		self.close();
                	}else{
                		$.toast({
                            text: "ERROR",
                            showHideTransition: 'plain', //펴짐
                            position: 'bottom-right',
                            heading: 'Error',
                            icon: 'error'
                        });
                	}
                }
            },
            error: function (e){
            	console.log(e);
            }
        });
    });
 
    $(document).on("click","#taxInvoceNotSendBtn",function () {
    	var formData = $("#taxInvoiceForm").serialize();
    	jQuery.ajax({
            type: 'post',
            url: "/api/notSend",
            data:formData,
            success: function (data) {
          
                if (data.validateError) {
                    $('.validateError').empty();
                    $.each(data.validateError, function (index, item) {
                        // $('#validateError'+index).removeClass('none');
                        // $('#validateError'+index).html('* '+item);
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
                	if (data.success){
                		alert("처리되었습니다.");
                		self.close();
                	}else{
                		$.toast({
                            text: "ERROR",
                            showHideTransition: 'plain', //펴짐
                            position: 'bottom-right',
                            heading: 'Error',
                            icon: 'error'
                        });
                	}
                }
            },
            error: function (e){
            	console.log(e);
            }
        });
    });
  

    
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>
    
    <script src='<c:url value="/assets/js/commonMgScript.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>