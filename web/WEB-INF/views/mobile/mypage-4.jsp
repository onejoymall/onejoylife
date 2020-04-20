<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>

    <section class="subheader">
        <div class="subTitle">장바구니</div>
        <ul class="taps">
            <li><a href="#" class="active">일반 (${searchVO.totRow})</a></li>
<%--            <li><a href="#">경품 (5)</a></li>--%>
        </ul>
    </section>
    <section class="wrap">
        <form name="defaultform" id="defaultForm" method="POST">
            <input type="hidden" name="table_name" value="product_cart">
            <input type="hidden" name="pk" value="cart_cd">

            <ul class="btns">
    <%--            <li><a href="#" class="active">선택 찜하기</a></li>--%>
                <li><a href="" class="commonlistDelete">선택 삭제</a></li>
            </ul>
            <hr>

            <c:if test="${not empty list}">
                <c:forEach var="list" items="${list}" varStatus="status">
                    <ul class="basket">
                        <li>
                            <input type="hidden" name="cart_cd" value="${list.cart_cd}">
                            <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.cart_cd}">
                            <label for="body-ck1-${status.index}"></label>
                        </li>
                        <li>
                            <ul>
                                <li>
                                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                                    <img src='${list.file_1}' onerror="this.src='http://placehold.it/90'">
                                    </a>
                                </li>
                                <li>
                                    <p>${list.product_brand}</p>
                                    <h5>${list.product_name}</h5>
                                    <p class="grey">${list.product_model_name}</p>
                                    <%--<p class="option"><span>구성품</span> <br>
                                    · 30mm 1.4 여친렌즈 <br>
                                    · 추가배터리</p>--%>
                                </li>
                            </ul>
                            <h2><fmt:formatNumber value="${list.product_payment*list.payment_order_quantity}" groupingUsed="true" /><span>원</span> <span class="shipping">무료배송</span></h2>
    <%--                        <button class="btn-black btn">옵션변경</button>--%>
                            <button class="btn x" data-id="${list.product_cd}">삭제</button>
                            <select name="payment_order_quantity" value="${list.payment_order_quantity}" class="half payment_order_quantity" data-id="${list.cart_cd}">
                                <option value="1" <c:if test="${list.payment_order_quantity eq '1'}"> selected</c:if>>1</option>
                                <option value="2" <c:if test="${list.payment_order_quantity eq '2'}"> selected</c:if>>2</option>
                                <option value="3" <c:if test="${list.payment_order_quantity eq '3'}"> selected</c:if>>3</option>
                                <option value="4" <c:if test="${list.payment_order_quantity eq '4'}"> selected</c:if>>4</option>
                                <option value="5" <c:if test="${list.payment_order_quantity eq '5'}"> selected</c:if>>5</option>
                                <option value="6" <c:if test="${list.payment_order_quantity eq '6'}"> selected</c:if>>6</option>
                            </select>
                        </li>
                    </ul>
                </c:forEach>
            </c:if>
            <c:if test="${empty list}">
                <ul class="basket">
                    <li>표시할 내용이 없습니다.</li>
                </ul>

            </c:if>
            <%--<ul class="basket">
                <li>
                    <input type="checkbox" id="basket1">
                    <label for="basket1"></label>
                </li>
                <li>
                    <ul>
                        <li><img src="../../assets/img/cam-img.jpg" alt=""></li>
                        <li>
                            <p>브라운</p>
                            <h5>쿠쿠 10인용 IH전기압력밥솥</h5>
                            <p class="grey">VR25G66G98UWS</p>
                            <p class="option"><span>구성품</span> <br>
                            · 30mm 1.4 여친렌즈 <br>
                            · 추가배터리</p>
                        </li>
                    </ul>
                    <h2>3,999,000<span>원</span> <span class="shipping">무료배송</span></h2>
                    <button class="btn-black btn">옵션변경</button>
                    <button class="btn">삭제</button>
                    <select class="half">
                        <option value="1" selected>1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                    </select>
                </li>
            </ul>--%>
        </form>
    </section>
    <hr>
    <section class="wrap">
        <ul class="calculator">
            <li>총 주문금액</li>
            <li><fmt:formatNumber value="${getCartSum.total_ori_payment}" groupingUsed="true" /> <span>원</span></li>
        </ul>
        <ul class="calculator">
            <li>총 할인금액</li>
            <li>- <fmt:formatNumber value="${getCartSum.total_ori_payment-getCartSum.total_payment}" groupingUsed="true" /> <span>원</span></li>
        </ul>
        <ul class="calculator">
            <li>배송비</li>
            <li>+ <fmt:formatNumber value="${getCartSum.total_delivery_payment}" groupingUsed="true" /> <span>원</span></li>
        </ul>
        <hr>
        <ul class="calculator">
            <li>원결제예정금액</li>
            <li class="txtRed"><fmt:formatNumber value="${getCartSum.total_payment+getCartSum.total_delivery_payment}" groupingUsed="true" /> <span>원</span></li>
        </ul>
    </section>
    <div class="bottomBtns">
        <ul>
           <li><a href="#" id="selectOrder" class="cartPaymentOrder" data-id="selectCheck">선택 주문하기</a></li>
           <li><a href="#" id="allOrder" class="cartPaymentOrder" data-id="allCheck">전체 주문하기</a></li>
        </ul>
    </div>



<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>