<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>


        <section class="subheader">
            <div class="subTitle clearfix">마이페이지</div>
            <c:import url="/MyPage/RightHeader"/>
        </section>
        <div class="wrap clearfix page-list">
            <ul>
                <li>나의 혜택관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="<c:url value="/MyPage/ePoint"/>">E.POINT 조회</a></li>
                        <li><a href="<c:url value="/MyPage/Coupon"/>">쿠폰조회</a></li>
                    </ul>
                </li>
                <li>나의 쇼핑관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="<c:url value="/MyPage/ShoppingBasket"/>">장바구니</a></li>
                        <li><a href="<c:url value="/MyPage/ShoppingAddList"/>">찜목록</a></li>
                        <li><a href="<c:url value="/MyPage/OrderAndDelivery"/>">주문/배송조회</a></li>
                        <li><a href="<c:url value="/MyPage/Reviews"/>">나의 상품평보기</a></li>
                        <li><a href="<c:url value="/MyPage/Qna"/>">나의 QnA보기</a></li>
                        <li><a href="<c:url value="/MyPage/Favorites"/>">자주 구매하는 상품</a></li>
                    </ul>
                </li>
                <li>나의 경품관리
                    <hr>
                    <ul class="in-ul">
                        <%-- <li><a href="<c:url value="/MyPage/GiveawayExperience"/>" class="ready">경품 체험하기</a></li> --%>
                        <li><a href="#" class="ready">경품 체험하기</a></li>
                        <li><a href="<c:url value="/MyPage/GiveawayWinningList"/>">경품 당첨내역 조회</a></li>
                    </ul>
                </li>
                <li>나의 정보관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="<c:url value="/MyPage/mypage-12"/>">회원정보 변경</a></li>
                        <li><a href="<c:url value="/MyPage/DeliveryAddress"/>">배송지 정보</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="mo-footer">

        </div>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>

