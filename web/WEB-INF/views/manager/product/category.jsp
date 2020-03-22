<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">카테고리</h2>
            <div class="main-hd-btn-wrap">
<%--                <button type="button" name="detail">화면 보기</button>--%>
                <button type="button" id="formCtegorySubmit">저장하기</button>
            </div>
        </div>
        <div class="main-body">
            <form name="defaultForm" id="defaultForm" method="post"  enctype="multipart/form-data">


            <div class="main-left">
                <div class="main-left-head">
                    <div class="left-head-tit">
                        <input type="text" class="category-select" name="pd_category_name_add" placeholder="카테고리선택" style="color:#363636!important;">
                        <input type="button" class="add-folder" value="생성" onclick="addCategory(0,$('input[name=pd_category_name_add]').val())">
                        <input type="hidden" name="pd_category_id" value="7">
                        <input type="hidden" name="pd_category_upper_code" value="7">
                        <input type="button" class="remove-folder" onclick="deleteCategory()" value="삭제">
                    </div>
                </div>
                <ul class="category-tree">
                    <li>
                        <a href="#" onclick="$('input[name=pd_category_name_add]').val('');$('input[name=pd_category_upper_code]').val(0);$('input[name=pd_category_name_add]').attr('placeholder','대분류');"><span></span>대분류</a>
                    </li>
                <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}" varStatus="status">
                        <li>
                            <a href="#" onclick="selectCategory(${list.pd_category_id})"><span></span>${list.pd_category_name}</a>
                            <ul class="category-tree-2dp">
                            <c:if test="${not empty subList}">
                                <c:forEach var="subList" items="${subList}">
                                    <c:if test="${list.pd_category_id eq subList.pd_category_upper_code}">
                                    <li>
                                        <a href="#" onclick="selectCategory(${subList.pd_category_id})"><span></span>${subList.pd_category_name}</a>
                                        <ul class="category-tree-3dp">
                                            <c:if test="${not empty thirdList}">
                                                <c:forEach var="thirdList" items="${thirdList}">
                                                    <c:if test="${subList.pd_category_id eq thirdList.pd_category_upper_code}">
                                                        <li>
                                                            <a href="#" onclick="selectCategory(${thirdList.pd_category_id})"><span></span>${thirdList.pd_category_name}</a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </ul>
                                    </li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            </ul>
                        </li>
                    </c:forEach>
                </c:if>

                </ul>
            </div>
            <div class="main-right">
                <div class="main-right-1">
                    <div class="main-right-head">
<%--                        <p>--%>
<%--                            [ <span id="pd_category_name"></span> ]<input type="text">--%>
<%--                        </p>--%>
                        <p class="left-head-tit">
                            <span>
                                <input type="text" name="pd_category_name"  style="color:#363636!important;">
                            </span>
                        </p>
                    </div>
                    <div class="main-right-sec">
                        <table class="right-table">
                            <colgroup>
                                <col style="width: 20%;">
                                <col style="width: 80%;">
                            </colgroup>
                            <tbody>
<%--                            <tr>--%>
<%--                                <td>담당자명</td>--%>
<%--                                <td><input type="text"></td>--%>
<%--                            </tr>--%>
                            <tr>
                                <td>상품수</td>
                                <td><span id="product_cnt"></span> 개 <%--(하위 카테고리 포함)--%></td>
                            </tr>
                            <tr>
                                <td>카테고리 숨김처리 여부</td>
                                <td class="radio-td">
                                    <input type="radio" id="right-ra1" name="pd_category_use_yn" class="styleClass" value="Y">
                                    <label for="right-ra1"><span>표시함</span></label>
                                    <input type="radio" id="right-ra2" name="pd_category_use_yn" class="styleClass" value="N">
                                    <label for="right-ra2"><span>표시안함</span></label>
                                </td>
                            </tr>
                            <tr>
                                <!--기획전,메인배너표시 radio버튼도 하단html와 같음-->
                                <td>메인 카테고리 표시상태</td>
                                <td class="radio-td">
                                    <input type="radio" id="pd_category_main_view1" name="pd_category_main_view" class="styleClass" value="Y">
                                    <label for="pd_category_main_view1"><span>표시</span></label>
                                    <input type="radio" id="pd_category_main_view2" name="pd_category_main_view" class="styleClass" value="N">
                                    <label for="pd_category_main_view2"><span>표시안함</span></label>
                                </td>
                            </tr>
                            <tr>
                                <!--기획전,메인배너표시 radio버튼도 하단html와 같음-->
                                <td>메인 특가상품 표시상태</td>
                                <td class="radio-td">
                                    <input type="radio" id="pd_category_main_view_sp1" name="pd_category_main_view_sp" class="styleClass" value="Y">
                                    <label for="pd_category_main_view_sp1"><span>표시</span></label>
                                    <input type="radio" id="pd_category_main_view_sp2" name="pd_category_main_view_sp" class="styleClass" value="N">
                                    <label for="pd_category_main_view_sp2"><span>표시안함</span></label>
                                </td>
                            </tr>
<%--                            <tr>--%>
<%--                                <td>관련상품 등록/수정</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="product-list">상품 리스트 보기</button>--%>
<%--                                </td>--%>
<%--                            </tr>--%>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="main-right-2">
                    <div class="main-right-sec">
                        <table class="right-table">
                            <colgroup>
                                <col style="width: 20%;">
                                <col style="width: 80%;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>기획전</td>
                                <td class="radio-td">
                                    <input type="radio" id="pd_category_event_use_y" name="pd_category_event_use_yn" class="styleClass" value="Y">
                                    <label for="pd_category_event_use_y"><span>표시함</span></label>
                                    <input type="radio" id="pd_category_event_use_n" name="pd_category_event_use_yn" class="styleClass" value="N">
                                    <label for="pd_category_event_use_n"><span>표시안함</span></label>
                                </td>
                            </tr>
                            <tr>
                                <td>배너 이미지 등록</td>
                                <td><p>* PC버전 가로 500px / 세로 255xp, 모바일버전 가로 500px / 세로 255xp</p>
                                    <img src="" onerror="this.src='http://placehold.it/300'" width="300" class="file_link"/>
                                    <div class="fileBox">

                                        <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">
                                        <label for="uploadBtn" class="btn_file">파일찾기</label>
                                        <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" class="text-width" name="pd_category_event_title"></td>
                            </tr>
                            <tr class="day-none">
                                <td>기간</td>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="from_date" class="date_pick" name="pd_category_event_start">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="to_date" class="date_pick" name="pd_category_event_end">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>간단 설명</td>
                                <td><input type="text" class="text-width" name="pd_category_event_memo"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="main-right-3">
                    <div class="main-right-sec">
                        <table class="right-table">
                            <colgroup>
                                <col style="width: 20%;">
                                <col style="width: 80%;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>매인 배너 표시</td>
                                <td class="radio-td">
                                    <input type="radio" id="pd_category_main_bn_use_y" name="banner_use_yn" class="styleClass" value="Y"><label for="pd_category_main_bn_use_y"><span>표시함</span></label>
                                    <input type="radio" id="pd_category_main_bn_use_n" name="banner_use_yn" class="styleClass" value="N"><label for="pd_category_main_bn_use_n"><span>표시안함</span></label>
                                </td>
                            </tr>
                            <tr>
                                <td>배너 이미지 등록</td>
                                <td><p>* PC버전 가로 500px / 세로 255xp, 모바일버전 가로 500px / 세로 255xp</p>
                                    <img src="" onerror="this.src='http://placehold.it/300'" width="300" class="file_link2"/>
                                    <div class="fileBox2">
                                        <input type="text" class="fileName2" id="fileName2" name="fileName2" readonly="readonly">
                                        <label for="uploadBtn2" class="btn_file2">파일찾기</label>
                                        <input type="file" id="uploadBtn2" name="uploadfile2" class="uploadBtn2">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" class="text-width" name="banner_title"></td>
                            </tr>
                            <tr class="day-none">
                                <td>기간</td>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="from_date1" class="date_pick" name="banner_start_date">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="to_date2" class="date_pick" name="banner_end_date">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>간단 설명</td>
                                <td><input type="text" class="text-width" name="banner_memo"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
<%--                <div class="main-right-4">--%>
<%--                    <div class="main-right-sec">--%>
<%--                        <table class="right-table-4">--%>
<%--                            <colgroup>--%>
<%--                                <col style="width: 3%;">--%>
<%--                                <col style="width: 5%;">--%>
<%--                                <col style="width: 10%;">--%>
<%--                                <col style="width: 5%;">--%>
<%--                                <col style="width: 50%;">--%>
<%--                                <col style="width: 15%;">--%>
<%--                                <col style="width: 5%;">--%>
<%--                                <col style="width: 7%;">--%>
<%--                            </colgroup>--%>
<%--                            <thead>--%>
<%--                            <tr>--%>
<%--                                <td>번호</td>--%>
<%--                                <td>상태</td>--%>
<%--                                <td>업체명</td>--%>
<%--                                <td>행사종류</td>--%>
<%--                                <td>행사명</td>--%>
<%--                                <td>기간</td>--%>
<%--                                <td>처리</td>--%>
<%--                                <td>정보</td>--%>
<%--                            </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>
<%--                            <tr>--%>
<%--                                <td>01</td>--%>
<%--                                <td>신청</td>--%>
<%--                                <td>안다르</td>--%>
<%--                                <td>기획전</td>--%>
<%--                                <td>가을 전품목 할인</td>--%>
<%--                                <td>2020.02.20 ~ 2020.03.10</td>--%>
<%--                                <td>---</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="product-list1">승인하기</button>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>02</td>--%>
<%--                                <td>재신청</td>--%>
<%--                                <td>안다르</td>--%>
<%--                                <td>기획전</td>--%>
<%--                                <td>가을 전품목 할인</td>--%>
<%--                                <td>2020.02.20 ~ 2020.03.10</td>--%>
<%--                                <td>---</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="product-list1">승인하기</button>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>03</td>--%>
<%--                                <td>승인</td>--%>
<%--                                <td>안다르</td>--%>
<%--                                <td>기획전</td>--%>
<%--                                <td>가을 전품목 할인</td>--%>
<%--                                <td>2020.02.20 ~ 2020.03.10</td>--%>
<%--                                <td>승인</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="product-list1">승인하기</button>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>04</td>--%>
<%--                                <td>반려</td>--%>
<%--                                <td>안다르</td>--%>
<%--                                <td>기획전</td>--%>
<%--                                <td>가을 전품목 할인</td>--%>
<%--                                <td>2020.02.20 ~ 2020.03.10</td>--%>
<%--                                <td>반려</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="product-list2">상세보기</button>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td>05</td>--%>
<%--                                <td>승인</td>--%>
<%--                                <td>안다르</td>--%>
<%--                                <td>기획전</td>--%>
<%--                                <td>가을 전품목 할인</td>--%>
<%--                                <td>2020.02.20 ~ 2020.03.10</td>--%>
<%--                                <td>승인</td>--%>
<%--                                <td>--%>
<%--                                    <button type="button" class="product-list1">승인하기</button>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                    <ul class="pagination2">--%>
<%--                        <li class="page-item"><a class="page-link" href="#">≪</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">＜</a></li>--%>
<%--                        <li class="page-item"><a class="page-link active" href="#">1</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">4</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">5</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">6</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">7</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">8</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">9</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">10</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">＞</a></li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">≫</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>


            </div>

            </form>
        </div>
    </div>
</main>
<!--모달팝업창-->
<div class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>상품 리스트</h2>
            <button type="button" class="modal-close">×</button>
        </div>
        <div class="search-form">
            <form name="listSrcForm" id="listSrcForm" method="get">
                <div class="keyword-src-wrap">
                    <input type="text" class="keyword-src" name="keyword-src">
                    <button type="submit" class="keyword-src-button">검색</button>
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
                    </tbody>
                </table>
            </form>
        </div>
        <div class="modal-body clearfix">
            <div class="goods-list-wrap">
                <div class="list-sort-wrap">
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
                        <td>구매</td>
                        <td name="detail">상태</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="checkbox" id="chk10" name="chk10"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk9" name="chk9"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk8" name="chk8"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk7" name="chk7"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk6" name="chk6"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk5" name="chk5"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk4" name="chk4"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk3" name="chk3"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk2" name="chk2"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="chk1" name="chk1"></td>
                        <td>654988</td>
                        <td>삼성 Samsung Galaxy S9+</td>
                        <td>모바일</td>
                        <td>503,200</td>
                        <td>430,000</td>
                        <td>120</td>
                        <td>기본배송</td>
                        <td>34</td>
                        <td>판매중</td>
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
            <button type="button" name="detail" class="btn-red">저장</button>
        </div>
    </div>
</div>
<div class="modal1">
    <div class="modal-content">
        <div class="modal-header">
            <h2>행사승인</h2>
            <button type="button" class="modal-close1">×</button>
        </div>
        <div class="modal-body clearfix">
            <table class="goods-detail-table1">
                <colgroup>
                    <col width="20%">
                    <col width="80%">
                </colgroup>
                <tbody>
                <tr>
                    <th>업체명</th>
                    <td>
                        <span>원조이라이프</span>
                    </td>
                </tr>
                <tr>
                    <th>행사 종류</th>
                    <td>
                        <span>기획전</span>
                    </td>
                </tr>
                <tr>
                    <th>행사명</th>
                    <td>
                        <span>가을 전품목 할인</span>
                    </td>
                </tr>
                <tr>
                    <th>국가별 진열</th>
                    <td>
                        <span>한국</span> / <span>미국</span> / <span>중국</span>
                    </td>
                </tr>
                <tr>
                    <th>브랜드</th>
                    <td>
                        <span>분류</span> / <span>분류</span> / <span>분류</span>
                    </td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <span>1차 분류 :</span><span>식품</span> /
                        <span>2차 분류 :</span><span>식품</span> /
                        <span>3차 분류 :</span><span>식품</span>
                    </td>
                </tr>
                <tr>
                    <th>소비자가 <span class="cc">&#40;필수&#41;</span></th>
                    <td><span>35000원</span></td>
                </tr>
                <tr>
                    <th>할인가</th>
                    <td><span>30000원</span></td>
                </tr>
                <tr>
                    <th>행사 설명</th>
                    <td>
                        <span>제주 신선 한라봉 1KG</span>
                    </td>
                </tr>
                <tr>
                    <th>검색어</th>
                    <td>
                        <span>검색어,검색어,검색어</span>
                    </td>
                </tr>
                <tr class="modal-tr">
                    <th class="modal-td-head">기획전/이벤트 이미지</th>
                    <td>

                        <div class="img-thumb-box">
                            <img src="http://placehold.it/500x300" alt="상품이미지"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="modal-td-head">배너 이미지</th>
                    <td>

                        <div class="img-thumb-box">
                            <img src="http://placehold.it/500x300" alt="상품이미지"/>
                        </div>
                    </td>
                </tr>
                <tr class="modal-tr">
                    <th class="modal-td-head">일정관리</th>
                    <td>
                        <div class="input-box2">
                            <span>2020.02.12</span>
                            <span> ~ </span>
                            <span>2020.03.12</span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <button type="button" name="detail" class="btn-gray">반려</button>
            <button type="button" name="detail" class="btn-red">승인</button>
        </div>
    </div>
</div>
<div class="modal2">
    <div class="modal-content">
        <div class="modal-header">
            <h2>행사신청 상세보기</h2>
            <button type="button" class="modal-close2">×</button>
        </div>
        <div class="modal-body clearfix">
            <table class="goods-detail-table1">
                <colgroup>
                    <col width="20%">
                    <col width="80%">
                </colgroup>
                <tbody>
                <tr>
                    <th>업체명</th>
                    <td>
                        <span>원조이라이프</span>
                    </td>
                </tr>
                <tr>
                    <th>행사 종류</th>
                    <td>
                        <span>기획전</span>
                    </td>
                </tr>
                <tr>
                    <th>행사명</th>
                    <td>
                        <span>가을 전품목 할인</span>
                    </td>
                </tr>
                <tr>
                    <th>국가별 진열</th>
                    <td>
                        <span>한국</span> / <span>미국</span> / <span>중국</span>
                    </td>
                </tr>
                <tr>
                    <th>브랜드</th>
                    <td>
                        <span>분류</span> / <span>분류</span> / <span>분류</span>
                    </td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <span>1차 분류 :</span><span>식품</span> /
                        <span>2차 분류 :</span><span>식품</span> /
                        <span>3차 분류 :</span><span>식품</span>
                    </td>
                </tr>
                <tr>
                    <th>소비자가 <span class="cc">&#40;필수&#41;</span></th>
                    <td><span>35000원</span></td>
                </tr>
                <tr>
                    <th>할인가</th>
                    <td><span>30000원</span></td>
                </tr>
                <tr>
                    <th>행사 설명</th>
                    <td>
                        <span>제주 신선 한라봉 1KG</span>
                    </td>
                </tr>
                <tr>
                    <th>검색어</th>
                    <td>
                        <span>검색어,검색어,검색어</span>
                    </td>
                </tr>
                <tr class="modal-tr">
                    <th class="modal-td-head">기획전/이벤트 이미지</th>
                    <td>

                        <div class="img-thumb-box">
                            <img src="http://placehold.it/500x300" alt="상품이미지"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="modal-td-head">배너 이미지</th>
                    <td>

                        <div class="img-thumb-box">
                            <img src="http://placehold.it/500x300" alt="상품이미지"/>
                        </div>
                    </td>
                </tr>
                <tr class="modal-tr">
                    <th class="modal-td-head">일정관리</th>
                    <td>
                        <div class="input-box2">
                            <span>2020.02.12</span>
                            <span> ~ </span>
                            <span>2020.03.12</span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
