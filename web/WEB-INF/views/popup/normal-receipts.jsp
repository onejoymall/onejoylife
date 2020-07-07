<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>

    <main class="clearfix">
        <div class="header-top">
            <p>구매영수증</p>
        </div>
        <div class="body-mar">
            <table>
                <colgroup>
                    <col style="width: 120px;">
                    <col style="width: 570px;">
                </colgroup>
                <tbody class="body-tr">
                    <tr>
                       <td>상점주문번호<br><span>(ORDER NO.)</span></td>
                       <td><span>${detail.order_no}</span></td>
                    </tr>
                    <tr>
                        <td>거래일시<br><span>(TRANS DATE)</span></td>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd"/></span></td>
                     </tr>
                     <tr>
                        <td>상품명<br><span>(DESCRIPTION)</span></td>
                        <td><span>${detail.product_order_name}</span></td>
                     </tr>
                     <tr>
                        <td>합계<br><span>(TOTAL)</span></td>
                        <td><span><fmt:formatNumber value="${detail.payment}" groupingUsed="true" />원</span></td>
                     </tr>
                     <tr>
                        <td>회사명<br><span>(COMPANY NAME)</span></td>
                        <td><span>ONEJOY</span></td>
                     </tr>
                     <tr>
                        <td>서명<br><span>(SIGNATURE)</span></td>
                        <td><span>${userInfo.username}</span></td>
                     </tr>
                </tbody>
            </table>
            <p>구매 영수증은 세금계산서 등 증빙서류로 활용할 수 없습니다.</p>
            <div class="mar-but">
                <button class="but1" type="button" onclick="window.print();">인쇄</button>
                <button class="but2" type="button" onclick="self.close();">확인</button>
            </div>
        </div>
        <div class="mar-f">
            <div class="mar-txt">
                <div class="logo-icon"><a href="../index.html"></a></div>
                <div class="left-bar"></div>
                <div class="txt-box">
                    <p>서울시 서초구 서리풀길4, 4층 (서초동 영호빌딩)<br>
                        대표이사 : 김수현<br>
                        사업자등록번호 : 478-88-01223<br>
                        문의전화 : 1811-9500
                    </p>
                </div>
            </div>
         </div>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>