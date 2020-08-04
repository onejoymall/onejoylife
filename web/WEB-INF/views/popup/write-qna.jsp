<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

    <header>
        <h2>${afn:getMessage("qnatext1",sessionScope.locale)}&amp;${afn:getMessage("qnatext2",sessionScope.locale)}</h2>
    </header>
    <form id="defaultForm" name="defaultForm" method="POST">
        <input type="hidden" name="product_cd" value="${param.product_cd}">
        <div class="main-section">
<%--            <p class="goods-name">LG휘센 2015년형 크라운2 스페셜 스탠드형 에어컨</p>--%>
            <table>
                <colgroup>
                    <col style="width: 120px;">
                    <col style="width: 714px;">
                </colgroup>
                <tbody class="sec1-tbody">
                    <tr>
                        <td class="sec1-td-bor1">${afn:getMessage("brd_title",sessionScope.locale)} *</td>
                        <td class="body-td2 padding-left">
                            <input type="text" name="qna_title" placeholder="${afn:getMessage('msg_below50word',sessionScope.locale)}" maxlength="50">
                            <input name="secret" id="secret" type="checkbox">
                            <label for="secret">${afn:getMessage('private',sessionScope.locale)}</label>
                            <input type="hidden" name="qna_open_type" value="F">
                        </td>
                    </tr>
                    <tr>
                        <td class="sec1-td-bor1">${afn:getMessage('QA_type',sessionScope.locale)}</td>
                        <td class="body-td2 padding-left">
                          <select name="qna_type" id="qna_type">
                                <option value="O">${afn:getMessage('orders_payments',sessionScope.locale)}</option>
                                <option value="C">${afn:getMessage('change_return_refund',sessionScope.locale)}</option>
                                <option value="D">${afn:getMessage('deliv',sessionScope.locale)}</option>
                                <option value="G">${afn:getMessage('QA_others',sessionScope.locale)}</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                         <td class="sec1-td-bor1">${afn:getMessage('content',sessionScope.locale)} *</td>
                        <td class="body-td2 padding-left">
                              <textarea name=qna_memo placeholder="${afn:getMessage('msg_below500word',sessionScope.locale)}"  style="resize:none;" maxlength="500"></textarea>
                            <p class="txt-counting">&#40;<span>0</span>/500&#41;</p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="button-box">
                <button type="button" id="qnaWriteSubmit">${afn:getMessage('registration',sessionScope.locale)}</button>
                <button type="button" class="grey-button" onclick="window.close()">${afn:getMessage('reviewCancel',sessionScope.locale)}</button>
            </div>

        </div>
    </form>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>