        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

                <div class="left-nav">
                    <h2 class="left-tit">마이페이지</h2>
                    <ul class="outer-ul">
                        <li class="outer-li">나의 혜택관리
                            <ul class="inner-ul">
                                <li><a href="<c:url value="/MyPage/ePoint"/>" class="<c:if test="${leftNavOrder == 2}">active</c:if>">E.POINT 조회</a></li>
                                <li><a href="<c:url value="/MyPage/Coupon"/>" class="<c:if test="${leftNavOrder == 3}">active</c:if>">쿠폰 조회</a></li>
                            </ul>
                        </li>
                        <li class="outer-li">나의 쇼핑관리
                            <ul class="inner-ul">
                                <li><a href="<c:url value="/MyPage/ShoppingBasket"/>" class="<c:if test="${leftNavOrder == 4}">active</c:if>">장바구니</a></li>
                                <li><a href="<c:url value="/MyPage/ShoppingAddList"/>" class="<c:if test="${leftNavOrder == 5}">active</c:if>">찜 목록</a></li>
                                <li><a href="<c:url value="/MyPage/OrderAndDelivery"/>" class="<c:if test="${leftNavOrder == 6}">active</c:if>">주문/배송 조회</a></li>
                                <li><a href="<c:url value="/MyPage/OrderCancels"/>" class="<c:if test="${leftNavOrder == 7}">active</c:if>">취소/재결제/교환/반품</a></li>
                                <li><a href="<c:url value="/MyPage/Reviews"/>" class="<c:if test="${leftNavOrder == 8}">active</c:if>">나의 상품평 보기</a></li>
                                <li><a href="<c:url value="/MyPage/Favorites"/>" class="<c:if test="${leftNavOrder == 9}">active</c:if>">자주 구매하는 상품</a></li>
                            </ul>
                        </li>
                        <li class="outer-li">나의 경품관리
                            <ul class="inner-ul">
                                <li><a href="<c:url value="/MyPage/GiveawayExperience"/>" class="<c:if test="${leftNavOrder == 10}">active</c:if>">경품 체험하기</a></li>
                                <li><a href="<c:url value="/MyPage/GiveawayWinningList"/>" class="<c:if test="${leftNavOrder == 11}">active</c:if>">경품 당첨내역 조회</a></li>
                            </ul>
                        </li>
                        <li class="outer-li">나의 정보관리
                            <ul class="inner-ul">
                                <li><a href="<c:url value="/MyPage/ModifyUserInfo"/>" class="<c:if test="${leftNavOrder == 12}">active</c:if>">회원정보 변경</a></li>
                                <li><a href="<c:url value="/MyPage/DeliveryAddress"/>"  class="<c:if test="${leftNavOrder == 13}">active</c:if>">배송지 정보</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
