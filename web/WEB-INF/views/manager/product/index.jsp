<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">상품리스트</h2>
            <div class="main-hd-btn-wrap">
<%--                <button type="button" name="detail">상품 등록</button>--%>
                <button type="button" class="ready"><i class="exel-ic"></i>일괄 등록/수정</button>
            </div>
        </div>
        <div class="search-form">
            <form name="listSrcForm" id="listSrcForm" method="get">
                <div class="keyword-src-wrap">
                    <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                    <button type="submit" class="keyword-src-button">검색</button>
                    <br>
                        <label for="check2">상품명</label> <input type="checkbox" name="searchType" value="product_name" id="check2" checked>
                        <label for="check1">상품코드</label> <input type="checkbox" name="searchType" value="product_cd" id="check1" <c:if test="${param.searchType eq 'product_cd'}">checked</c:if>>

                </div>
                <!--
                <table class="keyword-src-table">
                    <colgroup>
                        <col width="80px">
                        <col width="420px">
                        <col width="80px">
                        <col width="420px">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="src-category">
                                <option value="전체">전체</option>
                                <option value="뷰티">뷰티</option>
                                <option value="식품">식품</option>
                            </select>
                            <select name="src-category">
                                <option value="전체">전체</option>
                                <option value="수입">수입</option>
                                <option value="명품">명품</option>
                                <option value="매스티지">매스티지</option>
                                <option value="트렌드">트렌드</option>
                                <option value="해외직구">해외직구</option>
                            </select>
                            <select name="src-category">
                                <option value="전체">전체</option>
                                <option value="스킨케어">스킨케어</option>
                                <option value="메이크업">메이크업</option>
                                <option value="향수">향수</option>
                                <option value="남성화장품">남성화장품</option>
                            </select>
                        </td>
                        <th>브랜드</th>
                        <td>
                            <select name="src-brand">
                                <option value="전체">전체</option>
                                <option value="분류1">분류1</option>
                                <option value="분류2">분류2</option>
                            </select>
                            <select name="src-brand">
                                <option value="전체">전체</option>
                                <option value="분류1">분류1</option>
                                <option value="분류2">분류2</option>
                            </select>
                            <select name="src-brand">
                                <option value="전체">전체</option>
                                <option value="분류1">분류1</option>
                                <option value="분류2">분류2</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                -->
            </form>
        </div>
        <div class="goods-list-wrap">
            <div class="list-sort-wrap">
                <div class="left">
                    <button type="button" class="btn-default" name="copy" id="listDelete">선택 삭제</button>
<%--                    <button type="button" class="btn-default" name="copy">선택 복사 등록</button>--%>
<%--                    <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button>--%>
                    <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>다운로드</button>
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
                    <col width="4%">
                    <col width="6%">
                    <col width="30%">
                    <col width="6%">
                    <col width="5%">
                    <col width="5%">
                    <col width="5%">
                    <col width="10%">
                    <col width="5%">
                    <col width="10%">
                    <col width="14%">
                </colgroup>
                <thead>
                <tr>
                    <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                    <td name="detail">상품코드</td>
                    <td name="detail">상품명</td>
                    <td>카테고리</td>
                    <td>정가</td>
                    <td>판매가</td>
                    <td>재고</td>
                    <td>배송</td>
                    <td>구매수량</td>
                    <td name="detail">상태</td>
                    <td>관리</td>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty productList}">
                    <c:forEach var="productList" items="${productList}">
                        <tr>
                            <td>
                                <input type="checkbox" id="chk" name="chk" value="${productList.product_id}">
                                <input type="hidden" name="product_cd" value="${productList.product_cd}">
                            </td>
                            <td>${productList.product_cd}</td>
                            <td>${productList.product_name}</td>
                            <td></td>
                            <td>${productList.product_user_payment}</td>
                            <td>${productList.product_payment}</td>
                            <td></td>
                            <td>${productList.product_delivery_type}</td>
                            <td></td>
                            <td>${productList.product_sale_yn}</td>
                            <td>
                                <button type="button" class="goods-list-btn ready" name="copy">복사 등록</button>
                                <button type="button" class="goods-list-btn" name="detail" onclick="defaultModal('${productList.product_cd}')" >상세보기</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>

                </tbody>
            </table>
            </form>
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
            <h2>상품 정보 수정</h2>
            <button type="button" class="modal-close">×</button>
        </div>
        <div class="modal-body clearfix">
<%--            <div class="right">--%>
<%--                <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>상품 정보 다운로드</button>--%>
<%--            </div>--%>
            <h3>기본 정보</h3>
            <table class="goods-detail-table">
                <colgroup>
                    <col width="142px">
                    <col width="800px">
                </colgroup>
                <tbody>
                <tr>
                    <th>상품명 <span class="cc">&#40;필수&#41;</span></th>
                    <td>
                        <input type="text" id="product_name" name="product_name" >
                    </td>

                </tr>
                <tr>
                    <th>국가별 진열</th>
                    <td>
                        <select name="ios_code">
                            <option value="kr">한국</option>
                            <option value="us">미국</option>
                            <option value="cn">중국</option>
                        </select>
                        <button type="button" class="plus-btn"></button>

                    </td>
                </tr>
                <tr>
                    <th>브랜드</th>
                    <td>
                        <input type="text" name="product_brand">
                    </td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <span>1차 분류 :</span>
                        <select name="src-category">
                            <option value="전체">전체</option>
                            <option value="뷰티">뷰티</option>
                            <option value="식품">식품</option>
                        </select>
                        <span style="margin-left:20px;">2차 분류 :</span>
                        <select name="src-category">
                            <option value="전체">전체</option>
                            <option value="수입">수입</option>
                            <option value="명품">명품</option>
                            <option value="매스티지">매스티지</option>
                            <option value="트렌드">트렌드</option>
                            <option value="해외직구">해외직구</option>
                        </select>
                        <span style="margin-left:20px;">3차 분류 :</span>
                        <select name="src-category">
                            <option value="전체">전체</option>
                            <option value="스킨케어">스킨케어</option>
                            <option value="메이크업">메이크업</option>
                            <option value="향수">향수</option>
                            <option value="남성화장품">남성화장품</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>소비자가 <span class="cc">&#40;필수&#41;</span></th>
                    <td>
                        <input type="text" name="product_user_payment"  value=""> 원
                    </td>

                </tr>
                <tr>
                    <th>할인가</th>
                    <td>
                        <input type="text" id="product_payment" name="product_payment" value="30000"> 원
                    </td>
                </tr>
                <tr>
                    <th>상품 이미지</th>
                    <td>
                        <div class="fileBox">
                            <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">
                            <label for="uploadBtn" class="btn_file">파일찾기</label>
                            <input type="file" id="uploadBtn" name="uploadBtn" class="uploadBtn">
                            <span class="ex">상품 대표이미지를 업로드 해주세요.</span>
                        </div>
                        <div class="img-thumb-box">
                            <img src="http://placehold.it/500x300" id="product_detail_image" alt="상품이미지"/>
                            <input type="hidden" name="product_detail_image">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>상품 설명</th>
                    <td>
                        <textarea id="product_html" name="product_html"></textarea>
<%--                        <div class="fileBox">--%>
<%--                            <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">--%>
<%--                            <label for="uploadBtn" class="btn_file">파일찾기</label>--%>
<%--                            <input type="file" id="uploadBtn" name="uploadBtn" class="uploadBtn">--%>
<%--                            <span class="ex">상품 상세페이지 이미지를 업로드 해주세요.</span>--%>
<%--                        </div>--%>
                    </td>
                </tr>
                <tr>
                    <th>검색어</th>
                    <td>
                        <input type="text" id="product_keyword" name="product_keyword">
                        <br>
                        * 쉼표&#40;,&#41;로 구분
                    </td>
                </tr>
                </tbody>
            </table>
            <table class="goods-detail-table">
                <colgroup>
                    <col width="142px">
                    <col width="800px">
                </colgroup>
                <tbody>
                <tr>
                    <th>재고</th>
                    <td>
                        <input type="text" id="goods-stock" name="goods-stock">
                    </td>
                </tr>
                <tr>
                    <th>구매 수량 범위</th>
                    <td>
                        최소 <input type="text" id="goods-min" name="goods-min"> 개 ~ 최대 <input type="text" id="goods-max" name="goods-max"> 개
                    </td>
                </tr>
                <tr>
                    <th>포인트 지급액</th>
                    <td>
                        <input type="text" id="goods-point" name="goods-point"> 포인트
                    </td>
                </tr>
                <tr>
                    <th>회원 혜택</th>
                    <td>
                        <select name="goods-membership">
                            <option value="배송비무료">배송비 무료</option>
                            <option value="혜택2">혜택2</option>
                            <option value="혜택3">혜택3</option>
                            <option value="혜택4">혜택4</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>노출/숨김</th>
                    <td>
                        <input type="radio" id="goods-exposure" name="goods-exposure" value="노출" checked>
                        <label for="goods-exposure">노출</label>
                        <input type="radio" id="goods-hide" name="goods-exposure" value="숨김">
                        <label for="goods-hide">숨김</label>
                    </td>
                </tr>

                <tr>
                    <th>결제/배송/교환/반품 안내</th>
                    <td>
                        <span>결제 안내</span>
                        <textarea id="product_payment_info" name="product_payment_info"></textarea>
                        <span>교환/반품/배송안내</span>
                        <textarea id="product_delivery_info" name="product_delivery_info"></textarea>
                    </td>
                </tr>
                </tbody>
            </table>
            <h3>배송 정보</h3>
            <table class="goods-detail-table">
                <colgroup>
                    <col width="142px">
                    <col width="800px">
                </colgroup>
                <tbody>
                <tr>
                    <th>배송 방법</th>
                    <td>
                        <select name="shipping-type">
                            <option value="택배">택배</option>
                            <option value="퀵배송">퀵배송</option>
                            <option value="매장 방문수령">매장 방문수령</option>
                            <option value="직접배송">직접배송</option>
                            <option value="기타">기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>배송 기간</th>
                    <td>
                        최소 <input type="text" id="shipping-min" name="shipping-min"> 일 ~ 최대 <input type="text" id="shipping-max" name="shipping-max"> 일
                    </td>
                </tr>
                <tr>
                    <th>배송비 설정</th>
                    <td>
                        <select name="shipping-fee">
                            <option value="배송비무료">배송비 무료</option>
                            <option value="고정배송비">고정 배송비</option>
                            <option value="구매금액별">구매 금액 별 부과</option>
                            <option value="상품갯수별">상품 갯수 별 부과</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>배송비 상세 설정</th>
                    <td>
                        <div class="shippingFee-detail-wrap active">
                            어떤 경우든 배송비 <input type="text" id="shippingFee-fixed" name="shippingFee-fixed"> 원을 고정적으로 부과함.
                        </div>
                        <div class="shippingFee-detail-wrap active">
                            <input type="text" id="shippingFee2-min" name="shippingFee2-min"> 원 이상 ~ <input type="text" id="shippingFee2-max" name="shippingFee2-max"> 원 미만일 때 배송비 <input type="text" id="shippingFee2" name="shippingFee2"> 원<button type="button" class="plus-btn"></button>
                        </div>
                        <div class="shippingFee-detail-wrap active">
                            <input type="text" id="shippingFee3-min" name="shippingFee3-min"> 개 이상 ~ <input type="text" id="shippingFee3-max" name="shippingFee3-max"> 개 미만일 때 배송비 <input type="text" id="shippingFee3" name="shippingFee3"> 원<button type="button" class="plus-btn"></button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <table class="goods-detail-table">
                <colgroup>
                    <col width="142px">
                    <col width="800px">
                </colgroup>
                <tbody>

                </tbody>
            </table>
            <button type="button" name="detail" class="btn-red">저장하기</button>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
