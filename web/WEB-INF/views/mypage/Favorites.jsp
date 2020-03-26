<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">

                <c:import url="/MyPage/RightHeader"/>
                <div class="ojt-box">
                <div class="r-sec4">
                    <div class="sec4-txt">
                        <p class="txt-tit">자주 구매하는 상품</p>
                        <div class="txt-right">
                            <button type="button" id="del-chk-btn">삭제하기</button>
<%--                            <button type="button" id="cart-chk-btn">장바구니 담기</button>--%>
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
                                <input type="checkbox" id="tr-chk" name="tr-chk">
                                <label for="tr-chk"></label>
                            </th>
                            <th>상품정보</th>
                            <th>가격</th>
                            <th>조회</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body">
                        <c:if test="${not empty list}">
                            <c:forEach var="list" items="${list}" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" id="body-ck1-${status.index}" name="chk" value="${list.cart_cd}"><label for="body-ck1-${status.index}"></label></td>
                                    <td><img src='${list.file_1}' onerror="this.src='http://placehold.it/100'" width="100"></td>
                                    <td class="p-box">
                                        <p>${list.product_brand}</p>
                                        <p>${list.product_name}</p>
                                        <p>${list.product_model_name}</p>
                                            <%--                                        <p>구성품<br>·<span> 30mm 1.4 여친렌즈</span><br>·<span> 추가배터리</span></p>--%>
                                    </td>
                                        <%--                                    <td><p class="op-td1">옵션변경</p></td>--%>
                                    <td><input type="number" value="1" class="num-box"></td>
                                    <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</td>
                                        <%--                                    <td><span><fmt:formatNumber value="${list.product_delivery_payment}" groupingUsed="true" /></span>원</td>--%>
                                    <td><button class="x" data-id="${list.product_cd}"></button></td>
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
                    <div class="num-box">
                        <div class="num-box-in">
                            <div class="left-box"><a href=""></a></div>
                            <div class="num">
                                <span><a href="">1</a></span>
                                <span><a href="">2</a></span>
                                <span><a href="">3</a></span>
                                <span><a href="">4</a></span>
                                <span><a href="">5</a></span>
                            </div>
                            <div class="right-box"><a href=""></a></div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>