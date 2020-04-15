<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>


        <section class="subheader">
            <div class="subTitle clearfix">마이페이지</div>
            <div class="point-box clearfix">
                <p><span>hildonghong@onjoy.co.kr</span>님<a href="" class="setting-i"></a></p>
                <div class="coupon clearfix">
                    <div>
                        <p class="c-sub-tit">쿠폰</p>
                        <p class="c-sub-num"><a href=""><span>5</span></a></p>
                    </div>
                    <div>
                        <p class="c-sub-tit">배송중</p>
                        <p class="c-sub-num"><a href=""><span>5</span></a></p>
                    </div>
                    <div>
                        <p class="c-sub-tit">응모중인 경품</p>
                        <p class="c-sub-num"><a href=""><span>5</span></a></p>
                    </div>
                </div>
                <div class="point">
                    <div class="clearfix">
                        <p>E-POINT</p>
                        <p><a href="">999,999,999</a></p>
                    </div>
                    <div class="clearfix">
                        <p>OJT</p>
                        <p><a href="">999,999,999</a></p>
                    </div>
                    <div class="clearfix">
                        <p>OJST</p>
                        <p><a href="">999,999,999</a></p>
                    </div>
                </div>
            </div>
        </section>
        <div class="wrap clearfix page-list">
            <ul>
                <li>나의 혜택관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="">E.POINT 조회</a></li>
                        <li><a href="">쿠폰조회</a></li>
                    </ul>
                </li>
                <li>나의 쇼핑관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="">장바구니</a></li>
                        <li><a href="">찜목록</a></li>
                        <li><a href="">주문/배송조회</a></li>
                        <li><a href="">취소/재결제/교환/반품</a></li>
                        <li><a href="">나의 상품평보기</a></li>
                        <li><a href="">자주 구매하는 상품</a></li>
                    </ul>
                </li>
                <li>나의 경품관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="">경품 체험하기</a></li>
                        <li><a href="">경품 당첨내역 조회</a></li>
                    </ul>
                </li>
                <li>나의 정보관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="">회원정보 변경</a></li>
                        <li><a href="">배송지 정보</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="mo-footer">

        </div>
    </div>


<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>

