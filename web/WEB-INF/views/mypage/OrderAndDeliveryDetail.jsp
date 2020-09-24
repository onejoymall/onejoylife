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
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <div class="r-sec1">
                    <p class="sec1-h1">${afn:getMessage('order_detail',sessionScope.locale)}</p>
                    <p class="sec1-p1">${afn:getMessage('storeorder_num',sessionScope.locale)} : <span>${paymentDetail.order_no}</span><span> │ </span>${afn:getMessage('ordernum',sessionScope.locale)} : <span>${paymentDetail.imp_uid}</span><span> │ </span>${afn:getMessage('order_date',sessionScope.locale)} : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p></p>
                    <table>
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 260px;">
                            <col style="width: 125px;">
                            <col style="width: 110px;">
                            <col style="width: 100px;">
                            <col style="width: 150px;">
                        </colgroup>
                        <thead class="sec1-thead">
                        <tr>
                            <th></th>
                            <th>${afn:getMessage('product_information',sessionScope.locale)}</th>
                            <th>${afn:getMessage('product_amount',sessionScope.locale)}</th>
                            <th>${afn:getMessage('quantity',sessionScope.locale)}</th>
                            <th>${afn:getMessage('status',sessionScope.locale)}</th>
                            <th>${afn:getMessage('brdmanage',sessionScope.locale)}</th>
                        </tr>
                        </thead>
                        <tbody class="sec1-tbody">
	                        <c:forEach var="list" items="${paymentBundleList}" varStatus="status">
	                        <tr>
	                            <%-- <td>
	                            <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>
	                            <img src="${list.file_1}" style="width: 80px;"/>
	                            </a>
	                            </td> --%>
	                            <td>
                                  <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                                      <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" style="width: 80px;">
                                  </a>
                                </td>   
	                            
	                            
	                            <td class="sec1-tbody-p1">
	                                <p>${list.product_name} <c:if test="${not empty list.option_name}"> / ${list.option_name}</c:if></p>
	                            </td>
	                            <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
	                            <td><span><fmt:formatNumber value="${list.payment_order_quantity}" groupingUsed="true" /></span></td>
	                            <td><span>${list.payment_status_name}</span></td>
	                            <td class="sec1-tbody-p2">
	
	                                <div class="p2-box1">
	<%--                                    <p class="p2-ck"><a href="">배송지 변경</a></p>--%>
	                                <c:if test="${list.payment_status eq 'W' || list.payment_status eq 'D' || list.payment_status eq 'I'}">
	                                    <p><a href="/MyPage/OrderCancel?order_no=${list.order_no}">${afn:getMessage('full_cancellation',sessionScope.locale)}</a></p>
	                                </c:if>
	                                <c:if test="${list.payment_status eq 'R' || list.payment_status eq 'S'}">
	                                    <p class="lis-txt-box text-danger"><a id="SearchDelivery" class="click-span" data-id="${list.no}">${afn:getMessage('delivery_check',sessionScope.locale)}</a></p>
	                                    <p class="lis-txt-box text-danger"><a href="/MyPage/OrderChange?order_no=${list.no}">${afn:getMessage('change_request',sessionScope.locale)}</a></p>
	                                    <p class="lis-txt-box text-danger"><a href="/MyPage/OrderRollback?order_no=${list.no}">${afn:getMessage('rollback_req',sessionScope.locale)}</a></p>
	                                </c:if>
	                                <c:if test="${list.payment_status eq 'O'}">
	                                	<p class="lis-txt-box text-danger"><a href="/MyPage/OrderChange?order_no=${list.no}">${afn:getMessage('change_request',sessionScope.locale)}</a></p>
	                                    <p class="lis-txt-box text-danger"><a href="/MyPage/OrderRollback?order_no=${list.no}">${afn:getMessage('rollback_req',sessionScope.locale)}</a></p>
	                                </c:if>
	                                    <c:if test="${list.payment_status eq 'M'}">
	                                	<p class="lis-txt-box text-danger" ><a href="/MyPage/OrderCancel?order_no=${list.order_no}">${afn:getMessage('full_cancellation',sessionScope.locale)}</p>
	                                 
	                                </c:if>
	<%--                                    <p><a href="">판매자 문의</a></p>--%>
	                                </div>
	
	                            </td>
	                        </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="r-sec2">
                    <p class="sec-h1">${afn:getMessage('delivery_address',sessionScope.locale)}</p>
                    <table>
                        <colgroup>
                            <col style="width: 180px;">
                            <col style="width: 715px;;">
                        </colgroup>
                        <tbody class="sec2-body body-tr-s">
                        <tr>
                            <td class="body-td-tit1">${afn:getMessage('delivery_user_name',sessionScope.locale)}</td>
                            <td class="body-td-txt"><span>${delivery.delivery_user_name}</span></td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">${afn:getMessage('delivery_user_phone',sessionScope.locale)}</td>
                            <td class="body-td-txt">${delivery.delivery_user_phone}</td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">${afn:getMessage('deliv_receiveADDR',sessionScope.locale)}</td>
                            <td class="body-td-txt"><span>${delivery.postcode} ${delivery.roadAddress} ${delivery.extraAddress}</span></td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">${afn:getMessage('delivery_message_select',sessionScope.locale)}</td>
                            <td class="body-td-txt"><span>${delivery.delivery_message}</span></td>
                        </tr>
                        <c:if test="${not empty paymentDetail.delivery_hope_date}">
                        <tr>
                            <td class="body-td-tit1">${afn:getMessage('delivery_hope_date',sessionScope.locale)}</td>
                            <td class="body-td-txt"><span>${paymentDetail.delivery_hope_date} ${paymentDetail.delivery_hope_time}</span></td>
                        </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
<%--                <div class="r-sec3">--%>
<%--                    <p class="sec-h1">주문자 정보</p>--%>
<%--                    <table>--%>
<%--                        <colgroup>--%>
<%--                            <col style="width: 180px;">--%>
<%--                            <col style="width: 720px;">--%>
<%--                        </colgroup>--%>
<%--                        <tbody class="sec3-body body-tr-s">--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">주문하시는분</td>--%>
<%--                            <td class="body-td-txt"><span>홍길동</span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">이메일주소</td>--%>
<%--                            <td class="body-td-txt"><span>gildonghong@onejoy.co.kr</span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">휴대폰 번호</td>--%>
<%--                            <td class="body-td-txt"><span>010</span><span class="td-txt-un"> - </span><span>1234</span><span class="td-txt-un"> - </span><span>1234</span></td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
                <div class="r-sec4">
                    <p class="sec-h1">${afn:getMessage('payment_info',sessionScope.locale)}</p>
                    <table>
                        <colgroup>
                            <col style="width: 180px;">
                            <col style="width: 267px">
                            <col style="width: 180px;">
                            <col style="width: 267px">
                        </colgroup>
                        <tbody class="sec3-body body-tr-s">
                        <tr>
                            <td class="body-td-tit2">${afn:getMessage('order_payment',sessionScope.locale)}</td>
                            <td class="body-td-txt"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                            <td class="body-td-tit2">${afn:getMessage('product_amount',sessionScope.locale)}</td>
                            <td class="body-td-txt"><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)} <c:if test="${fn:length(paymentBundleList) > 1}"> ${afn:getMessage('other',sessionScope.locale)} ${fn:length(paymentBundleList) - 1}${afn:getMessage('case',sessionScope.locale)}</c:if></td>
                        </tr>
                        <tr>
                            <td class="body-td-tit2">${afn:getMessage('payment_payment',sessionScope.locale)}</td>
                            <td class="body-td-txt txt-color"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                            <td class="body-td-tit2">${afn:getMessage('pay_method',sessionScope.locale)}</td>
                            <td class="body-td-txt"><span>${paymentDetail.pay_method_name} ${paymentDetail.vbank_name} ${paymentDetail.vbank_num}</span></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="sec4-ca">
	                    <c:if test="${impPayment.status == 'paid'}">
	                    	<a href="javascript:taxInvoice('${paymentDetail.order_no}');" class="sec4-but">${afn:getMessage('tax_bill_sand',sessionScope.locale)}</a>
	                        <a href="javascript:normalReceipt('${paymentDetail.order_no}');" class="sec4-but">${afn:getMessage('receipt_output',sessionScope.locale)}</a>
                        </c:if>
                        <c:if test="${impPayment.status == 'paid' && impPayment.payMethod != 'card'}">
                        	<a href="javascript:cashReceipt('${paymentDetail.order_no}');" class="sec4-but">${afn:getMessage('cash_receipt_request',sessionScope.locale)}</a>
                        </c:if>
                        <c:if test="${impPayment.status == 'paid'}">
                        	<a href="javascript:transactionStatement('${paymentDetail.order_no}');" class="sec4-but">${afn:getMessage('transaction_statement_output',sessionScope.locale)}</a>
                        </c:if>
                        <c:if test="${impPayment.status == 'paid' && impPayment.payMethod == 'card'}">
                        	<a href="javascript:salesStatement('${paymentDetail.order_no}');" class="sec4-but">${afn:getMessage('sales_statement_output',sessionScope.locale)}</a>
                        </c:if>
                    </div>
<%--                    <div class="sec4-ca"><a href="">신용카드 전표</a></div>--%>
                </div>
                <div class="r-sec5">
                    <a href="/MyPage/OrderAndDelivery">${afn:getMessage('view_list',sessionScope.locale)}</a>
                </div>
            </div>
        </main>
    </div>
</div>
<!-- 팝업창 -->
<div class="modal">
    <div class="modal-content">
        <div class="modal-close-address">
            <p>${afn:getMessage('find_zipcode',sessionScope.locale)}</p>
            <div class="close"></div>
        </div>
        <div class="content-in">
           <table>
                <colgroup>
                    <col style="width: 20%;">
                   <col style="width: 80%;">
                </colgroup>

                <thead>
                <tr class="head-tr">
                    <td class="body-td1">
                        ${afn:getMessage('address',sessionScope.locale)}
                    </td>
                </tr>
                </thead>
                <tbody>
                <tr class="body-tr">
                    <td class="body-td2 td-m">
                        <div class="input-group">
                            <input placeholder="${afn:getMessage('postcode',sessionScope.locale)}" type="text" name="postcode" id="postcode_modi" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
                            <button type="button" class="grey" id="daumMapCall2">${afn:getMessage('find_zipcode',sessionScope.locale)}</button>
                        </div>
                        <p class="mar-p2"><input placeholder="${afn:getMessage('road_name_addr',sessionScope.locale)}" type="text" class="sec2-in2" name="roadAddress" id="roadAddress_modi" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>"></p>
                         <p class="mar-p2"><input placeholder="${afn:getMessage('extraAddress',sessionScope.locale)}" type="text" class="sec2-in2" name="extraAddress" id="extraAddress_modi" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>"></p>
                         <p>${afn:getMessage('msg.detail_address_input',sessionScope.locale)}</p>
                         <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress_modi"></p>

                    </td>
                </tr>
                </tbody>
           </table>
            <div class="btn-box">
                <button type="button" class="btn-redcover" id="updateDeliveryBtn">${afn:getMessage('update',sessionScope.locale)}</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){


        $('.click-box p').click(function(){
            var tab_id = $(this).attr('data-1');

            $('.click-box p').removeClass('on');
            $('.ck').removeClass('on');

            $(this).addClass('on');
            $("#"+tab_id).addClass('on');
        })
        $(".p2-box1 .p2-ck").click(function(){
            event.preventDefault();
            $(".modal").attr("style", "display:block");
        });

        $(".close").click(function(){
            $(".modal").attr("style", "display:none");
        });
    });



</script><c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>