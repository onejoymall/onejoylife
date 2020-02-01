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
                <div class="ojt-tab-box">
                    <div class="ojt-tab">
                        <p class="ojt-but on2" data-id2="ojt1">경품</p>
                        <p class="ojt-but" data-id2="ojt2">이벤트</p>
                    </div>
                </div>
                <div class="ojt-tabbox on2" id="ojt1">
                    <div class="r-input-box">
                        <div class="r-in-box">
                            <div class="input-box1">
                                <p class="ra-num on" data-id="con1">오늘</p>
                                <p class="ra-num" data-id="con2">1주일</p>
                                <p class="ra-num" data-id="con3">1개월</p>
                                <p class="ra-num" data-id="con4">3개월</p>
                            </div>
                            <div class="input-box2">
                                <div class="cla">
                                    <input type="text" id="from_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p1"> ~ </p>
                                <div class="cla">
                                    <input type="text" id="to_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p2"><a href="">조회</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="con on" id="con1">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 390px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 139px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>경품정보</th>
                                    <th>총 사용포인트</th>
                                    <th>상태</th>
                                    <th>조회</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>진행중</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>추첨완료</span><br><span class="txt-s">(2019.04.15)</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                        <a href=""><p class="lis-txt-box txt-color1">다른경품 더보기</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                            <div class="red-box">
                                                <span>결제전</span>
                                                <span class="dis-none">결제완료</span>
                                                <span class="dis-none">상품준비중</span>
                                                <span class="dis-none">배송중</span>
                                                <span class="dis-none">배송완료</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td><span>9,000P</span></td>
                                    <td><div class="win-icon"></div><p class="txt-s"><span>(2019.04.15)</span></p></td>
                                    <td>
                                        <a href="">
                                            <p class="lis-txt-box txt-color2">
                                                <span>경품받기</span>
                                                <span class="dis-none">주문상세</span>
                                                <span class="dis-none">배송조회</span>
                                            </p>
                                        </a>

                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>추첨완료</span><br><span class="txt-s">(2019.04.15)</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                        <a href=""><p class="lis-txt-box txt-color1">다른경품 더보기</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>진행중</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="sec4-lis dis-none">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 390px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 139px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>경품정보</th>
                                    <th>총 사용포인트</th>
                                    <th>상태</th>
                                    <th>조회</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td colspan="5"><span>응모하신 경품이 없습니다.</span></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
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
                    <div class="con" id="con2">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 390px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 139px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>경품정보</th>
                                    <th>총 사용포인트</th>
                                    <th>상태</th>
                                    <th>조회</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>진행중</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>추첨완료</span><br><span class="txt-s">(2019.04.15)</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                        <a href=""><p class="lis-txt-box txt-color1">다른경품 더보기</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                            <div class="red-box">
                                                <span>결제전</span>
                                                <span class="dis-none">결제완료</span>
                                                <span class="dis-none">상품준비중</span>
                                                <span class="dis-none">배송중</span>
                                                <span class="dis-none">배송완료</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td><span>9,000P</span></td>
                                    <td><div class="win-icon"></div><p class="txt-s"><span>(2019.04.15)</span></p></td>
                                    <td>
                                        <a href="">
                                            <p class="lis-txt-box txt-color2">
                                                <span>경품받기</span>
                                                <span class="dis-none">주문상세</span>
                                                <span class="dis-none">배송조회</span>
                                            </p>
                                        </a>

                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>추첨완료</span><br><span class="txt-s">(2019.04.15)</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                        <a href=""><p class="lis-txt-box txt-color1">다른경품 더보기</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>진행중</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
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
                    <div class="con" id="con3">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 390px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 139px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>경품정보</th>
                                    <th>총 사용포인트</th>
                                    <th>상태</th>
                                    <th>조회</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>진행중</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>추첨완료</span><br><span class="txt-s">(2019.04.15)</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                        <a href=""><p class="lis-txt-box txt-color1">다른경품 더보기</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                            <div class="red-box">
                                                <span>결제전</span>
                                                <span class="dis-none">결제완료</span>
                                                <span class="dis-none">상품준비중</span>
                                                <span class="dis-none">배송중</span>
                                                <span class="dis-none">배송완료</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td><span>9,000P</span></td>
                                    <td><div class="win-icon"></div><p class="txt-s"><span>(2019.04.15)</span></p></td>
                                    <td>
                                        <a href="">
                                            <p class="lis-txt-box txt-color2">
                                                <span>경품받기</span>
                                                <span class="dis-none">주문상세</span>
                                                <span class="dis-none">배송조회</span>
                                            </p>
                                        </a>

                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>추첨완료</span><br><span class="txt-s">(2019.04.15)</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                        <a href=""><p class="lis-txt-box txt-color1">다른경품 더보기</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>진행중</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
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
                    <div class="con" id="con4">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 390px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 139px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>경품정보</th>
                                    <th>총 사용포인트</th>
                                    <th>상태</th>
                                    <th>조회</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>진행중</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>추첨완료</span><br><span class="txt-s">(2019.04.15)</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                        <a href=""><p class="lis-txt-box txt-color1">다른경품 더보기</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                            <div class="red-box">
                                                <span>결제전</span>
                                                <span class="dis-none">결제완료</span>
                                                <span class="dis-none">상품준비중</span>
                                                <span class="dis-none">배송중</span>
                                                <span class="dis-none">배송완료</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td><span>9,000P</span></td>
                                    <td><div class="win-icon"></div><p class="txt-s"><span>(2019.04.15)</span></p></td>
                                    <td>
                                        <a href="">
                                            <p class="lis-txt-box txt-color2">
                                                <span>경품받기</span>
                                                <span class="dis-none">주문상세</span>
                                                <span class="dis-none">배송조회</span>
                                            </p>
                                        </a>

                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>추첨완료</span><br><span class="txt-s">(2019.04.15)</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
                                        <a href=""><p class="lis-txt-box txt-color1">다른경품 더보기</p></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:03</span></p>
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
                                    <td><span>9,000P</span></td>
                                    <td><span>진행중</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">참여자 내역</p></a>
                                        <a href=""><p class="lis-txt-box">내 응모번호</p></a>
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
                <div class="ojt-tabbox" id="ojt2">
                    <div class="r-input-box">
                        <div class="r-in-box">
                            <div class="input-box1-1">
                                <p class="ra-num on1" data-id1="con1-1">오늘</p>
                                <p class="ra-num" data-id1="con1-2">1주일</p>
                                <p class="ra-num" data-id1="con1-3">1개월</p>
                                <p class="ra-num" data-id1="con1-4">3개월</p>
                            </div>
                            <div class="input-box2">
                                <div class="cla">
                                    <input type="text" id="from_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p1"> ~ </p>
                                <div class="cla">
                                    <input type="text" id="to_date" class="date_pick">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p2"><a href="">조회</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="con2-1 on1" id="con1-1">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 380px;">
                                    <col style="width: 264px;">
                                    <col style="width: 125px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>이벤트명</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body2">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
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
                    <div class="con2-1" id="con1-2">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 380px;">
                                    <col style="width: 264px;">
                                    <col style="width: 125px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>이벤트명</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body2">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
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
                    <div class="con2-1" id="con1-3">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 380px;">
                                    <col style="width: 264px;">
                                    <col style="width: 125px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>이벤트명</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body2">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
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
                    <div class="con2-1" id="con1-4">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">진행중</option>
                                        <option value="">당첨자 발표</option>
                                        <option value="">당첨</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 125px;">
                                    <col style="width: 380px;">
                                    <col style="width: 264px;">
                                    <col style="width: 125px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>응모일시</th>
                                    <th>이벤트명</th>
                                    <th>기간</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body2">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10<br><span>18:56:10</span></p>
                                    </td>
                                    <td class="">
                                        <p>예쁜 우리집 자랑만해도 E-POINT가 쏟아진다!</p>
                                    </td>
                                    <td><span>2019.04.11</span> ~ <span>2019.12.31</span></td>
                                    <td><span>진행중</span></td>
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
            </div>
        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>