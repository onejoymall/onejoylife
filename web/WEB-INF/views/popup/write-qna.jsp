<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>

    <header>
        <h2>상품 Q&amp;A 작성</h2>
    </header>
    <form id="defaultForm" name="defaultForm" method="POST">
        <input type="hidden" name="product_cd" value="${param.product_cd}">
        <div class="main-section">
<%--            <p class="goods-name">LG휘센 2015년형 크라운2 스페셜 스탠드형 에어컨</p>--%>
            <table>
                <colgroup>
                    <col style="width: 120px;">
                    <col style="width: 714px;">
                </colgroup>
                <tbody class="sec1-tbody">
                    <tr>
                        <td class="sec1-td-bor1">제목</td>
                        <td class="body-td2 padding-left">
                            <input type="text" name="qna_title" placeholder="50자 이내로 입력해주세요" maxlength="50">
                            <input name="secret" id="secret" type="checkbox">
                            <label for="secret">비공개</label>
                            <input type="hidden" name="qna_open_type" value="F">
                        </td>
                    </tr>
                    <tr>
                        <td class="sec1-td-bor1">문의 유형</td>
                        <td class="body-td2 padding-left">
                            <select name="qna_type" id="qna_type">
                                <option value="O">주문/결제</option>
                                <option value="C">교환/반품/환불</option>
                                <option value="D">배송</option>
                                <option value="G">기타</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="sec1-td-bor1">내용</td>
                        <td class="body-td2 padding-left">
                            <textarea name=qna_memo placeholder="500자 이내로 입력해주세요" style="resize:none;" maxlength="500"></textarea>
                            <p class="txt-counting">&#40;<span>0</span>/500&#41;</p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="button-box">
                <button type="button" id="qnaWriteSubmit">등록</button>
                <button type="button" class="grey-button" onclick="window.close()">취소</button>
            </div>

        </div>
    </form>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>