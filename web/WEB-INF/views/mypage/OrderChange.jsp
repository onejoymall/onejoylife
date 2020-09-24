<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <form id="defaultForm" name="defaultForm"  method="POST">
                    <div class="r-sec1">
                        <p class="sec1-h1">${afn:getMessage('change_request',sessionScope.locale)}</p>
                        <p class="sec1-p1">${afn:getMessage('storeorder_num',sessionScope.locale)} : <span>${paymentDetail.order_no}</span><span> │ </span>${afn:getMessage('order_date',sessionScope.locale)} : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p>
                        <input type="hidden" name="order_no" value="${paymentDetail.no}">
                        <table>
                            <colgroup>
                                <col style="width: 150px;">
                                <col style="width: 260px;">
                                <col style="width: 225px;">
                                <col style="width: 125px;">
                                <col style="width: 200px;">
                                <%--                                    <col style="width: 259px;">--%>
                                <%--                                    <col style="width: 100px;">--%>
                            </colgroup>
                            <thead class="sec1-thead">
                            <tr>
                                <th></th>
                                <th>${afn:getMessage('product_information',sessionScope.locale)}</th>
                                <%--                                        <th>판매자</th>--%>
                                <th>${afn:getMessage('product_amount',sessionScope.locale)}</th>
                                <th>${afn:getMessage('quantity',sessionScope.locale)}</th>
                                <th>${afn:getMessage('coupon_discount',sessionScope.locale)}</th>
                            </tr>
                            </thead>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td><img src="${paymentDetail.file_1}" style="width: 80px;"/></td>
                                <td class="sec1-tbody-p1">
                                    <p>${paymentDetail.product_name}</p>
                                    <p>${paymentDetail.option_name}</p>
                                </td>
                                <%--                                        <td><span>${paymentDetail.product_made_company}</span></td>--%>
                                <td><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                <td><span><fmt:formatNumber value="${paymentDetail.payment_order_quantity}" groupingUsed="true" /></span></td>
                                <td><span><fmt:formatNumber value="${paymentDetail.coupon_discount}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <p class="sec-h1">${afn:getMessage('change_reason',sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec2-body body-tr-s">
<%--                            <tr>--%>
<%--                                <td class="body-td-tit">사유선택</td>--%>
<%--                                <td class="body-td-txt1">--%>
<%--                                    <select name="" id="" class="txt1-select">--%>
<%--                                        <option value="">사유를 선택하세요</option>--%>
<%--                                        <option value="">사유1</option>--%>
<%--                                        <option value="">사유2</option>--%>
<%--                                        <option value="">사유3</option>--%>
<%--                                    </select>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                            <tr>
                            
                                <td class="body-td-tit">${afn:getMessage('reason_input',sessionScope.locale)}</td>
                                
                                <td class="body-td-txt1">
                                    <textarea name="reason" id="reason" cols="97" rows="4" style="resize: none; margin-top: 10px;" class="area-content" maxlength="250"></textarea>
                                    <p class="area-num">(0/250)</p>
                                    	<div class="card-rd-box">
										     <input type="radio" id="card-rd1" name="card-rd" value="카드변경" onclick="txInput('reason',this.value)">
										     <label for="card-rd1">카드변경</label>
										     <input type="radio" id="card-rd2" name="card-rd" value="결제방식 변경" onclick="txInput('reason',this.value)">
										     <label for="card-rd2">결제방식 변경</label>
										</div>
                                </td>
                            </tr>
                            <script>
								function txInput(Obj,Str)
								{
								  document.getElementById(Obj).value = Str;
								}
							</script>
                            
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec3">
                        <p class="sec-h1">${afn:getMessage('product_reclamation_information',sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s">
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('delivery_user_name',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "return_user_name" type="text" value="${delivery.delivery_user_name}" class="select-op"></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('contact_num',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "return_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op"></td>
                            </tr>

                            <tr>
                                <td class="body-td-tit">${afn:getMessage('postcode',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "postcode" type="text" value="${delivery.postcode}" class="select-op"><button class="sec-but" type="button" id="daumMapCall">${afn:getMessage('address_change',sessionScope.locale)}</button></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('address',sessionScope.locale)}</td>
                                <td class="body-td-txt2">
                                    <input name = "roadAddress" id="roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
                                    <input name = "jibunAddress" id="jibunAddress" type="hidden" value="${delivery.jibunAddress}" >
                                    <input name = "guide" type="hidden" value="${delivery.jibunAddress}" >
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('extraAddress',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec4">
                        <p class="sec-h1">${afn:getMessage('changepro_deliv_info',sessionScope.locale)}</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s">
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('delivery_user_name',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "refund_user_name" type="text" value="${delivery.delivery_user_name}" class="select-op"></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('contact_num',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "refund_user_phone" type="text" value="${delivery.delivery_user_phone}" class="select-op"></td>
                            </tr>

                            <tr>
                                <td class="body-td-tit">${afn:getMessage('postcode',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input name = "refund_postcode" type="text" value="${delivery.postcode}" class="select-op"><button class="sec-but" type="button"  id="daumMapCall2">${afn:getMessage('address_change',sessionScope.locale)}</button></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('address',sessionScope.locale)}</td>
                                <td class="body-td-txt2">
                                    <input name = "refund_roadAddress" id="refund_roadAddress" type="text" value="${delivery.roadAddress}" class="select-op-long">
                                    <input name = "refund_jibunAddress" id="refundjibunAddress" type="hidden" value="${delivery.jibunAddress}" >
                                    <input name = "refund_guide" id="" type="hidden" value="${delivery.jibunAddress}" >
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">${afn:getMessage('extraAddress',sessionScope.locale)}</td>
                                <td class="body-td-txt2"><input id = "refundextraAddress" name = "refund_extraAddress" type="text" value="${delivery.extraAddress}" class="select-op-long"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="r-sec5">
                        <button type="button" id="formSubmit">${afn:getMessage('change_request',sessionScope.locale)}</button>
                        <button type="button" onclick="location.href='${header.referer}'">${afn:getMessage('prev',sessionScope.locale)}</button>
                    </div>
                </form>
            </div>

        </main>

    </div>
</div>

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>