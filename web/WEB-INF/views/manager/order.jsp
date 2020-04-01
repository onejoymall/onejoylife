<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">주문현황관리</h2>
            </div>
            <div class="dashboard-wrap">
                <div class="open-arrow"></div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="searchType" value="product_name" id="check2" checked>
                            <label for="check2">상품명</label>
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
                                            <input type="text" id="startDate" name="startDate" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="endDate" name="endDate" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </td>
                                <th>배송일</th>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="delivery_start_date" name="delivery_start_date" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="delivery_end_date" name="delivery_end_date" class="date_pick">
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
<%--                <div class="list-sort-wrap">--%>
<%--                    <div class="left">--%>
<%--                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button>--%>
<%--                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>전체 다운로드</button>--%>
<%--                    </div>--%>
<%--                    <div class="right">--%>
<%--                        <select name="order" class="order-select">--%>
<%--                            <option value="32">10개씩 보기</option>--%>
<%--                            <option value="60">50개씩 보기</option>--%>
<%--                            <option value="92">100개씩 보기</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                </div>--%>
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
                            <td>주문번호</td>
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
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>${list.order_no}</td>
                            <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
                            <td>${list.email}</td>
                            <td></td>
                            <td></td>
                            <td>${list.product_made_company_name}</td>
                            <td>${list.product_name}</td>
                            <td>${list.payment_order_quantity}</td>
                            <td><fmt:formatNumber value="${list.payment}" groupingUsed="true" /></td>
                            <td>${list.payment_status_name}</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail" onclick="selectPayment('${list.order_no}')">송장번호입력</button>
                            </td>
                        </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
                <form id="form1" name="form1"  method="post">
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
            <div class="modal-body clearfix">
                <div class="goods-detail-wrap">
                    <div class="right">
                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>주문 정보 다운로드</button>
                    </div>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>주문번호</th>
                                <td class="order_no">6549858</td>
                            </tr>
                            <tr>
                                <th>주문일</th>
                                <td class="reg_date">2020-03-13</td>
                            </tr>
                            <tr>
                                <th>주문자</th>
                                <td class="email">unknown01</td>
                            </tr>
                            <tr>
                                <th>배송일</th>
                                <td class="email">2020-03-14</td>
                            </tr>
                            <tr>
                                <th>택배사/운송장 번호</th>
                                <td><span class="delivery_t_invoice"></span>/<span class="delivery_t_code"></span></td>
                            </tr>
                            <tr>
                                <th>공급사</th>
                                <td class="product_made_company_name">-</td>
                            </tr>
                            <tr>
                                <th>상품명/옵션</th>
                                <td class="product_name">제주 신선 한라봉/1KG</td>
                            </tr>
                            <tr>
                                <th>수량</th>
                                <td class="payment_order_quantity">1</td>
                            </tr>
                            <tr>
                                <th>결제수단</th>
                                <td class="pay_method">카드</td>
                            </tr>
                            <tr>
                                <th>결제금액</th>
                                <td class="payment">30,150원</td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td class="payment_status">배송완료</td>
                            </tr>
                        </tbody>
                    </table>
<%--                    <button type="button" name="detail" class="btn-gray" onclick="window.open('tax-bill.html','세금계산서','width=1000, height=800,loaction=no,status=no,scrollbars=yes');">세금계산서</button>--%>
<%--                    <button type="button" name="detail" class="btn-gray" onclick="window.open('receipts.html','현금영수증','width=650, height=750,loaction=no,status=no,scrollbars=yes');">현금영수증</button>--%>
<%--                    <button type="button" name="detail" class="btn-gray" onclick="window.open('transaction.html','거래명세서','width=1015, height=750,loaction=no,status=no,scrollbars=yes');">거래명세서</button>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-open"></div>
    <div class="modal2">
    </div>
    <div class="modal-content2">
        <div class="dashboard">
            <div class="status">
                <p href="#" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db1">7</span></strong>
                        <span class="data-unit">입금전</span>
                    </span>
                </p>
            </div>
            <div class="status">
                <p href="#" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db2">16</span></strong>
                        <span class="data-unit">결제완료</span>
                    </span>
                </p>
            </div>
            <div class="status">
                <p href="#" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db3">25</span></strong>
                        <span class="data-unit">배송대기</span>
                    </span>
                </p>
            </div>
            <div class="status">
                <p href="#" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db4">34</span></strong>
                        <span class="data-unit">배송중</span>
                    </span>
                </p>
            </div>
            <div class="status">
                <p href="#" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db5">12</span></strong>
                        <span class="data-unit">배송완료</span>
                    </span>
                </p>
            </div>
            <div class="status2">
                <p href="#" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db6">1</span>/<span class="db7">2</span></strong>
                        <span class="data-unit">취소신청/취소처리중</span>
                    </span>
                </p>
            </div>
            <div class="status2">
                <p  href="#" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db8">2</span>/<span class="db9">6</span></strong>
                        <span class="data-unit">교환신청/교환처리중</span>
                    </span>
                </p>
            </div>
            <div class="status2">
                <p href="#" class="content-status order">
                    <span class="order-data">
                        <strong class="data-price"><span class="db10">0</span>/<span class="db11">1</span></strong>
                        <span class="data-unit">반품신청/반품처리중</span>
                    </span>
                </p>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../assets/js/goods-add.js"></script>
    <script type="text/javascript" src="../assets/js/index.js"></script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>