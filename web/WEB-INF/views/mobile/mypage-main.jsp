<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>


        <section class="subheader">
            <div class="subTitle clearfix">${afn:getMessage('mypage',sessionScope.locale)}</div>
            <c:import url="/MyPage/RightHeader"/>
        </section>
        <div class="wrap clearfix page-list">
            <ul>
                <li>${afn:getMessage('mybenefit',sessionScope.locale)}
                    <hr>
                    <ul class="in-ul">
                        <li><a href="<c:url value="/MyPage/ePoint"/>">${afn:getMessage('epoint',sessionScope.locale)}${afn:getMessage('lookup',sessionScope.locale)}</a></li>
                        <li><a href="<c:url value="/MyPage/Coupon"/>">${afn:getMessage('coupon',sessionScope.locale)}${afn:getMessage('lookup',sessionScope.locale)}</a></li>
                    </ul>
                </li>
                <li>${afn:getMessage('myshopping',sessionScope.locale)}
                    <hr>
                    <ul class="in-ul">
                        <li><a href="<c:url value="/MyPage/ShoppingBasket"/>">${afn:getMessage('cart',sessionScope.locale)}</a></li>
                        <li><a href="<c:url value="/MyPage/ShoppingAddList"/>">${afn:getMessage('wishlist',sessionScope.locale)}</a></li>
                        <li><a href="<c:url value="/MyPage/OrderAndDelivery"/>">${afn:getMessage('order_and_delivery',sessionScope.locale)}${afn:getMessage('lookup',sessionScope.locale)}</a></li>
                        <li><a href="<c:url value="/MyPage/Reviews"/>">${afn:getMessage('my_review',sessionScope.locale)}</a></li>
                        <li><a href="<c:url value="/MyPage/Qna"/>">${afn:getMessage('my_qna',sessionScope.locale)}</a></li>
                        <li><a href="<c:url value="/MyPage/Favorites"/>">${afn:getMessage('favorite_product',sessionScope.locale)}</a></li>
                    </ul>
                </li>
                <li>${afn:getMessage('my_giveaway',sessionScope.locale)}
                    <hr>
                    <ul class="in-ul">
                        <%-- <li><a href="<c:url value="/MyPage/GiveawayExperience"/>" class="ready">경품 체험하기</a></li> --%>
                        <%-- <li><a href="#" class="ready">${afn:getMessage('my_giveaway_experience',sessionScope.locale)}</a></li> --%>
                        <li><a href="/Help/help-1-1" >${afn:getMessage('my_giveaway_experience',sessionScope.locale)}</a></li>
                        <li><a href="<c:url value="/MyPage/GiveawayWinningList"/>">${afn:getMessage('giveaway_win_list',sessionScope.locale)}${afn:getMessage('lookup',sessionScope.locale)}</a></li>
                    </ul>
                </li>
                <li>${afn:getMessage('my_info',sessionScope.locale)}
                    <hr>
                    <ul class="in-ul">
                        <li><a href="<c:url value="/MyPage/mypage-12"/>">${afn:getMessage('user_info_change',sessionScope.locale)}</a></li>
                        <li><a href="<c:url value="/MyPage/DeliveryAddress"/>">${afn:getMessage('delivery_address',sessionScope.locale)}</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="mo-footer">

        </div>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>