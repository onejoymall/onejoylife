<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

    <main class="clearfix">
        <div class="header-top">
            <p>${afn:getMessage("transaction_statement",sessionScope.locale)}</p>
        </div>
        <div class="body-mar">
            <table>
                <p class="body-tit">${afn:getMessage("contSheet",sessionScope.locale)}</p>
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
                    <tr class="tr-tit">
                        <td rowspan="4">
                        ${afn:getMessage("ko3",sessionScope.locale)}<br>
                        ${afn:getMessage("ko4",sessionScope.locale)}<br>
                        ${afn:getMessage("ko5",sessionScope.locale)}</td>
                        <td>${afn:getMessage("licensee",sessionScope.locale)}<br>${afn:getMessage("reservNum",sessionScope.locale)}</td>
                        <td colspan="3"><span>487-88-01223</span></td>
                        <td rowspan="4">
                        ${afn:getMessage("ko6",sessionScope.locale)}<br>
                        ${afn:getMessage("ko7",sessionScope.locale)}<br>
                        ${afn:getMessage("ko8",sessionScope.locale)}<br>
                        ${afn:getMessage("ko9",sessionScope.locale)}<br>
                        ${afn:getMessage("ko10",sessionScope.locale)}</td>
                        <td>${afn:getMessage("name",sessionScope.locale)}</td>
                        <td colspan="3"><span>${userInfo.username}</span></td>
                    </tr>
                    <tr>
                        <td>${afn:getMessage("corpName1-1",sessionScope.locale)}<br>(${afn:getMessage("corpName1-2",sessionScope.locale)})</td>
                        <td><span> ${afn:getMessage("onelifeName",sessionScope.locale)}</span></td>
                        <td> ${afn:getMessage("name",sessionScope.locale)}</td>
                        <td><span> ${afn:getMessage("ksy",sessionScope.locale)}</span></td>
                        <td> ${afn:getMessage("ceoPH",sessionScope.locale)}</td>
                        <td colspan="3"><span>${userInfo.phone}</span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>${afn:getMessage("workPlace",sessionScope.locale)}<br>${afn:getMessage("address",sessionScope.locale)}</td>
                        <td colspan="3"><span>${afn:getMessage("wh_text3",sessionScope.locale)}<br> (${afn:getMessage("wh_text4",sessionScope.locale)})</span></td>
                        <td rowspan="2">${afn:getMessage("address",sessionScope.locale)}</td>
                        <td rowspan="2" colspan="3">(${detail.postcode}) ${detail.roadAddress} ${detail.extraAddress}<span></span></td>
                    </tr>
                    <tr>
                        <td>${afn:getMessage("business_condition",sessionScope.locale)}</td>
                        <td><span>${afn:getMessage("wholesaleretail",sessionScope.locale)}</span></td>
                        <td>${afn:getMessage("event",sessionScope.locale)}</td>
                        <td><span>${afn:getMessage("elecStores",sessionScope.locale)}</span></td>
                        <!-- <td>업태</td>
                        <td><span><input type="text"></span></td>
                        <td>종목</td>
                        <td><span><input type="text"></span></td> -->
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 105px;">
                    <col style="width: 364px;">
                    <col style="width: 105px;">
                    <col style="width: 222px;">
                    <col style="width: 143px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td>${afn:getMessage("transaction_date_date",sessionScope.locale)}</td>
                        <td>${afn:getMessage("product_name",sessionScope.locale)}</td>
                        <td>${afn:getMessage("quantity",sessionScope.locale)}</td>
                        <td>${afn:getMessage("proPrice",sessionScope.locale)}</td>
                        <td>${afn:getMessage("remark",sessionScope.locale)}</td>
                    </tr>
                    <c:forEach var="list" items="${paymentBundleList}">
                    	<tr>
	                        <td><span><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></span></td>
	                        <td><span>${list.product_name}</span></td>
	                        <td><span>${list.payment_order_quantity}</span></td>
	                        <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</span></td>
	                        <td><span></span></td>
	                    </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td colspan="3">${afn:getMessage("realPrice",sessionScope.locale)}</td>
                        <td colspan="2"><span><fmt:formatNumber value="${detail.payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</span></td>
                    </tr>
                </tbody>
            </table>
            <p class="txt-p">* ${afn:getMessage("msg_trans_1",sessionScope.locale)}</p>
            <p class="txt-p">* ${afn:getMessage("msg_trans_2",sessionScope.locale)}</p>
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
                      ${afn:getMessage("msg_cr_1-11",sessionScope.locale)}   <br>
                 	  ${afn:getMessage("msg_cr_1-12",sessionScope.locale)}    <br>
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