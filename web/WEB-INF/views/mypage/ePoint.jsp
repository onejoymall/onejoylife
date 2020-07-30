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
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<div class="wrap">
    <div class="page-box clearfix">
        <main>
            <c:import url="/layout/scrollRight"/>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">

                <c:import url="/MyPage/RightHeader"/>
                <form id="form1" name="form1"  method="get">
                <div class="ojt-tab-box">
                    <div class="ojt-tab">
                        <p class="ojt-but on2" data-id2="ojt1">E-POINT</p>
                        <p class="ojt-but ready" data-id2="ojt2">OJT / OJST</p>
                    </div>
                </div>
                <div class="ojt-tabbox on2" id="ojt1">
                    <div class="r-in-box">
                        <div class="input-box1">
                            <p class="ra-num on" data-id="con1">${afn:getMessage('today',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con2">1${afn:getMessage('week',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con3">1${afn:getMessage('month',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con4">3${afn:getMessage('month',sessionScope.locale)}</p>
                        </div>
                        <div class="input-box2">
                            <div class="cla">
                                <input type="text" id="from_date" name="start_date" class="date_pick" value="<c:out value="${param.start_date}"/>">
                                <div class="cla-img1"></div>
                            </div>
                            <p class="cla-p1"> ~ </p>
                            <div class="cla">
                                <input type="text" id="to_date" name="end_date" class="date_pick" value="<c:out value="${param.end_date}"/>">
                                <div class="cla-img1"></div>
                            </div>
                            <p class="cla-p2"><a href="#" onclick="$('#form1').submit();">${afn:getMessage('lookup',sessionScope.locale)}</a></p>
                        </div>
                    </div>
                    <div class="con on" id="con1">
                        <div class="r-sec4">
                            <!-- <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">적립<span> (+)</span></option>
                                        <option value="">사용<span> (-)</span></option>
                                    </select>
                                </div>
                            </div> -->
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 100px;">
                                    <col style="width: 300px;">
                                    <col style="width: 107px;">
                                    <col style="width: 113px;">
                                    <col style="width: 107px;">
                                    <col style="width: 107px;">
                                    <col style="width: 116px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>${afn:getMessage('transaction_date_time',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('detail',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('kind',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('extinction_date',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('use',sessionScope.locale)}${afn:getMessage('point',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('add',sessionScope.locale)}${afn:getMessage('point',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('remain',sessionScope.locale)}${afn:getMessage('point',sessionScope.locale)}</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body txt-color1">
                                <c:if test="${not empty list}">
                                    <c:forEach var="list" items="${list}">
                                        <tr>
                                            <td><p><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/><br><fmt:formatDate value="${list.reg_date}" pattern="HH:mm"/></p></td>
                                            <td><p>${list.point_paid_memo}</p></td>
                                            <td>${list.point_paid_type_name}</td>
                                            <td>${list.point_end_date}</td>
                                            <td>-<fmt:formatNumber value="${list.point_use}" groupingUsed="true" /></td>
                                            <td>+<fmt:formatNumber value="${list.point_add}" groupingUsed="true" /></td>
                                            <td><fmt:formatNumber value="${list.point_amount}" groupingUsed="true" /></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="7">${afn:getMessage('msg.none_content',sessionScope.locale)}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>

                            <jsp:include page="/WEB-INF/views/common/pagingforSubmitList.jsp" />
                            <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </main>

    </div>
</div>

<script>
    $(function() {
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            showMonthAfterYear:true,
            monthNames:['1${afn:getMessage('month2',sessionScope.locale)}','2${afn:getMessage('month2',sessionScope.locale)}','3${afn:getMessage('month2',sessionScope.locale)}','4${afn:getMessage('month2',sessionScope.locale)}','5${afn:getMessage('month2',sessionScope.locale)}','6${afn:getMessage('month2',sessionScope.locale)}','7${afn:getMessage('month2',sessionScope.locale)}','8${afn:getMessage('month2',sessionScope.locale)}','9${afn:getMessage('month2',sessionScope.locale)}','10${afn:getMessage('month2',sessionScope.locale)}','11${afn:getMessage('month2',sessionScope.locale)}','12${afn:getMessage('month2',sessionScope.locale)}'],
            dayNamesMin: ['${afn:getMessage('sun',sessionScope.locale)}','${afn:getMessage('mon',sessionScope.locale)}','${afn:getMessage('tue',sessionScope.locale)}','${afn:getMessage('wed',sessionScope.locale)}','${afn:getMessage('thu',sessionScope.locale)}','${afn:getMessage('fri',sessionScope.locale)}','${afn:getMessage('sat',sessionScope.locale)}'],
            dayNames: ['${afn:getMessage('sunday',sessionScope.locale)}','${afn:getMessage('monday',sessionScope.locale)}','${afn:getMessage('tuesday',sessionScope.locale)}','${afn:getMessage('wednesday',sessionScope.locale)}','${afn:getMessage('thursday',sessionScope.locale)}','${afn:getMessage('friday',sessionScope.locale)}','${afn:getMessage('saturday',sessionScope.locale)}'],
            numberOfMonths: [1,1],
        });
        $(".date_pick").datepicker();
    });

</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>