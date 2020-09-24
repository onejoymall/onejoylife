<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

    <div class="wrap">
        <div class="page-box">
            <main class="clearfix">
                <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
                <div class="right-contain">
                    <form name="defaultForm" id="defaultForm" method="POST">
                        <div class="r-sec1">
                            <p class="sec1-h1">${afn:getMessage('cancel_req',sessionScope.locale)}</p>
                            <p class="sec1-p1">${afn:getMessage('store_order_no',sessionScope.locale)} : <span>${paymentDetail.order_no}</span><span> │ </span>${afn:getMessage('order_date',sessionScope.locale)} : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p>
                            <input type="hidden" name="merchant_uid" value="${paymentDetail.order_no}">
                            <input type="hidden" name="cancel_request_amount" value="${paymentDetail.payment}">
                            <table>
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col style="width: 460px;">
                                    <col style="width: 200px;">
                                    <col style="width: 200px;">
                                    <col style="width: 200px;">
<%--                                    <col style="width: 259px;">--%>
<%--                                    <col style="width: 100px;">--%>
                                </colgroup>
                                <thead class="sec1-thead">
                                    <tr>
                                        <th></th>
                                        <th>${afn:getMessage('product_info',sessionScope.locale)}</th>
<%--                                        <th>판매자</th>--%>
                                        <th>${afn:getMessage('product_amount',sessionScope.locale)}</th>
                                        <th>${afn:getMessage('quantity',sessionScope.locale)}</th>
                                        <th>${afn:getMessage('sum_total',sessionScope.locale)}</th>
                                    </tr>
                                </thead>
                                <tbody class="sec1-tbody">
                                    <c:if test="${fn:length(paymentBundleList) <= 1}">
                                    <tr>
                                        <td><img src="${paymentDetail.file_1}" style="width: 80px;"/></td>
                                        <td class="sec1-tbody-p1">
                                            <p>${paymentDetail.product_name}</p>
                                        </td>
<%--                                        <td><span>${paymentDetail.product_made_company}</span></td>--%>
                                        <td><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                        <td><span>${paymentDetail.payment_order_quantity}</span></td>
                                        <td><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                    </tr>
                                    </c:if>
                                    <c:if test="${fn:length(paymentBundleList) > 1}">
                                        <c:forEach var="list" items="${paymentBundleList}" varStatus="status">
                                            <tr>
                                                <td><img src="${list.file_1}" style="width: 80px;"/></td>
                                                <td class="sec1-tbody-p1">
                                                    <p>${list.product_name}</p>
                                                    <p>${list.option_name}</p>
                                                </td>
        <%--                                        <td><span>${paymentDetail.product_made_company}</span></td>--%>
                                                <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                                <td><span>${list.payment_order_quantity}</span></td>
                                                <c:if test="${status.index == 0 }">
                                                <td rowspan="${fn:length(paymentBundleList)}"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="r-sec2">
                            <p class="sec-h1">${afn:getMessage('cancel_reason',sessionScope.locale)}</p>
                            <table>
                                <colgroup>
                                    <col style="width: 180px;">
                                    <col style="width: 300px;">
                                    <col style="width: 420px;">
                                </colgroup>
                                <tbody class="sec2-body body-tr-s">
                                    <tr>
                                        <td class="body-td-tit">${afn:getMessage('reason',sessionScope.locale)}</td>
                                        <td colspan="2" class="body-td-txt1">
                                            <input name="reason" type="text"   id="reason" class="select-op">
                                            <div class="card-rd-box">
										     <input type="radio" id="card-rd1" name="card-rd" value="카드변경" onclick="txInput('reason',this.value)">
										     <label for="card-rd1">${afn:getMessage('changeCard',sessionScope.locale)}</label>
										     <input type="radio" id="card-rd2" name="card-rd" value="결제방식 변경" onclick="txInput('reason',this.value)">
										     <label for="card-rd2">${afn:getMessage('changePay',sessionScope.locale)}</label>
										</div>
                                        </td>
<%--                                        <td class="body-td-txt1">--%>
<%--                                            <input type="checkbox" id="ch-box">--%>
<%--                                            <label for="ch-box">--%>
<%--                                                <span class="ch-display">장바구니 다시담기</span>--%>
<%--                                            </label>--%>
<%--                                        </td>--%>
                                    </tr>
                                </tbody>
                                     <script>
										function txInput(Obj,Str)
										{
										  document.getElementById(Obj).value = Str;
										}
									</script>
                            </table>
                        </div>
                        
<%--                         
                        <div class="r-sec3">
                            <p class="sec-h1">${afn:getMessage('rollback_info',sessionScope.locale)}</p>
                            <table>
                                <colgroup>
                                    <col style="width: 180px;">
                                    <col style="width: 267px">
                                    <col style="width: 180px;">
                                    <col style="width: 267px">
                                </colgroup>
                                <tbody class="sec3-body body-tr-s">
                                <tr>
                                    <td class="body-td-tit">${afn:getMessage('order_payment',sessionScope.locale)}</td>
                                    <td class="body-td-txt2"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                    <td class="body-td-tit">${afn:getMessage('product_amount',sessionScope.locale)}</td>
                                    <td class="body-td-txt2"><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)} <c:if test="${fn:length(paymentBundleList) > 1}"> ${afn:getMessage('other',sessionScope.locale)} ${fn:length(paymentBundleList) - 1}${afn:getMessage('case',sessionScope.locale)}</c:if></td>
                                </tr>
                                <tr>
                                    <td class="body-td-tit">${afn:getMessage('payment_payment',sessionScope.locale)}</td>
                                    <td class="body-td-txt2 txt-color"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                    <td class="body-td-tit">${afn:getMessage('pay_method',sessionScope.locale)}</td>
                                    <td class="body-td-txt2"><span>${paymentDetail.pay_method}</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        
                         --%>
                         
                         
        <%--                 <div class="r-sec4">
                            <p class="sec-h1">${afn:getMessage('rollback_account',sessionScope.locale)}</p>
                            <table>
                                <colgroup>
                                    <col style="width: 180px;">
                                    <col style="width: 110px;">
                                    <col style="width: 610px">
                                </colgroup>
                                <tbody class="sec4-body">
                                    <tr>
                                        <td class="body-td-tit" rowspan="3">${afn:getMessage('rollback_account',sessionScope.locale)}</td>
                                        <td class="body-td-txt2 pad-top">${afn:getMessage('bank_name',sessionScope.locale)}</td>
                                        <td class="pad-top">
                                           <input name="refund_bank" type="text" class="select-op">
                                            <select name="refund_bank" class="select-op">
                                                <c:if test="${not empty getSelectorList}">
                                                    <option value="">${afn:getMessage('bank_name',sessionScope.locale)}</option>
                                                    <c:forEach var="getSelectorList" items="${getSelectorList}" varStatus="status">
                                                        <option value="${getSelectorList.code_value}" >${getSelectorList.code_name}</option>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="body-td-txt2">${afn:getMessage('account',sessionScope.locale)}</td>
                                        <td>
                                            <input type="text" name="refund_account"  class="select-op">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="body-td-txt2 pad-bottom">${afn:getMessage('account_name',sessionScope.locale)}</td>
                                        <td class="pad-bottom">
                                            <input type="text" name="refund_holder" class="select-op">
                                           <button class="sec-but">계좌인증</button>
                                        </td>
                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div> --%>
                        <div class="r-sec5">
                            <button type="button" id="payCancel">${afn:getMessage('request',sessionScope.locale)}</button>
                            <button type="button" onclick="location.href='${header.referer}'">${afn:getMessage('prev',sessionScope.locale)}</button>
                        </div>
                    </form>
                </div>   
            </main>
        </div>
    </div>
<c:import url="/layout/footer"/>
<script>
$('#payCancel').on("click",function () {
	
    var formData = $('#defaultForm').serialize();
    var alertType;
    var showText;

    jQuery.ajax({
        type: $('#defaultForm').attr('method'),
        url: postUrl,
        // enctype: 'multipart/form-data',
        data: formData,
        success: function (data) {
            // console.log(data.validateError)
            if (data.validateError) {
                $('.validateError').empty();
                console.log(data);
                $.each(data.validateError, function (index, item) {
                    // $('#validateError'+index).removeClass('none');
                    // $('#validateError'+index).html('* '+item);
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + " "+getMessageAjax('is')+" " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error',
                    });
                });

            } else {
                // loginAuth(data.access_token);
                if (data.success) {
                    $.toast({
                        text: 'success',
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        icon: 'success',
                        hideAfter: 2000,
                        afterHidden: function () {
                        	if(data.redirectUrl){
                        		location.href=data.redirectUrl;	
                        	}else{
                        		location.reload();
                        	}
                        }
                    });
                } else{
                	if(data.redirectUrl){
                		location.href=data.redirectUrl;	
                	}else{
                		$.toast({
                            text: "ERROR",
                            showHideTransition: 'plain', //펴짐
                            position: 'bottom-right',
                            heading: 'Error',
                            icon: 'error',
                        });
                	}
                }
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});


</script>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>