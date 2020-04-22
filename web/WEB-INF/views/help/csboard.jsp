<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-01
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main class="clearfix">
            <%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
            <div class="right-contain">
                <form id="form1" name="form1" action="/Board/boardSave" method="post" enctype="multipart/form-data">
                    <div class="r-sec1">
                        <p class="sec1-h1">1:1 문의</p>
                        <p class="sec1-p1"><span>·문의 하기</span></p>
                        <table>
                            <colgroup>
                                <col style="width: 160px;">
                                <col style="width: 914px;">
                            </colgroup>
                            <tbody class="sec1-tbody">
                            <tr class="name-box">
                                <td>이름 *</td>
                                <td><input type="text" id="brdwriter" name="brdwriter" size="20" maxlength="20" value="<c:out value="${boardInfo.brdwriter}"/>"></td>
                            </tr>
                            <tr class="name-box">
                                <td>이메일 *</td>
                                <td>
                                    <input type="text" id="email" name="email" value="${sessionScope.email}">
                                </td>
                            </tr>
                            <c:if test="${empty sessionScope.login}">
                                <tr class="name-box">
                                    <td>비밀번호 *</td>
                                    <td>
                                        <input type="password" id="password" name="password">
                                    </td>
                                </tr>
                            </c:if>

                            <tr class="phone-box">
                                <td>휴대폰 번호</td>
                                <td>
                                    <div>
                                        <select name="phoneNum-1" id="phoneNum-1">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="017">017</option>
                                            <option value="019">019</option>
                                        </select>
                                        <span> - </span>
                                        <input type="tel" name="phoneNum-2" id="phoneNum-2" maxlength="4" class="phoneNum">
                                        <span> - </span>
                                        <input type="tel" name="phoneNum-3" id="phoneNum-3" maxlength="4" class="phoneNum">
                                        <input type="hidden" name="phone">
<%--                                        <div class="chk-box">--%>
<%--                                            <input type="checkbox" id="sms-chk" name="sms-chk">--%>
<%--                                            <label for="sms-chk">답변여부를 SMS로 받으시겠습니까?</label>--%>
<%--                                        </div>--%>
                                    </div>

                                </td>
                            </tr>
                            <tr class="sort-box">
                                <td>문의 유형 *</td>
                                <td>
                                    <select name="question_type" id="question_type">
                                        <option value="">선택</option>
                                        <option value="S">대량주문</option>
                                        <option value="O">주문/결제</option>
                                        <option value="C">교환/반품/환불</option>
                                        <option value="E">이벤트</option>
                                        <option value="D">배송</option>
                                        <option value="G">기타</option>
                                    </select>
                                </td>
                            </tr>
<%--                            <tr class="goods-box">--%>
<%--                                <td>문의 상품</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="inquire">주문 상품 조회</button>--%>
<%--                                    <span>159753258456</span>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                            <tr class="title-box">
                                <td>문의 제목 *</td>
                                <td><input type="text" id="brdtitle" name="brdtitle" size="70" maxlength="250" value="<c:out value="${boardInfo.brdtitle}"/>"></td>
                            </tr>
                            <tr>
                                <td>문의 내용 *</td>
                                <td>
                                    <textarea name="brdmemo" id="brdmemo" style="resize:none;"></textarea>
                                    <p class="txt-counting">&#40;<span>0</span>/1000&#41;</p>
                                </td>
                            </tr>
<%--                            <tr class="imagefile-box">--%>
<%--                                <td>이미지 첨부</td>--%>
<%--                                <td>--%>
<%--                                    <div class="fileBox">--%>
<%--                                        <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">--%>
<%--                                        <label for="uploadBtn" class="btn_file">파일찾기</label>--%>
<%--                                        <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">--%>
<%--                                        <span class="ex">이미지 첨부는 1개만 가능합니다. 5Mbyte 이하로 올려주세요.</span>--%>
<%--                                    </div>--%>

<%--                                </td>--%>
<%--                            </tr>--%>

                            </tbody>
                        </table>
                        <p class="ex"><span class="bullet-point">·</span><span>쇼핑몰 관련 1:1 문의하기 입니다.<br>매장 이용관련 불편사항은<a href="">[원조이몰 고객지원센터]</a>를 이용하여 글을 남겨주세요.</span></p>
                    </div>
                    <div class="button-box">
                        <button type="button" onclick="fn_formSubmit(${sessionScope.login});">접수</button>
                        <button type="button">취소</button>
                    </div>
                    <input type="hidden" name="bgno" value="<c:out value="${bgno}"/>">
                    <input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>">
                </form>
            </div>

        </main>
    </div>
</div>
<script>
    $('.phoneNum').on("keyup", function () {
        $('input[name=phone]').val($('#phoneNum-1').val()+"-"+$('#phoneNum-2').val()+"-"+$('#phoneNum-3').val());
    })
    $('#phoneNum-1').on("change", function () {
        $('input[name=phone]').val($('#phoneNum-1').val()+"-"+$('#phoneNum-2').val()+"-"+$('#phoneNum-3').val());
    })

</script>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

