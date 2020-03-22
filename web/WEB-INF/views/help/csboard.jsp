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
                <form action="" method="POST">
                    <div class="r-sec1">
                        <p class="sec1-h1">1:1 문의하기</p>
                        <p class="sec1-p1"><span>·</span> 문의하신 내용에 대한 답변은 질문 시 등록하신 이메일에서 확인하실 수 있습니다.</p>
                        <table>
                            <colgroup>
                                <col style="width: 160px;">
                                <col style="width: 914px;">
                            </colgroup>
                            <tbody class="sec1-tbody">
                            <tr class="name-box">
                                <td>이름</td>
                                <td><span>홍길동</span></td>
                            </tr>
                            <tr class="email-box">
                                <td>이메일 *</td>
                                <td>
                                    <input type="text" id="email-id" name="email-id"> @ <input type="text" id="email-2" name="email-2" readonly>
                                    <select id="email-3" name="email-3">
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="etc" selected>직접 입력</option>
                                    </select>
                                    <p class="ex">1:1 문의 답변을 수신하실 이메일 주소를 정확히 기입해주시기 바랍니다.</p>
                                </td>
                            </tr>
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
                                        <input type="tel" name="phoneNum-2" id="phoneNum-2">
                                        <span> - </span>
                                        <input type="tel" name="phoneNum-3" id="phoneNum-3">
                                        <div class="chk-box">
                                            <input type="checkbox" id="sms-chk" name="sms-chk">
                                            <label for="sms-chk">답변여부를 SMS로 받으시겠습니까?</label>
                                        </div>
                                    </div>

                                </td>
                            </tr>
                            <tr class="sort-box">
                                <td>문의 유형 *</td>
                                <td>
                                    <select name="sort" id="sort">
                                        <option value="선택">선택</option>
                                        <option value="주문결제">주문/결제</option>
                                        <option value="교환반품환불">교환/반품/환불</option>
                                        <option value="이벤트">이벤트</option>
                                        <option value="배송">배송</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="goods-box">
                                <td>문의 상품</td>
                                <td>
                                    <button type="button" class="inquire">주문 상품 조회</button>
                                    <span>159753258456</span>
                                </td>
                            </tr>
                            <tr class="title-box">
                                <td>문의 제목 *</td>
                                <td><input type="text" name="q-title" id="q-title"></td>
                            </tr>
                            <tr>
                                <td>문의 내용 *</td>
                                <td>
                                    <textarea name="q-contents" id="q-contents" style="resize:none;"></textarea>
                                    <p class="txt-counting">&#40;<span>0</span>/1000&#41;</p>
                                </td>
                            </tr>
                            <tr class="imagefile-box">
                                <td>이미지 첨부</td>
                                <td>
                                    <div class="fileBox">
                                        <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">
                                        <label for="uploadBtn" class="btn_file">파일찾기</label>
                                        <input type="file" id="uploadBtn" name="uploadBtn" class="uploadBtn">
                                        <span class="ex">이미지 첨부는 1개만 가능합니다. 5Mbyte 이하로 올려주세요.</span>
                                    </div>

                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p class="ex"><span class="bullet-point">·</span><span>쇼핑몰 관련 1:1 문의하기 입니다.<br>매장 이용관련 불편사항은<a href="">[원조이몰 고객지원센터]</a>를 이용하여 글을 남겨주세요.</span></p>
                    </div>
                    <div class="button-box">
                        <button type="submit">접수</button>
                        <button type="button">취소</button>
                    </div>
                </form>
            </div>

        </main>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

