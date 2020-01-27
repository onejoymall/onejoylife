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
                <div class="r-sec1">
                    <span class="but-img"></span>
                    <span class="name">gildonghong@onejoy.co.kr</span>
                    <span>님</span>
                </div>
                <div class="r-sec2">
                    <div class="rec2-in">
                        <p class="font-de1">쿠폰</p>
                        <p class="font-de2">
                            <a href="#">
                                <span>5</span>
                                <span>장</span>
                            </a>
                        </p>
                    </div>
                    <div class="rec2-in">
                        <p class="font-de1">배송중인 상품</p>
                        <p class="font-de2">
                            <a href="#">
                                <span>5</span>
                                <span>장</span>
                            </a>
                        </p>
                    </div>
                    <div class="rec2-in">
                        <p class="font-de1">응모중인 경품</p>
                        <p class="font-de2">
                            <a href="#">
                                <span>5</span>
                                <span>장</span>
                            </a>
                        </p>
                    </div>
                    <div class="rec2-in">
                        <p class="font-de1">E-point</p>
                        <p class="font-de2">
                            <a href="#">
                                <span>999,999,999</span>
                                <span>p</span>
                            </a>
                        </p>
                    </div>
                    <div class="rec2-in">
                        <div>
                            <p class="in-coin1 font-de1">OJT</p>
                            <p class="in-coin2 font-de2">
                                <a href="#">
                                    <span>999,999,999</span>
                                    <span>coin</span>
                                </a>
                            </p>
                        </div>
                        <div>
                            <p class="in-coin1 font-de1">OJST</p>
                            <p class="in-coin2 font-de2">
                                <a href="#">
                                    <span>999,999,999</span>
                                    <span>coin</span>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="r-sec3">
                    <div class="sec3-in">
                        <div class="sec3-box1">배송현황</div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon1"></div>
                            <p>주문접수<span>(1)</span></p>
                        </div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon2"></div>
                            <p>결제완료<span>(0)</span></p>
                        </div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon3"></div>
                            <p>상품준비중<span>(0)</span></p>
                        </div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon4"></div>
                            <p>배송중<span>(0)</span></p>
                        </div>
                        <div class="sec3-box2">
                            <div class="sec3-box2-icon5"></div>
                            <p>배송완료<span>(0)</span></p>
                        </div>
                    </div>
                </div>
                <div class="r-sec4">
                    <div class="sec4-txt">
                        <p class="txt-tit">최근 구매내역<span>최근주문3건(1개월내)</span></p>
                        <p class="mor-a">
                            <a href="">더보기 ></a>
                        </p>
                    </div>
                    <table class="sec4-lis">
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 305px;">
                            <col style="width: 125px;">
                            <col style="width: 100px;">
                            <col style="width: 100px;">
                            <col style="width: 120px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>주문일/주문번호</th>
                            <th>상품정보</th>
                            <th>상품금액</th>
                            <th>수량</th>
                            <th>주문금액</th>
                            <th>진행상태</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body">
                        <tr>
                            <td class="my-lis-1">
                                <p>2019.04.10</p>
                                <p><a href="">123456789121</a></p>
                            </td>
                            <td class="my-lis-2">
                                <a href="">
                                    <div class="my-lis-img1"></div>
                                    <div class="my-lis-txt">
                                        <p>브라운</p>
                                        <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                        <p>VR20H9050UWS</p>
                                    </div>
                                </a>
                            </td>
                            <td class="lis-font-w"><a href="">3,099,000</a><span>원</span></td>
                            <td class="lis-font-w"><a href="">2</a></td>
                            <td class="lis-font-w"><a href="">3,099,000</a><span>원</span></td>
                            <td>
                                <p class="lis-font-w">배송완료</p>
                                <div class="lis-txt-box">
                                    <a href="#">상품평작성</a>
                                </div>
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
                <div class="r-sec5">
                    <div class="sec5-txt">
                        <p class="txt-tit">경품 참여 내역</p>
                        <p class="mor-a"><a href="#">더보기 ></a></p>
                    </div>
                    <table>
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 630px;">
                            <col style="width: 120px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>참여일</th>
                            <th>이벤트명</th>
                            <th>진행상태</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body2">
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="com">발표완료</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td>진행중</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">당첨</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">당첨</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">당첨</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="r-sec6">
                    <div class="sec6-txt">
                        <p class="txt-tit">나의 상품 Q&A</p>
                        <p class="mor-a"><a href="#">더보기 ></a></p>
                    </div>
                    <table>
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 630px;">
                            <col style="width: 120px;">
                        </colgroup>
                        <thead class="lis-head">
                        <tr>
                            <th>작성일</th>
                            <th>제목</th>
                            <th>답변상태</th>
                        </tr>
                        </thead>
                        <tbody class="lis-body2">
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td>답변대기</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">답변완료</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">답변완료</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">답변완료</td>
                        </tr>
                        <tr>
                            <td>2019.04.10</td>
                            <td><a href="">[삼성전자] [일일특가] *사운드바 증정 이벤트*</a></td>
                            <td class="txt-ok">답변완료</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
