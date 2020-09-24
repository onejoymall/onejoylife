<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-01
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box">
        <main class="clearfix">
            <%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
            <div class="right-contain">
                <form id="form1" name="form1" action="/Board/boardSave" method="post" enctype="multipart/form-data">
                    <div class="r-sec1">
                        <p class="sec1-h1">${afn:getMessage("QA_one_to_one",sessionScope.locale)}</p>
                        <p class="sec1-p1"><span>·${afn:getMessage("myQA",sessionScope.locale)}</span></p>
                        <table>
                            <colgroup>
                                <col style="width: 160px;">
                                <col style="width: 914px;">
                            </colgroup>
                            <tbody class="sec1-tbody">
                            <tr class="name-box">
                                <td>${afn:getMessage("QA_name",sessionScope.locale)} *</td>
                                <td><input type="text" id="brdwriter" name="brdwriter" size="20" maxlength="20" value="<c:out value="${boardInfo.brdwriter}"/>"></td>
                            </tr>
                            <tr class="name-box">
                                <td>${afn:getMessage("QA_email",sessionScope.locale)} *</td>
                                <td>
                                    <input type="text" id="email" name="email" value="${sessionScope.email}">
                                </td>
                            </tr>
                            <c:if test="${empty sessionScope.login}">
                                <tr class="name-box">
                                    <td>${afn:getMessage("QA_pw",sessionScope.locale)} *</td>
                                    <td>
                                        <input type="password" id="password" name="password">
                                    </td>
                                </tr>
                            </c:if>

                            <tr class="phone-box">
                                <td>${afn:getMessage("QA_ph",sessionScope.locale)}</td>
                                <td>
                                    <div>
                                        <select name="phoneNum-1" id="phoneNum-1">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="017">017</option>
                                            <option value="019">019</option>
                                        </select>
                                        <span> - </span>
                                        <input type="tel" name="phoneNum-2" id="phoneNum-2" maxlength="4" class="phoneNum">
                                        <span> - </span>
                                        <input type="tel" name="phoneNum-3" id="phoneNum-3" maxlength="4" class="phoneNum">
                                        <input type="hidden" name="phone">
<%--                                        <div class="chk-box">--%>
<%--                                            <input type="checkbox" id="sms-chk" name="sms-chk">--%>
<%--                                            <label for="sms-chk">답변여부를 SMS로 받으시겠습니까?</label>--%>
<%--                                        </div>--%>
                                    </div>

                                </td>
                            </tr>
                            <tr class="sort-box">
                                <td>${afn:getMessage("QA_type",sessionScope.locale)} *</td>
                                <td>
                                  <input type="hidden" name="lo" id="lo" <c:out value="${bgQuestionType}"/>"> 
                                    <select name="question_type" id="question_type">
                                        <option value="">${afn:getMessage("QA_choose",sessionScope.locale)}</option>
                                        <option value="S" <c:if test="${bgQuestionType eq \"LO\"}">selected</c:if>>${afn:getMessage("QA_largeorder",sessionScope.locale)}</option>
                                        <option value="O" >${afn:getMessage("orders_payments",sessionScope.locale)}</option>
                                        <option value="C">${afn:getMessage("QA_change_return_refund",sessionScope.locale)}</option>
                                        <option value="E">${afn:getMessage("QA_event",sessionScope.locale)}</option>
                                        <option value="D">${afn:getMessage("QA_delivery",sessionScope.locale)}</option>
                                        <option value="G">${afn:getMessage("QA_others",sessionScope.locale)}</option>
                                        <option value="B">${afn:getMessage("QA_inconvenience",sessionScope.locale)}</option>
                                        <option value="M">${afn:getMessage("QA_store",sessionScope.locale)}</option>
                                    </select>
                                </td>
                            </tr>
<%--                            <tr class="goods-box">--%>
<%--                                <td>문의 상품</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="inquire">주문 상품 조회</button>--%>
<%--                                    <span>159753258456</span>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                            <tr class="title-box">
                                <td>${afn:getMessage("QA_title",sessionScope.locale)} *</td>
                                <td><input type="text" id="brdtitle" name="brdtitle" size="70" maxlength="250" value="<c:out value="${boardInfo.brdtitle}"/>"></td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("QA_content",sessionScope.locale)} *</td>
                                <td>
                                    <textarea name="brdmemo" id="brdmemo" style="resize:none;"></textarea>
                                    <p class="txt-counting">&#40;<span>0</span>/1000&#41;</p>
                                </td>
                            </tr>
                            <!-- <tr class="imagefile-box hidden"> -->
                            <tr class="imagefile-box ">
                            
                                <td>${afn:getMessage("QA_img",sessionScope.locale)}</td>
                                <td>
                                    <div class="fileBox">
                                        <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">
                                        <label for="uploadBtn" class="btn_file">${afn:getMessage("QA_findfile",sessionScope.locale)}</label>
                                        <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
                                        <span class="ex">${afn:getMessage("msg_oneFileForOneQA",sessionScope.locale)}</span>
                                    </div>

                                </td>
                            </tr>

                            </tbody>
                        </table>
                        <p class="ex"><span class="bullet-point">·</span><span>${afn:getMessage("msg_oto_ShoppingQA",sessionScope.locale)}<br>${afn:getMessage("msg_shop_info1-1",sessionScope.locale)}<a href="">[${afn:getMessage("msg_shop_info1-2",sessionScope.locale)}]</a>${afn:getMessage("msg_shop_info1-3",sessionScope.locale)}</span></p>
                    </div>
                    <div class="button-box">
                        <button type="button" onclick="fn_formSubmit(${sessionScope.login});">${afn:getMessage("QAinsert",sessionScope.locale)}</button>
                        <button type="button">${afn:getMessage("QAcancel",sessionScope.locale)}</button>
                    </div>
                    <input type="hidden" name="bgno" value="<c:out value="${bgno}"/>">
                    <input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>">
                </form>
            </div>
        </main>
    </div>
</div>
<script>
    $('.phoneNum').on("keyup", function () {
        $('input[name=phone]').val($('#phoneNum-1').val()+"-"+$('#phoneNum-2').val()+"-"+$('#phoneNum-3').val());
    })
    $('#phoneNum-1').on("change", function () {
        $('input[name=phone]').val($('#phoneNum-1').val()+"-"+$('#phoneNum-2').val()+"-"+$('#phoneNum-3').val());
    })


</script>

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>

