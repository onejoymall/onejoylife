<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">회원 마케팅관리</h2>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="src-name" id="src-name">
                            <label for="src-name">이름</label>
                            <input type="checkbox" name="src-id" id="src-id">
                            <label for="src-id">아이디</label>
                            <input type="checkbox" name="src-age" id="src-age">
                            <label for="src-age">나이</label>
                        </div>
                    </div>
                    <table class="keyword-src-table">
                        <colgroup>
                            <col width="10%">
                            <col width="23%">
                            <col width="10%">
                            <col width="23%">
                            <col width="10%">
                            <col width="24%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>등급</th>
                                <td>
                                    <select name="src-grade">
                                        <option value="전체">전체</option>
                                        <option value="일반회원">일반회원</option>
                                        <option value="우수회원">우수회원</option>
                                        <option value="특별회원">특별회원</option>
                                    </select>
                                </td>
                                <th>지역</th>
                                <td>
                                    <select name="src-category">
                                        <option value="전체">전체</option>
                                        <option value="서울">서울</option>
                                        <option value="경기">경기</option>
                                    </select>
                                </td>
                                <th>성별</th>
                                <td class="age-margin">
                                    <input type="radio" name="age-radio" id="age-all" checked="">
                                    <label for="age-all">전체</label>
                                    <input type="radio" name="age-radio" id="age-wom">
                                    <label for="age-wom">여자</label>
                                    <input type="radio" name="age-radio" id="age-man">
                                    <label for="age-man">남자</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="goods-list-wrap txt-align1">
                <h4 class="list-tit">회원 리스트</h4>
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="big" name="copy">선택 삭제</button>
                        <button type="button" class="big" name="detail">선택 메일보내기</button>
                        <button type="button" class="big" name="detail1">선택 SMS보내기</button>
                        <button type="button" class="big" name="detail2-1">선택 로그인 푸시보내기</button>
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
                        <col width="8%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>등록일</td>
                            <td>이름</td>
                            <td>아이디</td>
                            <td>등급</td>
                            <td>성별</td>
                            <td>나이</td>
                            <td>지역</td>
                            <td>마일리지</td>
                            <td>포인트</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk10" name="chk10"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk9" name="chk9"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk8" name="chk8"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk7" name="chk7"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk6" name="chk6"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk5" name="chk5"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk4" name="chk4"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk3" name="chk3"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk2" name="chk2"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1" name="chk1"></td>
                            <td>2020-02-28</td>
                            <td>홍동길</td>
                            <td>onejoy12</td>
                            <td>일반</td>
                            <td>남자</td>
                            <td>20</td>
                            <td>경기</td>
                            <td>0</td>
                            <td>0</td>
                            <td>
                                <button type="button" class="goods-list-btn" name="detail3">상세보기</button>
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
            <div class="goods-list-wrap1 txt-align2">
                <h4 class="list-tit">회원가입 및 로그관리</h4>
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="goods-list-btn" name="copy">선택 삭제</button>
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
                        <col width="3%">
                        <col width="5%">
                        <col width="7%">
                        <col width="20%">
                        <col width="25%">
                        <col width="20%">
                        <col width="20%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk1" name="all-chk1"></td>
                            <td>번호</td>
                            <td>관리자</td>
                            <td>회원아이디</td>
                            <td>유형</td>
                            <td>실행내용</td>
                            <td>일시</td>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td><input type="checkbox" id="chk1-10" name="chk1-10"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-9" name="chk1-9"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-8" name="chk1-8"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-7" name="chk1-7"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-6" name="chk1-6"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-5" name="chk1-5"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-4" name="chk1-4"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-3" name="chk1-3"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-2" name="chk1-2"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="chk1-1" name="chk1-1"></td>
                            <td>1</td>
                            <td>관리자</td>
                            <td>onejoy12</td>
                            <td>-</td>
                            <td>로그인</td>
                            <td>2020-02-28</td>
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
               <h2>이메일 보내기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form name="member-management" id="member-management" method="get">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th colspan="2">보내는 사람</th>
                                <td>이름: <input type="text" placeholder="원조이라이프">
                                    메일주소: <input type="text" placeholder="onejoy-life.com">
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="6">받는사람</th>
                                <th>회원등급</th>
                                <td>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck1">
                                    <label for="mem-class-ck1">일반회원</label>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck2">
                                    <label for="mem-class-ck2">우수회원</label>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck3">
                                    <label for="mem-class-ck3">특별회원</label>
                                </td>
                            </tr>
                            <tr>
                                <th>나이</th>
                                <td>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck1">
                                    <label for="age-class-ck1">10대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck2">
                                    <label for="age-class-ck2">20대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck3">
                                    <label for="age-class-ck3">30대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck4">
                                    <label for="age-class-ck4">40대 이상</label>
                                </td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>
                                    <input type="checkbox" name="sex-class-ck" id="sex-class-ck1">
                                    <label for="">여자</label>
                                    <input type="checkbox" name="sex-class-ck" id="sex-class-ck2">
                                    <label for="sex-class-ck2">남자</label>
                                </td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <p class="cc2">해당 상품이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                    <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                    <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                    <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                                     <input type="text" id="goods-cate" name="goods-cate" placeholder="ex) 24|29|30">
                                 </td>
                            </tr>
                            <tr>
                                <th>상품정보</th>
                                <td>
                                    <input type="checkbox" name="product-class-ck" id="prod-class-ck1">
                                    <label for="prod-class-ck1">구매상품</label>
                                    <input type="checkbox" name="product-class-ck" id="prod-class-ck2">
                                    <label for="prod-class-ck2">장바구니 상품</label>
                                </td>
                            </tr>
                            <tr>
                                <th>메일수신거부</th>
                                <td>
                                    <input type="checkbox" name="mail-class-ck" id="mail-class-ck1">
                                    <label for="mail-class-ck1">포함</label>
                                    <input type="checkbox" name="mail-class-ck" id="mail-class-ck2">
                                    <label for="mail-class-ck2">제외</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <textarea name="mem-mail" id="summernote"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red">발송하기</button>
                    <button type="button" class="btn-red">취소</button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>SMS 보내기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form name="member-management" id="member-management" method="get">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th colspan="2">보내는 사람</th>
                                <td>이름: <input type="text" placeholder="원조이라이프">
                                    번호: <input type="text" placeholder="000-0000-0000">
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="6">받는사람</th>
                                <th>회원등급</th>
                                <td>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck1">
                                    <label for="mem-class-ck1">일반회원</label>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck2">
                                    <label for="mem-class-ck2">우수회원</label>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck3">
                                    <label for="mem-class-ck3">특별회원</label>
                                </td>
                            </tr>
                            <tr>
                                <th>나이</th>
                                <td>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck1">
                                    <label for="age-class-ck1">10대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck2">
                                    <label for="age-class-ck2">20대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck3">
                                    <label for="age-class-ck3">30대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck4">
                                    <label for="age-class-ck4">40대 이상</label>
                                </td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>
                                    <input type="checkbox" name="sex-class-ck" id="sex-class-ck1">
                                    <label for="">여자</label>
                                    <input type="checkbox" name="sex-class-ck" id="sex-class-ck2">
                                    <label for="sex-class-ck2">남자</label>
                                </td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <p class="cc2">해당 상품이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                    <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                    <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                    <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                                     <input type="text" id="goods-cate" name="goods-cate" placeholder="ex) 24|29|30">
                                 </td>
                            </tr>
                            <tr>
                                <th>상품정보</th>
                                <td>
                                    <input type="checkbox" name="product-class-ck" id="prod-class-ck1">
                                    <label for="prod-class-ck1">구매상품</label>
                                    <input type="checkbox" name="product-class-ck" id="prod-class-ck2">
                                    <label for="prod-class-ck2">장바구니 상품</label>
                                </td>
                            </tr>
                            <tr>
                                <th>SMS수신거부</th>
                                <td>
                                    <input type="checkbox" name="mail-class-ck" id="mail-class-ck1">
                                    <label for="mail-class-ck1">포함</label>
                                    <input type="checkbox" name="mail-class-ck" id="mail-class-ck2">
                                    <label for="mail-class-ck2">제외</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <textarea name="mem-SMS" id="summernote2"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red">발송하기</button>
                    <button type="button" class="btn-red">취소</button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal2">
        <div class="modal-content">
            <div class="modal-header">
               <h2>로그인 푸시보내기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <form name="member-management" id="member-management" method="get">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="10%">
                            <col width="10%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th colspan="2">보내는 사람</th>
                                <td>이름: <input type="text" placeholder="원조이라이프">
                                    번호: <input type="text" placeholder="000-0000-0000">
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="6">받는사람</th>
                                <th>회원등급</th>
                                <td>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck1">
                                    <label for="mem-class-ck1">일반회원</label>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck2">
                                    <label for="mem-class-ck2">우수회원</label>
                                    <input type="checkbox" name="member-class-ck" id="mem-class-ck3">
                                    <label for="mem-class-ck3">특별회원</label>
                                </td>
                            </tr>
                            <tr>
                                <th>나이</th>
                                <td>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck1">
                                    <label for="age-class-ck1">10대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck2">
                                    <label for="age-class-ck2">20대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck3">
                                    <label for="age-class-ck3">30대</label>
                                    <input type="checkbox" name="age-class-ck" id="age-class-ck4">
                                    <label for="age-class-ck4">40대 이상</label>
                                </td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>
                                    <input type="checkbox" name="sex-class-ck" id="sex-class-ck1">
                                    <label for="">여자</label>
                                    <input type="checkbox" name="sex-class-ck" id="sex-class-ck2">
                                    <label for="sex-class-ck2">남자</label>
                                </td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>
                                    <p class="cc2">해당 상품이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                    <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                    <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                    <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                                     <input type="text" id="goods-cate" name="goods-cate" placeholder="ex) 24|29|30">
                                 </td>
                            </tr>
                            <tr>
                                <th>상품정보</th>
                                <td>
                                    <input type="checkbox" name="product-class-ck" id="prod-class-ck1">
                                    <label for="prod-class-ck1">구매상품</label>
                                    <input type="checkbox" name="product-class-ck" id="prod-class-ck2">
                                    <label for="prod-class-ck2">장바구니 상품</label>
                                </td>
                            </tr>
                            <tr>
                                <th>SMS수신거부</th>
                                <td>
                                    <input type="checkbox" name="mail-class-ck" id="mail-class-ck1">
                                    <label for="mail-class-ck1">포함</label>
                                    <input type="checkbox" name="mail-class-ck" id="mail-class-ck2">
                                    <label for="mail-class-ck2">제외</label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <textarea name="mem-push" id="summernote3"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red">발송하기</button>
                    <button type="button" class="btn-red">취소</button>
                </form>
            </div>
        </div>
    </div>
    <div class="modal3">
        <div class="modal-content">
            <div class="modal-header">
               <h2>회원 상세보기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
               <form name="member-management" id="member-management" method="get">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>회원 등급명</th>
                                <td>일반회원</td>
                            </tr>
                            <tr>
                                <th>회원 등급설명</th>
                                <td> - </td>
                            </tr>
                            <tr>
                                <th>등록일</th>
                                <td>2020-02-28</td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>홍길동</td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td>onejoy12</td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td>남자</td>
                            </tr>
                            <tr>
                                <th>나이</th>
                                <td>20</td>
                            </tr>
                            <tr>
                                <th>마일리지</th>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>포인트</th>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>수신여부</th>
                                <td>수신동의</td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red">확인</button>
               </form>
                
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>

    <script>
        //summernote
        $(document).ready(function (){
            $('#summernote').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
            $('#summernote2').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
            $('#summernote3').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
        });
    </script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>