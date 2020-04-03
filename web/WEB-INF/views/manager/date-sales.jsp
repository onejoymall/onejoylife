<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">날짜별 매출현황</h2>
            </div>
            <table class="goods-list-tab">
                <colgroup></colgroup>
                <tbody>
                    <tr>
                        <th class="list-tab on" data-tab="tab-on1">일별 매출</th>
                        <th class="list-tab" data-tab="tab-on2">주별 매출</th>
                        <th class="list-tab" data-tab="tab-on3">월별 매출</th>
                    </tr>
                </tbody>
            </table>
            <div>
                <div class="in-list-tab on" id="tab-on1">
                    <div class="search-form">
                        <form name="" id="" class="listSrcForm1" method="get">
                            <div class="keyword-src-wrap">
                                <input type="text" class="keyword-src" name="keyword-src">
                                <button type="button" class="keyword-src-button">검색</button>
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
                                    <tr>
                                        <th>기간별 선택</th>
                                        <td>
                                            <select name="src-category">
                                                <option value="전체">전체</option>
                                                <option value="일별 매출">일별 매출</option>
                                                <option value="주별 매출">주별 매출</option>
                                                <option value="달별 매출">달별 매출</option>
                                            </select>
                                        </td>
                                        <th>분기별 선택</th>
                                        <td>
                                            <select name="src-category">
                                                <option value="전체">전체</option>
                                                <option value="분기">분기</option>
                                                <option value="반기">반기</option>
                                                <option value="연">연</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>날짜 지정</th>
                                        <td>
                                            <div class="input-box2">
                                                <div class="cla">
                                                    <input type="text" class="date_pick">
                                                    <div class="cla-img1"></div>
                                                </div>
                                                <p class="cla-p1"> ~ </p>
                                                <div class="cla">
                                                    <input type="text" class="date_pick">
                                                    <div class="cla-img1"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="goods-list-wrap">
                        <div class="list-box clearfix">
                            <div class="list-sort-wrap">
                                <div class="left">
                                </div>
                                <div class="right">
                                    <select name="order" class="order-select">
                                        <option value="10">10개씩 보기</option>
                                        <option value="50">50개씩 보기</option>
                                        <option value="100">100개씩 보기</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sort-wrap-table1">
                                <colgroup>
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="11%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="11%">
                                    <col width="11%">
                                    <col width="13%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <td rowspan="2">일자</td>
                                        <td colspan="6">결제완료 주문</td>
                                        <td rowspan="2">결제합계</td>
                                        <td rowspan="2">환불합계</td>
                                        <td rowspan="2">순매출</td>
                                    </tr>
                                    <tr>
                                        <td>주문수</td>
                                        <td>품목수</td>
                                        <td>상품구매 금액</td>
                                        <td>배송비</td>
                                        <td>할인</td>
                                        <td>쿠폰</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-12(수)</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>합계</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">≪</a></li>
                            <li class="page-item"><a class="page-link" href="#">＜</a></li>
                            <li class="page-item"><a class="page-link active" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">6</a></li>
                            <li class="page-item"><a class="page-link" href="#">7</a></li>
                            <li class="page-item"><a class="page-link" href="#">8</a></li>
                            <li class="page-item"><a class="page-link" href="#">9</a></li>
                            <li class="page-item"><a class="page-link" href="#">10</a></li>
                            <li class="page-item"><a class="page-link" href="#">＞</a></li>
                            <li class="page-item"><a class="page-link" href="#">≫</a></li>
                        </ul>
                    </div>
                </div>
                <div class="in-list-tab" id="tab-on2">
                    <div class="search-form">
                        <form name="" id="" class="listSrcForm2" method="get">
                            <div class="keyword-src-wrap">
                                <input type="text" class="keyword-src" name="keyword-src">
                                <button type="button" class="keyword-src-button">검색</button>
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
                                    <tr>
                                        <th>기간별 선택</th>
                                        <td>
                                            <select name="src-category">
                                                <option value="전체">전체</option>
                                                <option value="일별 매출">일별 매출</option>
                                                <option value="주별 매출">주별 매출</option>
                                                <option value="달별 매출">달별 매출</option>
                                            </select>
                                        </td>
                                        <th>분기별 선택</th>
                                        <td>
                                            <select name="src-category">
                                                <option value="전체">전체</option>
                                                <option value="분기">분기</option>
                                                <option value="반기">반기</option>
                                                <option value="연">연</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>날짜 지정</th>
                                        <td>
                                            <div class="input-box2">
                                                <div class="cla">
                                                    <input type="text" class="date_pick">
                                                    <div class="cla-img1"></div>
                                                </div>
                                                <p class="cla-p1"> ~ </p>
                                                <div class="cla">
                                                    <input type="text" class="date_pick">
                                                    <div class="cla-img1"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="goods-list-wrap">
                        <div class="list-box clearfix">
                            <div class="list-sort-wrap">
                                <div class="left">
                                </div>
                                <div class="right">
                                    <select name="order" class="order-select">
                                        <option value="10">10개씩 보기</option>
                                        <option value="50">50개씩 보기</option>
                                        <option value="100">100개씩 보기</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sort-wrap-table1">
                                <colgroup>
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="11%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="11%">
                                    <col width="11%">
                                    <col width="13%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <td rowspan="2">일자</td>
                                        <td colspan="6">결제완료 주문</td>
                                        <td rowspan="2">결제합계</td>
                                        <td rowspan="2">환불합계</td>
                                        <td rowspan="2">순매출</td>
                                    </tr>
                                    <tr>
                                        <td>주문수</td>
                                        <td>품목수</td>
                                        <td>상품구매 금액</td>
                                        <td>배송비</td>
                                        <td>할인</td>
                                        <td>쿠폰</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02-24<br>
                                            ~ 2020-02-28</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>합계</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">≪</a></li>
                            <li class="page-item"><a class="page-link" href="#">＜</a></li>
                            <li class="page-item"><a class="page-link active" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">6</a></li>
                            <li class="page-item"><a class="page-link" href="#">7</a></li>
                            <li class="page-item"><a class="page-link" href="#">8</a></li>
                            <li class="page-item"><a class="page-link" href="#">9</a></li>
                            <li class="page-item"><a class="page-link" href="#">10</a></li>
                            <li class="page-item"><a class="page-link" href="#">＞</a></li>
                            <li class="page-item"><a class="page-link" href="#">≫</a></li>
                        </ul>
                    </div>
                </div>
                <div class="in-list-tab" id="tab-on3">
                    <div class="search-form">
                        <form name="" id="" class="listSrcForm3" method="get">
                            <div class="keyword-src-wrap">
                                <input type="text" class="keyword-src" name="keyword-src">
                                <button type="button" class="keyword-src-button">검색</button>
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
                                    <tr>
                                        <th>기간별 선택</th>
                                        <td>
                                            <select name="src-category">
                                                <option value="전체">전체</option>
                                                <option value="일별 매출">일별 매출</option>
                                                <option value="주별 매출">주별 매출</option>
                                                <option value="달별 매출">달별 매출</option>
                                            </select>
                                        </td>
                                        <th>분기별 선택</th>
                                        <td>
                                            <select name="src-category">
                                                <option value="전체">전체</option>
                                                <option value="분기">분기</option>
                                                <option value="반기">반기</option>
                                                <option value="연">연</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>날짜 지정</th>
                                        <td>
                                            <div class="input-box2">
                                                <div class="cla">
                                                    <input type="text" class="date_pick">
                                                    <div class="cla-img1"></div>
                                                </div>
                                                <p class="cla-p1"> ~ </p>
                                                <div class="cla">
                                                    <input type="text" class="date_pick">
                                                    <div class="cla-img1"></div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div class="goods-list-wrap">
                        <div class="list-box clearfix">
                            <div class="list-sort-wrap">
                                <div class="left">
                                </div>
                                <div class="right">
                                    <select name="order" class="order-select">
                                        <option value="10">10개씩 보기</option>
                                        <option value="50">50개씩 보기</option>
                                        <option value="100">100개씩 보기</option>
                                    </select>
                                </div>
                            </div>
                            <table class="sort-wrap-table1">
                                <colgroup>
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="11%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="9%">
                                    <col width="11%">
                                    <col width="11%">
                                    <col width="13%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <td rowspan="2">일자</td>
                                        <td colspan="6">결제완료 주문</td>
                                        <td rowspan="2">결제합계</td>
                                        <td rowspan="2">환불합계</td>
                                        <td rowspan="2">순매출</td>
                                    </tr>
                                    <tr>
                                        <td>주문수</td>
                                        <td>품목수</td>
                                        <td>상품구매 금액</td>
                                        <td>배송비</td>
                                        <td>할인</td>
                                        <td>쿠폰</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                    <tr>
                                        <td>2020-02</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                        <td>0</td>
                                        <td>5,000</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>합계</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">≪</a></li>
                            <li class="page-item"><a class="page-link" href="#">＜</a></li>
                            <li class="page-item"><a class="page-link active" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">6</a></li>
                            <li class="page-item"><a class="page-link" href="#">7</a></li>
                            <li class="page-item"><a class="page-link" href="#">8</a></li>
                            <li class="page-item"><a class="page-link" href="#">9</a></li>
                            <li class="page-item"><a class="page-link" href="#">10</a></li>
                            <li class="page-item"><a class="page-link" href="#">＞</a></li>
                            <li class="page-item"><a class="page-link" href="#">≫</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </main>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
