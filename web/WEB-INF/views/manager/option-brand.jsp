<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">브랜드 등록</h2>
                <div class="main-hd-btn-wrap">
                    <button type="button" name="detail">브랜드 등록</button>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="src-name">
                            <label for="src-name">브랜드명</label>
                            <input type="checkbox" name="src-code">
                            <label for="src-code">브랜드코드</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="goods-list-wrap">
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="btn-default" name="copy">선택 삭제</button>
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
                        <col width="5%">
                        <col width="5%">
                        <col width="68%">
                        <col width="5%">
                        <col width="5%">
                        <col width="5%">
                        <col width="5%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>번호</td>
                            <td>브랜드코드</td>
                            <td>브랜드명</td>
                            <td>사용여부</td>
                            <td>등록 일자</td>
                            <td>상품수</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>01</td>
                            <td>B000000C</td>
                            <td>원조이라이프</td>
                            <td>사용함</td>
                            <td>2020.02.13</td>
                            <td>5</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                            </td>
                        </tr>
                    </tbody>
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
               <h2>브랜드 등록</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <h3>브랜드 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>브랜드명 <span class="cc">&#40;필수&#41;</span></th>
                            <td>
                                <input type="text" id="brand-name" name="brand-name" value="" placeholder="원조이라이프">
                            </td>
                            
                        </tr>
                        <tr>
                            <th>브랜드코드</th>
                            <td>자동생성</td>
                        </tr>
                        <tr>
                            <th>사용여부</th>
                            <td>
                                <input type="radio" id="brand1-ra1" name="brand-radio" checked>
                                <label for="brand1-ra1" class="brand-label"><span>표시</span></label>
                                <input type="radio" id="brand1-ra2" name="brand-radio">
                                <label for="brand1-ra2"><span>표시 안함</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th>검색어 설정</th>
                            <td>
                                <input type="text" id="brand-name" name="brand-name" value="">
                                <p>* 쉼표(,)로 구분</p>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red">등록하기</button>
            </div>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>브랜드 상세보기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <h3>브랜드 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>브랜드명 <span class="cc">&#40;필수&#41;</span></th>
                            <td>
                                <span>원조이라이프</span>
                            </td>
                            
                        </tr>
                        <tr>
                            <th>브랜드코드</th>
                            <td><span>B000000C</span></td>
                        </tr>
                        <tr>
                            <th>사용여부</th>
                            <td>
                                <input type="radio" id="brand2-ra1" name="brand-radio2" checked>
                                <label for="brand2-ra1" class="brand-label"><span>표시</span></label>
                                <input type="radio" id="brand2-ra2" name="brand-radio2">
                                <label for="brand2-ra2"><span>표시 안함</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th>검색어 설정</th>
                            <td>
                                <input type="text" id="brand-name" name="brand-name" value="">
                                <p>* 쉼표(,)로 구분</p>
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red">변경하기</button>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>