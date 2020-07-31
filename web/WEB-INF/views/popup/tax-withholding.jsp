<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
    <main class="clearfix">
        <div class="header-top">
            <p>${afn:getMessage("writeWHReci",sessionScope.locale)}</p>
        </div>
        <div class="body-mar">
           <table>
               <colgroup>
                   <col style="width:100px">
                   <col style="width:371px">
                   <col style="width:100px">
                   <col style="width:371px">
               </colgroup>
               <tbody class="t-body2">
                   <tr>
                       <th class="tr-tit">${afn:getMessage("contNum",sessionScope.locale)}</th>
                       <td>68</td>
                       <th class="tr-tit">내${afn:getMessage("wh_text1",sessionScope.locale)} &#183; ${afn:getMessage("foreigner",sessionScope.locale)}</th>
                       <td>${afn:getMessage("citizen",sessionScope.locale)}</td>
                   </tr>
               </tbody>
           </table>
            <table>
                <colgroup>
                    <col style="width: 81px;">
                    <col style="width: 100px;">
                    <col style="width: 158px;">
                    <col style="width: 100px;">
                    <col style="width: 127px;">
                    <col style="width: 100px;">
                    <col style="width: 277px;">
                </colgroup>
                <tbody class="t-body1">
                   <tr>
                       <td colspan="7">${afn:getMessage("WHrecei",sessionScope.locale)}</td>
                   </tr>
                    <tr>
                        <td rowspan="2" class="tr-tit">${afn:getMessage("wh_text2",sessionScope.locale)}<br>${afn:getMessage("duty",sessionScope.locale)}</td>
                        <td class="tr-tit">${afn:getMessage("corpName",sessionScope.locale)}</td>
                        <td><span>${afn:getMessage("onejoy2",sessionScope.locale)}</span></td>
                        <td class="tr-tit">${afn:getMessage("ceo_name",sessionScope.locale)}</td>
                        <td><span>${afn:getMessage("ksy",sessionScope.locale)}</span></td>
                        <td class="tr-tit">${afn:getMessage("reservNum",sessionScope.locale)}</td>
                        <td colspan="3"><span>487-88-01223</span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">${afn:getMessage("secIdCOr",sessionScope.locale)}</td>
                        <td>110111-6958247</td>
                        <td class="tr-tit">주소${afn:getMessage("address",sessionScope.locale)}</td>
                        <td colspan="3"><span>${afn:getMessage("wh_text3",sessionScope.locale)}<br> (${afn:getMessage("wh_text4",sessionScope.locale)})</span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 80px;">
                    <col style="width: 99px;">
                    <col style="width: 157px;">
                    <col style="width: 100px;">
                    <col style="width: 127px;">
                    <col style="width: 100px;">
                    <col style="width: 277px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr>
                        <td rowspan="2" class="tr-tit">${afn:getMessage("incomer",sessionScope.locale)}</td>
                        <td class="tr-tit">${afn:getMessage("name",sessionScope.locale)}</td>
                        <td><span>${detail.order_user_name}</span></td>
                        <td class="tr-tit" colspan="3">${afn:getMessage("secIdCOr",sessionScope.locale)}</td>
                        <td><span>${detail.reg_no}</span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">${afn:getMessage("address",sessionScope.locale)}</td>
                        <td colspan="5"><span>(${detail.postcode}) ${detail.roadAddress} ${detail.extraAddress}</span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 80px;">
                    <col style="width: 99px;">
                    <col style="width: 150px;">
                    <col style="width: 150px;">
                    <col style="width: 150px;">
                    <col style="width: 155px;">
                    <col style="width: 155px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr>
                        <td rowspan="2" class="tr-tit">${afn:getMessage("incomeCompare",sessionScope.locale)}</td>
                        <td class="tr-tit">${afn:getMessage("resident",sessionScope.locale)}</td>
                        <td><span>${afn:getMessage("OtherIncome",sessionScope.locale)} 60</span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">${afn:getMessage("nonresident",sessionScope.locale)}</td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 70px;">
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 129px;">
                    <col style="width: 130px;">
                    <col style="width: 110px;">
                    <col style="width: 110px;">
                    <col style="width: 110px;">
                    <col style="width: 100px;">
                    <col style="width: 100px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td colspan="3">${afn:getMessage("paymentDate",sessionScope.locale)}</td>
                        <td rowspan="2">${afn:getMessage("DateOfAssi",sessionScope.locale)}</td>
                        <td rowspan="2">${afn:getMessage("payOfAssi",sessionScope.locale)}</td>
                        <td rowspan="2">${afn:getMessage("IncomeAmo",sessionScope.locale)}</td>
                        <td rowspan="2">${afn:getMessage("tariff",sessionScope.locale)}</td>
                        <td colspan="3">${afn:getMessage("whTax",sessionScope.locale)}</td>
                    </tr>
                    <tr class="tr-tit">
                        <td>${afn:getMessage("year",sessionScope.locale)}</td>
                        <td>${afn:getMessage("month",sessionScope.locale)}</td>
                        <td>${afn:getMessage("day",sessionScope.locale)}</td>
                        <td>${afn:getMessage("incomeTax",sessionScope.locale)}</td>
                        <td>${afn:getMessage("localInTax",sessionScope.locale)}</td>
                        <td>${afn:getMessage("wh_text5",sessionScope.locale)}</td>
                    </tr>
                    <c:set var="texA" value="0"/>
                    <c:set var="texB" value="0"/>
                    <c:set var="texA" value="${texA + (detail.giveaway_play_winner_point*0.2)}"/>
                    <c:set var="texB" value="${texB + (texA*0.1)}"/>
                    
                    <tr>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy"/></span></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="MM"/></span></span></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="dd"/></span></span></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd"/></span></span></td>
                        <td><span><fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /></span></td>
                        <td><span>20 %</span></td>
                        <td><span><fmt:formatNumber value="${texA}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${texB}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${texA+texB}" groupingUsed="true" /></span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 390px;">
                    <col style="width: 260px;">
                    <col style="width: 290px;">
                </colgroup>
                <tbody class="t-body3">
                    <tr>
                        <td><span></span>${afn:getMessage("msg_wh1",sessionScope.locale)}
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy년 MM월 dd일"/></span></td>
                        <td><span class="txt-weight">${afn:getMessage("onejoy2",sessionScope.locale)}</span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><span class="txt-weight">${afn:getMessage("fromTaxOffice",sessionScope.locale)}</span></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <div class="but-box">
                <button class="but2" onclick="window.print();">${afn:getMessage("print",sessionScope.locale)}</button>
            </div>
        </div>
    </main>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>