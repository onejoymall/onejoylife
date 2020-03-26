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
                        <p class="sec1-h1">반품신청</p>
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
                        <p class="sec-h1">반품사유</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 720px;">
                            </colgroup>
                            <tbody class="sec2-body body-tr-s  body-border">
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
                                    <textarea name="" id="" cols="97" rows="4" class="area-content"></textarea>
                                    <p class="area-num">(0/20000)</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec3">
                        <p class="sec-h1">반품수거 정보입력</p>
                        <table>
                            <colgroup>
                                <col style="width: 290px;">
                                <col style="width: 610px;">
                            </colgroup>
                            <tbody class="sec3-body t-border">
                            <tr>
                                <td class="body-td-tit1">반품하실 상품을 발송하셨습니까?</td>
                                <td class="body-td-txt2">
                                    <ul class="input-ul">
                                        <li class="ra-tab1 on" data-id="tab1">
                                            <input type="radio" id="tab1-rd" name="rd-tab" checked>
                                            <label for="tab1-rd" class="rd-label"><span class="rd-txt">네, 이미 발송하였습니다.</span></label>
                                        </li>
                                        <li class="ra-tab2" data-id="tab2">
                                            <input type="radio" id="tab2-rd" name="rd-tab">
                                            <label for="tab2-rd" class="rd-label"><span class="rd-txt">아니요, 아직 발송하지 않았습니다.</span></label>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="tab on" id="tab1">
                            <colgroup>
                                <col style="width: 290px;">
                                <col style="width: 610px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s body-border">
                            <tr>
                                <td class="body-td-tit1">반품상품 발송일</td>
                                <td class="body-td-txt2">
                                    <div class="cla">
                                        <input type="text" id="from_date" class="date_pick">
                                        <div class="cla-img1"></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-tit1">반품상품 택배사</td>
                                <td class="body-td-txt2">
                                    <select name="" id="" class="txt1-select">
                                        <option value="">선택</option>
                                        <option value="">택배사1</option>
                                        <option value="">택배사2</option>
                                        <option value="">택배사3</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td class="body-td-tit1">반풍상품 송장번호</td>
                                <td class="body-td-txt2">
                                    <input type="text" class="num-s">
                                    <input type="checkbox" id="ch-box">
                                    <label for="ch-box">
                                        <span class="ch-display">송장번호 없이 반품신청</span>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="tab" id="tab2">
                            <colgroup>
                                <col style="width: 290px;">
                                <col style="width: 610px;">
                            </colgroup>
                            <tbody class="sec3-body body-tr-s body-border">
                            <tr>
                                <td class="body-td-tit1">수령인</td>
                                <td class="body-td-txt2"><span>홍길동</span></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit1">연락처</td>
                                <td class="body-td-txt2"><span>010</span><span class="td-txt-un"> - </span><span>1234</span><span class="td-txt-un"> - </span><span>1234</span></td>
                            </tr>
                            <tr>
                                <td class="body-td-tit1">주소</td>
                                <td class="body-td-txt2"><span>06643 서울특별시 서초구 서리풀길 4 영호빌딩 4층</span><button class="sec-but">주소지 변경</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec4">
                        <p class="sec-h1">결제 정보</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 267px">
                                <col style="width: 180px;">
                                <col style="width: 267px">
                            </colgroup>
                            <tbody class="sec4-body body-tr-s body-border">
                            <tr>
                                <td class="body-td-tit">주문금액</td>
                                <td class="body-td-txt2"><span>3,099,000</span>원</td>
                                <td class="body-td-tit">상품금액</td>
                                <td class="body-td-txt2"><span>3,099,000</span>원</td>
                            </tr>
                            <tr>
                                <td class="body-td-tit">결제금액</td>
                                <td class="body-td-txt2 txt-color"><span>3,099,000</span>원</td>
                                <td class="body-td-tit">결제수단</td>
                                <td class="body-td-txt2"><span>하나체크카드</span> / <span>일시불</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec5">
                        <p class="sec-h1">환불 계좌</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 110px;">
                                <col style="width: 610px">
                            </colgroup>
                            <tbody class="sec5-body body-border">
                            <tr>
                                <td class="body-td-tit" rowspan="3">환불계좌</td>
                                <td class="body-td-txt2 pad-top">은행명</td>
                                <td class="pad-top">
                                    <select name="" id="" class="select-op">
                                        <option value="">은행을 선택해주세요.</option>
                                        <option value="">은행1</option>
                                        <option value="">은행2</option>
                                        <option value="">은행3</option>
                                        <option value="">은행4</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-txt2">계좌번호</td>
                                <td>
                                    <input type="text" placeholder="1234-12-12312356" class="select-op">
                                </td>
                            </tr>
                            <tr>
                                <td class="body-td-txt2 pad-bottom">예금주</td>
                                <td class="pad-bottom">
                                    <input type="text" placeholder="홍길동" class="select-op">
                                    <button class="sec-but">계좌인증</button>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec6">
                        <button type="submit">신청</button>
                        <button>이전</button>
                    </div>
                </form>
            </div>
        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>