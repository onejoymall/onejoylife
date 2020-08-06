        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

                <div class="left-nav">
                    <h2 class="left-tit">${afn:getMessage('mypage',sessionScope.locale)}</h2>
                    <ul class="outer-ul">
                        <li class="outer-li">${afn:getMessage('mybenefit',sessionScope.locale)}
                            <ul class="inner-ul">
                                <li><a href="<c:url value="/MyPage/ePoint"/>" class="<c:if test="${leftNavOrder == 2}">active</c:if>">${afn:getMessage('e-point_lookup',sessionScope.locale)}</a></li>
                                <li><a href="<c:url value="/MyPage/Coupon"/>" class="<c:if test="${leftNavOrder == 3}">active</c:if>">${afn:getMessage('coupon_lookup',sessionScope.locale)}</a></li>
                            </ul>
                        </li>
                        <li class="outer-li">${afn:getMessage('myshopping',sessionScope.locale)}
                            <ul class="inner-ul">
                                <li><a href="<c:url value="/MyPage/ShoppingBasket"/>" class="<c:if test="${leftNavOrder == 4}">active</c:if>">${afn:getMessage('cart',sessionScope.locale)}</a></li>
                                <li><a href="<c:url value="/MyPage/ShoppingAddList"/>" class="<c:if test="${leftNavOrder == 5}">active</c:if>">${afn:getMessage('wishlist',sessionScope.locale)}</a></li>
                                <li><a href="<c:url value="/MyPage/OrderAndDelivery"/>" class="<c:if test="${leftNavOrder == 6}">active</c:if>">${afn:getMessage('order_and_delivery_lookup',sessionScope.locale)}</a></li>
<%--                                <li><a href="<c:url value="/MyPage/OrderCancels"/>" class="<c:if test="${leftNavOrder == 7}">active</c:if>">취소/재결제/교환/반품</a></li>--%>
                                <li><a href="<c:url value="/MyPage/Reviews"/>" class="<c:if test="${leftNavOrder == 8}">active</c:if>">${afn:getMessage('my_review',sessionScope.locale)}</a></li>
                                <li><a href="<c:url value="/MyPage/Qna"/>" class="<c:if test="${leftNavOrder == 14}">active</c:if>">${afn:getMessage('my_qna',sessionScope.locale)}</a></li>
                                <li><a href="<c:url value="/MyPage/Favorites"/>" class="<c:if test="${leftNavOrder == 9}">active</c:if>">${afn:getMessage('favorite_product',sessionScope.locale)}</a></li>
                                <li><a href="<c:url value="/MyPage/mypage-share"/>" class="<c:if test="${leftNavOrder == 15}">active</c:if>">${afn:getMessage('shared_product',sessionScope.locale)}</a></li>
                            </ul>
                        </li>
                        <li class="outer-li">${afn:getMessage('my_giveaway',sessionScope.locale)}
                            <ul class="inner-ul">
                                <%-- <li><a href="<c:url value="/MyPage/GiveawayExperience"/>" class="<c:if test="${leftNavOrder == 10}">active</c:if>">경품 체험하기</a></li> --%>
                                <%-- <li><a href="javascript:void(0)" class="ready">${afn:getMessage('my_giveaway_experience',sessionScope.locale)}</a></li> --%>
                                <li><a href="/Help/csinfo">${afn:getMessage('my_giveaway_experience',sessionScope.locale)}</a></li>
                                <li><a href="<c:url value="/MyPage/GiveawayWinningList"/>" class="<c:if test="${leftNavOrder == 11}">active</c:if>">${afn:getMessage('giveaway_win_list_lookup',sessionScope.locale)}</a></li>
                            </ul>
                        </li>
                        <li class="outer-li">${afn:getMessage('my_info',sessionScope.locale)}
                            <ul class="inner-ul">
                                <li><a href="<c:url value="/MyPage/mypage-12"/>" class="<c:if test="${leftNavOrder == 12}">active</c:if>">${afn:getMessage('user_info_change',sessionScope.locale)}</a></li>
                                <li><a href="<c:url value="/MyPage/DeliveryAddress"/>"  class="<c:if test="${leftNavOrder == 13}">active</c:if>">${afn:getMessage('delivery_address',sessionScope.locale)}</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
