<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
	<section class="subheader">
		<c:import url="/MyPage/RightHeaderSub"/>
	</section>
    <section class="wrap">
       <ul class="flexbetween mb-1">
           <li>
               <h2>${afn:getMessage('favorite_product',sessionScope.locale)}</h2>
           </li>   
           <li>
           <c:if test="${not empty list}">
      			<button type="button" id="del-chk-btn" class="btn btn-grey addChkFavorites">${afn:getMessage('add_wish',sessionScope.locale)}</button>
				<button type="button" id="cart-chk-btn" class="btn btn-blue addChkCart">${afn:getMessage('add_cart',sessionScope.locale)}</button>
			</c:if>
           </li>
       </ul>
        
        <hr>
        <c:if test="${not empty list}">
            <c:forEach var="list" items="${list}" varStatus="status">
            <ul class="basket">
	            <li>
	            	<c:if test="${list.product_option_yn !='Y' }">
	                <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_cd}">
	                <label for="body-ck1-${status.index}"></label>
	                </c:if>
	            </li>
	            <li>
	                <ul>
	                    <li>
	                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                        </a>
                        </li>
	                    <li>
	                        <%-- <p>${list.product_made_company_name}</p> --%>
	                        <h5>${list.product_name}</h5>
	                        <%-- <p class="grey">${list.product_model_name}</p> --%>
	                    </li>
	                </ul>
	                <h2><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span>${afn:getMessage('worea_won',sessionScope.locale)}</span> </h2>
	                <form name="" class="" method="POST" action="/product/productPayment">
                     <input type="hidden" name="product_delivery_payment" value="${list.product_delivery_payment}">
                     <input type="hidden" name="payment_order_quantity" value="1">
                     <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
                    </form>
	                <c:if test="${list.product_option_yn !='Y' }">
	                <button class="btn-red btn favoriteSubmit" >${afn:getMessage('pay_now',sessionScope.locale)}</button>
	                <button class="btn-grey btn favorite" data-id="${list.product_cd}">${afn:getMessage('add_wish',sessionScope.locale)}</button>
	                <button class="btn-blue btn" onclick="addShoppingBasketM('${list.product_cd}')">${afn:getMessage('add_cart',sessionScope.locale)}</button>
	                </c:if>
                    <c:if test="${list.product_option_yn =='Y' }">
	                <button type="button" class="btn-red btn" onclick="location.href='/product/productDetail?product_cd=${list.product_cd}';">${afn:getMessage('select_option',sessionScope.locale)}</button>
	                <button class="btn-grey btn favorite" data-id="${list.product_cd}">${afn:getMessage('add_wish',sessionScope.locale)}</button>
	                </c:if>
	            </li>
	        </ul>
	        <hr>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
                    ${afn:getMessage('msg.none_content',sessionScope.locale)}
		<hr>
        </c:if>
        <c:if test="${not empty productList}">
        <ul class="flexbetween mb-1">
           <li>
               <h2>${afn:getMessage('recommend_product',sessionScope.locale)}</h2>
           </li>   
           <li>
      			<button type="button" id="del-chk-btn" class="btn btn-grey addChkFavorites">${afn:getMessage('add_wish',sessionScope.locale)}</button>
				<button type="button" id="cart-chk-btn" class="btn btn-blue addChkCart">${afn:getMessage('add_cart',sessionScope.locale)}</button>
           </li>
       </ul>
       <hr>

       <c:forEach var="list" items="${productList}" varStatus="status">
            <ul class="basket">
	            <li>
	            	<c:if test="${list.product_option_yn !='Y' }">
	                <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_cd}">
	                <label for="body-ck1-${status.index}"></label>
	                </c:if>
	            </li>
	            <li>
	                <ul>
	                    <li>
	                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                        </a>
                        </li>
	                    <li>
	                        <%-- <p>${list.product_made_company_name}</p> --%>
	                        <h5>${list.product_name}</h5>
	                        <%-- <p class="grey">${list.product_model_name}</p> --%>
	                    </li>
	                </ul>
	                <h2><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span>${afn:getMessage('korea_won',sessionScope.locale)}</span> </h2>
	                <form name="" class="" method="POST" action="/product/productPayment">
                     <input type="hidden" name="product_delivery_payment" value="${list.product_delivery_payment}">
                     <input type="hidden" name="payment_order_quantity" value="1">
                     <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
                    </form>
                    <c:if test="${list.product_option_yn !='Y' }">
	                <button class="btn-red btn favoriteSubmit" >${afn:getMessage('pay_now',sessionScope.locale)}</button>
	                <button class="btn-grey btn favorite" data-id="${list.product_cd}">${afn:getMessage('add_wish',sessionScope.locale)}</button>
	                <button class="btn-blue btn" onclick="addShoppingBasketM('${list.product_cd}')">${afn:getMessage('add_cart',sessionScope.locale)}</button>
	                </c:if>
                    <c:if test="${list.product_option_yn =='Y' }">
	                <button type="button" class="btn-red btn" onclick="location.href='/product/productDetail?product_cd=${list.product_cd}';">${afn:getMessage('select_option',sessionScope.locale)}</button>
	                <button class="btn-grey btn favorite" data-id="${list.product_cd}">${afn:getMessage('add_wish',sessionScope.locale)}</button>
	                </c:if>
	            </li>
				<input type="hidden" name="payment_order_quantity" value="1">
	        </ul>
	        <hr>
            </c:forEach>
       </c:if>
    </section>
     <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>