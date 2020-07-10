<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>

    <main class="clearfix">
        <div class="header-top">
            <p>거래명세서</p>
        </div>
        <div class="body-mar">
            <table>
                <p class="body-tit">거래명세표</p>
                <colgroup>
                    <col style="width: 25px;">
                    <col style="width: 80px;">
                    <col style="width: 142px;">
                    <col style="width: 80px;">
                    <col style="width: 142px;">
                    <col style="width: 25px;">
                    <col style="width: 80px;">
                    <col style="width: 142px;">
                    <col style="width: 80px;">
                    <col style="width: 143px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td rowspan="4">공<br>급<br>자</td>
                        <td>사업자<br>등록번호</td>
                        <td colspan="3"><span>487-88-01223</span></td>
                        <td rowspan="4">공<br>급<br>받<br>는<br>자</td>
                        <td>성명</td>
                        <td colspan="3"><span>${userInfo.username}</span></td>
                    </tr>
                    <tr>
                        <td>상호<br>(법인명)</td>
                        <td><span>원조이라이프</span></td>
                        <td>성명</td>
                        <td><span>김수현</span></td>
                        <td>핸드폰번호</td>
                        <td colspan="3"><span>${userInfo.phone}</span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>사업장<br>주소</td>
                        <td colspan="3"><span>(우:1605-1) 서울시 서초구 서리풀길4, 4층<br> (서초동 영호빌딩)</span></td>
                        <td rowspan="2">주소</td>
                        <td rowspan="2" colspan="3">(${detail.postcode}) ${detail.roadAddress} ${detail.extraAddress}<span></span></td>
                    </tr>
                    <tr>
                        <td>업태</td>
                        <td><span>도소매업외</span></td>
                        <td>종목</td>
                        <td><span>전자상거래업외</span></td>
                        <!-- <td>업태</td>
                        <td><span><input type="text"></span></td>
                        <td>종목</td>
                        <td><span><input type="text"></span></td> -->
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 105px;">
                    <col style="width: 364px;">
                    <col style="width: 105px;">
                    <col style="width: 222px;">
                    <col style="width: 143px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td>거래일자</td>
                        <td>상품명</td>
                        <td>수량</td>
                        <td>상품가격</td>
                        <td>비고</td>
                    </tr>
                    <c:forEach var="list" items="${paymentBundleList}">
                    	<tr>
	                        <td><span><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></span></td>
	                        <td><span>${list.product_name}</span></td>
	                        <td><span>${list.payment_order_quantity}</span></td>
	                        <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</span></td>
	                        <td><span></span></td>
	                    </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td colspan="3">실제 총 결제 금액</td>
                        <td colspan="2"><span><fmt:formatNumber value="${detail.payment}" groupingUsed="true" />원</span></td>
                    </tr>
                </tbody>
            </table>
            <p class="txt-p">* 거래명세표는 원조이라이프의 거래내역을 보여주며 세금계산서와 같은 법적 효력은 없습니다.</p>
            <p class="txt-p">* 부가세 신고용 증빙은 현금영수증이나 신용카드전표를 활용하시기 바랍니다.</p>
            <div class="but-box">
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