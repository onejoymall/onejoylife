<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">기본배송 관리</h2>

            </div>
            <div class="goods-detail-wrap">
                <form:form id="defaultForm" name="defaultForm" commandName="detail">
                    <h3>배송 정보</h3>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>

                            <tr class="shipping-t-detail">
                                <th>배송 방법</th>
                                <td>
                                    <select name="product_delivery_type">
                                        <option value="A" <c:if test="${detail.product_delivery_type eq 'A' }">selected</c:if>>택배</option>
                                        <option value="B" <c:if test="${detail.product_delivery_type eq 'B' }">selected</c:if>>빠른등기</option>
                                        <option value="C" <c:if test="${detail.product_delivery_type eq 'C' }">selected</c:if>>일반등기</option>
                                        <option value="E" <c:if test="${detail.product_delivery_type eq 'E' }">selected</c:if>>퀵배송</option>
                                        <option value="F" <c:if test="${detail.product_delivery_type eq 'F' }">selected</c:if>>기타</option>
                                        <option value="G" <c:if test="${detail.product_delivery_type eq 'G' }">selected</c:if>>화물배송</option>
                                        <option value="H" <c:if test="${detail.product_delivery_type eq 'H' }">selected</c:if>>매장직접수령</option>
                                        <option value="I" <c:if test="${detail.product_delivery_type eq 'I' }">selected</c:if>>배송 필요 없음</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="shipping-t-detail">
                                <th>국내/해외 배송<span class="cc-red">&#40;필수&#41;</span></th>
                                <td>
                                    <select name="product_delivery_International_type">
                                       <option value="A" <c:if test="${detail.product_delivery_International_type eq 'A' }">selected</c:if>>국내 배송</option>
                                       <option value="B" <c:if test="${detail.product_delivery_International_type eq 'B' }">selected</c:if>>국내/해외 배송</option>
                                       <option value="C" <c:if test="${detail.product_delivery_International_type eq 'C' }">selected</c:if>>해외 배송</option>
                                   </select>
                                   <span class="cc">* 국내 배송을 포함하지 않은 단독 해외 배송은 해외 쇼핑몰에서만 사용할 수 있습니다.</span>
                                </td>
                            </tr>
                            <tr class="shipping-t-detail">
                                <th>배송 지역</th>
                                <td>
                                    <input type="text" name="product_delivery_locale" id="shipping-area2" value="${detail.product_delivery_locale}"/>
<%--                                    <input type="text" id="shipping-area2" name="product_delivery_locale" placeholder="ex) 전국">--%>
                                    <span class="cc">* 최대 40byte까지만 등록됩니다.</span>
                                </td>
                            </tr>
                            <tr class="shipping-t-detail" >
                                <th>배송비 선결제 설정<span class="cc-red">&#40;필수&#41;</span></th>
                                <td>
                                    <select name="product_delivery_payment_type">
                                       <option value="C" <c:if test="${detail.product_delivery_payment_type eq 'C' }">selected</c:if>>착불</option>
                                       <option value="P" <c:if test="${detail.product_delivery_payment_type eq 'P' }">selected</c:if>>선결제</option>
                                       <option value="B" <c:if test="${detail.product_delivery_payment_type eq 'B' }">selected</c:if>>선결제/착불</option>
                                   </select>
                                </td>
                            </tr>
                            <tr class="shipping-t-detail" >
                                <th>배송 기간</th>
                                <td>
                                   <p class="cc2">1부터 99까지의 숫자를 사용해 입력합니다.</p>
                                    <input type="text" id="shipping-period" name="product_delivery_date" value="${detail.product_delivery_date}" placeholder="ex) 배송 기간이 2~4일 걸릴 경우 '2|4'라고 입력">
                                </td>
                            </tr>
                            <tr class="shipping-fee-tr shipping-t-detail" >
                                <th>배송비 구분</th>
                                <td>
                                    <select name="product_delivery_payment_class" id="shipping-fee">
                                       <option value="T" <c:if test="${detail.product_delivery_payment_class eq 'T' }">selected</c:if>>배송비 무료</option>
                                       <option value="R" <c:if test="${detail.product_delivery_payment_class eq 'R' }">selected</c:if>>고정 배송비 사용</option>
                                       <option value="M" <c:if test="${detail.product_delivery_payment_class eq 'M' }">selected</c:if>>구매 금액에 따른 부과</option>
                                       <option value="D" <c:if test="${detail.product_delivery_payment_class eq 'D' }">selected</c:if>>구매 금액별 차등 배송료 사용</option>
                                       <option value="W" <c:if test="${detail.product_delivery_payment_class eq 'W' }">selected</c:if>>상품 무게별 차등 배송료 사용</option>
                                       <option value="C" <c:if test="${detail.product_delivery_payment_class eq 'C' }">selected</c:if>>상품 수량별 차등 배송료 사용</option>
                                       <option value="N" <c:if test="${detail.product_delivery_payment_class eq 'N' }">selected</c:if>>상품 수량에 비례하여 배송료 부과</option>
                                   </select>
                                   <span class="cc">* 옵션을 새로 선택하면 상세 설정 내역이 초기화됩니다.</span>
                                </td>
                            </tr>
                            <c:if test="${detail.product_delivery_payment_class eq 'R' }">
                            <tr class="shippingFee-detail-wrap shipping-t-detail "><th>배송비 상세 설정</th><td>배송비 <input type="text" name="product_delivery_payment" value="${detail.product_delivery_payment}"> 원을 고정적으로 부과함.</td></tr>'
                            </c:if>
                            <c:if test="${detail.product_delivery_payment_class eq 'M' }">
                            <tr class="shippingFee-detail-wrap shipping-t-detail "><th>배송비 상세 설정</th><td><p class="cc2">구매 금액이 30,000원 미만일 때 배송비 2,500원을 부과하려면 30000|2500 입력</p><input type="text" id="shippingFee-detail" name="product_delivery_payment" placeholder="ex) 30000|2500"  value="${detail.product_delivery_payment}"></td></tr>
                            </c:if>
                            <c:if test="${detail.product_delivery_payment_class eq 'D' }">
                            <tr class="shippingFee-detail-wrap shipping-t-detail  long"><th>배송비 상세 설정</th><td><p class="cc2">20,000원 이상~30,000원 미만일 때 배송비 2,000원을 부과하고 30,000원 이상~50,000원 미만일 때 배송비 1,000원을 부과하려면<br>20000|30000|2000//30000|50000|1000 입력</p><input type="text"  name="product_delivery_payment" placeholder="ex) 20000|30000|2000//30000|50000|1000" value="${detail.product_delivery_payment}"></td></tr>
                            </c:if>
                            <c:if test="${detail.product_delivery_payment_class eq 'W' }">
                            <tr class="shippingFee-detail-wrap shipping-t-detail  long"><th>배송비 상세 설정</th><td><p class="cc2">3kg 이상~5kg 미만일 때 배송비 2,000원을 부과하고 5kg 이상~7kg 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text"  name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000" value="${detail.product_delivery_payment}"></td></tr>
                            </c:if>
                            <c:if test="${detail.product_delivery_payment_class eq 'C' }">
                            <tr class="shippingFee-detail-wrap shipping-t-detail  long"><th>배송비 상세 설정</th><td><p class="cc2">3개 이상~5개 미만일 때 배송비 2,000원을 부과하고 5개 이상~7개 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text" i name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000" value="${detail.product_delivery_payment}"></td></tr>
                            </c:if>
                            <c:if test="${detail.product_delivery_payment_class eq 'N' }">
                            <tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>주문 금액에 상관 없이 수량에 따라 배송료 <input type="text" name="product_delivery_payment" value="${detail.product_delivery_payment}">원을 부과함.</td></tr>
                            </c:if>
                            <tr class="shipping-f-detail">
                                <th>스토어픽업 설정</th>
                                <td>
                                    <input type="radio" id="goods-storePickup-y" name="product_delivery_store_pickup" value="Y" <c:if test="${detail.product_delivery_store_pickup eq 'Y' }">checked</c:if>>
                                    <label for="goods-storePickup-y">사용함</label>
                                    <input type="radio" id="goods-storePickup-n" name="product_delivery_store_pickup" value="N" <c:if test="${detail.product_delivery_store_pickup eq 'N' }">checked</c:if>>
                                    <label for="goods-storePickup-n">사용 안 함</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3>반품주소 설정</h3>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>

                            <tr class="shipping-t-detail">
                                <th>반품주소</th>
                                <td>
                                    <textarea name="refund_value" id="summernote">${detail.refund_value}</textarea>
                                </td>
                            </tr>
                            <%-- <tr>
                            	<td>
                                    <input type="hidden" id="roadAddress" name="refund_roadAddress" class="ad-input" value="${detail.refund_roadAddress}">
                                    <input type="text" id="jibunAddress" name="refund_jibunAddress" class="ad-input" placeholder="주소" value="${detail.refund_jibunAddress}">
                                </td>
                            </tr>
                            <tr>
                            	<td>
                                    <input type="text" id="extraAddress" name="refund_extraAddress" class="ad-input" placeholder="상세주소" value="${detail.refund_extraAddress}">
                                </td>
                            </tr> --%>
                        </tbody>
                    </table>
                    
                    <h3>출고지 설정</h3>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>

                            <tr class="shipping-t-detail">
                                <th>출고지 주소</th>
                                <td>
                                    <textarea name="forward_value" id="summernote2">${detail.forward_value}</textarea>
                                </td>
                            </tr>
                           <%--  <tr>
                            	<td>
                                    <input type="hidden" id="roadAddress" name="roadAddress" class="ad-input" value="${detail.forward_roadAddress}">
                                    <input type="text" id="jibunAddress" name="jibunAddress" class="ad-input" placeholder="주소" value="${detail.forward_jibunAddress}">
                                </td>
                            </tr>
                            <tr>
                            	<td>
                                    <input type="text" id="extraAddress" name="extraAddress" class="ad-input" placeholder="상세주소" value="${detail.forward_extraAddress}">
                                </td>
                            </tr> --%>
                        </tbody>
                    </table>
                    
                    <h3>희망 배송일/시간 설정</h3>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>

                            <tr class="shipping-t-detail">
                                <th>배송일 설정</th>
                                <td>
                                    <input type="radio" name="hope_delivery_date_yn" value="Y" <c:if test="${detail.product_delivery_hope_date_yn eq 'Y' }">checked</c:if>>사용
                                    <input type="radio" name="hope_delivery_date_yn" value="N" <c:if test="${detail.product_delivery_hope_date_yn eq 'N' }">checked</c:if>>사용안함
                                </td>
                            </tr>
                            <tr>
                            	<th>배송시간 설정</th>
                            	<td>
                                    <input type="radio" name="hope_delivery_time_yn" value="Y" <c:if test="${detail.product_delivery_hope_time_yn eq 'Y' }">checked</c:if>>사용
                                    <input type="radio" name="hope_delivery_time_yn" value="N" <c:if test="${detail.product_delivery_hope_time_yn eq 'N' }">checked</c:if>>사용안함
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3>묶음배송</h3>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>

                            <tr class="shipping-t-detail">
                                <th>묶음배송 사용</th>
                                <td>
                    				<input type="radio" name="bundle_delivery_yn" value="Y" <c:if test="${detail.product_delivery_bundle_yn eq 'Y' }">checked</c:if>>사용
                                    <input type="radio" name="bundle_delivery_yn" value="N" <c:if test="${detail.product_delivery_bundle_yn eq 'N' }">checked</c:if>>사용안함
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <button type="button" name="detail" class="btn-red" id="systemDeliveryFormSubmit">저장하기</button>
                </form:form>
            </div>
        </div>
    </main>
    <script type="text/javascript" src="/assets/js/goods-add.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
    <script type="text/javascript" src="/assets/js/index.js"></script>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>