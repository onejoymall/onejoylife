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
                    <div class="r-input-box">
                        <p class="r-input-tit" style="width:100%">나의 상품평 보기</p>
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
                        <p class="r-in-p2">조회일자를 설정하시면 최대 3개월 간의 주문내역을 조회하실 수 있습니다.</p>
                    </div>
                    <div class="con on" id="con1">
                        <div class="r-sec4">
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col style="width: 600px;">
                                    <col style="width: 150px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>주문일/주문번호</th>
                                    <th>상품정보</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10</p>
                                        <p><a href="">123456789121</a></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="mypage-6-1.html">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                        </a>
                                        <div class="review-box clearfix">
                                            <div class="star-box">
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                            </div>
                                            <div class="review-txt">
                                                <p class="review-tit">굉장히 만족스럽습니다.</p>
                                                <p class="review-arti">
                                                    카메라 잘받았습니다.
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="lis-txt-box lis-txt-box1-3">
                                            <a href="#">수정하기</a>
                                        </div>
                                        <div class="lis-txt-box lis-txt-box1-1">
                                            <a href="#">삭제하기</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10</p>
                                        <p><a href="">123456789121</a></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="mypage-6-1.html">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                        </a>
                                        <div class="review-box clearfix">
                                            <div class="star-box">
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                            </div>
                                            <div class="review-txt">
                                                <p class="review-tit">굉장히 만족스럽습니다.</p>
                                                <p class="review-arti">
                                                    카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서 친절히 답해주셔서 감사하구요, 아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^감사합니다.
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="lis-txt-box lis-txt-box1-3">
                                            <a href="#">수정하기</a>
                                        </div>
                                        <div class="lis-txt-box lis-txt-box1-1">
                                            <a href="#">삭제하기</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10</p>
                                        <p><a href="">123456789121</a></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="mypage-6-1.html">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                        </a>
                                        <div class="review-box clearfix">
                                            <div class="star-box">
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                            </div>
                                            <div class="review-txt">
                                                <p class="review-tit">굉장히 만족스럽습니다.</p>
                                                <p class="review-arti">
                                                    카메라 잘받았습니다. 보증서도 이상없이 있고, 감사합니다.
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="lis-txt-box lis-txt-box1-3">
                                            <a href="#">수정하기</a>
                                        </div>
                                        <div class="lis-txt-box lis-txt-box1-1">
                                            <a href="#">삭제하기</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10</p>
                                        <p><a href="">123456789121</a></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="mypage-6-1.html">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                        </a>
                                        <div class="review-box clearfix">
                                            <div class="star-box">
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                            </div>
                                            <div class="review-txt">
                                                <p class="review-tit">굉장히 만족스럽습니다.</p>
                                                <p class="review-arti">
                                                    성능도 좋고 품질도 맘에들어요<br>잘쓸게요
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="lis-txt-box lis-txt-box1-3">
                                            <a href="#">수정하기</a>
                                        </div>
                                        <div class="lis-txt-box lis-txt-box1-1">
                                            <a href="#">삭제하기</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="my-lis-1">
                                        <p>2019.04.10</p>
                                        <p><a href="">123456789121</a></p>
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="mypage-6-1.html">
                                            <div class="my-lis-img1"></div>
                                            <div class="my-lis-txt">
                                                <p>브라운</p>
                                                <p class="lis-font-w">쿠쿠 10인용 IH전기압력밥솥</p>
                                                <p>VR20H9050UWS</p>
                                            </div>
                                        </a>
                                        <div class="review-box clearfix">
                                            <div class="star-box">
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                                <i class="y-star-full"></i>
                                            </div>
                                            <div class="review-txt">
                                                <p class="review-tit">굉장히 만족스럽습니다.</p>
                                                <p class="review-arti">
                                                    카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서 친절히 답해주셔서 감사하구요, 아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^감사합니다.
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="lis-txt-box lis-txt-box1-3">
                                            <a href="#">수정하기</a>
                                        </div>
                                        <div class="lis-txt-box lis-txt-box1-1">
                                            <a href="#">삭제하기</a>
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
                    </div>

            </div>
        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>