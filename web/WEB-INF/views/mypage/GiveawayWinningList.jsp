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
<%@ include file="/WEB-INF/views/layout/header.jsp" %>'
<div class="wrap">
    <div class="page-box clearfix">
        <main>
            <c:import url="/layout/scrollRight"/>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <c:import url="/MyPage/RightHeader"/>
                <div class="ojt-tab-box">
                    <div class="ojt-tab">
                        <p class="ojt-but on2" data-id2="ojt1">경품</p>
                        <p class="ojt-but" data-id2="ojt2">이벤트</p>
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
                                    <input type="text" name="start_date" id="from_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p1"> ~ </p>
                                <div class="cla">
                                    <input type="text" name="end_date" id="to_date" class="date_pick">
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
                                    <p>총<span>${listCnt}건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 390px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 139px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>경품정보</th>
                                    <th>총 사용포인트</th>
                                    <th>상태</th>
                                    <th>조회</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                            <c:if test="${not empty list}">
                                <c:forEach var="list" items="${list}" varStatus="status">
                                    <tr>
                                        <td class="my-lis-1">
                                            <p><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/><br><fmt:formatDate value="${list.reg_date}" pattern="HH:mm"/></p>
                                        </td>
                                        <td class="my-lis-2">
                                            <a href="/giveaway/giveawaydetail?giveaway_cd=${list.giveaway_cd}">
<%--                                                <div class="my-lis-img1"></div>--%>
                                                <div style="width: 90px;height: 90px;background: url(/assets/img/${list.giveaway_detail_image}) no-repeat center / cover;"></div>
                                                <div class="my-lis-txt">
                                                    <p>${list.giveaway_brand}</p>
                                                    <p class="lis-font-w">${list.giveaway_name}</p>
                                                    <p>${list.giveaway_model_name}</p>
                                                </div>

                                                <div class="red-box">
                                                    <c:if test="${not empty list.giveaway_winner_reg_date && list.winner_id > 0}">
                                                        <span>${list.giveaway_payment_status_name}</span>
                                                        <%--                                                    <span class="dis-none">결제완료</span>--%>
                                                        <%--                                                    <span class="dis-none">상품준비중</span>--%>
                                                        <%--                                                    <span class="dis-none">배송중</span>--%>
                                                        <%--                                                    <span class="dis-none">배송완료</span>--%>
                                                    </c:if>
                                                </div>
                                            </a>
                                        </td>
                                        <td><span><fmt:formatNumber value="${list.giveaway_payment_epoint}" groupingUsed="true" />P</span></td>
                                        <c:if test="${empty list.giveaway_winner_reg_date && empty list.winner_id}">
                                            <td>
                                                <span>진행중</span><br>
                                            </td>
                                        </c:if>
                                        <c:if test="${not empty list.giveaway_winner_reg_date && empty list.winner_id}">
                                        <td>
                                            <span>추첨완료</span><br>
                                            <span class="txt-s">(<fmt:formatDate value="${list.giveaway_winner_reg_date}" pattern="yyyy.MM.dd"/>)</span>
                                        </td>
                                        </c:if>
                                        <c:if test="${not empty list.giveaway_winner_reg_date && list.winner_id > 0}">
                                            <td><div class="win-icon"></div><p class="txt-s"><span>(<fmt:formatDate value="${list.giveaway_winner_reg_date}" pattern="yyyy.MM.dd"/>)</span></p></td>
                                        </c:if>

                                        <td>
<%--                                            <a href=""><p class="lis-txt-box">참여자 내역</p></a>--%>
                                            <c:if test="${not empty list.giveaway_winner_reg_date && list.winner_id > 0}">

                                                <c:if test="${list.giveaway_payment_status eq 'A'}">
                                                    <a href="/MyPage/giveawayform?giveaway_cd=${list.giveaway_cd}&giveaway_play_cd=${list.giveaway_play_cd}">
                                                        <p class="lis-txt-box txt-color2">
                                                            <span>경품받기</span>
                                                        </p>
                                                    </a>
                                                </c:if>
<%--                                                    <span class="dis-none">주문상세</span>--%>
                                                <c:if test="${list.giveaway_payment_status !=  'A'}">
                                                    <a href="#" id="SearchDelivery">
                                                        <p class="lis-txt-box txt-color2">
                                                            <span>배송조회</span>
                                                        </p>
                                                    </a>
                                                </c:if>
                                            </c:if>
                                            <a href=""><p class="lis-txt-box">${list.giveaway_play_cd}</p></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="5">표시할 내용이 없습니다.</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </c:if>
                                    </tbody>
                            </table>


                            <form id="form1" name="form1"  method="get">
                                <jsp:include page="/WEB-INF/views/common/pagingforSubmitList.jsp" />
                                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                            </form>
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
                    </div>
                    <div class="con2-1 on1" id="con1-1">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 380px;">
                                    <col style="width: 264px;">
                                    <col style="width: 125px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>이벤트명</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body2">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
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
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 380px;">
                                    <col style="width: 264px;">
                                    <col style="width: 125px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>이벤트명</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body2">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
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
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 380px;">
                                    <col style="width: 264px;">
                                    <col style="width: 125px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>이벤트명</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body2">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
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
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 380px;">
                                    <col style="width: 264px;">
                                    <col style="width: 125px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>이벤트명</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body2">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
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
    })
    var child;
    $('.click-span').click(function(){
        if(child != undefined){
            child.close()
        }

        child = window.open('mypage-6-mo1.html','_blank','width=750, height=900');
    });
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>