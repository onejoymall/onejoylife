<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>

    <main class="clearfix">
        <div class="header-top">
            <p>신용카드</p>
        </div>
        <div class="body-mar">
            <table>
                <p class="body-tit">신용카드 매출전표</p>
                <colgroup>
                    <col style="width: 180px;">
                    <col style="width: 180px;">
                    <col style="width: 180px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td>승인번호</td>
                        <td>카드종류</td>
                        <td>카드번호</td>
                    </tr>
                    <tr>
                        <td><span>${impPayment.apply_num}</span></td>
                        <td><span>${impPayment.card_name}</span></td>
                        <td><span>${fn:substring(impPayment.card_number,0,4)}-${fn:substring(impPayment.card_number,4,6)}**-****-${fn:substring(impPayment.card_number,12,16)}</span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>결제일자</td>
                        <td>거래종류</td>
                        <td>할부</td>
                    </tr>
                    <tr>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd HH:mm:ss"/></span></td>
                        <td><span>신용승인</span></td>
                        <td>
	                        <span>
	                        	<c:if test="${impPayment.card_quota == 0}">일시불</c:if>
	                        	<c:if test="${impPayment.card_quota != 0}">${impPayment.card_quota}</c:if>
	                        </span>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 270px;">
                    <col style="width: 270px;">
                </colgroup>
                <tbody class="t-body2">
                    <tr class="tr-tit">
                        <td colspan="2" class="bor-non">상품명</td>
                    </tr>
                    <tr >
                        <td colspan="2" class="bor-non"><span>${impPayment.name}</span></td>
                    </tr>
                    <tr class="tr-tit">
                    	<td>주문번호</td>
                        <td>상점주문번호</td>
                    </tr>
                    <tr>
                        <td><span>${impPayment.imp_uid}</span></td>
                        <td><span>${impPayment.merchant_uid}</span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <p class="body-tit">판매자 정보</p>
                <colgroup>
                    <col style="width: 270px;">
                    <col style="width: 270px;">
                </colgroup>
                <tbody class="t-body2">
                    <tr class="tr-tit">
                        <td>가맹점명</td>
                        <td>대표자명</td>
                    </tr>
                    <tr>
                        <td><span>(주)원조이</span></td>
                        <td><span>김수현</span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>전화번호</td>
                        <td>사업자등록번호</td>
                    </tr>
                    <tr>
                        <td><span>1811-9590</span></td>
                        <td><span>487-88-01223</span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td colspan="2" class="bor-non">주소</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="bor-non"><span>(우:1605-1) 서울시 서초구 서리풀길4, 4층 (서초동 영호빌딩)</span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <p class="body-tit">금액</p>
                <colgroup>
                    <col style="width: 270px;">
                    <col style="width: 270px;">
                </colgroup>
                <tbody class="t-body2">
                    <tr>
                        <td class="tr-tit">승인금액</td>
                        <td><span><fmt:formatNumber value="${impPayment.amount}" groupingUsed="true" /></span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">공급가액</td>
                        <td><span><fmt:formatNumber value="${impPayment.amount * 0.89}" groupingUsed="true" /></span></td>
                    </tr>
                    <tr>
                        <td class="tr-tit">부가세액</td>
                        <td><span><fmt:formatNumber value="${impPayment.amount * 0.11}" groupingUsed="true" /></span></td>
                    </tr>
                    <tr class="tr-color">
                        <td class="tr-tit">합계</td>
                        <td><span><fmt:formatNumber value="${impPayment.amount}" groupingUsed="true" /></span></td>
                    </tr>
                </tbody>
            </table>
            <p class="txt-p">본 영수증은 (주)원조이에서 발행한 것이며, 부가가치세법 제 46조에 따른 신용카드 매출전표입니다.</p>
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