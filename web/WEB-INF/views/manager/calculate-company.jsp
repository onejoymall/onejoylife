<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">업체별 정산내역</h2>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button><div class="src-filter-wrap">
                            <input type="checkbox" id="src-name">
                            <label for="src-name">업체명</label>
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
                                <th>할인쿠폰</th>
                                <td>
                                   <input type="checkbox" name="src-before" id="src-before" checked>
                                   <label for="src-before">사용</label>
                                   <input type="checkbox" name="src-after" id="src-after" checked>
                                   <label for="src-after">사용안함</label>
                                </td>
                                <th>매입/위탁</th>
                                <td>
                                   <input type="checkbox" name="src-q1" id="src-q1" checked>
                                   <label for="src-q1">매입</label>
                                   <input type="checkbox" name="src-q2" id="src-q2" checked>
                                   <label for="src-q2">위탁</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="goods-list-wrap">
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="goods-list-btn" name="copy">선택 삭제</button>
                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button>
                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>전체 다운로드</button>
                    </div>
                    <div class="right">
                        <select name="order" class="order-select">
                            <option value="32">10개씩 보기</option>
                            <option value="60">50개씩 보기</option>
                            <option value="92">100개씩 보기</option>
                        </select>
                    </div>
                </div>
                <table>
                    <colgroup>
                        <col width="2%">
                        <col width="3%">
                        <col width="10%">
                        <col width="7%">
                        <col width="7%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="11%">
                        <col width="13%">
                        <col width="7%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>번호</td>
                            <td>업체명</td>
                            <td>할인쿠폰</td>
                            <td>매입/위탁</td>
                            <td>과세상품</td>
                            <td>면세상품</td>
                            <td>무형상품</td>
                            <td>PG사 수수료</td>
                            <td>PG사 포인트 적립/사용</td>
                            <td>정산내역</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>01</td>
                            <td>원조이라이프</td>
                            <td>사용</td>
                            <td>매입</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>-</td>
                            <td>+ 000</td>
                            <td>-</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail">상세보기</button>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5">합계</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
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
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>정산내역</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>업체명</th>
                            <td>원조이라이프</td>
                        </tr>
                        <tr>
                            <th>과세상품</th>
                            <td>0</td>
                        </tr>
                        <tr>
                            <th>면세상품</th>
                            <td>0</td>
                        </tr>
                        <tr>
                            <th>무형상품</th>
                            <td>0</td>
                        </tr>
                        <tr>
                            <th>할인쿠폰 사용여부</th>
                            <td>0 사용</td>
                        </tr>
                        <tr>
                            <th>매입/위탁</th>
                            <td>매입</td>
                        </tr>
                        <tr>
                            <th>PG사 수수료</th>
                            <td>0</td>
                        </tr>
                        <tr>
                            <th>PG사 포인트 적립/사용</th>
                            <td>+ 000</td>
                        </tr>
                        <tr>
                            <th>정산내역</th>
                            <td> - </td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red">확인</button>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../assets/js/index.js"></script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>