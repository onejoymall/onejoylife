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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box clearfix">
        <main>
            <c:import url="/layout/scrollRight"/>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <%--                <%@ include file="/WEB-INF/views/layout/MyPageRightHeader.jsp" %>--%>
                <c:import url="/MyPage/RightHeader"/>
                    <form name="defaultform" id="defaultForm" method="POST">
                        <input type="hidden" name="table_name" value="product_favorites">
                        <input type="hidden" name="pk" value="product_favorites_cd">
                        <div class="ojt-box">
                            <div class="r-sec4">
                                <div class="sec4-txt">
                                    <p class="txt-tit">${afn:getMessage('wishlist',sessionScope.locale)}</p>
                                    <div class="txt-right">
                                        <button type="button" id="del-chk-btn" class="deleteFavorites">${afn:getMessage('delete',sessionScope.locale)}</button>
                                        <button type="button" id="cart-chk-btn" class="addAllCart">${afn:getMessage('add_cart',sessionScope.locale)}</button>
                                    </div>
                                </div>
                                <table class="sec4-lis">
                                    <colgroup>
                                        <col style="width: 50px;">
                                        <col style="width: 150px;">
                                        <col style="width: 370px;">
                                        <col style="width: 339px;">
                                    </colgroup>
                                    <thead class="lis-head">
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="tr-ck1-1"><label for="tr-ck1-1" class="tr-icon"></label>
                                        </th>
                                        <td></td>
                                        <th>${afn:getMessage('product_information',sessionScope.locale)}</th>
                                        <th>${afn:getMessage('price',sessionScope.locale)}</th>
                                        <th>${afn:getMessage('lookup',sessionScope.locale)}</th>

                                    </tr>
                                    </thead>
                                    <tbody class="lis-body">
                                    <c:if test="${not empty list}">
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                            <tr>
                                                <td>
                                                	<c:if test="${list.product_option_yn !='Y' }">
                                                	<input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_cd}"><label for="body-ck1-${status.index}"></label>
                                                	</c:if>
                                               	</td>
                                                <td>
                                                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                                                        <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                                                    </a>
                                                </td>
                                                <td class="p-box">
                                                    <%-- <p>${list.product_brand}</p> --%>
                                                    <p>${list.product_name}</p>
                                                    <%-- <p>${list.product_model_name}</p> --%>
                                                        <%--                                        <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
                                                </td>
                                                    <%--                                    <td><p class="op-td1">옵션변경</p></td>--%>
    <%--                                            <td><input type="number" value="1" class="num-box"></td>--%>
                                                <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>${afn:getMessage('korea_won',sessionScope.locale)}</td>
                                                    <%--                                    <td><span><fmt:formatNumber value="${list.product_delivery_payment}" groupingUsed="true" /></span>원</td>--%>
<%--                                                <td><button class="x" data-id="${list.product_cd}"></button></td>--%>
                                                <td>
                                                	<c:if test="${list.product_option_yn !='Y' }">
                                                	<a href="javascript:void(0);" onclick="deleteFavorite('${list.product_cd}')"><p class="lis-txt-box txt-color2" >${afn:getMessage('delete',sessionScope.locale)}</p></a>
                                                    <a href="javascript:void(0);" onclick="addShoppingBasketM('${list.product_cd}')"><p class="lis-txt-box txt-color1" >${afn:getMessage('add_cart',sessionScope.locale)}</p></a>
                                                    </c:if>
                                                	<c:if test="${list.product_option_yn =='Y' }">
                                                	<a href="javascript:void(0);" onclick="deleteFavorite('${list.product_cd}')"><p class="lis-txt-box txt-color2" >${afn:getMessage('delete',sessionScope.locale)}</p></a>
                                                    <a href="javascript:void(0);" onclick="location.href='/product/productDetail?product_cd=${list.product_cd}';"><p class="lis-txt-box txt-color1" >${afn:getMessage('select_option',sessionScope.locale)}</p></a>
                                                    </c:if>
                                                </td>
                                                <input type="hidden" name="payment_order_quantity" value="1">
                                            </tr>
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

                            </div>
                        </div>

                    </form>
            </div>
        </main>

    </div>
</div>


<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>