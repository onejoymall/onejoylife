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
                <div class="ojt-tab-box">
                    <div class="ojt-tab">
                        <p class="ojt-but on2" data-id2="ojt1">${afn:getMessage('giveaway',sessionScope.locale)}</p>
                        <p class="ojt-but ready" data-id2="ojt2">${afn:getMessage('event',sessionScope.locale)}</p>
                    </div>
                </div>
                <div class="ojt-tabbox on2" id="ojt1">
                    <div class="r-input-box">
                        <div class="r-in-box">
                            <div class="input-box1">
                                <p class="ra-num on" data-id="con1">${afn:getMessage('today',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con2">1${afn:getMessage('week',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con3">1${afn:getMessage('month',sessionScope.locale)}</p>
                            <p class="ra-num" data-id="con4">3${afn:getMessage('month',sessionScope.locale)}</p>
                            </div>
                            <form id="form2" name="form2"  method="get">
                            <div class="input-box2">
                                <div class="cla">
                                    <input type="text" name="start_date" id="from_date" class="date_pick" value="${param.start_date}">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p1"> ~ </p>
                                <div class="cla">
                                    <input type="text" name="end_date" id="to_date" class="date_pick" value="${param.end_date}">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p2"><a href="javascript:$('#form2').submit();">${afn:getMessage('lookup',sessionScope.locale)}</a></p>
                            </div>
                            </form>
                        </div>
                    </div>
                    <div class="con on" id="con1">
                        <div class="r-sec4">
                            <%-- <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>${listCnt}건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div> --%>
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
                                    <th>${afn:getMessage('appl_date_time',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('giveaway_info',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('use_point_total',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('status',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('lookup',sessionScope.locale)}</th>
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
                                                <div style="width: 90px;height: 90px;background: url(${list.file_1}) no-repeat center / cover;"></div>
                                                <div class="my-lis-outer">
	                                                <div class="my-lis-txt">
	                                                    <%-- <p>${list.giveaway_brand}</p> --%>
	                                                    <p class="lis-font-w">${list.giveaway_name}</p>
	                                                    <%-- <p>${list.giveaway_model_name}</p> --%>
	                                                </div>
                                                </div>
												
												<div class="my-lis-outer">
	                                                <div class="red-box">
	                                                    <c:if test="${not empty list.giveaway_winner_reg_date && list.winner_id > 0}">
	                                                        <%-- <span>${list.giveaway_payment_status_name}</span> --%>
	                                                        <%--                                                    <span class="dis-none">결제완료</span>--%>
	                                                        <%--                                                    <span class="dis-none">상품준비중</span>--%>
	                                                        <%--                                                    <span class="dis-none">배송중</span>--%>
	                                                        <%--                                                    <span class="dis-none">배송완료</span>--%>
	                                                    </c:if>
	                                                </div>
                                                </div>
                                            </a>
                                        </td>
                                        <td><span><fmt:formatNumber value="${list.giveaway_payment_epoint}" groupingUsed="true" />P</span></td>
                                        <c:if test="${empty list.giveaway_winner_reg_date && empty list.winner_id}">
                                            <td>
                                                <span>${afn:getMessage('ongoing',sessionScope.locale)}</span><br>
                                            </td>
                                        </c:if>
                                        <c:if test="${not empty list.giveaway_winner_reg_date && empty list.winner_id}">
                                        <td>
                                            <span>${afn:getMessage('use_point_total',sessionScope.locale)}</span><br>
                                            <span class="txt-s">(<fmt:formatDate value="${list.giveaway_winner_reg_date}" pattern="yyyy.MM.dd"/>)</span>
                                        </td>
                                        </c:if>
                                        <c:if test="${not empty list.giveaway_winner_reg_date && list.winner_id > 0}">
                                            <td><div class="win-icon"></div>
                                            <c:if test="${list.giveaway_payment_status !=  'A'}"><p class="txt-s"><span>(${list.payment_status_name})</span></p></c:if>
                                            <p class="txt-s"><span>(<fmt:formatDate value="${list.giveaway_winner_reg_date}" pattern="yyyy.MM.dd"/>)</span></p></td>
                                        </c:if>

                                        <td>
<%--                                            <a href=""><p class="lis-txt-box">참여자 내역</p></a>--%>
                                            <c:if test="${not empty list.giveaway_winner_reg_date && list.winner_id > 0}">

                                                <c:if test="${list.giveaway_payment_status eq 'A' || list.payment_status == 'N'}">
                                                    <a href="/MyPage/giveawayform?giveaway_cd=${list.giveaway_cd}&giveaway_play_cd=${list.giveaway_play_cd}">
                                                        <p class="lis-txt-box txt-color2">
                                                            <span>${afn:getMessage('giveaway',sessionScope.locale)}${afn:getMessage('receive',sessionScope.locale)}</span>
                                                        </p>
                                                    </a>
                                                </c:if>
<%--                                                    <span class="dis-none">주문상세</span>--%>
                                                <c:if test="${list.giveaway_payment_status !=  'A' && list.payment_status != 'N'}">
                                                    <a href="javascript:void(0)" id="SearchDelivery" data-id="${list.order_no}">
                                                        <p class="lis-txt-box txt-color2">
                                                            <span>${afn:getMessage('QA_delivery',sessionScope.locale)}${afn:getMessage('receive',sessionScope.locale)}</span>
                                                        </p>
                                                    </a>
                                                    <c:if test="${list.payment_status == 'M' && list.pay_method == 'vbank'}">
                                                    	<a href="javascript:vbankNoCheck('${list.imp_uid}')"><p class="lis-txt-box">${afn:getMessage('vbank',sessionScope.locale)} ${afn:getMessage('QAok',sessionScope.locale)}</p></a>
                                                    </c:if>
                                                    <c:if test="${list.payment_status != 'M' }">
                                                    	<a href="javascript:withholding('${list.order_no}')"><p class="lis-txt-box">${afn:getMessage('withholding',sessionScope.locale)}</p></a>
                                                    </c:if>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="5">${afn:getMessage('msg.none_content',sessionScope.locale)}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </c:if>
                                    </tbody>
                            </table>


                            <form id="form1" name="form1"  method="get">
                                <jsp:include page="/WEB-INF/views/common/pagingforSubmitList.jsp" />
                                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                                <input type="hidden" name="start_date" value="<c:out value="${param.start_date}"/>">
                                <input type="hidden" name="end_date" value="<c:out value="${param.end_date}"/>">
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
            monthNames:['1${afn:getMessage('month2',sessionScope.locale)}','2${afn:getMessage('month2',sessionScope.locale)}','3${afn:getMessage('month2',sessionScope.locale)}','4${afn:getMessage('month2',sessionScope.locale)}','5${afn:getMessage('month2',sessionScope.locale)}','6${afn:getMessage('month2',sessionScope.locale)}','7${afn:getMessage('month2',sessionScope.locale)}','8${afn:getMessage('month2',sessionScope.locale)}','9${afn:getMessage('month2',sessionScope.locale)}','10${afn:getMessage('month2',sessionScope.locale)}','11${afn:getMessage('month2',sessionScope.locale)}','12${afn:getMessage('month2',sessionScope.locale)}'],
            dayNamesMin: ['${afn:getMessage('sun',sessionScope.locale)}','${afn:getMessage('mon',sessionScope.locale)}','${afn:getMessage('tue',sessionScope.locale)}','${afn:getMessage('wed',sessionScope.locale)}','${afn:getMessage('thu',sessionScope.locale)}','${afn:getMessage('fri',sessionScope.locale)}','${afn:getMessage('sat',sessionScope.locale)}'],
            dayNames: ['${afn:getMessage('sunday',sessionScope.locale)}','${afn:getMessage('monday',sessionScope.locale)}','${afn:getMessage('tuesday',sessionScope.locale)}','${afn:getMessage('wednesday',sessionScope.locale)}','${afn:getMessage('thursday',sessionScope.locale)}','${afn:getMessage('friday',sessionScope.locale)}','${afn:getMessage('saturday',sessionScope.locale)}'],
            numberOfMonths: [1,1],
        });
        $(".date_pick").datepicker();
    });
    /* $('.input-box1 p').click(function(){
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
    }) */
    /* $('.ojt-tab p').click(function(){
        var tab_id2 = $(this).attr('data-id2');

        $('.ojt-tab p').removeClass('on2');
        $('.right-contain .ojt-tabbox').removeClass('on2');
        $(this).addClass('on2');
        $("#"+tab_id2).addClass('on2');
    }) */
    var child;
    $('.click-span').click(function(){
        if(child != undefined){
            child.close()
        }

        child = window.open('mypage-6-mo1.html','_blank','width=750, height=900');
    });
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>