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
<div class="wrap">
    <div class="page-box">
        <main>
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
                            <p class="ra-num on" data-id="con1">오늘</p>
                            <p class="ra-num" data-id="con2">1주일</p>
                            <p class="ra-num" data-id="con3">1개월</p>
                            <p class="ra-num" data-id="con4">3개월</p>
                        </div>
                        <div class="input-box2">
                            <div class="cla">
                                <input type="text" id="from_date" name="start_date" class="date_pick" value="<c:out value="${param.start_date}"/> ">
                                <div class="cla-img1"></div>
                            </div>
                            <p class="cla-p1"> ~ </p>
                            <div class="cla">
                                <input type="text" id="to_date" name="end_date" class="date_pick" value="<c:out value="${param.end_date}"/> ">
                                <div class="cla-img1"></div>
                            </div>
                            <p class="cla-p2"><a href="#" onclick="$('#form1').submit();">조회</a></p>
                        </div>
                    </div>
                    <div class="con on" id="con1">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">적립<span> (+)</span></option>
                                        <option value="">사용<span> (-)</span></option>
                                    </select>
                                </div>
                            </div>
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
                                    <th>거래일시</th>
                                    <th>내역</th>
                                    <th>구분</th>
                                    <th>소멸예정일</th>
                                    <th>사용포인트</th>
                                    <th>적립포인트</th>
                                    <th>잔여포인트</th>
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
                                        <td colspan="7">표시할 내용이 없습니다.</td>
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
            monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
            numberOfMonths: [1,1],
        });
        $(".date_pick").datepicker();
    });

</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>