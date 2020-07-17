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
                <div class="ojt-tab-box">
                    <div class="ojt-tab">
                        <p class="ojt-but on2" data-id2="ojt1">취소</p>
                        <p class="ojt-but" data-id2="ojt2">재결제</p>
                        <p class="ojt-but" data-id2="ojt3">교환/반품</p>
                    </div>
                </div>
                <div class="ojt-tabbox on2" id="ojt1">
                    <div class="r-input-box">
                        <div class="r-in-box">
                            <div class="input-box1">
                                <p class="ra-num on" data-id="con1-1">오늘</p>
                                <p class="ra-num" data-id="con1-2">1주일</p>
                                <p class="ra-num" data-id="con1-3">1개월</p>
                                <p class="ra-num" data-id="con1-4">3개월</p>
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
                    <div class="con on" id="con1-1">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">취소신청전</option>
                                        <option value="">취소신청중</option>
                                        <option value="">취소완료</option>
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
                                    <th>결제금액</th>
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
                                            <div class="red-box">
                                                <span>취소신청전</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td><span>9,000원</span></td>
                                    <td><span>취소신청전</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">주문 내역</p></a>
                                        <a href="/MyPage/OrderCancel"><p class="lis-txt-box txt-color2">취소신청 하기</p></a>
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
                            <div class="input-box1">
                                <p class="ra-num on" data-id="con2-1">오늘</p>
                                <p class="ra-num" data-id="con2-2">1주일</p>
                                <p class="ra-num" data-id="con2-3">1개월</p>
                                <p class="ra-num" data-id="con2-4">3개월</p>
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
                    <div class="con on" id="con2-1">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">재결제전</option>
                                        <option value="">재결제완료</option>
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
                                    <th>결제금액</th>
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
                                            <div class="red-box">
                                                <span>재결제전</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td><span>9,000원</span></td>
                                    <td>재결제전</td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">주문 내역</p></a>
                                        <a href=""><p class="lis-txt-box txt-color2">재결제 하기</p></a>
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
                <div class="ojt-tabbox" id="ojt3">
                    <div class="r-input-box">
                        <div class="r-in-box">
                            <div class="input-box1">
                                <p class="ra-num on" data-id="con3-1">오늘</p>
                                <p class="ra-num" data-id="con3-2">1주일</p>
                                <p class="ra-num" data-id="con3-3">1개월</p>
                                <p class="ra-num" data-id="con3-4">3개월</p>
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
                    <div class="con on" id="con3-1">
                        <div class="r-sec4">
                            <div class="sec4-txt">
                                <div class="txt-right">
                                    <p>총<span>25건</span></p>
                                    <select name="" id="">
                                        <option value="">전체</option>
                                        <option value="">교환전</option>
                                        <option value="">교환신청중</option>
                                        <option value="">교환완료</option>
                                        <option value="">반품전</option>
                                        <option value="">반품신청중</option>
                                        <option value="">반품완료</option>
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
                                    <th>결제금액</th>
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
                                            <div class="red-box">
                                                <span>교환전</span>
                                            </div>
                                        </a>
                                    </td>
                                    <td><span>19,000원</span></td>
                                    <td><span>교환전</span></td>
                                    <td>
                                        <a href=""><p class="lis-txt-box">주문 내역</p></a>
                                        <a href="/MyPage/OrderChange"><p class="lis-txt-box txt-color2">교환신청 하기</p></a>
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


            </div>
        </main>

    </div>
</div>
<script>
    $('.input-box1 p').click(function(){
        var tab_id = $(this).attr('data-id');
        var pr = $(this).parent('.input-box1');
        var pr2 = $(this).parents('.ojt-tabbox');

        pr.find('p').removeClass('on');
        pr2.find('div.con').removeClass('on');
        $(this).addClass('on');
        $("#"+tab_id).addClass('on');
    })
    $('.input-box1-1 p').click(function(){
        var tab_id1 = $(this).attr('data-id1');

        $('.input-box1-1 p').removeClass('on1');
        $('.ojt-tabbox .con2-1').removeClass('on1');
        $(this).addClass('on1');
        $("#"+tab_id1).addClass('on1');
    })
    $('.ojt-tab p').click(function(){
        var tab_id2 = $(this).attr('data-id2');

        $('.ojt-tab p').removeClass('on2');
        $('.right-contain .ojt-tabbox').removeClass('on2');
        $(this).addClass('on2');
        $("#"+tab_id2).addClass('on2');
    })
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>