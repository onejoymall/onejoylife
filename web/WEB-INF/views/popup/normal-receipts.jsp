<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%-- ${afn:getMessage("delivery_t_invoice",sessionScope.locale)} --%>
    <main class="clearfix">
        <div class="header-top">
            <p>${afn:getMessage("purchaseReceipt",sessionScope.locale)} </p>
        </div>
        <div class="body-mar">
            <table>
                <colgroup>
                    <col style="width: 120px;">
                    <col style="width: 570px;">
                </colgroup>
                <tbody class="body-tr">
                    <tr>
                       <td>${afn:getMessage("storeOrderNum",sessionScope.locale)} <br><span>(ORDER NO.)</span></td>
                       <td><span>${detail.order_no}</span></td>
                    </tr>
                    <tr>
                        <td>${afn:getMessage("transaction_date_time",sessionScope.locale)} <br><span>(TRANS DATE)</span></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd"/></span></td>
                     </tr>
                     <tr>
                        <td>${afn:getMessage("product_name",sessionScope.locale)} <br><span>(DESCRIPTION)</span></td>
                        <td><span>${detail.product_order_name}</span></td>
                     </tr>
                     <tr>
                        <td>${afn:getMessage("sum_total",sessionScope.locale)} <br><span>(TOTAL)</span></td>
                        <td><span><fmt:formatNumber value="${detail.payment}" groupingUsed="true" />원</span></td>
                     </tr>
                     <tr>
                        <td>${afn:getMessage("companyName",sessionScope.locale)}<br><span>(COMPANY NAME)</span></td>
                        <td><span>ONEJOY</span></td>
                     </tr>
                     <tr>
                        <td>${afn:getMessage("userSign",sessionScope.locale)}<br><span>(SIGNATURE)</span></td>
                        <td><span>${userInfo.username}</span></td>
                     </tr>
                </tbody>
            </table>
            <p>${afn:getMessage("msg_receipts_1-1",sessionScope.locale)}</p>
            <div class="mar-but">
                <button class="but1" type="button" onclick="window.print();">${afn:getMessage("print",sessionScope.locale)}</button>
                <button class="but2" type="button" onclick="self.close();">${afn:getMessage("cur_status",sessionScope.locale)}</button>
            </div>
        </div>
        <div class="mar-f">
            <div class="mar-txt">
                <div class="logo-icon"><a href="../index.html"></a></div>
                <div class="left-bar"></div>
                <div class="txt-box">
                    <p>${afn:getMessage("msg_cr_1-10",sessionScope.locale)}<br>
                 ${afn:getMessage("msg_cr_1-11",sessionScope.locale)}     <br>
               ${afn:getMessage("msg_cr_1-12",sessionScope.locale)}  <br>
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