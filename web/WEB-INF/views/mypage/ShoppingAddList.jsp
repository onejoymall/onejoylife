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
                <%--                <%@ include file="/WEB-INF/views/layout/MyPageRightHeader.jsp" %>--%>
                <c:import url="/MyPage/RightHeader"/>
                    <div class="ojt-box">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <p class="txt-tit">찜 목록</p>
                                <div class="txt-right">
                                    <button type="button" id="del-chk-btn">삭제하기</button>
                                    <button type="button" id="cart-chk-btn">장바구니 담기</button>
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
                                <tr>
                                    <td class="my-lis-1">
                                        <input type="checkbox" id="chk1" name="chk1">
                                        <label for="chk1"></label>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="goods-view.html">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                        </a>
                                    </td>
                                    <td><span>19,000원</span></td>
                                    <td>
                                        <a href="#"><p class="lis-txt-box txt-color1">장바구니 담기</p></a>
                                    </td>
                                </tr>

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