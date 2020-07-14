<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>
	<section class="subheader">
		<c:import url="/MyPage/RightHeaderSub"/>
	</section>
<form name="defaultform" id="defaultForm" method="POST">
	<input type="hidden" name="table_name" value="product_favorites">
	<input type="hidden" name="pk" value="product_favorites_cd">
    <section class="wrap">
       <ul class="flexbetween mb-1">
           <li>
               <h2>찜 목록</h2>
           </li>   
           <li>
      			<button type="button" id="del-chk-btn" class="btn btn-red deleteFavorites">삭제하기</button>
				<button type="button" id="cart-chk-btn" class="btn btn-blue addAllCart">장바구니 담기</button>
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
	                        <%-- <p>${list.product_brand}</p> --%>
	                        <h5>${list.product_name}</h5>
	                        <%-- <p class="grey">${list.product_model_name}</p> --%>
	                    </li>
	                </ul>
	                <h2><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span>원</span> <span class="shipping">무료배송</span></h2>
	                <c:if test="${list.product_option_yn !='Y' }">
	                <button type="button" class="btn-red btn" onclick="deleteFavorite('${list.product_cd}')">삭제하기</button>
	                <button type="button" class="btn-blue btn" onclick="addShoppingBasketM('${list.product_cd}')">장바구니 담기</button>
	                </c:if>
	                <c:if test="${list.product_option_yn =='Y' }">
	                <button type="button" class="btn-red btn" onclick="deleteFavorite('${list.product_cd}')">삭제하기</button>
	                <button type="button" class="btn-blue btn" onclick="location.href='/product/productDetail?product_cd=${list.product_cd}';">옵션선택하러가기</button>
	                </c:if>
	            </li>
				<input type="hidden" name="payment_order_quantity" value="1">
	        </ul>
	        <hr>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
                    표시할 내용이 없습니다.
		<hr>
        </c:if>
	</section>
</form>
    
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>