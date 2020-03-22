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
                <form action="" method="POST">
                    <div class="r-sec1">
                        <p class="sec1-h1">교환신청</p>
                        <p class="sec1-p1">주문번호 : <span>123456789456</span><span> │ </span>주문일 : <span>2019.04.23</span></p>
                        <table>
                            <colgroup>
                                <col style="width: 150px;">
                                <col style="width: 260px;">
                                <col style="width: 125px;">
                                <col style="width: 259px;">
                                <col style="width: 100px;">
                            </colgroup>
                            <thead class="sec1-thead">
                            <tr>
                                <th></th>
                                <th>상품정보</th>
                                <th>판매자</th>
                                <th>상품금액</th>
                                <th>수량</th>
                            </tr>
                            </thead>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td><div class="sec1-td-img"></div></td>
                                <td class="sec1-tbody-p1">
                                    <p>KFC 메뉴교환권</p>
                                    <p>17_KFC 오리지널 치킨 교환권</p>
                                </td>
                                <td><span>KFC</span></td>
                                <td><span>3,099,000</span>원</td>
                                <td><span>1</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <p class="sec-h1">교환사유</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec2-body body-tr-s">
                            <tr>
                                <td class="body-td-tit">사유선택</td>
                                <td class="body-td-txt1">
                                    <select name="" id="" class="txt1-select">
                                        <option value="">사유를 선택하세요</option>
                                        <option value="">사유1</option>
                                        <option value="">사유2</option>
                                        <option value="">사유3</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">사유입력</td>
                                <td class="body-td-txt1">
                                    <textarea name="" id="" cols="97" rows="4" style="resize: none; margin-top: 10px;" class="area-content"></textarea>
                                    <p class="area-num">(0/2000)</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec3">
                        <p class="sec-h1">원상품 회수지 정보</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s">
                            <tr>
                                <td class="body-td-tit">수령인</td>
                                <td class="body-td-txt2"><span>홍길동</span></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">연락처</td>
                                <td class="body-td-txt2"><span>010</span><span class="td-txt-un"> - </span><span>1234</span><span class="td-txt-un"> - </span><span>1234</span></td>
                            </tr>

                            <tr>
                                <td class="body-td-tit">주소</td>
                                <td class="body-td-txt2"><span>06643 서울특별시 서초구 서리풀길 4 영호빌딩 4층</span><button class="sec-but">주소지 변경</button></td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec4">
                        <p class="sec-h1">교환상품 배송지 정보</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s">
                            <tr>
                                <td class="body-td-tit">수령인</td>
                                <td class="body-td-txt2"><span>홍길동</span></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">연락처</td>
                                <td class="body-td-txt2"><span>010</span><span class="td-txt-un"> - </span><span>1234</span><span class="td-txt-un"> - </span><span>1234</span></td>
                            </tr>

                            <tr>
                                <td class="body-td-tit">주소</td>
                                <td class="body-td-txt2"><span>06643 서울특별시 서초구 서리풀길 4 영호빌딩 4층</span><button class="sec-but">주소지 변경</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="r-sec5">
                        <button type="submit">교환신청</button>
                        <button>이전</button>
                    </div>
                </form>
            </div>

        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>