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
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>




                <div class="r-sec1">
                    <span class="but-img"></span>
                    <span class="name">${sessionScope.email}</span>
                    <span>님</span>
                </div>
                <div class="r-sec2">
                    <div class="rec2-in">
                        <p class="font-de1">${afn:getMessage('coupon',sessionScope.locale)}</p>
                        <p class="font-de2">
                            <a href="<c:url value="/MyPage/Coupon"/>">
                                <span>${couponCnt}</span>
                                <span>${afn:getMessage('cou_count',sessionScope.locale)}</span>
                            </a>
                        </p>
                    </div>
                    <div class="rec2-in">
                        <p class="font-de1">${afn:getMessage('delivery_product',sessionScope.locale)}</p>
                        <p class="font-de2">
                            <a href="<c:url value="/MyPage/OrderAndDelivery?payment_status=R"/>">
                                <span>${paymentCnt.rCnt}</span>
                            </a>
                        </p>
                    </div>
                    <div class="rec2-in">
                        <p class="font-de1">${afn:getMessage('giveaway_contest',sessionScope.locale)}</p>
                        <p class="font-de2">
                            <a href="<c:url value="/MyPage/GiveawayWinningList"/> ">
                                <span>${giveawayCnt}</span>

                            </a>
                        </p>
                    </div>
                    <div class="rec2-in">
                        <p class="font-de1">${afn:getMessage('epoint',sessionScope.locale)}</p>
                        <p class="font-de2">
                            <a href="<c:url value="/MyPage/ePoint"/>">
                                <span><fmt:formatNumber value="${point_amount}" groupingUsed="true" /></span>
                                <span>p</span>
                            </a>
                        </p>
                    </div>
                    <div class="rec2-in">

                        <div>
                            <p class="in-coin1 font-de1">${afn:getMessage('ojt',sessionScope.locale)}</p>
                            <p class="in-coin2 font-de2">
                                <a href="#">
                                	<span>0coin</span>
                                    <!-- <span>0</span>
                                    <span>coin</span> -->
                                </a>
                            </p>
                        </div>
<%--                        <div>--%>
<%--                            <p class="in-coin1 font-de1">OJST</p>--%>
<%--                            <p class="in-coin2 font-de2">--%>
<%--                                <a href="#">--%>
<%--                                    <span>0</span>--%>
<%--                                    <span>coin</span>--%>
<%--                                </a>--%>
<%--                            </p>--%>
<%--                        </div>--%>
                    <p class="font-de1">${afn:getMessage('Preparing',sessionScope.locale)}</p>
                    </div>
                </div>

