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
                <div class="ojt-tab-box">
                    <div class="ojt-tab">
                        <p class="ojt-but on2" data-id2="ojt1">E-POINT</p>
                        <p class="ojt-but ready" data-id2="ojt2">OJT / OJST</p>
                    </div>
                </div>
                <div class="ojt-tabbox on2" id="ojt1">
                    <div class="r-input-box">
                        <div class="r-in-box">
                            <div class="input-box1">
                                <p class="ra-num on" data-id="con1">오늘</p>
                                <p class="ra-num" data-id="con2">1주일</p>
                                <p class="ra-num" data-id="con3">1개월</p>
                                <p class="ra-num" data-id="con4">3개월</p>
                            </div>
                            <div class="input-box2">
                                <div class="cla">
                                    <input type="text" id="from_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p1"> ~ </p>
                                <div class="cla">
                                    <input type="text" id="to_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p2"><a href="">조회</a></p>
                            </div>
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
                            <div class="num-box">
                                <div class="num-box-in">
                                    <div class="left-box"><a href=""></a></div>
                                    <div class="num">
                                        <span><a href="">1</a></span>
                                        <span><a href="">2</a></span>
                                        <span><a href="">3</a></span>
                                        <span><a href="">4</a></span>
                                        <span><a href="">5</a></span>
                                    </div>
                                    <div class="right-box"><a href=""></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="con" id="con2">
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
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="num-box">
                                <div class="num-box-in">
                                    <div class="left-box"><a href=""></a></div>
                                    <div class="num">
                                        <span><a href="">1</a></span>
                                        <span><a href="">2</a></span>
                                        <span><a href="">3</a></span>
                                        <span><a href="">4</a></span>
                                        <span><a href="">5</a></span>
                                    </div>
                                    <div class="right-box"><a href=""></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="con" id="con3">
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
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="num-box">
                                <div class="num-box-in">
                                    <div class="left-box"><a href=""></a></div>
                                    <div class="num">
                                        <span><a href="">1</a></span>
                                        <span><a href="">2</a></span>
                                        <span><a href="">3</a></span>
                                        <span><a href="">4</a></span>
                                        <span><a href="">5</a></span>
                                    </div>
                                    <div class="right-box"><a href=""></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="con" id="con4">
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
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>[브라운] 쿠쿠 10인용 IH전기압력밥솥</p>
                                    </td>
                                    <td><span>일반적립</span></td>
                                    <td><span>2020.02.29</span></td>
                                    <td><span>-</span></td>
                                    <td><span>+ 950P</span></td>
                                    <td><span>999,999,999P</span></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="num-box">
                                <div class="num-box-in">
                                    <div class="left-box"><a href=""></a></div>
                                    <div class="num">
                                        <span><a href="">1</a></span>
                                        <span><a href="">2</a></span>
                                        <span><a href="">3</a></span>
                                        <span><a href="">4</a></span>
                                        <span><a href="">5</a></span>
                                    </div>
                                    <div class="right-box"><a href=""></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ojt-tabbox" id="ojt2">
                    <div class="r-input-box">
                        <div class="r-in-box">
                            <div class="input-box1-1">
                                <p class="ra-num on1" data-id1="con1-1">오늘</p>
                                <p class="ra-num" data-id1="con1-2">1주일</p>
                                <p class="ra-num" data-id1="con1-3">1개월</p>
                                <p class="ra-num" data-id1="con1-4">3개월</p>
                            </div>
                            <div class="input-box2">
                                <div class="cla">
                                    <input type="text" id="from_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p1"> ~ </p>
                                <div class="cla">
                                    <input type="text" id="to_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p2"><a href="">조회</a></p>
                            </div>
                        </div>
                        <div class="r-txt-box">
                            <p><span>2019.04.09</span> 전체 거래소 거래현황</p>
                            <p>OJT 채굴량 <span class="num-color1">999,999,999,999,999 OJT</span></p>
                            <p>OJST 배당총량 <span class="num-color1">999,999,999,999,999 OJST</span></p>
                        </div>
                    </div>
                    <div class="con2-1 on1" id="con1-1">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">OJT 원조이몰 채굴<span class="op-p"> (+)</span></option>
                                        <option value="">OJT 거래소 구입<span class="op-p"> (+)</span></option>
                                        <option value="">OJT 거래소 판매<span class="op-m"> (-)</span></option>
                                        <option value="">OJST 원조이몰 배당<span class="op-p"> (+)</span></option>
                                        <option value="">OJST 거래소 구입<span class="op-p"> (+)</span></option>
                                        <option value="">OJST 거래소 판매<span class="op-m"> (-)</span></option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 100px;">
                                    <col style="width: 175px;">
                                    <col style="width: 150px;">
                                    <col style="width: 159px;">
                                    <col style="width: 150px;">
                                    <col style="width: 160px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>배당일시</th>
                                    <th>구분</th>
                                    <th>OJT내역</th>
                                    <th>OJT누적</th>
                                    <th>OJST내역</th>
                                    <th>OJST누적</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 원조이몰 채굴</p>
                                    </td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 거래소 구입</p>
                                    </td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 거래서 판매</p>
                                    </td>
                                    <td><span class="m-color1">- 950</span></td>
                                    <td><span>999,050</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJST 원조이몰 배당</p>
                                    </td>
                                    <td><span>-</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJST 거래소 판매</p>
                                    </td>
                                    <td><span>-</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span class="m-color1">- 950</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="num-box">
                                <div class="num-box-in">
                                    <div class="left-box"><a href=""></a></div>
                                    <div class="num">
                                        <span><a href="">1</a></span>
                                        <span><a href="">2</a></span>
                                        <span><a href="">3</a></span>
                                        <span><a href="">4</a></span>
                                        <span><a href="">5</a></span>
                                    </div>
                                    <div class="right-box"><a href=""></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="con2-1" id="con1-2">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">OJT 원조이몰 채굴<span class="op-p"> (+)</span></option>
                                        <option value="">OJT 거래소 구입<span class="op-p"> (+)</span></option>
                                        <option value="">OJT 거래소 판매<span class="op-m"> (-)</span></option>
                                        <option value="">OJST 원조이몰 배당<span class="op-p"> (+)</span></option>
                                        <option value="">OJST 거래소 구입<span class="op-p"> (+)</span></option>
                                        <option value="">OJST 거래소 판매<span class="op-m"> (-)</span></option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 100px;">
                                    <col style="width: 175px;">
                                    <col style="width: 150px;">
                                    <col style="width: 159px;">
                                    <col style="width: 150px;">
                                    <col style="width: 160px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>배당일시</th>
                                    <th>구분</th>
                                    <th>OJT내역</th>
                                    <th>OJT누적</th>
                                    <th>OJST내역</th>
                                    <th>OJST누적</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 원조이몰 채굴</p>
                                    </td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 거래소 구입</p>
                                    </td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 거래서 판매</p>
                                    </td>
                                    <td><span class="m-color1">- 950</span></td>
                                    <td><span>999,050</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJST 원조이몰 배당</p>
                                    </td>
                                    <td><span>-</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJST 거래소 판매</p>
                                    </td>
                                    <td><span>-</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span class="m-color1">- 950</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="num-box">
                                <div class="num-box-in">
                                    <div class="left-box"><a href=""></a></div>
                                    <div class="num">
                                        <span><a href="">1</a></span>
                                        <span><a href="">2</a></span>
                                        <span><a href="">3</a></span>
                                        <span><a href="">4</a></span>
                                        <span><a href="">5</a></span>
                                    </div>
                                    <div class="right-box"><a href=""></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="con2-1" id="con1-3">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">OJT 원조이몰 채굴<span class="op-p"> (+)</span></option>
                                        <option value="">OJT 거래소 구입<span class="op-p"> (+)</span></option>
                                        <option value="">OJT 거래소 판매<span class="op-m"> (-)</span></option>
                                        <option value="">OJST 원조이몰 배당<span class="op-p"> (+)</span></option>
                                        <option value="">OJST 거래소 구입<span class="op-p"> (+)</span></option>
                                        <option value="">OJST 거래소 판매<span class="op-m"> (-)</span></option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 100px;">
                                    <col style="width: 175px;">
                                    <col style="width: 150px;">
                                    <col style="width: 159px;">
                                    <col style="width: 150px;">
                                    <col style="width: 160px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>배당일시</th>
                                    <th>구분</th>
                                    <th>OJT내역</th>
                                    <th>OJT누적</th>
                                    <th>OJST내역</th>
                                    <th>OJST누적</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 원조이몰 채굴</p>
                                    </td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 거래소 구입</p>
                                    </td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 거래서 판매</p>
                                    </td>
                                    <td><span class="m-color1">- 950</span></td>
                                    <td><span>999,050</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJST 원조이몰 배당</p>
                                    </td>
                                    <td><span>-</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJST 거래소 판매</p>
                                    </td>
                                    <td><span>-</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span class="m-color1">- 950</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="num-box">
                                <div class="num-box-in">
                                    <div class="left-box"><a href=""></a></div>
                                    <div class="num">
                                        <span><a href="">1</a></span>
                                        <span><a href="">2</a></span>
                                        <span><a href="">3</a></span>
                                        <span><a href="">4</a></span>
                                        <span><a href="">5</a></span>
                                    </div>
                                    <div class="right-box"><a href=""></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="con2-1" id="con1-4">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">OJT 원조이몰 채굴<span class="op-p"> (+)</span></option>
                                        <option value="">OJT 거래소 구입<span class="op-p"> (+)</span></option>
                                        <option value="">OJT 거래소 판매<span class="op-m"> (-)</span></option>
                                        <option value="">OJST 원조이몰 배당<span class="op-p"> (+)</span></option>
                                        <option value="">OJST 거래소 구입<span class="op-p"> (+)</span></option>
                                        <option value="">OJST 거래소 판매<span class="op-m"> (-)</span></option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 100px;">
                                    <col style="width: 175px;">
                                    <col style="width: 150px;">
                                    <col style="width: 159px;">
                                    <col style="width: 150px;">
                                    <col style="width: 160px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>배당일시</th>
                                    <th>구분</th>
                                    <th>OJT내역</th>
                                    <th>OJT누적</th>
                                    <th>OJST내역</th>
                                    <th>OJST누적</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 원조이몰 채굴</p>
                                    </td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 거래소 구입</p>
                                    </td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJT 거래서 판매</p>
                                    </td>
                                    <td><span class="m-color1">- 950</span></td>
                                    <td><span>999,050</span><span>OJT</span></td>
                                    <td><span>-</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJST 원조이몰 배당</p>
                                    </td>
                                    <td><span>-</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span class="p-color1">+ 950</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <p>OJST 거래소 판매</p>
                                    </td>
                                    <td><span>-</span></td>
                                    <td><span>1,000950</span><span>OJT</span></td>
                                    <td><span class="m-color1">- 950</span></td>
                                    <td><span>1,000,000</span><span>OJST</span></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="num-box">
                                <div class="num-box-in">
                                    <div class="left-box"><a href=""></a></div>
                                    <div class="num">
                                        <span><a href="">1</a></span>
                                        <span><a href="">2</a></span>
                                        <span><a href="">3</a></span>
                                        <span><a href="">4</a></span>
                                        <span><a href="">5</a></span>
                                    </div>
                                    <div class="right-box"><a href=""></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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
    $('.input-box1 p').click(function(){
        var tab_id = $(this).attr('data-id');

        $('.input-box1 p').removeClass('on');
        $('.ojt-tabbox .con').removeClass('on');
        $(this).addClass('on');
        $("#"+tab_id).addClass('on');
    })
    $('.input-box1-1 p').click(function(){
        var tab_id1 = $(this).attr('data-id1');

        $('.input-box1-1 p').removeClass('on1');
        $('.ojt-tabbox .con2-1').removeClass('on1');
        $(this).addClass('on1');
        $("#"+tab_id1).addClass('on1');
    })
    $('.ojt-tab p').click(function(){
        var tab_id2 = $(this).attr('data-id2');

        $('.ojt-tab p').removeClass('on2');
        $('.right-contain .ojt-tabbox').removeClass('on2');
        $(this).addClass('on2');
        $("#"+tab_id2).addClass('on2');
    });
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>