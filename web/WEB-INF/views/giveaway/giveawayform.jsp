<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-31
  Time: 오후 3:21
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
            <form name="defaultFormGiveaway" id="defaultFormGiveaway" method="POST">
            	<input name="product_cd"  type="hidden" value="">
                <input name="giveaway_cd1"  type="hidden" value="${giveaway_cd}">
                <input name="giveaway_play_cd1"  type="hidden" value="${giveaway_play_cd}">
                <input name="order_no"  type="hidden" value="${order_no}">
                <h2 class="head-h2">${afn:getMessage("insertinfo",sessionScope.locale)}</h2>
                <div class="in-box">
                    <div class="sec1">
                        <p class="sec-h1">${afn:getMessage("userinformation",sessionScope.locale)}</p>

                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 920px;">
                            </colgroup>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td>${afn:getMessage("userN",sessionScope.locale)}</td>
                                <td><input type="text" name="order_user_name" id="order_user_name"  class="sec1-in1" value="<c:out value="${userInfo.username}"/>"></td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("userE",sessionScope.locale)}</td>
                                <td><input type="text" name="order_user_email" id="order_user_email"  class="sec1-in1" value="<c:out value="${sessionScope.email}"/>"></td>
                            </tr>
                            <tr class="bor-none">
                                <td>${afn:getMessage("userPH",sessionScope.locale)}
                                    <!-- Map 선언 -->
                                    <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
                                    <c:if test="${empty userInfo.phone}">
                                        <c:set var="phoneNumber" value="${latestDelivery.order_user_phone}" />
                                    </c:if>
                                    <c:if test="${not empty userInfo.phone}">
                                        <c:set var="phoneNumber" value="${userInfo.phone}" />
                                    </c:if>
                                    <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                                        <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
<%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
                                    </c:forEach>
                                </td>
                                <td class="nth-3-td">
                                    <select name="order_user_phone_a" id="order_user_phone_a">
                                        <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
                                        <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
                                        <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
                                        <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
                                        <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
                                        <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
                                    </select>
                                    <span> - </span>
                                    <input type="text" name="order_user_phone_b" id="order_user_phone_b" value="${phoneMap.key2}" class="order_user_phone" maxlength="4">
                                    <span> - </span>
                                    <input type="text" name="order_user_phone_c" id="order_user_phone_c" value="${phoneMap.key3}" class="order_user_phone" maxlength="4">
                                    <input type="hidden" name="order_user_phone" id="order_user_phone" value="<c:out value="${latestDelivery.order_user_phone}"/> ">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p class="sec1-f-txt">·<span>${afn:getMessage("msg_msg_deliv1-3",sessionScope.locale)}</span></p>
                    </div>
                    <div class="sec2">
                        <p class="sec-h1">${afn:getMessage("deliv_info",sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 920px;">
                            </colgroup>
                            <tbody class="sec2-tbody">

                            <tr>
                                <td>${afn:getMessage("deliv_choose",sessionScope.locale)}</td>
                                <td class="sec2-ov">
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-1" checked value="OLD">
                                        <label for="ra1-1"><span class="ra-txt">${afn:getMessage("deliv_main",sessionScope.locale)}</span></label>
                                    </p>
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-2" value="LAST">
                                        <label for="ra1-2"><span class="ra-txt">${afn:getMessage("deliv_recent",sessionScope.locale)}</span></label>
                                    </p>
                                    <p>
                                        <input type="radio" name="selectAddress" id="ra1-3" value="NEW">
                                        <label for="ra1-3"><span class="ra-txt">${afn:getMessage("deliv_new",sessionScope.locale)}</span></label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("deliv_receiveN",sessionScope.locale)}</td>
                                <td><input type="text" placeholder="+${afn:getMessage('delivPlaceHolder',sessionScope.locale)}+" class="sec2-in1" name="delivery_user_name" id="delivery_user_name" value="${latestDelivery.order_user_name}"></td>
                            </tr>
                            <tr class="bor-none">
                                <td>${afn:getMessage("deliv_receiveCPH",sessionScope.locale)} <!-- Map 선언 -->
                                    <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
                                    <c:if test="${empty userInfo.phone}">

                                    </c:if>
                                    <c:if test="${not empty userInfo.phone}">
                                        <c:set var="phoneNumber" value="${latestDelivery.delivery_user_phone}" />
                                    </c:if>
                                    <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                                        <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
                                        <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
                                    </c:forEach>
                                </td>
                                <td class="nth-3-td">
                                    <select name="delivery_user_phone_a" id="delivery_user_phone_a">
                                        <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
                                        <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
                                        <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
                                        <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
                                        <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
                                        <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
                                    </select>
                                    <span> - </span>
                                    <input type="text" name="delivery_user_phone_b" id="delivery_user_phone_b" value="${phoneMap.key2}" class="delivery_user_phone" maxlength="4">
                                    <span> - </span>
                                    <input type="text" name="delivery_user_phone_c" id="delivery_user_phone_c" value="${phoneMap.key3}" class="delivery_user_phone" maxlength="4">
                                    <input type="hidden" name="delivery_user_phone" id="delivery_user_phone" value="${latestDelivery.delivery_user_phone}">
                                </td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("deliv_receivePH",sessionScope.locale)}<!-- Map 선언 -->
                                    <c:set var="phoneMap" value="<%=new java.util.HashMap()%>" />
                                    <c:if test="${empty userInfo.phone}">

                                    </c:if>
                                    <c:if test="${not empty userInfo.phone}">
                                        <c:set var="phoneNumber" value="${latestDelivery.delivery_user_tel}" />
                                    </c:if>
                                    <c:forEach items="${fn:split(phoneNumber, '-') }" var="item" varStatus="status">
                                        <c:set target="${phoneMap}" property="key${status.count}" value="${item}" />
                                        <%--                                        ${phoneMap.key+status.count}/${item}<br>--%>
                                    </c:forEach>
                                </td>
                                <td class="nth-3-td">
                                    <select name="delivery_user_tel_a" id="delivery_user_tel_a">
                                        <option value="010" <c:if test="${phoneMap.key1 eq \"010\"}">selected</c:if> >010</option>
                                        <option value="011" <c:if test="${phoneMap.key1 eq \"011\"}">selected</c:if>>011</option>
                                        <option value="016" <c:if test="${phoneMap.key1 eq \"016\"}">selected</c:if>>016</option>
                                        <option value="017" <c:if test="${phoneMap.key1 eq \"017\"}">selected</c:if>>017</option>
                                        <option value="018" <c:if test="${phoneMap.key1 eq \"018\"}">selected</c:if>>018</option>
                                        <option value="019" <c:if test="${phoneMap.key1 eq \"019\"}">selected</c:if>>019</option>
                                    </select>
                                    <span> - </span>
                                    <input type="text" name="delivery_user_tel_b" id="delivery_user_tel_b" value="${phoneMap.key2}" class="delivery_user_tel" maxlength="4">
                                    <span> - </span>
                                    <input type="text" name="delivery_user_tel_c" id="delivery_user_tel_c" value="${phoneMap.key3}" class="delivery_user_tel" maxlength="4">
                                    <input type="hidden" name="delivery_user_tel" id="delivery_user_tel" value="${latestDelivery.delivery_user_tel}">
                                </td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("deliv_receiveADDR",sessionScope.locale)}</td>
                                <td>
                                    <p class="mar-p1">
                                        <input type="text" name="postcode" id="postcode" class="sec2-in1" value="${latestDelivery.postcode}">
                                        <button type="button" id="daumMapCall">우편번호 찾기${afn:getMessage("find_zipcode",sessionScope.locale)}</button>
                                    </p>
                                    <p class="mar-p2"><input type="text" class="sec2-in2" name="roadAddress" id="roadAddress" value="${latestDelivery.roadAddress}"></p>
                                    <p class="mar-p2"><input type="text" class="sec2-in2" name="extraAddress" id="extraAddress" value="${latestDelivery.extraAddress}"></p>
                                    <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress"></p>
<%--                                    <p class="hidden"><input type="hidden" name="extraAddress" id="extraAddress"></p>--%>
                                    <p class="mar-p2" id="guide"></p>
                                </td>
                            </tr>
                            <tr class="bor-none">
                                <td>${afn:getMessage("deliv_msg",sessionScope.locale)}</td>
                                <td class="sel-td">

                                    <select name="delivery_message_select" id="delivery_message_select" >
                                        <option value="">${afn:getMessage("deliv_msg_option",sessionScope.locale)}</option>
                                        <option value="">${afn:getMessage("deliv_msg_option_door",sessionScope.locale)}</option>
                                        <option value="self">${afn:getMessage("deliv_msg_option_write",sessionScope.locale)}</option>
                                    </select>

                                    <p class="mar-p2 hidden" id="delivery_message_box"><input type="text" class="sec2-in2" name="delivery_message" id="delivery_message"></p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="sec3">
                        <p class="sec3-in1" ><span class="sec3-span1"></span><span class="sec3-span2">${afn:getMessage("msg_deliv1-1",sessionScope.locale)}</span></p>
                        <p class="sec3-in2">※ ${afn:getMessage("msg_deliv1-2",sessionScope.locale)}</p>
                    </div>
                    <div class="sec4">
                        <a href="#" id="formSubmitGiveaway">${afn:getMessage("nextStp",sessionScope.locale)}</a>
                    </div>
                </div>
            </form>
        </main>
    </div>
</div>
<script>
    $(".order_user_phone").on("focusout",function () {
        var phoneA = $("#order_user_phone_a").val();
        var phoneB = $("#order_user_phone_b").val();
        var phoneC = $("#order_user_phone_c").val();
        $("#order_user_phone").val(phoneA+"-"+phoneB+"-"+phoneC);
    })
    $(".delivery_user_phone").on("focusout",function () {
        var phoneA = $("#delivery_user_phone_a").val();
        var phoneB = $("#delivery_user_phone_b").val();
        var phoneC = $("#delivery_user_phone_c").val();
        $("#delivery_user_phone").val(phoneA+"-"+phoneB+"-"+phoneC);
        console.log(phoneA+"-"+phoneB+"-"+phoneC)
    })
    $(".delivery_user_tel").on("focusout",function () {
        var phoneA = $("#delivery_user_tel_a").val();
        var phoneB = $("#delivery_user_tel_b").val();
        var phoneC = $("#delivery_user_tel_c").val();
        $("#delivery_user_tel").val(phoneA+"-"+phoneB+"-"+phoneC);
    })
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>