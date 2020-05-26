<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
    	<div class="main-header">
            <h2 name="detail">지역별 배송비 설정</h2>
        </div>
        <div class="goods-detail-wrap">
            <form:form>
                <h3>지역별 배송비 설정</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                        <tr class="shipping-t-detail">
                            <th>지역별 배송비 사용</th>
                            <td>
                            	<input type="radio" name="product_delivery_area_yn" value="Y" id="areaY" <c:if test="${detail.product_delivery_area_yn eq 'Y' }">checked</c:if>><label for="areaY">사용</label>
                                <input type="radio" name="product_delivery_area_yn" value="N" id="areaN" <c:if test="${detail.product_delivery_area_yn eq 'N' }">checked</c:if>><label for="areaN">사용안함</label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form:form>
        </div>
        <%-- <div class="search-form">
            <form name="listSrcForm" id="listSrcForm" method="get">
                <div class="keyword-src-wrap">
                    <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                    <input type="hidden" name="displayRowCount">
                    <button type="submit" class="keyword-src-button">검색</button>

                    <div class="src-filter-wrap">
                        <input type="checkbox" name="searchType" value="product_name" id="check2" checked>
                        <label for="check2">상품명</label>
                        <input type="checkbox" name="searchType" value="product_cd" id="check1" <c:if test="${param.searchType eq 'product_cd'}">checked</c:if>>
                        <label for="check1">상품코드</label>
                    </div>
                </div>
            </form>
        </div> --%>
        <c:if test="${detail.product_delivery_area_yn eq 'Y' }">
        <div class="goods-list-wrap">
            <div class="list-sort-wrap">
                <div class="left">
                    <button type="button" class="btn-default" name="copy" id="listDelete">선택 삭제</button>
                    <%-- <button type="button" class="btn-default" name="copy" onclick="listProductUpdate('<!-- product_use_yn','Y')">진열함</button>
                    <button type="button" class="btn-default" name="copy" onclick="listProductUpdate('product_use_yn','N')">진열암함</button>
                    <button type="button" class="btn-default" name="copy" onclick="listProductUpdate('product_sale_yn','Y')">판매함</button>
                    <button type="button" class="btn-default" name="copy" onclick="listProductUpdate('product_sale_yn','N')">판매안함</button>
                    <button type="button" class="btn-default" name="copy" onclick="listProductUpdateStock()">재고관리</button>
                    <button type="button" class="btn-default UpdateProductCatetorySubmit" name="copy">분류관리</button>
                    <button type="button" class="btn-default excelBtn" name="copy" data-id="product"><i class="ex -->el-ic"></i>다운로드</button> --%>
<%--                    <button type="button" class="btn-default" name="copy">선택 복사 등록</button>--%>
<%--                    <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button>--%>

                </div>

                <div class="right">
                	<button type="button" name="detail"> 등 록 </button>
                    <%-- <select name="order" class="order-select">
                        <option value="10" <c:if test="${searchVO.displayRowCount == 10}"> selected</c:if>>10개씩 보기</option>
                        <option value="50" <c:if test="${searchVO.displayRowCount == 50}"> selected</c:if>>50개씩 보기</option>
                        <option value="100" <c:if test="${searchVO.displayRowCount == 100}"> selected</c:if>>100개씩 보기</option>
                    </select> --%>
                </div>
            </div>
            <form name="defaultListForm" id="defaultListForm" method="POST">
                <input type="hidden" name="Pk" value="${Pk}">
                <input type="hidden" name="table_name" value="${table_name}">
                <table>
                <colgroup>
                    <col width="5%">
                    <col width="50%">
                    <col width="25%">
                    <col width="20%">
                </colgroup>
                <thead>
                <tr>
                    <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                    <td >지역명</td>
                    <td >우편번호</td>
                    <td>추가 배송비</td>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}">
                        <tr>
                            <td>
                                <input type="checkbox" id="chk" name="chk" value="${list.area_id}">
                                <input type="hidden" name="area_id" value="${list.area_id}">
                            </td>
                            <td >${list.area_name}</td>
                            <td style="text-align: center">${list.postcode}</td>
                            <td style="text-align: right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.additional_delivery_payment}" />원</td>
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
        </c:if>
    </div>
</main>
<div class="modal" style="display:none">
    <div class="modal-content">
        <div class="modal-header">
           <h2>지역별 배송비 등록</h2>
            <button type="button" class="modal-close">×</button>
        </div>
        <div class="modal-body clearfix">
            <form name="defaultForm" id="defaultForm" method="post">
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>특수지역명</th>
                        <td>
                            <input type="text" id="area_name" name="area_name" placeholder="ex) 산간지역">
                        </td>
                    </tr>
                    <tr>
                        <th>우편번호</th>
                        <td>
                            <input type="text" id="postcode" name="postcode" placeholder="ex) 01000"/>
                            <button type="button" class="btn-default mr-10" id="daumMapCall">우편번호</button>
                        </td>
                    </tr>
                    <tr>
                        <th>추가 배송비</th>
                        <td>
                            <input type="text" id="additional_delivery_payment" name="additional_delivery_payment" />
                        </td>
                    </tr>
                    </tbody>
                </table>
                <button type="button" class="btn-red mr-10" id="areaInsertBtn">저장</button>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="/assets/js/goods-add.js"></script>
<script type="text/javascript" src="/assets/js/index.js"></script>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
