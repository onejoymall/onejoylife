<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<div class="wrap">
    <div class="page-box clearfix">
        <main>
            <c:import url="/layout/scrollRight"/>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">

                <c:import url="/MyPage/RightHeader"/>
                <div class="ojt-box">
                <div class="r-sec4">
                    <div class="sec4-txt">
                        <p class="txt-tit">${afn:getMessage('favorite_product',sessionScope.locale)}</p>
                        <div class="txt-right">
                        <c:if test="${not empty list}">
                            <!-- <button type="button" id="del-chk-btn " class="cartPaymentOrder txt-color2">바로결제</button> -->
                            <button type="button" id="" class="txt-color3 addChkFavorites">${afn:getMessage('add_wish',sessionScope.locale)}</button>
                            <button type="button" id="cart-chk-btn" class="txt-color1 addChkCart">${afn:getMessage('add_cart',sessionScope.locale)}</button>
                        </c:if>
                        </div>
                    </div>
                    
                    <table class="sec4-lis">
                        <colgroup>
                            <col style="width: 125px;">
                            <col style="width: 510px;">
                            <col style="width: 120px;">
                            <col style="width: 139px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>
                                <c:if test="${not empty list}"><input type="checkbox" id="tr-ck1-1"><label for="tr-ck1-1" class="tr-icon"></label></c:if>
                            </th>
                            <th>${afn:getMessage('product_info',sessionScope.locale)}</th>
                            <th>${afn:getMessage('amount',sessionScope.locale)}</th>
                            <th>${afn:getMessage('lookup',sessionScope.locale)}</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body">
                        <c:if test="${not empty list}">
                            
                            <c:forEach var="list" items="${list}" varStatus="status">
                                <tr>
                                    <td class="my-lis-1">
                                    	<c:if test="${list.product_option_yn !='Y' }">
                                    	<input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_cd}"><label for="body-ck1-${status.index}"></label>
                                    	</c:if>
                                   	</td>
                                    <td class="my-lis-2">
                                    	<a href="/product/productDetail?product_cd=${list.product_cd}">
	                                        <div><img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100"></div>
	                                        <div class="my-lis-txt">
		                                        <%-- <p>${list.product_made_company_name}</p> --%>
		                                        <p class="lis-font-w">${list.product_name}</p>
		                                        <%-- <p>${list.product_model_name}</p> --%>
                                      		</div>
                                        </a>
                                    </td>
                                    <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />${afn:getMessage('worea_won',sessionScope.locale)}</span></td>
                                    <td>
                                    	<form name="" class="" method="POST" action="/product/productPayment">
				                            <input type="hidden" name="product_delivery_payment" value="${list.product_delivery_payment}">
				                            <input type="hidden" name="payment_order_quantity" value="1">
				                            <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
				                            <input type="hidden" name="order_no" id="order_no" value="${list.order_no}">
			                            </form>
			                            <c:if test="${list.product_option_yn !='Y' }">
                                        <a href="javascript:void(0)" class="favoriteSubmit"><p class="lis-txt-box txt-color2">${afn:getMessage('pay_now',sessionScope.locale)}</p></a>
                                        <a href="javascript:void(0)" class="favorite" data-id="${list.product_cd}"><p class="lis-txt-box txt-color3">${afn:getMessage('add_wish',sessionScope.locale)}</p></a>
                                        <a href="javascript:addShoppingBasketM('${list.product_cd}')"><p class="lis-txt-box txt-color1">${afn:getMessage('add_cart',sessionScope.locale)}</p></a>
                                        </c:if>
			                            <c:if test="${list.product_option_yn =='Y' }">
                                        <a href="/product/productDetail?product_cd=${list.product_cd}"><p class="lis-txt-box txt-color2">${afn:getMessage('select_option',sessionScope.locale)}</p></a>
                                        <a href="javascript:void(0)" class="favorite" data-id="${list.product_cd}"><p class="lis-txt-box txt-color3">${afn:getMessage('add_wish',sessionScope.locale)}</p></a>
                                        </c:if>
                                    </td>
                                </tr>
                                <input type="hidden" name="payment_order_quantity" value="1">
                            </c:forEach>
                            
                        </c:if>
                        <c:if test="${empty list}">
                            <tr>
                                <td colspan="8">
                                    ${afn:getMessage('msg.none_content',sessionScope.locale)}
                                </td>
                            </tr>

                        </c:if>
                        </tbody>
                    </table>
                    
                    <c:if test="${not empty productList}">
                    <div class="sec4-txt">
                        <p class="txt-tit">${afn:getMessage('recommend_product',sessionScope.locale)}</p>
                        <div class="txt-right">
                            <!-- <button type="button" id="del-chk-btn " class="cartPaymentOrder txt-color2">바로결제</button> -->
                            <button type="button" id="" class="txt-color3 addChkFavorites">${afn:getMessage('add_wish',sessionScope.locale)}</button>
                            <button type="button" id="cart-chk-btn" class="txt-color1 addChkCart">${afn:getMessage('add_cart',sessionScope.locale)}</button>
                        </div>
                    </div>
                    
                    <table class="sec4-lis">
                        <colgroup>
                            <col style="width: 125px;">
                            <col style="width: 510px;">
                            <col style="width: 120px;">
                            <col style="width: 139px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>
                                <input type="checkbox" id="tr-ck1-2"><label for="tr-ck1-2" class="tr-icon"></label>
                            </th>
                            <th>${afn:getMessage('product_info',sessionScope.locale)}</th>
                            <th>${afn:getMessage('amount',sessionScope.locale)}</th>
                            <th>${afn:getMessage('lookup',sessionScope.locale)}</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body">
                                <c:forEach var="list" items="${productList}" varStatus="status">
                                <tr>
                                    <td class="my-lis-1">
                                    	<c:if test="${list.product_option_yn !='Y' }">
                                    	<input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_cd}"><label for="body-ck1-${status.index}"></label>
                                    	</c:if>
                                   	</td>
                                    <td class="my-lis-2">
                                    	<a href="/product/productDetail?product_cd=${list.product_cd}">
	                                        <div><img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100"></div>
	                                        <div class="my-lis-txt">
		                                        <p>${list.product_made_company_name}</p>
		                                        <p class="lis-font-w">${list.product_name}</p>
		                                        <p>${list.product_model_name}</p>
                                      		</div>
                                        </a>
                                    </td>
                                    <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />${afn:getMessage('korea_won',sessionScope.locale)}</p></span></td>
                                    <td>
                                    	<form name="" class="" method="POST" action="/product/productPayment">
				                            <input type="hidden" name="product_delivery_payment" value="${list.product_delivery_payment}">
				                            <input type="hidden" name="payment_order_quantity" value="1">
				                            <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
			                            </form>
                                        <c:if test="${list.product_option_yn !='Y' }">
                                        <a href="javascript:void(0)" class="favoriteSubmit"><p class="lis-txt-box txt-color2">${afn:getMessage('pay_now',sessionScope.locale)}</p></p></a>
                                        <a href="javascript:void(0)" class="fvorite" data-id="${list.product_cd}"><p class="lis-txt-box txt-color3">${afn:getMessage('add_wish',sessionScope.locale)}</p></p></a>
                                        <a href="javascript:addShoppingBasketM('${list.product_cd}')"><p class="lis-txt-box txt-color1">${afn:getMessage('add_cart',sessionScope.locale)}</p></p></a>
                                        </c:if>
			                            <c:if test="${list.product_option_yn =='Y' }">
                                        <a href="/product/productDetail?product_cd=${list.product_cd}"><p class="lis-txt-box txt-color2">${afn:getMessage('select_option',sessionScope.locale)}</p></p></a>
                                        <a href="javascript:void(0)" class="favorite" data-id="${list.product_cd}"><p class="lis-txt-box txt-color3">${afn:getMessage('add_wish',sessionScope.locale)}</p></p></a>
                                        </c:if>
                                    </td>
                                </tr>
                                </c:forEach>
                        </tbody>
                    </table>
                    </c:if>
                    <form name="form1" id="form1" method="get">
                        <jsp:include page="/WEB-INF/views/common/pagingforSubmitList.jsp" />
                        <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                    </form>
                </div>
            </div>
            </div>
        </main>

    </div>
</div>
<c:import url="/layout/footer"/>

<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>