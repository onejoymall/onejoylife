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
<div class="wrap">
    <div class="page-box">
        <main>
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
                                    <p class="txt-tit">찜 목록</p>
                                    <div class="txt-right">
                                        <button type="button" id="del-chk-btn" class="commonlistDelete">삭제하기</button>
                                        <button type="button" id="cart-chk-btn" class="addAllCart">장바구니 담기</button>
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
                                        <th>상품정보</th>
                                        <th>가격</th>
                                        <th>조회</th>

                                    </tr>
                                    </thead>
                                    <tbody class="lis-body">
                                    <c:if test="${not empty list}">
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                            <tr>
                                                <td><input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.product_favorites_cd}"><label for="body-ck1-${status.index}"></label></td>
                                                <td>
                                                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                                                        <img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100">
                                                    </a>
                                                </td>
                                                <td class="p-box">
                                                    <p>${list.product_brand}</p>
                                                    <p>${list.product_name}</p>
                                                    <p>${list.product_model_name}</p>
                                                        <%--                                        <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
                                                </td>
                                                    <%--                                    <td><p class="op-td1">옵션변경</p></td>--%>
    <%--                                            <td><input type="number" value="1" class="num-box"></td>--%>
                                                <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</td>
                                                    <%--                                    <td><span><fmt:formatNumber value="${list.product_delivery_payment}" groupingUsed="true" /></span>원</td>--%>
<%--                                                <td><button class="x" data-id="${list.product_cd}"></button></td>--%>
                                                <td>
                                                    <a href="javascript:void(0);" onclick="addShoppingBasket('${list.product_cd}')"><p class="lis-txt-box txt-color1" >장바구니 담기</p></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty list}">
                                        <tr>
                                            <td colspan="8">
                                                표시할 내용이 없습니다.
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


<%@ include file="/WEB-INF/views/layout/footer.jsp" %>