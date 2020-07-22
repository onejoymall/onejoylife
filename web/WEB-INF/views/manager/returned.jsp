<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">교환/반품 관리</h2>
            </div>
            <div class="dashboard-wrap">
                <div class="open-arrow"></div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <input type="hidden" name="displayRowCount">
                        <button type="submit" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <%-- <input type="checkbox" name="searchType" value="product_name" id="check2" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'product_name')}">checked</c:if>>
                            <label for="check2">상품명</label> --%>
                            <input type="checkbox" name="searchType" value="B.order_no" id="check3" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'B.order_no')}">checked</c:if>>
                            <label for="check3">상점주문번호</label>
                            <input type="checkbox" name="searchType" value="imp_uid" id="check10" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'imp_uid')}">checked</c:if>>
                            <label for="check10">주문번호</label>
                            <%-- <input type="checkbox" name="searchType" value="order_user_name" id="check4" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'order_user_name')}">checked</c:if>>
                            <label for="check4">주문자명</label> --%>
                            <%-- <input type="checkbox" name="searchType" value="delivery_user_name" id="check5" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'delivery_user_name')}">checked</c:if>>
                            <label for="check5">수취인명</label>
                            <input type="checkbox" name="searchType" value="delivery_t_invoice" id="check6" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'delivery_t_invoice')}">checked</c:if>>
                            <label for="check6">운송장번호</label>
                            <input type="checkbox" name="searchType" value="delivery_user_phone" id="check7" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'delivery_user_phone')}">checked</c:if>>
                            <label for="check7">핸드폰번호</label>
                            <input type="checkbox" name="searchType" value="order_user_email" id="check8" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'order_user_email')}">checked</c:if>>
                            <label for="check8">이메일</label>
                            <input type="checkbox" name="searchType" value="store_name" id="check9" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'store_name')}">checked</c:if>>
                            <label for="check9">공급사명</label> --%>
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
<%--                                <th>주문 상태</th>--%>
<%--                                <td>--%>
<%--                                    <select name="src-orderState">--%>
<%--                                       <option value="전체">전체</option>--%>
<%--                                       <option value="입금 전">입금 전</option>--%>
<%--                                       <option value="결제완료">결제완료</option>--%>
<%--                                       <option value="배송대기">배송대기</option>--%>
<%--                                       <option value="배송중">배송중</option>--%>
<%--                                       <option value="배송완료">배송완료</option>--%>
<%--                                       <option value="취소처리중">취소처리중</option>--%>
<%--                                       <option value="취소">취소</option>--%>
<%--                                       <option value="교환처리중">교환처리중</option>--%>
<%--                                       <option value="교환">교환</option>--%>
<%--                                       <option value="반품처리중">반품처리중</option>--%>
<%--                                       <option value="반품">반품</option>--%>
<%--                                   </select>--%>
<%--                                </td>--%>
                                <th>주문일</th>
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
                                <th>배송일</th>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="delivery_start_date" name="delivery_start_date" class="${param.delivery_start_date}">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="delivery_end_date" name="delivery_end_date" class="${param.delivery_end_date}">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
<%--                            <tr>--%>
<%--                                <th>카테고리</th>--%>
<%--                                <td>--%>
<%--                                   <select name="src-category">--%>
<%--                                       <option value="전체">전체</option>--%>
<%--                                       <option value="뷰티">뷰티</option>--%>
<%--                                       <option value="식품">식품</option>--%>
<%--                                   </select>--%>
<%--                                   <select name="src-category">--%>
<%--                                       <option value="전체">전체</option>--%>
<%--                                       <option value="수입">수입</option>--%>
<%--                                       <option value="명품">명품</option>--%>
<%--                                       <option value="매스티지">매스티지</option>--%>
<%--                                       <option value="트렌드">트렌드</option>--%>
<%--                                       <option value="해외직구">해외직구</option>--%>
<%--                                   </select>--%>
<%--                                   <select name="src-category">--%>
<%--                                       <option value="전체">전체</option>--%>
<%--                                       <option value="스킨케어">스킨케어</option>--%>
<%--                                       <option value="메이크업">메이크업</option>--%>
<%--                                       <option value="향수">향수</option>--%>
<%--                                       <option value="남성화장품">남성화장품</option>--%>
<%--                                   </select>--%>
<%--                                </td>--%>
<%--                                <th>브랜드</th>--%>
<%--                                <td>--%>
<%--                                    <select name="src-brand">--%>
<%--                                       <option value="전체">전체</option>--%>
<%--                                       <option value="분류1">분류1</option>--%>
<%--                                       <option value="분류2">분류2</option>--%>
<%--                                   </select>--%>
<%--                                   <select name="src-brand">--%>
<%--                                       <option value="전체">전체</option>--%>
<%--                                       <option value="분류1">분류1</option>--%>
<%--                                       <option value="분류2">분류2</option>--%>
<%--                                   </select>--%>
<%--                                   <select name="src-brand">--%>
<%--                                       <option value="전체">전체</option>--%>
<%--                                       <option value="분류1">분류1</option>--%>
<%--                                       <option value="분류2">분류2</option>--%>
<%--                                   </select>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <th>상품 종류</th>--%>
<%--                                <td>--%>
<%--                                    <select name="src-goodsSort">--%>
<%--                                       <option value="전체">전체</option>--%>
<%--                                       <option value="일반상품">일반 상품</option>--%>
<%--                                       <option value="여행티켓">여행 티켓</option>--%>
<%--                                       <option value="렌탈">렌탈</option>--%>
<%--                                    </select>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="goods-list-wrap">
                <div class="list-sort-wrap">
                    <div class="left">
<%--                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button>--%>
<%--                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>전체 다운로드</button>--%>
						<button type="button" class="btn-default excelBtn" name="copy" data-id="returned"><i class="exel-ic"></i>다운로드</button>
                    </div>
                    <div class="right">
		            	<select name="order" class="order-select">
			               <option value="10" <c:if test="${searchVO.displayRowCount == 10}"> selected</c:if>>10개씩 보기</option>
			               <option value="50" <c:if test="${searchVO.displayRowCount == 50}"> selected</c:if>>50개씩 보기</option>
			               <option value="100" <c:if test="${searchVO.displayRowCount == 100}"> selected</c:if>>100개씩 보기</option>
		            	</select>
	                </div>
<%--                    <div class="right">--%>
<%--                        <select name="order" class="order-select">--%>
<%--                            <option value="32">10개씩 보기</option>--%>
<%--                            <option value="60">50개씩 보기</option>--%>
<%--                            <option value="92">100개씩 보기</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
                </div>
                <form name="defaultListForm" id="defaultListForm" method="POST">
                <input type="hidden" name="Pk" value="${Pk}">
                <input type="hidden" name="table_name" value="${table_name}">
                <table>
                    <colgroup>
                        <col width="3%">
                        <col width="5%">
                        <col width="6%">
                        <col width="8%">
                        <col width="6%">
                        <col width="7%">
                        <col width="7%">
                        <col width="33%">
                        <col width="5%">
                        <col width="8%">
                        <col width="6%">
                        <col width="6%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>상점주문번호</td>
                            <td>주문일</td>
                            <td>주문자</td>
                            <td>배송일</td>
                            <td>운송장번호</td>
                            <td>공급사</td>
                            <td>상품명/옵션</td>
                            <td>수량</td>
                            <td>결제금액</td>
                            <td>상태</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty list}">
                        <c:forEach var="list" items="${list}" varStatus="status">
                       <tr>
                            <td><input type="checkbox" id="chk" name="chk" value="${list.order_no}"></td>
                            <td>${list.order_no}</td>
                            <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
                            <td>${list.email}</td>
                            <td><fmt:formatDate value="${list.delivery_start_date}" pattern="yyyy.MM.dd"/></td>
                            <td>${list.delivery_t_invoice}</td>
                            <td>${list.store_name}</td>
                            <td>${list.product_name} <c:if test="${not empty list.option_name}"> / ${list.option_name}</c:if></td>
                            <td>${list.payment_order_quantity}</td>
                            <td><fmt:formatNumber value="${list.payment}" groupingUsed="true" /></td>
                            <td>${list.payment_status_name}</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail" onclick="selectDeliveryRefund('${list.no}')">상세보기</button>
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
            <input type="hidden" name="reason"/>
            <input type="hidden" name="refund_account"/>
            <input type="hidden" name="refund_bank"/>
            <input type="hidden" name="refund_holder"/>
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
                                    <c:forEach var="companyList" items="${companyList}" varStatus="status">
                                        <option value="${companyList.Code}">${companyList.Name}</option>
                                    </c:forEach>
                                    </select>
                                    <input type="text" name="delivery_t_invoice" placeholder="송장번호 입력">
                                </td>
                            </tr>

                            <tr>
                                <th>주문번호</th>
                                <td class="order_no">-</td>
                            </tr>
                            <tr>
                                <th>주문일</th>
                                <td class="reg_date">-</td>
                            </tr>
                            <tr>
                                <th>주문자</th>
                                <td class="email">-</td>
                            </tr>
                            <tr>
                                <th>배송일</th>
                                <td class="delivery_start_date">-</td>
                            </tr>
                            <tr>
                                <th>공급사</th>
                                <td class="stroe_name">-</td>
                            </tr>
                            <tr>
                                <th>상품명/옵션 [수량]</th>
                                <td class="product_name">-</td>
                            </tr>
                            <tr>
                                <th>수량</th>
                                <td class="payment_order_quantity">-</td>
                            </tr>
                            <tr>
                                <th>결제수단</th>
                                <td class="pay_method">-</td>
                            </tr>
                            <tr>
                                <th>결제금액</th>
                                <td class="payment">-</td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td class="payment_status_name">-</td>
                            </tr>
                            <tr>
                                <th>요청 사유</th>
                                <td class="reason">-</td>
                            </tr>
                            <tr>
                                <th>상품 회수처 이름</th>
                                <td class="refund_user_name"></td>
                            </tr>
                            <tr>
                                <th>상품 회수처 전화번호</th>
                                <td class="refund_user_phone"></td>
                            </tr>
                            <tr>
                                <th>상품 회수처 주소</th>
                                <td><span class="refund_postcode"></span>&nbsp;<span class="refund_roadAddress"></span>&nbsp;<span class="refund_extraAddress"></span></td>
                            </tr>
                            <tr>
                                <th>교환상품 배송지 수령인</th>
                                <td class="return_user_name"></td>
                            </tr>
                            <tr>
                                <th>교환상품 배송지 연락처</th>
                                <td class="return_user_phone"></td>
                            </tr>
                            <tr>
                                <th>교환상품 배송지 주소</th>
                                <td><span class="postcode"></span>&nbsp;<span class="roadAddress"></span>&nbsp;<span class="extraAddress"></span></td>
                            </tr>
                            <tr>
                                <th>환불 계좌 은행명</th>
                                <td class="refund_bank_name"></td>
                            </tr>
                            <tr>
                                <th>환불 계좌번호</th>
                                <td class="refund_account_number"></td>
                            </tr>
                            <tr>
                                <th>환불 계좌 예금주</th>
                                <td class="refund_account_holder"></td>
                            </tr>
                            <tr>
                                <th>반품 택배사</th>
                                <td class="refund_delivery_t_code"></td>
                            </tr>
                            <tr>
                                <th>반품 택배 송장번호</th>
                                <td class="refund_delivery_t_invoice"></td>
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
    <div class="modal-open"></div>
    <div class="modal2">
    </div>
<div class="modal-content2">
    <div class="dashboard">
        <div class="status">
            <a href="/Manager/order?&payment_status=M" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db1"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.mCnt}" /></span></strong>
                        <span class="data-unit">입금전</span>
                    </span>
            </a>
        </div>
        <div class="status">
            <a href="/Manager/order?&payment_status=W" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.wCnt}" /></span></strong>
                        <span class="data-unit">결제완료</span>
                    </span>
            </a>
        </div>
        <div class="status">
            <a href="/Manager/order?&payment_status=D" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.dCnt + statusCount.iCnt}" /></span></strong>
                        <span class="data-unit">배송준비중</span>
                    </span>
            </a>
        </div>
        <div class="status">
            <a href="/Manager/order?&payment_status=R" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db4"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.rCnt}" /></span></strong>
                        <span class="data-unit">배송중</span>
                    </span>
            </a>
        </div>
        <div class="status">
            <a href="/Manager/order?&payment_status=O" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db5"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.oCnt}" /></span></strong>
                        <span class="data-unit">배송완료</span>
                    </span>
            </a>
        </div>
        <div class="status2">
            <a href="/Manager/order?&payment_status=C" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db6"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.cCnt}" /></span></strong>
                        <span class="data-unit">결제취소</span>
                    </span>
            </a>
        </div>
        <div class="status2">
            <a href="/Manager/order?&payment_status=F" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db8"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.sCnt}" /></span>/<span class="db9"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.sCnt + statusCount.fCnt}" /></span></strong>
                        <span class="data-unit">교환완료/교환처리</span>
                    </span>
            </a>
        </div>
        <div class="status2">
            <a href="/Manager/order?&payment_status=H" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db10"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.gCnt}" /></span>/<span class="db11"><fmt:formatNumber type="number" maxFractionDigits="3" value="${statusCount.gCnt + statusCount.hCnt}" /></span></strong>
                        <span class="data-unit">반품완료/반품처리</span>
                    </span>
            </a>
        </div>
    </div>
</div>
<script>
    $('.order-select').on("change",function () {
        $('input[name=displayRowCount]').val($(this).val());
        $('#listSrcForm').submit();
    })
</script>
    <script type="text/javascript" src="../assets/js/goods-add.js"></script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>