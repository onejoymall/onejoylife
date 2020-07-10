<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>

    <main class="clearfix">
    <form id="taxInvoiceForm" name="taxInvoiceForm">
    	<input type="hidden" name="order_no" value="${param.order_no}"/>
    	<input type="hidden" name="amount_total" value="${supply_total}"/>
    	<input type="hidden" name="tax_total" value="${tax_total}"/>
    	<input type="hidden" name="total_amount" value="${supply_total + tax_total}"/>
    	<input type="hidden" name="reg_date" value="<fmt:formatDate value="${detail.reg_date}" pattern="yyyyMMdd"/>"/>
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
                           <input type="radio" name="tax_type" id="vat1" value=1>
                           <label for="vat1">과세</label>
                           <input type="radio" name="tax_type" id="vat2" value=2 checked>
                           <label for="vat2">영세율</label>
                       </td>
                       <th class="tr-tit">공급받는자 구분</th>
                       <td>
                           <input type="radio" name="invoicee_party_type" id="buyer1" value="corp">
                           <label for="buyer1">사업자</label>
                           <input type="radio" name="invoicee_party_type" id="buyer2" value="person" checked>
                           <label for="buyer2">개인</label>
                           <input type="radio" name="invoicee_party_type" id="buyer3" value="foreigner">
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
                           <input type="text" id="volume" name="kwon">
                           <label for="volume">권</label>
                           <input type="text" id="issue" name="ho">
                           <label for="issue">호</label>
                       </td>
                       <th>일련번호</th>
                       <td><input type="text" id="number" name="serial_num"></td>
                   </tr>
                    <tr class="tr-tit">
                        <td rowspan="5">공<br>급<br>자</td>
                        <td>등록번호</td>
                        <td colspan="3"><span>487-88-01223</span></td>
                        <td rowspan="5">공<br>급<br>받<br>는<br>자</td>
                        <td>등록번호</td>
                        <td colspan="3"><span><input type="text" name="corp_num"></span></td>
                    </tr>
                    <tr>
                        <td>상호(법인명)</td>
                        <td><span>주식회사 원조이</span></td>
                        <td>성명</td>
                        <td><span>김수현</span></td>
                        <td>상호(법인명)</td>
                        <td><span><input type="text" name="corp_name"></span></td>
                        <td>성명</td>
                        <td><span><input type="text" name="ceo_name"></span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>사업장 주소</td>
                        <td colspan="3"><span>서울시 서초구 서리풀길4, 4층<br> (서초동 영호빌딩)</span></td>
                        <td>사업장 주소</td>
                        <td colspan="3"><span><input type="text" name="addr"></span></td>
                    </tr>
                    <tr>
                        <td>업태</td>
                        <td><span>도소매업외</span></td>
                        <td>종목</td>
                        <td><span>전자상거래업외</span></td>
                        <td>업태</td>
                        <td><span><input type="text" name="biz_type"></span></td>
                        <td>종목</td>
                        <td><span><input type="text" name="biz_class"></span></td>
                    </tr>
                    <tr class="tr-tit">
                        <td>이메일</td>
                        <td colspan="3"><span>onejoy@onejoy.co.kr</span></td>
                        <td>이메일</td>
                        <td colspan="3"><span><input type="text" name="email"></span></td>
                    </tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width:70px">
                    <col style="width:40px">
                    <col style="width:40px">
                    <col style="width:84px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:26px">
                    <col style="width:159px">
                </colgroup>
                <thead class="tr-tit t-body1">
                	<tr>
	                    <th colspan="3">작성일자</th>
	                    <th colspan="12">공급가액</th>
	                    <th colspan="10">세액</th>
	                    <th rowspan="2">비고</th>
                    </tr>
                    <tr>
                    	<th>년</th>
                    	<th>월</th>
                    	<th>일</th>
                    	<th>공란수</th>
                    	<th>백</th>
                    	<th>십</th>
                    	<th>억</th>
                    	<th>천</th>
                    	<th>백</th>
                    	<th>십</th>
                    	<th>만</th>
                    	<th>천</th>
                    	<th>백</th>
                    	<th>십</th>
                    	<th>일</th>
                    	<th>십</th>
                    	<th>억</th>
                    	<th>천</th>
                    	<th>백</th>
                    	<th>십</th>
                    	<th>만</th>
                    	<th>천</th>
                    	<th>백</th>
                    	<th>십</th>
                    	<th>일</th>
                    </tr>
                </thead>
                <tbody class="t-body1">
					<tr>
						<td><fmt:formatDate value="${detail.reg_date}" pattern="yyyy"/></td>
						<td><fmt:formatDate value="${detail.reg_date}" pattern="MM"/></td>
						<td><fmt:formatDate value="${detail.reg_date}" pattern="dd"/></td>
						<td>${empty_count}</td>
						<td>${fn:substring(total_amount_str,0,1)}</td>
						<td>${fn:substring(total_amount_str,1,2)}</td>
						<td>${fn:substring(total_amount_str,2,3)}</td>
						<td>${fn:substring(total_amount_str,3,4)}</td>
						<td>${fn:substring(total_amount_str,4,5)}</td>
						<td>${fn:substring(total_amount_str,5,6)}</td>
						<td>${fn:substring(total_amount_str,6,7)}</td>
						<td>${fn:substring(total_amount_str,7,8)}</td>
						<td>${fn:substring(total_amount_str,8,9)}</td>
						<td>${fn:substring(total_amount_str,9,10)}</td>
						<td>${fn:substring(total_amount_str,10,11)}</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><input type="text" name="remark1"/></td>
					</tr>
                </tbody>
            </table>
            <table>
                <colgroup>
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 309px;">
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 110px;">
                    <col style="width: 130px;">
                    <col style="width: 130px;">
                    <col style="width: 100px;">
                </colgroup>
                <tbody class="t-body1">
                    <tr class="tr-tit">
                        <td>월</td>
                        <td>일</td>
                        <td>품목</td>
                        <td>규격</td>
                        <td>수량</td>
                        <td>단가</td>
                        <td>공급가액</td>
                        <td>세액</td>
                        <td>비고</td>
                    </tr>
                    <c:forEach items="${paymentBundleList}" var="list">
                    <input type="hidden" name="purchaseExpiry" value="<fmt:formatDate value="${detail.reg_date}" pattern="yyyyMMdd"/>"/>
                    <input type="hidden" name="name" value="${list.product_name}"/>
                    <input type="hidden" name="infomation" value="1"/>
                    <input type="hidden" name="chargeableUnit" value="${list.payment_order_quantity}"/>
                    <input type="hidden" name="unitPrice" value="${list.unit_price}"/>
                    <input type="hidden" name="amount" value="${list.unit_price}"/>
                    <input type="hidden" name="tax" value="0"/>
                    <input type="hidden" name="description" value=""/>
                    	<tr>
	                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="MM"/></span></td>
							<td><span><fmt:formatDate value="${detail.reg_date}" pattern="dd"/></span></td>
	                        <td><span>${list.product_name}</span></td>
	                        <td><span>1</span></td>
	                        <td><span>${list.payment_order_quantity}</span></td>
	                        <td><span><fmt:formatNumber value="${list.unit_price}" groupingUsed="true" /></span></td>
	                        <td><span><fmt:formatNumber value="${list.unit_price}" groupingUsed="true" /></span></td>
	                        <td><span><fmt:formatNumber value="0" groupingUsed="true" /></span></td>
	                        <td><span></span></td>
	                    </tr>
                    </c:forEach>
                    <input type="hidden" name="purchaseExpiry" value="<fmt:formatDate value="${detail.reg_date}" pattern="yyyyMMdd"/>"/>
                    <input type="hidden" name="name" value="배송비"/>
                    <input type="hidden" name="infomation" value=""/>
                    <input type="hidden" name="chargeableUnit" value="1"/>
                    <input type="hidden" name="unitPrice" value="${delivery_payment}"/>
                    <input type="hidden" name="amount" value="${delivery_payment}"/>
                    <input type="hidden" name="tax" value="0"/>
                    <input type="hidden" name="description" value=""/>
                    <tr>
                        <td><span><fmt:formatDate value="${detail.reg_date}" pattern="MM"/></span></td>
						<td><span><fmt:formatDate value="${detail.reg_date}" pattern="dd"/></span></td>
                        <td><span>배송비</span></td>
                        <td><span>1</span></td>
                        <td><span>1</span></td>
                        <td><span><fmt:formatNumber value="${delivery_payment}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="${delivery_payment}" groupingUsed="true" /></span></td>
                        <td><span><fmt:formatNumber value="0" groupingUsed="true" /></span></td>
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
                        <td rowspan="2">이 금액을 <input type="radio" id="receiving" name="purpose_type" value="1" checked><label for="receiving">영수</label><input type="radio" id="requesting" name="purpose_type"><label for="requesting" value="2">청구</label> 함</td>
                    </tr>
                    <tr>
                        <td><fmt:formatNumber value="${supply_total + tax_total}" groupingUsed="true" /></td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                </tbody>
            </table>
            <div>
            	<p>※ 개인인경우 등록번호에 주민번호 입력해주세요.</p>
            	<p>※ 외국인경우 등록번호에 외국인등록번호 또는 여권번호 입력해주세요.</p>
            	<p>※ 모든번호는 숫자만 입력해주세요.</p>
            </div>
            <div class="but-box">
                <button class="but2" type="button" onclick="window.print();">인쇄</button>
                <button class="but1" type="button" id="taxInvoceSendBtn">국세청 전송</button>
            </div>
        </div>
    </form>
    </main>
    <script>
    $(function(){
    	var order_no = '${param.order_no}';
    	$("input[name=tax_type]").on("input", function(){
    		if($("input[name=tax_type]:checked").val() == '1'){
    			location.href="/Popup/taxInvoice?order_no="+order_no;
    		}
    	});
    });
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>
    
    <script src='<c:url value="/assets/js/commonMgScript.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>