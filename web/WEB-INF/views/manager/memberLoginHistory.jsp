<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">일반 회원관리</h2>
            <div class="main-hd-btn-wrap">
                <button type="button" name="detail">회원등급 설정</button>
            </div>
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
            <h2>회원등급 설정</h2>
            <button type="button" class="modal-close">×</button>
        </div>
        <div class="modal-body clearfix">
            <form name="member-management" id="member-management" method="get">
                <h2>회원등급 목록</h2>
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="goods-list-btn">선택 삭제</button>
                        <button type="button" class="goods-list-btn member-list-btn">선택 수정</button>
                    </div>
                    <div class="right">
                    </div>
                </div>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="2%">
                        <col width="10%">
                        <col width="11%">
                        <col width="13%">
                        <col width="9%">
                        <col width="13%">
                        <col width="9%">
                        <col width="13%">
                        <col width="9%">
                        <col width="11%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th rowspan="2"><input type="checkbox" id="all-chk2" name="all-chk1"></th>
                        <th rowspan="2">등급명</th>
                        <th rowspan="2">혜택 결제조건</th>
                        <th colspan="2">할인적용</th>
                        <th colspan="2">포인트 적립</th>
                        <th colspan="2">차등지급 가격</th>
                        <th rowspan="2">회원수</th>
                    </tr>
                    <tr>
                        <th>구매금액(이상)</th>
                        <th>적용</th>
                        <th>구매금액(이상)</th>
                        <th>적립</th>
                        <th>구매금액(이상)</th>
                        <th>지급</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk2-2" name="chk2-2"></td>
                        <td>일반회원</td>
                        <td>모든결제</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk2-1" name="chk2-1"></td>
                        <td>일반회원</td>
                        <td>모든결제</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>0</td>
                    </tr>
                    </tbody>
                </table>
                <button type="button" class="btn-red member-add">회원등급 추가</button>
                <button type="button" class="btn-red">저장하기</button>
            </form>
        </div>
    </div>
</div>
<div class="modal1">
    <div class="modal-content">
        <div class="modal-header">
            <h2>상세보기</h2>
            <button type="button" class="modal-close">×</button>
        </div>
        <div class="modal-body clearfix">
            <h3>포인트 정보</h3>
            <table class="goods-detail-table">
                <colgroup>
                    <col width="20%">
                    <col width="80%">
                </colgroup>
                <tbody>
                <tr>
                    <th>회원명</th>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <th>회원 ID</th>
                    <td>onejoy12</td>
                </tr>
                <tr>
                    <th>회원등급</th>
                    <td>일반회원</td>
                </tr>
                <tr>
                    <th>포인트</th>
                    <td>0</td>
                </tr>
                <tr>
                    <th>포인트 지급</th>
                    <td><input type="text"><button type="button" class="point-btn">지급</button></td>
                </tr>
                <tr>
                    <th>포인트 환수</th>
                    <td><input type="text"><button type="button" class="point-btn">환수</button></td>
                </tr>
                </tbody>
            </table>
            <button type="button" class="btn-red">저장</button>
        </div>
    </div>
</div>
<div class="modal2">
    <div class="modal-content">
        <div class="modal-header">
            <h2>회원등급 추가</h2>
            <button type="button" class="modal2-close">×</button>
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
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>회원 등급설명</th>
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>혜택 결제 조건</th>
                        <td>
                            <input type="radio" name="use-dc" id="use-dc-F" checked>
                            <label for="use-dc-F">모든 결제</label>
                            <input type="radio" name="use-dc" id="use-dc-C">
                            <label for="use-dc-C">현금 결제(무통장)</label>
                            <input type="radio" name="use-dc" id="use-dc-A">
                            <label for="use-dc-A">현금 결제 외 모든 결제</label>
                        </td>
                    </tr>
                    <tr>
                        <th>할인적용</th>
                        <td class="in-txt-width">
                            <input type="text"> 원 이상 구매시
                            <input type="text" placeholder="원 / %"> 적용
                        </td>
                    </tr>
                    <tr>
                        <th>포인트 적립</th>
                        <td class="in-txt-width">
                            <input type="text"> 원 이상 구매시
                            <input type="text" placeholder="원 / %"> 적립
                        </td>
                    </tr>
                    <tr>
                        <th>차등지급 가격</th>
                        <td class="in-txt-width">
                            <input type="text"> 원 이상 구매시
                            <input type="text" placeholder="원 / %"> 지급
                        </td>
                    </tr>
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red">회원등급 추가</button>
            </form>

        </div>
    </div>
</div>
<div class="modal3">
    <div class="modal-content">
        <div class="modal-header">
            <h2>회원등급 수정</h2>
            <button type="button" class="modal3-close">×</button>
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
                        <td>
                            <input type="text" value="일반회원">
                        </td>
                    </tr>
                    <tr>
                        <th>회원 등급설명</th>
                        <td>
                            <input type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>혜택 결제 조건</th>
                        <td>
                            <input type="radio" name="use-dc2" id="use-dc2-F" checked>
                            <label for="use-dc2-F">모든 결제</label>
                            <input type="radio" name="use-dc2" id="use-dc2-C">
                            <label for="use-dc2-C">현금 결제(무통장)</label>
                            <input type="radio" name="use-dc2" id="use-dc2-A">
                            <label for="use-dc2-A">현금 결제 외 모든 결제</label>
                        </td>
                    </tr>
                    <tr>
                        <th>할인적용</th>
                        <td class="in-txt-width">
                            <input type="text"> 원 이상 구매시
                            <input type="text" placeholder="원 / %"> 적용
                        </td>
                    </tr>
                    <tr>
                        <th>포인트 적립</th>
                        <td class="in-txt-width">
                            <input type="text"> 원 이상 구매시
                            <input type="text" placeholder="원 / %"> 적립
                        </td>
                    </tr>
                    <tr>
                        <th>차등지급 가격</th>
                        <td class="in-txt-width">
                            <input type="text"> 원 이상 구매시
                            <input type="text" placeholder="원 / %"> 지급
                        </td>
                    </tr>
                    </tbody>
                </table>
                <button type="button" class="btn-red">수정하기</button>
            </form>

        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>