<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>
	<section class="subheader">
		<c:import url="/MyPage/RightHeaderSub"/>
	</section>
    <section class="wrap">
       <ul class="flexbetween mb-1">
           <li>
               <h2>찜 목록</h2>
           </li>   
           <li>
      			<button type="button" id="del-chk-btn" class="btn btn-red commonlistDelete">삭제하기</button>
				<button type="button" id="cart-chk-btn" class="btn btn-blue addAllCart">장바구니 담기</button>
           </li>
       </ul>
        
        <hr>
        <c:if test="${not empty list}">
            <c:forEach var="list" items="${list}" varStatus="status">
            <ul class="basket">
	            <li>
	                <input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_favorites_cd}">
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
	                        <p>${list.product_brand}</p>
	                        <h5>${list.product_name}</h5>
	                        <p class="grey">${list.product_model_name}</p>
	                    </li>
	                </ul>
	                <h2><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span>원</span> <span class="shipping">무료배송</span></h2>
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
    </section>
    
<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>