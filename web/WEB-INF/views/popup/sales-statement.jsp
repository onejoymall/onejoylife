<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

    <main class="clearfix">
        <div class="header-top">
            <p>${afn:getMessage("creditCard",sessionScope.locale)}</p>
        </div>
        <div class="body-mar">
            <table>
                <p class="body-tit"> ${afn:getMessage("creditCardSaleChk",sessionScope.locale)}</p>
                <colgroup>
                    <col style="width: 180px;">
                    <col style="width: 180px;">
                    <col style="width: 180px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td>${afn:getMessage("approvalNumber",sessionScope.locale)}</td>
                        <td>${afn:getMessage("cardType",sessionScope.locale)}</td>
                        <td>${afn:getMessage("cardNum",sessionScope.locale)}</td>
                    </tr>
                    <tr>
                        <td><span>${impPayment.apply_num}</span></td>
                        <td><span>${impPayment.card_name}</span></td>
                        <td><span>${fn:substring(impPayment.card_number,0,4)}-${fn:substring(impPayment.card_number,4,6)}**-****-${fn:substring(impPayment.card_number,12,16)}</span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>${afn:getMessage("payday",sessionScope.locale)}</td>
                        <td>${afn:getMessage("tranPay",sessionScope.locale)}</td>
                        <td>${afn:getMessage("monthlyPay",sessionScope.locale)}</td>
                    </tr>
                    <tr>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd HH:mm:ss"/></span></td>
                        <td><span>${afn:getMessage("creditAppro",sessionScope.locale)}/span></td>
                        <td>
	                        <span>
	                        	<c:if test="${impPayment.card_quota == 0}">${afn:getMessage("lumSumPay",sessionScope.locale)}</c:if>
	                        	<c:if test="${impPayment.card_quota != 0}">${impPayment.card_quota}</c:if>
	                        </span>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 270px;">
                    <col style="width: 270px;">
                </colgroup>
                <tbody class="t-body2">
                    <tr class="tr-tit">
                        <td colspan="2" class="bor-non">${afn:getMessage("product_name",sessionScope.locale)}</td>
                    </tr>
                    <tr >
                        <td colspan="2" class="bor-non"><span>${impPayment.name}</span></td>
                    </tr>
                    <tr class="tr-tit">
                    	<td>${afn:getMessage("ordernum",sessionScope.locale)}</td>
                        <td>${afn:getMessage("storeOrderNum",sessionScope.locale)}</td>
                    </tr>
                    <tr>
                        <td><span>${impPayment.imp_uid}</span></td>
                        <td><span>${impPayment.merchant_uid}</span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <p class="body-tit"> ${afn:getMessage("sellerInfo",sessionScope.locale)}</p>
                <colgroup>
                    <col style="width: 270px;">
                    <col style="width: 270px;">
                </colgroup>
                <tbody class="t-body2">
                    <tr class="tr-tit">
                        <td>${afn:getMessage("franchise",sessionScope.locale)}</td>
                        <td>${afn:getMessage("ceoN",sessionScope.locale)}</td>
                    </tr>
                    <tr>
                        <td><span>${afn:getMessage("onejoy2",sessionScope.locale)}</span></td>
                        <td><span>${afn:getMessage("ksy",sessionScope.locale)}</span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>${afn:getMessage("ksy_ph",sessionScope.locale)}</td>
                        <td>${afn:getMessage("ksy_crn",sessionScope.locale)}</td>
                    </tr>
                    <tr>
                        <td><span>${afn:getMessage("ksy_info",sessionScope.locale)}</span></td>
                        <td><span>${afn:getMessage("ksy_info2",sessionScope.locale)}</span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td colspan="2" class="bor-non">${afn:getMessage("address",sessionScope.locale)}</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="bor-non"><span>${afn:getMessage("msg_cr_1-10",sessionScope.locale)}</span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <p class="body-tit">${afn:getMessage("totalPrice",sessionScope.locale)}</p>
                <colgroup>
                    <col style="width: 270px;">
                    <col style="width: 270px;">
                </colgroup>
                <tbody class="t-body2">
                    <tr>
                        <td class="tr-tit">${afn:getMessage("approvPrice",sessionScope.locale)}</td>
                        <td><span><fmt:formatNumber value="${impPayment.amount}" groupingUsed="true" /></span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">${afn:getMessage("supplyValue",sessionScope.locale)}</td>
                        <td><span><fmt:formatNumber value="${impPayment.amount * 0.89}" groupingUsed="true" /></span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">${afn:getMessage("additionalPrice",sessionScope.locale)}</td>
                        <td><span><fmt:formatNumber value="${impPayment.amount * 0.11}" groupingUsed="true" /></span></td>
                    </tr>
                    <tr class="tr-color">
                        <td class="tr-tit">${afn:getMessage("total",sessionScope.locale)}</td>
                        <td><span><fmt:formatNumber value="${impPayment.amount}" groupingUsed="true" /></span></td>
                    </tr>
                </tbody>
            </table>
            <p class="txt-p">${afn:getMessage("msg_pay1",sessionScope.locale)}</p>
            <div class="but-box">
                <button class="but1" type="button" onclick="window.print();">${afn:getMessage("print",sessionScope.locale)}</button>
                <button class="but2" type="button" onclick="self.close();">${afn:getMessage("confirm",sessionScope.locale)}</button>
            </div>
        </div>
        <div class="mar-f">
            <div class="mar-txt">
                <div class="logo-icon"><a href="../index.html"></a></div>
                <div class="left-bar"></div>
                <div class="txt-box">
                    <p>${afn:getMessage("msg_cr_1-10",sessionScope.locale)}<br>
                 	  ${afn:getMessage("msg_cr_1-11",sessionScope.locale)}  <br>
                 	  ${afn:getMessage("msg_cr_1-12",sessionScope.locale)} <br>
                      ${afn:getMessage("msg_cr_1-13",sessionScope.locale)} 
                    </p>
                </div>
            </div>
         </div>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>