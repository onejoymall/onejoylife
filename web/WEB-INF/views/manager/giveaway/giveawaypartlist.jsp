<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">경품 참여 관리</h2>
            <div class="main-hd-btn-wrap">
                <%--                <button type="button" name="detail">상품 등록</button>--%>
                <button type="button" class="uploadModalBtn"><i class="exel-ic"></i>일괄 수정</button>
            </div>
        </div>
        <div class="search-form">
            <form name="listSrcForm" id="listSrcForm" method="get">
                <div class="keyword-src-wrap">
                    <input type="text" class="keyword-src" name="keyword-src">
                    <button type="submit" class="keyword-src-button">검색</button>

                    <div class="src-filter-wrap">
                        <input type="checkbox" name="searchType" value="giveaway_name" id="check2" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'giveaway_name')}">checked</c:if>>
                        <label for="check2">경품명</label>
                        <input type="checkbox" name="searchType" value="giveaway_cd" id="check1" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'giveaway_cd')}">checked</c:if>>
                        <label for="check1">경품코드</label>
                    </div>
                </div>
                <table class="keyword-src-table">
                    <colgroup>
                        <col width="80px">
                        <col width="420px">
                        <col width="80px">
                        <col width="420px">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>당첨결과</th>
                        <td>
                            <select name="giveaway_play_status" >
                                <c:if test="${not empty getGiveSelectorList}">
                                    <option value="">선택</option>
                                    <c:forEach var="getGiveSelectorList" items="${getGiveSelectorList}" varStatus="status">
                                        <option value="${getGiveSelectorList.code_value}" <c:if test="${getGiveSelectorList.code_value eq param.giveaway_play_status}">selected</c:if>>${getGiveSelectorList.code_name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </td>
                        <th>응모일</th>
                        <td>
                            <div class="input-box2">
                                <div class="cla">
                                    <input type="text" id="start_date" name="start_date" class="date_pick" value="${param.start_date}">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p1"> ~ </p>
                                <div class="cla">
                                    <input type="text" id="end_date" name="end_date" class="date_pick" value="${param.end_date}">
                                    <div class="cla-img1"></div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td></td>
                        <th>추첨일</th>
                        <td>
                            <div class="input-box2">
                                <div class="cla">
                                    <input type="text" id="cast_start_date" name="cast_start_date" class="date_pick" value="${param.cast_start_date}">
                                    <div class="cla-img1"></div>
                                </div>
                                <p class="cla-p1"> ~ </p>
                                <div class="cla">
                                    <input type="text" id="cast_end_date" name="cast_end_date" class="date_pick" value="${param.cast_end_date}">
                                    <div class="cla-img1"></div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="goods-list-wrap giveaway-play-list-wrap">
            <div class="list-sort-wrap">
                <div class="left">
                	<button type="button" class="btn-default excelBtn" name="copy" data-id="giveawayPart"><i class="exel-ic"></i>다운로드</button>
                    <!-- <button type="button" class="btn-default" name="copy" id="listDelete">선택 삭제</button> -->
                    <%--                    <button type="button" class="btn-default" name="copy">선택 복사 등록</button>--%>
                    <%--                    <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button>--%>
                    <!-- <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>다운로드</button> -->
                </div>
                <%--                <div class="right">--%>
                <%--                    <select name="order" class="order-select">--%>
                <%--                        <option value="32">10개씩 보기</option>--%>
                <%--                        <option value="60">50개씩 보기</option>--%>
                <%--                        <option value="92">100개씩 보기</option>--%>
                <%--                    </select>--%>
                <%--                </div>--%>
            </div>
            <form name="defaultListForm" id="defaultListForm" method="POST">
                <input type="hidden" name="Pk" value="${Pk}">
                <input type="hidden" name="table_name" value="${table_name}">
                <table>
                    <colgroup>
                        <col width="2%">
                        <col width="18%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                        <td name="detail">이메일</td>
                        <td>경품코드</td>
                        <td>경품명</td>
                        <td name="detail">응모일</td>
                        <td>응모포인트</td>
                        <td>추첨일</td>
                        <td>당첨결과</td>
                        <td>관리</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty list}">
                        <c:forEach var="list" items="${list}" varStatus="status">
                            <tr>
                                <td>
                                    <input type="checkbox" id="chk" name="chk" value="${list.giveaway_play_id}">
                                    <input type="hidden" name="giveaway_cd" value="${list.giveaway_cd}">
                                </td>
                                <td>${list.email}</td>
                                <td>${list.giveaway_cd}</td>
                                <td>${list.giveaway_name}</td>
                                <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/> <fmt:formatDate value="${list.reg_date}" pattern="HH:mm"/></td>
                                <td><fmt:formatNumber value="${list.giveaway_payment_epoint}" groupingUsed="true" />P</td>
                                <td><fmt:formatDate value="${list.giveaway_winner_reg_date}" pattern="yyyy.MM.dd"/></td>
                                <c:if test="${empty list.giveaway_winner_reg_date && empty list.winner_id}">
                                    <td>
                                        <span>진행중</span>
                                    </td>
                                </c:if>
                                <c:if test="${not empty list.giveaway_winner_reg_date && empty list.winner_id}">
                                <td>
                                    <span>추첨완료</span>
                                </td>
                                </c:if>
                                <c:if test="${not empty list.giveaway_winner_reg_date && list.winner_id > 0}">
                                    <td>
                                        <span>당첨(${list.payment_status_name})</span>
                                    </td>
                                </c:if>
                                <td>
	                                <c:if test="${not empty list.giveaway_winner_reg_date && list.winner_id > 0 && not empty list.order_no}">
	                                    <button type="button" class="goods-list-btn"  onclick="selectPaymentG('${list.order_no}')">상세보기</button>
	                                    <button type="button" class="goods-list-btn"  onclick="withholding('${list.order_no}')">원천징수</button>
	                                </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    </tbody>
                </table>
            </form>
            <form id="form1" name="form1"  method="get">
                <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
            </form>
        </div>
    </div>
</main>

<!--모달팝업창-->
<div class="modal">
    <div class="modal-content">
        <div class="modal-header">
           <h2>주문 상세보기</h2>
            <button type="button" class="modal-close">×</button>
        </div>
        <form id="saveDelivery" name="saveDelivery">
        <div class="modal-body clearfix">
            <div class="goods-detail-wrap">
                <div class="right">
<%--                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>주문 정보 다운로드</button>--%>
                </div>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>
                                배송정보 입력
                            </th>
                            <td>
                                <select name="delivery_t_code">
                                    <option value="00">직접 배송</option>
                                <c:forEach var="companyList" items="${companyList}" varStatus="status">
                                    <option value="${companyList.Code}">${companyList.Name}</option>
                                </c:forEach>
                                </select>
                                <input type="text" name="delivery_t_invoice" placeholder="송장번호 입력">
                            </td>
                        </tr>

                        <tr>
                            <th>상점주문번호</th>
                            <td class="order_no"></td>
                        </tr>
                        <tr>
                            <th>주문번호</th>
                            <td class="imp_uid"></td>
                        </tr>
                        <tr>
                            <th>주문자</th>
                            <td class="order_user_email"></td>
                        </tr>
                        <tr>
                            <th>주문일</th>
                            <td class="reg_date"></td>
                        </tr>
                        <tr>
                            <th>주문자명</th>
                            <td class="order_user_name"></td>
                        </tr>
                        <tr>
                            <th>수취인</th>
                            <td class="delivery_user_name"></td>
                        </tr>
                        <tr>
                            <th>수취인 핸드폰번호</th>
                            <td class="delivery_user_phone"></td>
                        </tr>
                        <tr>
                            <th>수취인 전화번호</th>
                            <td class="delivery_user_tel"></td>
                        </tr>
                        <tr>
                            <th>수취인 주소</th>
                            <td>(<span class="postcode"></span>) <span class="roadAddress"></span> <span class="extraAddress"></span></td>
                        </tr>
                        <tr>
                            <th>배송메세지</th>
                            <td class="delivery_message"></td>
                        </tr>
                        <tr>
                            <th>배송일</th>
                            <td class="delivery_start_date"></td>
                        </tr>
                        <tr>
                            <th>희망 배송일시</th>
                            <td><span class="delivery_hope_date"></span> <span class="delivery_hope_time"></span></td>
                        </tr>
                        <tr>
                            <th>공급사</th>
                            <td class="product_made_company_name">-</td>
                        </tr>
                        <tr>
                            <th>상품명/옵션</th>
                            <td class="product_order_name giveaway_name"></td>
                        </tr>
                        <tr>
                            <th>수량</th>
                            <td class="payment_order_quantity"></td>
                        </tr>
                        <tr>
                            <th>결제수단</th>
                            <td class="pay_method"></td>
                        </tr>
                        <tr>
                            <th>결제금액</th>
                            <td class="payment"></td>
                        </tr>
                        <tr>
                            <th>상태</th>
                            <td class="payment_status_name"></td>
                        </tr>
                    </tbody>
                </table>
                <div id="setButton">

                </div>
                <div id="setDefaultButton" class="f-left">

                </div>
<%--                    <button type="button" name="detail" class="btn-gray" onclick="window.open('tax-bill.html','세금계산서','width=1000, height=800,loaction=no,status=no,scrollbars=yes');">배송처리</button>--%>
<%--                    <button type="button" name="detail" class="btn-gray" onclick="window.open('receipts.html','현금영수증','width=650, height=750,loaction=no,status=no,scrollbars=yes');">현금영수증</button>--%>
<%--                    <button type="button" name="detail" class="btn-gray" onclick="window.open('transaction.html','거래명세서','width=1015, height=750,loaction=no,status=no,scrollbars=yes');">거래명세서</button>--%>
            </div>
        </div>
        </form>
    </div>
</div>
<!--20.06.19 다운로드 모달 추가-->
<div class="uploadModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>엑셀 업로드</h2>
            <button type="button" class="modal-close">x</button>
        </div>
        <form id="excelUploadForm" action="" method="POST">
            <div class="modal-body clearfix">
               <table class="goods-detail-table">
                  <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                        <tr>
                           <th>양식</th>
                           <td><button class="btn-default downlaodTemplateBtn" type="button" data-id="giveawayPart"><i class="exel-ic"></i>양식 다운받기</button>
                           <button class="btn-default downlaodHowToUseBtn" type="button" data-id="giveawayPart"><i class="exel-ic"></i>사용방법</button></td>
                       </tr>
                       <tr>
                          
                           <th>업로드</th>
                           <td>
                           <div class="fileBox">
                               <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly" placeholder="엑셀 파일 첨부">
                               <label for="uploadBtn" class="btn_file">파일선택</label>
                               <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtnExcel">
                           </div>
                           </td>
                       </tr>
                    </tbody>
                   
               </table>
                <button class="btn-red uploadExcelBtn" type="button" data-id="giveawayPart">수정 하기</button>
            </div>
        </form>
    </div>
</div>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
