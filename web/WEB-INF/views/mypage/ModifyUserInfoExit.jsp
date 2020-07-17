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
                <p class="r-sec1">회원탈퇴</p>
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
                    <div class="sec3-p1">
                        <p>회원님 원조이몰을 이용하시는데 불편함이 있으셨나요?<br>이용 불편 및 각종 문의 사항은 고객센터(1811-9590)로 연락주시면 서비스개선을 위해 최선을 다하겠습니다.</p>
                    </div>
                    <div class="sec3-p2">
                        <p class="sec3-h">회원탈퇴 안내</p>
                        <div class="p2-txt">
                            <div class="txt1">
                                <p class="hyp">-</p>
                                <p>회원 탈퇴 시 회원님께서 보유 및 적립된 E-POINT, 쿠폰, 회원정보, 거래정보 등은 모두 소멸 및 삭제 되며, 또한 원조이몰에서 이루어지고 있던<br>OJST 또한 배당은 이루어지지 않습니다. 보유한 OJT 및 OJST 경우는 회원님의 지값 및 거래소를 통해 코인 거래는 이용 가능 합니다.</p>
                            </div>
                            <div class="txt1">
                                <p class="hyp">-</p>
                                <p>회원 탈퇴 후 1개월동안 회원의 성명, 생년월일, 아이디(ID), 비밀번호(Password), 이메일(E-mail), 연락처 정보를 보관하며,<br>로그기록, 접속아이피(IP)정보는 12개월간 보관합니다. 거래 정보가 있는 경우, 판매 거래 정보관리를 위하여 구매와 관련된 상품정보, 아이디,<br>거래 내역 등에 대한 기본정보는 탈퇴 후 5년간 보관합니다.</p>
                            </div>
                            <div class="txt1">
                                <p class="hyp">-</p>
                                <p>회원 탈퇴 후 재가입 시에는 신규 회원 가입으로 처리되며, 탈퇴 전의 회원정보와 거래정보 및 E-POINT, 쿠폰, 응모권, 내역 정보등 은 복구되지 않습니다.</p>
                            </div>
                            <div class="txt1">
                                <p class="hyp">-</p>
                                <p>탈퇴 후 기존과 동일한 이메일계정으로 가입하실 수 없으며, 새로운 이메일계정으로 가입 하셔야 하며, 회원가입 탈퇴 취소가 불가 하기에 유의 부탁드립니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <form action="">
                    <div class="r-sec4">
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 714px;">
                            </colgroup>
                            <tbody class="sec4-body">
                            <tr>
                                <td class="body-td-tit">탈퇴사유</td>
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
                                <td class="body-td-tit">고객님의 의견</td>
                                <td class="body-td-txt1">
                                    <textarea name="" id="" cols="97" rows="4" class="area-content" placeholder="원조이몰에 대한 불만사항이나 의견이 있으시면 개재 부탁드립니다."></textarea>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec5">
                        <p class="sec-p">회원정보확인</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 714px;">
                            </colgroup>
                            <tbody class="sec5-tbody">
                            <tr>
                                <td class="sec5-td-bor1">아이디 (이메일)</td>
                                <td class="body-td2 padding-left">
                                    <input type="text">
                                </td>
                            </tr>
                            <tr>
                                <td class="sec5-td-bor1">비밀번호</td>
                                <td class="body-td2 padding-left">
                                    <input type="password">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec6">
                        <input type="checkbox" id="ch-box">
                        <label for="ch-box"><p class="ch-txt"><span class="ch-color">(필수)</span> 회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.</p></label>
                    </div>
                    <div class="r-sec7">
                        <button type="submit">탈퇴</button>
                        <button>이전</button>
                    </div>
                </form>
            </div>

        </main>

    </div>
</div>
<c:import url="/layout/footer"/>

<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>