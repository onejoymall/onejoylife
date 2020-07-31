<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

    <main class="clearfix">
        <div class="header-top">
            <p>${afn:getMessage("cashReceipts",sessionScope.locale)}</p>
        </div>
        <div class="body-mar">
            <p class="body-tit">${afn:getMessage("cashReceiptsAppl",sessionScope.locale)}</p>
            <p class="body-txt1">${afn:getMessage("msg_cr_1-1",sessionScope.locale)}
            ${afn:getMessage("msg_cr_1-2",sessionScope.locale)}
            ${afn:getMessage("msg_cr_1-3",sessionScope.locale)}</p>
            <a href=""> ${afn:getMessage("msg_cr_1-4",sessionScope.locale)}</a>
            <p class="body-txt2"> ${afn:getMessage("msg_cr_1-5",sessionScope.locale)}</p>
            
                <form action="" name="cashReceiptsForm" id="cashReceiptsForm">
                <input type="hidden" name="imp_uid" value="${detail.imp_uid}"/>
                    <div class="form-out">
                        <div class="form-box1">
                            <input type="radio" id="rd1" name="type" value="person" checked="checked">
                            <label for="rd1"><span class="ra-txt">${afn:getMessage("deductions",sessionScope.locale)}</span></label>
                            <input type="radio" id="rd2" name="type" value="company">
                            <label for="rd2"><span class="ra-txt">${afn:getMessage("Expenditure",sessionScope.locale)}</span></label>
                        </div>
                        <div class="form-box2">
                            <select name="identifier_type" id="identifier_type">
                                <option value="phone">${afn:getMessage("cr_Ph",sessionScope.locale)}</option>
                                <option value="person">${afn:getMessage("cr_sid",sessionScope.locale)}</option>
                                <option value="business">${afn:getMessage("cr_crn",sessionScope.locale)}</option>
                            </select>
                            <input type="text" name="identifier">
                            <p class="cc">${afn:getMessage("WOdash",sessionScope.locale)}</p>
                        </div>
                    </div>
                    <div class="but-box">
                        <button class="but1" type="button" id="cashReceiptsBtn">${afn:getMessage("crOk",sessionScope.locale)}</button>
                        <button class="but2" type="button" onclick="self.close();">${afn:getMessage("crCancel",sessionScope.locale)}</button>
                    </div>
                </form>
            <p class="f-tit">${afn:getMessage("msg_cr_1-6",sessionScope.locale)}</p>
            <p>${afn:getMessage("msg_cr_1-7",sessionScope.locale)}<br> 
           ${afn:getMessage("msg_cr_1-8",sessionScope.locale)}<br> 
           ${afn:getMessage("msg_cr_1-14",sessionScope.locale)} </p>
            <p class="f-tit">${afn:getMessage("taxbillAppl",sessionScope.locale)}</p>
            <p>${afn:getMessage("msg_cr_1-9",sessionScope.locale)}</p>
        </div>
        <div class="mar-f">
            <div class="mar-txt">
                <div class="logo-icon"><a href="../index.html"></a></div>
                <div class="left-bar"></div>
                <div class="txt-box">
                    <p>${afn:getMessage("msg_cr_1-10",sessionScope.locale)}<br>
                      ${afn:getMessage("msg_cr_1-11",sessionScope.locale)}<br>
                        ${afn:getMessage("msg_cr_1-12",sessionScope.locale)}<br>
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