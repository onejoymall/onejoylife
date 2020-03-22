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
                    <p class="sec1-h1">배송지 관리</p>
                    <div class="r-sec1">
                        <div class="sec1-ck">
                            <p class="ck-p on" data-p="sec-ck1">국내 배송주소</p>
                            <p class="ck-p" data-p="sec-ck2">해외 배송주소</p>
                        </div>
                        <p class="sec1-p">상품 구매 시 사용하실 배송지 정보를 관리하실 수 있습니다.</p>
                        <table class="tab on" id="sec-ck1">
                            <colgroup>
                                <col style="width: 115px;">
                                <col style=" width: 115px;">
                                <col style="width: 130px;">
                                <col style=" width: 359px;">
                                <col style="width: 175px;">
                            </colgroup>
                            <thead>
                            <tr class="sec1-tr">
                                <td>선택</td>
                                <td>배송지명</td>
                                <td>받는사람</td>
                                <td>주소</td>
                                <td>연락처</td>
                            </tr>
                            </thead>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td>
                                    <input type="radio" id="1-ra1" name="sec-ra">
                                    <label for="1-ra1" class="ra-icon"></label>
                                </td>
                                <td>회사</td>
                                <td>홍길동<span class="td-clolr">(기본)</span></td>
                                <td><span>06643 서울특별시 서초구 서리풀길 4 영호빌딩 4층</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="1-ra2" name="sec-ra">
                                    <label for="1-ra2" class="ra-icon"></label>
                                </td>
                                <td>회사</td>
                                <td>홍길동<span class="td-clolr"></span></td>
                                <td><span>06643 서울특별시 서초구 서리풀길 4 영호빌딩 4층</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="1-ra3" name="sec-ra">
                                    <label for="1-ra3" class="ra-icon"></label>
                                </td>
                                <td>회사</td>
                                <td>홍길동<span class="td-clolr"></span></td>
                                <td><span>06643 서울특별시 서초구 서리풀길 4 영호빌딩 4층</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="1-ra4" name="sec-ra">
                                    <label for="1-ra4" class="ra-icon"></label>
                                </td>
                                <td>회사</td>
                                <td>홍길동<span class="td-clolr"></span></td>
                                <td><span>06643 서울특별시 서초구 서리풀길 4 영호빌딩 4층</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="1-ra5" name="sec-ra">
                                    <label for="1-ra5" class="ra-icon"></label>
                                </td>
                                <td>회사</td>
                                <td>홍길동<span class="td-clolr"></span></td>
                                <td><span>06643 서울특별시 서초구 서리풀길 4 영호빌딩 4층</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>

                            </tbody>
                        </table>
                        <table class="tab" id="sec-ck2">
                            <colgroup>
                                <col style="width: 115px;">
                                <col style=" width: 115px;">
                                <col style="width: 130px;">
                                <col style=" width: 359px;">
                                <col style="width: 175px;">
                            </colgroup>
                            <thead>
                            <tr class="sec1-tr">
                                <td>선택</td>
                                <td>배송지명</td>
                                <td>받는사람</td>
                                <td>주소</td>
                                <td>연락처</td>
                            </tr>
                            </thead>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td>
                                    <input type="radio" id="2-ra1" name="sec-ra2">
                                    <label for="2-ra1" class="ra-icon"></label>
                                </td>
                                <td>COMPANY</td>
                                <td>GILDONGHONG<span class="td-clolr">(기본)</span></td>
                                <td><span>19950 E WALNUT DR N, WALNUT, CA 91789,<br>SCHENECTADY, NEW YORK 12345 US</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="2-ra2" name="sec-ra2">
                                    <label for="2-ra2" class="ra-icon"></label>
                                </td>
                                <td>COMPANY</td>
                                <td>GILDONGHONG<span class="td-clolr"></span></td>
                                <td><span>19950 E WALNUT DR N, WALNUT, CA 91789,<br>SCHENECTADY, NEW YORK 12345 US</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="2-ra3" name="sec-ra2">
                                    <label for="2-ra3" class="ra-icon"></label>
                                </td>
                                <td>COMPANY</td>
                                <td>GILDONGHONG<span class="td-clolr"></span></td>
                                <td><span>19950 E WALNUT DR N, WALNUT, CA 91789,<br>SCHENECTADY, NEW YORK 12345 US</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="2-ra4" name="sec-ra2">
                                    <label for="2-ra4" class="ra-icon"></label>
                                </td>
                                <td>COMPANY</td>
                                <td>GILDONGHONG<span class="td-clolr"></span></td>
                                <td><span>19950 E WALNUT DR N, WALNUT, CA 91789,<br>SCHENECTADY, NEW YORK 12345 US</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="radio" id="2-ra5" name="sec-ra2">
                                    <label for="2-ra5" class="ra-icon"></label>
                                </td>
                                <td>COMPANY</td>
                                <td>GILDONGHONG<span class="td-clolr"></span></td>
                                <td><span>19950 E WALNUT DR N, WALNUT, CA 91789,<br>SCHENECTADY, NEW YORK 12345 US</span></td>
                                <td><span>010-123-1234</span><br><span>010-123-01234</span></td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <p>선택주소지 수정</p>
                        <p>선택주소지 삭제</p>
                    </div>
                    <div class="r-sec3">
                        <button type="submit">새 배송지 등록</button>
                        <button>기존배송지로 설정</button>
                    </div>
                </form>
            </div>

        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>