<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>

    <main class="clearfix">
        <div class="header-top">
            <p>세금계산서 작성</p>
        </div>
        <div class="body-mar">
           <table>
               <colgroup>
                   <col style="width:120px">
                   <col style="width:349px">
                   <col style="width:120px">
                   <col style="width:350px">
               </colgroup>
               <tbody class="t-body2">
                   <tr>
                       <th class="tr-tit">부가세 유형</th>
                       <td>
                           <input type="radio" name="vat" id="vat1">
                           <label for="vat1">과세</label>
                           <input type="radio" name="vat" id="vat2">
                           <label for="vat2">영세</label>
                       </td>
                       <th class="tr-tit">공급받는자 구분</th>
                       <td>
                           <input type="radio" name="buyer" id="buyer1">
                           <label for="buyer1">사업자</label>
                           <input type="radio" name="buyer" id="buyer2">
                           <label for="buyer2">개인</label>
                           <input type="radio" name="buyer" id="buyer3">
                           <label for="buyer3">외국인</label>
                       </td>
                   </tr>
               </tbody>
           </table>
            <table>
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
                   <tr class>
                       <td colspan="5">전자세금계산서 &#40;공급자 보관용&#41;</td>
                       <th colspan="2">책 번호</th>
                       <td>
                           <input type="text" id="volume" name="volume">
                           <label for="volume">권</label>
                           <input type="text" id="issue" name="issue">
                           <label for="issue">호</label>
                       </td>
                       <th>일련번호</th>
                       <td><input type="text" id="number"></td>
                   </tr>
                    <tr class="tr-tit">
                        <td rowspan="4">공<br>급<br>자</td>
                        <td>등록번호</td>
                        <td colspan="3"><span>487-88-01223</span></td>
                        <td rowspan="4">공<br>급<br>받<br>는<br>자</td>
                        <td>등록번호</td>
                        <td colspan="3"><span><input type="text"></span></td>
                    </tr>
                    <tr>
                        <td>상호(법인명)</td>
                        <td><span>원조이라이프</span></td>
                        <td>성명</td>
                        <td><span>김수현</span></td>
                        <td>상호(법인명)</td>
                        <td><span><input type="text"></span></td>
                        <td>성명</td>
                        <td><span><input type="text"></span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>주소</td>
                        <td colspan="3"><span>(우:1605-1) 서울시 서초구 서리풀길4, 4층<br> (서초동 영호빌딩)</span></td>
                        <td>주소</td>
                        <td colspan="3"><span><input type="text"></span></td>
                    </tr>
                    <tr>
                        <td>업태</td>
                        <td><span>원조이라이프</span></td>
                        <td>종목</td>
                        <td><span></span></td>
                        <td>업태</td>
                        <td><span><input type="text"></span></td>
                        <td>종목</td>
                        <td><span><input type="text"></span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width:150px">
                    <col style="width:170px">
                    <col style="width:160px">
                    <col style="width:459px">
                </colgroup>
                <thead class="tr-tit t-body1">
                    <th>작성일자</th>
                    <th>공급가액</th>
                    <th>세액</th>
                    <th>비고</th>
                </thead>
                <tbody class="t-body1">
                    <td>
                        <div class="cla">
                            <input type="text" id="from_date" class="date_pick">
                            <div class="cla-img1"></div>
                        </div>
                    </td>
                    <td><input type="text" id="v-supply" name="v-supply"></td>
                    <td><input type="text" id="tax-amount" name="tax-amount"></td>
                    <td><input type="text" id="remark" name="remark"></td>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 249px;">
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 110px;">
                    <col style="width: 110px;">
                    <col style="width: 110px;">
                    <col style="width: 100px;">
                    <col style="width: 100px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td>월</td>
                        <td>일</td>
                        <td>품목</td>
                        <td>규격</td>
                        <td>수량</td>
                        <td>단가<br>(VAT포함 원화)</td>
                        <td>공급가액</td>
                        <td>세액</td>
                        <td>합계</td>
                        <td>비고</td>
                    </tr>
                    <tr>
                        <td><span>3</span></td>
                        <td><span>14</span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span>1</span></td>
                        <td><span>18,000원</span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                    </tr>
                    <tr>
                        <td><span>3</span></td>
                        <td><span>14</span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span>1</span></td>
                        <td><span>18,000원</span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                    </tr>
                    <tr>
                        <td><span>3</span></td>
                        <td><span>14</span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span>1</span></td>
                        <td><span>18,000원</span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                        <td><span></span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 289px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td>합계금액</td>
                        <td>현금</td>
                        <td>수표</td>
                        <td>어음</td>
                        <td>외상미수금</td>
                        <td rowspan="2">이 금액을 <input type="radio" id="receiving" name="receiving"><label for="receiving">영수</label><input type="radio" id="requesting" name="receiving"><label for="requesting">청구</label> 함</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <div class="but-box">
                <button class="but2">인쇄</button>
                <button class="but1">국세청 전송</button>
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