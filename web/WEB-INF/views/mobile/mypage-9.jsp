<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>
	<section class="subheader">
		<c:import url="/MyPage/RightHeaderSub"/>
	</section>
    <section class="wrap">
       <ul class="flexbetween mb-1">
           <li>
               <h2>자주 구매하는 상품</h2>
           </li>   
           <li>
           <c:if test="${not empty list}">
      			<button type="button" id="del-chk-btn" class="btn btn-grey addChkFavorites">찜하기</button>
				<button type="button" id="cart-chk-btn" class="btn btn-blue addChkCart">장바구니 담기</button>
			</c:if>
           </li>
       </ul>
        
        <hr>
        <c:if test="${not empty list}">
            <c:forEach var="list" items="${list}" varStatus="status">
            <ul class="basket">
	            <li>
	                <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_cd}">
	                <label for="body-ck1-${status.index}"></label>
	            </li>
	            <li>
	                <ul>
	                    <li>
	                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                        </a>
                        </li>
	                    <li>
	                        <p>${list.product_made_company_name}</p>
	                        <h5>${list.product_name}</h5>
	                        <p class="grey">${list.product_model_name}</p>
	                    </li>
	                </ul>
	                <h2><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span>원</span> </h2>
	                <form name="" class="" method="POST" action="/product/productPayment">
                     <input type="hidden" name="product_delivery_payment" value="${list.product_delivery_payment}">
                     <input type="hidden" name="payment_order_quantity" value="1">
                     <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
                    </form>
	                <button class="btn-red btn favoriteSubmit" >바로결제</button>
	                <button class="btn-grey btn favorite" data-id="${list.product_cd}">찜하기</button>
	                <button class="btn-blue btn" onclick="addShoppingBasket('${list.product_cd}')">장바구니 담기</button>
	            </li>
	        </ul>
	        <hr>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
                    표시할 내용이 없습니다.
		<hr>
        </c:if>
        <c:if test="${not empty productList}">
        <ul class="flexbetween mb-1">
           <li>
               <h2>추천 상품</h2>
           </li>   
           <li>
      			<button type="button" id="del-chk-btn" class="btn btn-grey addChkFavorites">찜하기</button>
				<button type="button" id="cart-chk-btn" class="btn btn-blue addChkCart">장바구니 담기</button>
           </li>
       </ul>
       <hr>

			<form name="defaultform" id="defaultForm" method="POST">
       <c:forEach var="list" items="${productList}" varStatus="status">
            <ul class="basket">
	            <li>
	                <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_cd}">
	                <label for="body-ck1-${status.index}"></label>
	            </li>
	            <li>
	                <ul>
	                    <li>
	                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                        </a>
                        </li>
	                    <li>
	                        <p>${list.product_made_company_name}</p>
	                        <h5>${list.product_name}</h5>
	                        <p class="grey">${list.product_model_name}</p>
	                    </li>
	                </ul>
	                <h2><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span>원</span> </h2>
	                <form name="" class="" method="POST" action="/product/productPayment">
                     <input type="hidden" name="product_delivery_payment" value="${list.product_delivery_payment}">
                     <input type="hidden" name="payment_order_quantity" value="1">
                     <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
                    </form>
	                <button class="btn-red btn favoriteSubmit" >바로결제</button>
	                <button class="btn-grey btn favorite" data-id="${list.product_cd}">찜하기</button>
	                <button class="btn-blue btn" onclick="addShoppingBasket('${list.product_cd}')">장바구니 담기</button>
	            </li>
				<input type="hidden" name="payment_order_quantity" value="1">
	        </ul>
	        <hr>
            </c:forEach>
			</form>
       </c:if>
    </section>
    
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>