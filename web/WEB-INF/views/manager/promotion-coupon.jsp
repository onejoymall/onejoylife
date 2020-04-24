<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">쿠폰 관리</h2>
            <div class="main-hd-btn-wrap">
                <button type="button" name="detail">쿠폰 등록</button>
<%--                <button type="button"><i class="exel-ic"></i>일괄 등록/수정</button>--%>
            </div>
        </div>
        <div class="search-form">
            <form name="listSrcForm" id="listSrcForm" method="get">
                <div class="keyword-src-wrap">
                    <input type="text" class="keyword-src" name="keyword-src">
                    <button type="submit" class="keyword-src-button">검색</button>
                    <div class="src-filter-wrap">
                        <input type="checkbox" name="src-name">
                        <label for="src-name">쿠폰명</label>
                        <input type="checkbox" name="src-code">
                        <label for="src-code">상품코드</label>
                    </div>
                </div>

            </form>
        </div>
        <div class="goods-list-wrap">
            <div class="list-sort-wrap">
               <%--  <div class="left">
                    <button type="button" class="btn-default" name="copy">선택 삭제</button>
                   <button type="button" class="btn-default" name="copy">선택 복사 등록</button>
                   <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button>
                   <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>전체 다운로드</button>
                </div><!-- 
                <div class="right">
                    <select name="order" class="order-select">
                        <option value="32">10개씩 보기</option>
                        <option value="60">50개씩 보기</option>
                        <option value="92">100개씩 보기</option>
                    </select>
                </div> --> --%>
            </div>
            <table>
                <colgroup>
                    <%-- <col width="2%">
                    <col width="5%"> --%>
                    <col width="33%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                </colgroup>
                <thead>
                <tr>
                    <!-- <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                    <td name="detail">번호</td> -->
                    <td name="detail">쿠폰명</td>
                    <td>발급수</td>
                    <td>쿠폰사용 매출액</td>
                    <td>쿠폰 수익률 조회</td>
                    <td>상태</td>
                    <td>등록일</td>
                    <td>관리</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <!-- <td><input type="checkbox" id="chk10" name="chk10"></td>
                    <td>01</td> -->
                    <td>신규 가입 회원 3,000원 할인 적용</td>
                    <td>0</td>
                    <td>0원</td>
                    <td>20%</td>
                    <td class="txt-active">발급중</td>
                    <td>2020-02-18 00:00:00</td>
                    <td>
                        <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                    </td>
                </tr>
                <tr>
                    <!-- <td><input type="checkbox" id="chk9" name="chk9"></td>
                    <td>01</td> -->
                    <td>신규 가입 회원 3,000원 할인 적용</td>
                    <td>0</td>
                    <td>0원</td>
                    <td>20%</td>
                    <td class="txt-active">발급중</td>
                    <td>2020-02-18 00:00:00</td>
                    <td>
                        <button type="button" class="goods-list-btn" name="detail1">상세보기</button>
                    </td>
                </tr>
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
        <form id="insertForm" method="POST">
            <div class="modal-header">
                <h2>쿠폰 등록</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
<%--                <div class="right">--%>
<%--                    <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>쿠폰 정보 다운로드</button>--%>
<%--                </div>--%>
                <h3>발급 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>쿠폰명 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" id="coupon_name" name="coupon_name" value="" placeholder="쿠폰명">
                        </td>
                    </tr>
                    <tr>
                        <th>공급사</th>
                        <td>
                            <p class="cc2">&#91;판매분류관리 &gt; 공급사 관리&#93;에 등록한 유효한 공급사 코드를 입력합니다.
                            </p>
                            <input type="text" id="supplier_cd" name="supplier_cd" placeholder="ex) S00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 등록&#40;상세&#41;</th>
                        <td>
                        	<input type="text" class="fileName" name="fileName" readonly="readonly">
                            <input type="file" name="uploadfile" class="uploadBtn">
                        </td>
                    </tr>
					 <tr>
                        <th>국가별 공급</th>
                        <td>
                            <input type="checkbox" name="country_supply" value="korea" id="nation1-ck1" checked>
                            <label for="nation1-ck1">한국</label>
                            <input type="checkbox" name="country_supply" value="usa" id="nation1-ck2">
                            <label for="nation1-ck2">미국</label>
                            <input type="checkbox" name="country_supply" value="china" id="nation1-ck3">
                            <label for="nation1-ck3">중국</label>
                        </td>
                    </tr>
                    <tr>
                        <th>혜택구분 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="radio" id="discount-radio1" name="coupon_sale_type" value="amount"  checked>
                            <label for="discount-radio1">할인금액</label>
                            <input type="radio" id="discount-radio2" name="coupon_sale_type" value="percentage">
                            <label for="discount-radio2">할인율</label>
                        </td>
                    </tr>
                    <tr class="discount-detail1" >
                        <th>할인금액</th>
                        <td>
                            <input type="text" id="discount1-rd" name="coupon_sale_payment" placeholder="" class="txt-right"> 원
                        </td>
                    </tr>
                    <tr class="discount-detail2" style="display:none">
                        <th>할인율</th>
                        <td>
                            <input type="text" id="discount1-rd1" name="coupon_sale_rate" placeholder="" class="txt-right"> %
                        </td>
                    </tr>
                    <tr>
                        <th>발급 구분</th>
                        <td>
                            <select class="option-box" name="coupon_condition1">
                                <option data-id="option1" value="T">대상자 지정 발급</option>
                                <option data-id="option2" value="next2">조건부 자동 발급</option>
                                <option data-id="option3" value="next3">고객 다운로드 발급</option>
                            </select>

                            <select class="option-select" name="coupon_condition2" id="option2-select" style="display: none;">
                                <option data-id="option2-1" value="J" selected="selected">회원가입</option>
                                <option data-id="option2-2" value="D">배송완료시</option>
                                <option data-id="option2-3" value="B">기념일(생일)</option>
                                <option data-id="option2-4" value="R">상품 후기 작성</option>
                                <option data-id="option2-5" value="C">주문 완료 시</option>
                                <option data-id="option2-6" value="F">첫 구매 고객</option>
                                <option data-id="option2-7" value="S">구매 수량 충족시</option>
                            </select>
                            <select class="option-select" name="coupon_condition3" id="option3-select" style="display: none;">
                                <option data-id="option3-1" value="L" value="option3-1">회원 대상</option>
                                <option data-id="option3-2" value="M" value="option3-2">일정기간 미구매 회원 대상</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="goods-detail-table option1-box option-wrap">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 대상자 지정 발급 -->
                    <tr>
                        <th>발급시점</th>
                        <td>
                        	<div class="option1-box1">
	                            <input type="radio" name="coupon_issue_time" id="option1-rd1" value="N" checked>
	                            <label for="option1-rd1">즉시 발급</label>
	                            <input type="radio" name="coupon_issue_time" id="option1-rd2" value="S">
	                            <label for="option1-rd2">지정한 시점에 발급</label>
	                            <div id="option1-rd2-txt" style="display: none;">
	                                <input type="text" name="coupon_issue_date" placeholder="ex) 2020-02-28">
	                            </div>
                            </div>
                            <div class="option2-box3">
	                            <input type="radio" id="iss1" name="coupon_issue_time" value="A"/>
	                            <label for="iss1">기념일 당일 발급</label>
	                            <input type="radio" id="iss2" name="coupon_issue_time" value="B">
	                            <label for="iss2">사용</label>
	                            <span><input type="text" value="3" name="coupon_anniversary_before" class="txt-right num-width1"> 일 전 선 발행</span>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="goods-detail-table option2-box option-wrap">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 조건부 자동 발급 -->
                    <!-- 회원가입 -->
                    <!-- <tr class="option2-box1" style="display: table-row;">
                        <th>발급 대상자 설정 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="join-radio" id="join-radio1" checked>
                            <label for="join-radio1">가입회원</label>
                            <input type="checkbox" name="join-radio" id="join-radio2">
                            <label for="join-radio2">추천인</label>
                            <select name="" id="">
                                <option value="제한없음">제한없음</option>
                                <option value="sms&메일">SMS 수신동의  AND 이메일 수신동의</option>
                                <option value="smsOR메일">SMS 수신동의  OR 이메일 수신동의</option>
                                <option value="sms">SMS 수신동의</option>
                                <option value="메일">이메일 수신동의</option>
                            </select>
                        </td>
                    </tr> -->
                    <!-- 배송 완료 시 -->
                    <!-- <tr class="option2-box2">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc-mo1" id="pc-mo1-1" checked>
                            <label for="pc-mo1-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc-mo1" id="pc-mo1-2" checked>
                            <label for="pc-mo1-2">모바일쇼핑몰</label>
                        </td>
                    </tr> -->
                    <tr class="option2-box2 option2-box2-1">
                        <th>발급 가능 구매 금액</th>
                        <td>
                            <select name="" id="">
                                <option value="">주문 금액기준</option>
                                <!-- <option value="">실결제 금액기준</option> -->
                            </select>
                            <select name="box2-out-select1" id="box2-out-select1">
                                <option value="box2-in1-1">제한없음</option>
                                <option value="box2-in1-2">최소금액</option>
                                <!-- <option value="box2-in1-3">금액 범위</option> -->
                            </select>
                            <span class="box2-span box2-txt1">
                                         <input type="text" class="txt-right num-width2" name="coupon_min_amount">
                                         <span> 원</span>
                                     </span>
                            <span class="box2-span box2-txt2">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 이상 ~ </span>
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <tr class="option2-box7">
                        <th>수량 판단 기준</th>
                        <td>
                            <input type="radio" id="num1-1" name="coupon_buy_count_condition" value="P" checked>
                            <label for="num1-1">상품 수량 기준</label>
                            <input type="radio" id="num1-2" name="coupon_buy_count_condition" value="O">
                            <label for="num1-2">주문 수량 기준</label>
                        </td>
                    </tr>
                    <tr class="option2-box7">
                        <th>최소 구매 수량 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" value="1" class="txt-right num-width1" name="coupon_min_buy_count">
                            <span>개</span>
                        </td>
                    </tr>
                    <!-- <tr class="option2-box2">
                        <th>1회 발급 수량</th>
                        <td>
                            <input type="radio" id="iss-num1" name="iss-num" value="I1">
                            <label for="iss-num1">1장씩 발급</label>
                            <input type="radio" id="iss-num2" name="iss-num" checked>
                            <label for="iss-num2">설정된 수량만큼 발급</label>
                            <select name="iss-num-select" id="" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                            </select>
                            <span>매</span>
                        </td>
                    </tr>
                    <tr class="option2-box2">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="option2-box2">
                        <th>발급단위</th>
                        <td>
                            <select name="box2-out-select2" id="box2-out-select2">
                                <option value="box2-in2-1">주문서</option>
                                <option value="box2-in2-2">상품</option>
                            </select>
                        </td>
                    </tr>
                    발급단위 상품
                    <tr class="option2-box2-in2" style="display: none;">
                        <th>발급 대상 상품</th>
                        <td>
                            <input type="radio" id="iss-product1" name="iss-product" checked>
                            <label for="iss-product1">제한 없음</label>
                            <input type="radio" id="iss-product2" name="iss-product">
                            <label for="iss-product2">선택 상품 적용</label>
                        </td>
                    </tr>
                    <tr class="option2-box2-in2" style="display: none;">
                        <th>발급 대상 카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods-cate" name="goods-cate" placeholder="ex) 24|29|30">
                        </td>
                    </tr>
                    <tr class="option2-box2">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss-count1" name="iss-count" value="count-I1">
                            <label for="iss-count1">제한 없음</label>
                            <input type="radio" id="iss-count2" name="iss-count" checked>
                            <label for="iss-count2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss-count-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="option2-box2">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss-yn1" name="iss-yn" value="yn-I1">
                            <label for="iss-yn1">불가능</label>
                            <input type="radio" id="iss-yn2" name="iss-yn" checked>
                            <label for="iss-yn2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss-yn-span"> 매</span>
                        </td>
                    </tr> -->
                    <tr class="option2-box2 option2-box2-2">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss-day1" name="iss-day" value="D1">
                            <label for="iss-day1">설정안함</label>
                            <input type="radio" id="iss-day2" name="iss-day" checked>
                            <label for="iss-day2">설정함</label>
                            <span>
                                         <!-- <input type="text"  placeholder="ex) 2020-02-24"  name="day-iss1">
                                         <span> ~ </span> -->
                                         <input type="text"  placeholder="ex) 2020-03-24"  name="coupon_issue_order_end">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <!-- 기념일(생일) -->
                    <!-- <tr class="option2-box3">
                        <th>기념일 정보</th>
                        <td>
                            <input type="radio" id="birthday-radio1" name="birthday-radio" checked>
                            <label for="birthday-radio1">생일</label>
                            <input type="radio" id="birthday-radio2" name="birthday-radio">
                            <label for="birthday-radio2">결혼 기념일</label>
                            <input type="radio" id="birthday-radio3" name="birthday-radio">
                            <label for="birthday-radio3">배우자 생일</label>
                        </td>
                    </tr>
                    <tr class="option2-box3">
                        <th>발급대상 회원등급</th>
                        <td>
                            <input type="radio" id="iss-mem1" name="iss-mem" checked>
                            <label for="iss-mem1">모든회원</label>
                            <input type="radio" id="iss-mem2" name="iss-mem">
                            <label for="iss-mem2">일반회원</label>
                        </td>
                    </tr> -->
                    <!-- <tr class="option2-box3">
                        <th>발급시점</th>
                        <td>
                            <input type="radio" id="iss1" name="coupon_issue_time" value="E" checked/>
                            <label for="iss1">기념일 당일 발급</label>
                            <input type="radio" id="iss2" name="coupon_issue_time" value="S">
                            <label for="iss2">사용</label>
                            <span><input type="text" value="3" name="coupon_anniversary_before" class="txt-right num-width1"> 일 전 선 발행</span>
                        </td>
                    </tr> -->
                    <!-- 상품 후기 작성 -->
                    <tr class="option2-box4">
                        <th>후기작성 조건 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            상품사용후기
                            <input type="text" value="1" class="txt-right num-width1" name="coupon_review_condition"> 개 이상 작성시
                            <!-- <span>
                                         ( <input type="checkbox"> 이미지 필수등록 )
                                     </span> -->
                        </td>
                    </tr>
                    <!-- <tr class="option2-box4">
                        <th>발급대상 회원등급</th>
                        <td>
                            <input type="radio" id="iss-mem1-1" name="iss-mem1" checked>
                            <label for="iss-mem1-1">모든회원</label>
                            <input type="radio" id="iss-mem1-2" name="iss-mem1">
                            <label for="iss-mem1-2">일반회원</label>
                        </td>
                    </tr>
                    <tr class="option2-box4">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss-count1-1" name="iss-count1" value="count-I2">
                            <label for="iss-count1-1">제한없음</label>
                            <input type="radio" id="iss-count1-2" name="iss-count1" checked>
                            <label for="iss-count1-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss-count1-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="option2-box4">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss-yn-1" name="iss-yn1" value="yn-I2">
                            <label for="iss-yn-1">불가능</label>
                            <input type="radio" id="iss-yn-2" name="iss-yn1" checked>
                            <label for="iss-yn-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss-yn1-span"> 매</span>
                        </td>
                    </tr> -->
                    <!-- 주문 완료 시 -->
                    <!-- <tr class="option2-box5">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc-mo2" id="pc-mo2-1" checked>
                            <label for="pc-mo2-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc-mo2" id="pc-mo2-2" checked>
                            <label for="pc-mo2-2">모바일쇼핑몰</label>
                        </td>
                    </tr> -->
                    <!-- <tr class="option2-box5">
                        <th>발급 가능 구매 금액</th>
                        <td>
                            <select name="" id="">
                                <option value="">주문 금액기준</option>
                                <option value="">실결제 금액기준</option>
                            </select>
                            <select name="box5-out-select1" id="box5-out-select1">
                                <option value="box5-in1-1" selected="selected">제한없음</option>
                                <option value="box5-in1-2">최소금액</option>
                                <option value="box5-in1-3">금액 범위</option>
                            </select>
                            <span class="box5-span box5-txt1">
                                         <input type="text" class="txt-right num-width2" name="coupon_min_amount">
                                         <span> 원</span>
                                     </span>
                            <span class="box5-span box5-txt2">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 이상 ~ </span>
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 까지</span>
                                     </span>
                        </td>
                    </tr> -->
                    <!-- <tr class="option2-box5">
                        <th>1회 발급 수량</th>
                        <td>
                            <input type="radio" id="iss-num1-1" name="iss-num1" value="I2">
                            <label for="iss-num1-1">1장씩 발급</label>
                            <input type="radio" id="iss-num2-2" name="iss-num1">
                            <label for="iss-num2-2">설정된 수량만큼 발급</label>
                            <select name="iss-num1-select" id="iss-num1-select" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                            </select>
                            <span>매</span>
                        </td>
                    </tr>
                    <tr class="option2-box5">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="option2-box5">
                        <th>발급단위</th>
                        <td>
                            <select name="box5-out-select2" id="box5-out-select2">
                                <option value="box5-in2-1">주문서</option>
                                <option value="box5-in2-2">상품</option>
                            </select>
                        </td>
                    </tr>
                    발급단위 상품
                    <tr class="option2-box5-in2">
                        <th>발급 대상 상품</th>
                        <td>
                            <input type="radio" id="iss-product1-1" name="iss-product1" checked>
                            <label for="iss-product1-1">제한 없음</label>
                            <input type="radio" id="iss-product1-2" name="iss-product1">
                            <label for="iss-product1-2">선택 상품 적용</label>
                        </td>
                    </tr>
                    <tr class="option2-box5-in2">
                        <th>발급 대상 카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods-cate1" name="goods-cate1" placeholder="ex) 24|29|30">
                        </td>
                    </tr>
                    <tr class="option2-box5">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss-count2-1" name="iss-count2" value="count-I3">
                            <label for="iss-count2-1">제한 없음</label>
                            <input type="radio" id="iss-count2-2" name="iss-count2" checked>
                            <label for="iss-count2-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss-count2-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="option2-box5">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss-yn2-1" name="iss-yn2" value="yn-I3">
                            <label for="iss-yn2-1">불가능</label>
                            <input type="radio" id="iss-yn2-2" name="iss-yn2" checked>
                            <label for="iss-yn2-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss-yn2-span"> 매</span>
                        </td>
                    </tr> -->
                    <!-- <tr class="option2-box5">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss-day1-1" name="iss-day1" value="D2">
                            <label for="iss-day1-1">설정안함</label>
                            <input type="radio" id="iss-day1-2" name="iss-day1" checked>
                            <label for="iss-day1-2">설정함</label>
                            <span>
                                <input type="text" placeholder="ex) 2020-02-24" name="day-iss2">
                                <span> ~ </span>
                                <input type="text" placeholder="ex) 2020-03-24" name="coupon_issue_order_end">
                                <span> 까지</span>
                            </span>
                        </td>
                    </tr> -->
                    <!-- 첫 구매 고객 -->
                    <!-- <tr class="option2-box6">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc-mo3" id="pc-mo3-1" checked>
                            <label for="pc-mo3-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc-mo3" id="pc-mo3-2" checked>
                            <label for="pc-mo3-2">모바일쇼핑몰</label>
                        </td>
                    </tr> -->
                    <!-- <tr class="option2-box6">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss-day2-1" name="iss-day2" value="D3">
                            <label for="iss-day2-1">설정안함</label>
                            <input type="radio" id="iss-day2-2" name="iss-day2" checked>
                            <label for="iss-day2-2">설정함</label>
                            <span>
                                 <input type="text" placeholder="ex) 2020-02-24" name="day-iss3">
                                 <span> ~ </span>
                                 <input type="text" placeholder="ex) 2020-03-24" name="coupon_issue_order_end">
                                 <span> 까지</span>
                             </span>
                        </td>
                    </tr> -->
                    <!-- 구매 수량 충족시 -->
                    <!-- <tr class="option2-box7">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc-mo4" id="pc-mo4-1" checked>
                            <label for="pc-mo4-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc-mo4" id="pc-mo4-2" checked>
                            <label for="pc-mo4-2">모바일쇼핑몰</label>
                        </td>
                    </tr> -->
                    <!-- <tr class="option2-box7">
                        <th>수량 판단 기준</th>
                        <td>
                            <input type="radio" id="num1-1" name="coupon_buy_count_condition" checked>
                            <label for="num1-1">상품 수량 기준</label>
                            <input type="radio" id="num1-2" name="coupon_buy_count_condition">
                            <label for="num1-2">주문 수량 기준</label>
                        </td>
                    </tr>
                    <tr class="option2-box7">
                        <th>최소 구매 수량 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" value="1" class="txt-right num-width1" name="coupon_min_buy_count">
                            <span>개</span>
                        </td>
                    </tr> -->
                    <!-- <tr class="option2-box7">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="option2-box7">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss-yn3-1" name="iss-yn3" value="yn-I4">
                            <label for="iss-yn3-1">불가능</label>
                            <input type="radio" id="iss-yn3-2" name="iss-yn3" checked>
                            <label for="iss-yn3-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss-yn3-span"> 매</span>
                        </td>
                    </tr> -->
                    <!-- <tr class="option2-box7">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss-day3-1" name="iss-day3" value="D4">
                            <label for="iss-day3-1">설정안함</label>
                            <input type="radio" id="iss-day3-2" name="iss-day3" checked>
                            <label for="iss-day3-2">설정함</label>
                            <span>
                                         <input type="text" placeholder="ex) 2020-02-24" name="day-iss4">
                                         <span> ~ </span>
                                         <input type="text" placeholder="ex) 2020-03-24" name="coupon_issue_oder_end">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr> -->
                    </tbody>
                </table>
                <table class="goods-detail-table option3-box option-wrap">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 고객 다운로드 발급 -->
                    <!-- 회원 대상 -->
                    <!-- <tr class="option3-box1">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="option3-box1">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss-count3-1" name="iss-count3" value="count-I4">
                            <label for="iss-count3-1">제한 없음</label>
                            <input type="radio" id="iss-count3-2" name="iss-count3" checked>
                            <label for="iss-count3-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss-count3-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="option3-box1">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss-yn4-1" name="iss-yn4" value="yn-I5">
                            <label for="iss-yn4-1">불가능</label>
                            <input type="radio" id="iss-yn4-2" name="iss-yn4" checked>
                            <label for="iss-yn4-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss-yn4-span"> 매</span>
                        </td>
                    </tr> -->
                    <!-- <tr class="option3-box1">
                        <th>발급시점</th>
                        <td>
                            <input type="radio" id="iss1-1" name="coupon_issue_time" value="N" checked>
                            <label for="iss1-1">즉시 발급</label>
                            <input type="radio" id="iss1-2" name="coupon_issue_time" value="S">
                            <label for="iss1-2">지정한 시점에 발급</label>
                            <div id="option3-rd2-txt" style="display: none;"><input type="text" name="option1-rd2-txt-input" name="coupon_issue_date" placeholder="ex) 2020-02-28"></div>
                        </td>
                    </tr> -->
                    <!-- 일정기간 미구매 회원 대상 -->
                    <tr class="option3-box2">
                        <th>미구매 기간</th>
                        <td>
                            <select name="" id="" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                                <option value="">11</option>
                                <option value="">12</option>
                            </select>
                            <span> 개월</span>
                        </td>
                    </tr>
                    <!-- <tr class="option3-box2">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="option3-box2">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss-count4-1" name="iss-count4" value="count-I5">
                            <label for="iss-count4-1">제한 없음</label>
                            <input type="radio" id="iss-count4-2" name="iss-count4" checked>
                            <label for="iss-count4-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss-count4-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="option3-box2">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss-yn5-1" name="iss-yn5" value="yn-I6">
                            <label for="iss-yn5-1">불가능</label>
                            <input type="radio" id="iss-yn5-2" name="iss-yn5" checked>
                            <label for="iss-yn5-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss-yn5-span"> 매</span>
                        </td>
                    </tr> -->
                    </tbody>
                </table>
                <h3>사용 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>유효 기간 설정</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.<br>
                                <span class="cc">* 빈 값이면 저장 날짜를 기준으로 하여 1년으로 자동 설정됩니다.</span>
                            </p>
                            <input type="text" id="goods-validity-start" name="coupon_valid_date_start" placeholder="ex) 2020-02-28"> ~ <input type="text" id="goods-validity-end" name="coupon_valid_date_end" placeholder="ex) 2020-02-28">
                        </td>
                    </tr>
                    <tr>
                        <th>적용 범위</th>
                        <td>
                            <input type="radio" name="coupon_use_range" id="apply-rd1" value="P">
                            <label for="apply-rd1">상품 쿠폰</label>
                            <input type="radio" name="coupon_use_range" id="apply-rd2" value="O" checked>
                            <label for="apply-rd2">주문서 쿠폰</label>
                        </td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods-cate2" name="coupon_ct" placeholder="ex) 24|29|30">
                        </td>
                    </tr>
                    <tr>
                        <th>사용가능 기준금액</th>
                        <td>
                            <input type="radio" id="goods-validity1" name="goods-validity" value="O"  checked>
                            <label for="goods-validity1">제한 없음</label>
                            <input type="radio" id="goods-validity2" name="goods-validity" value="Y">
                            <label for="goods-validity2">주문 금액 기준</label>
                            <!-- <input type="radio" id="goods-validity3" name="goods-validity" value="N">
                            <label for="goods-validity3">상품 금액 기준</label> -->
                        </td>
                    </tr>
                    <tr class="goods-validity-detail1" style="display:none">
                        <th>주문 금액 기준</th>
                        <td>
                            <input type="text" id="goods-validity-start1" name="coupon_use_min_amount" placeholder="" class="txt-right"> 원 이상
                        </td>
                    </tr>
                    <tr class="goods-validity-detail2" style="display:none">
                        <th>상품 금액 기준</th>
                        <td>
                            <input type="text" id="goods-validity-start2" name="goods-validity-start2" placeholder="" class="txt-right"> 원 이상
                        </td>
                    </tr>
                    <tr>
                        <th>적용 계산 기준</th>
                        <td>
                            <select name="coupon_sale_cal_condition">
                                <option value="B">할인(쿠폰 제외) 적용 전 결제 금액</option>
                                <option value="A">할인(쿠폰 제외) 적용 후 결제 금액</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>개별 결제 수단 설정</th>
                        <td>
                            <p class="cc2">상품의 개별 결제수단을 설정할 경우 다음 항목 중 입력합니다.<br><br>
                                무통장입금: cash, 카드결제: card, 적립금: mileage, 실시간 계좌이체: tcash, 가상계좌: icash, 휴대폰결제: cell, 케이페이: kpay, 페이나우: paynow, 페이코: payco, 카카오페이: kakaopay, 스마일페이: smilepay, 네이버페이: naverpay<br>
                                <span class="cc">* 결제 수단이 여러 개인 경우 쉼표&#40;,&#41;로 구분합니다.</span>
                            </p>
                            <input type="text" id="goods-payment" name="coupon_use_payment_class" placeholder="ex) cash, mileage">
                        </td>
                    </tr>
                    <tr>
                        <th>중복적용</th>
                        <td>
                            <input type="radio" name="coupon_dup_yn" id="coupon1-rd1" value="Y">
                            <label for="coupon1-rd1">중복사용 가능</label>
                            <input type="radio" name="coupon_dup_yn" id="coupon1-rd2" value="N" checked>
                            <label for="coupon1-rd2">중복사용 불가능</label>
                        </td>
                    </tr>
                    <!-- <tr>
                        <th>사용가능 회원</th>
                        <td>
                            <input type="radio" name="member-radio" id="member-rd1">
                            <label for="member-rd1">모두사용 가능</label>
                            <input type="radio" name="member-radio" id="member-rd2" checked>
                            <label for="member-rd2">회원만 사용 가능</label>
                        </td>
                    </tr> -->
                    <tr>
                        <th>쿠폰 종류</th>
                        <td>
                            <input type="radio" name="coupon_type" id="kind-rd1" value="S">
                            <label for="kind-rd1">시리얼 쿠폰</label>
                            <input type="radio" name="coupon_type" id="kind-rd2" value="N" checked>
                            <label for="kind-rd2">일반 온라인 쿠폰</label>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <h3>부가 서비스</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>로그인시 쿠폰발급 알림</th>
                        <td>
                            <input type="radio" name="login_alert_yn" id="login-coupon-rd1" value="Y" checked>
                            <label for="login-coupon-rd1">사용함</label>
                            <input type="radio" name="login_alert_yn" id="login-coupon-rd2" value="N">
                            <label for="login-coupon-rd2">사용안함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰발급 SMS 발송</th>
                        <td>
                            <input type="radio" name="sms_alert_yn" id="sms-coupon-rd1" value="Y" checked>
                            <label for="sms-coupon-rd1">사용함</label>
                            <input type="radio" name="sms_alert_yn" id="sms-coupon-rd2" value="N">
                            <label for="sms-coupon-rd2">사용안함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰발급 이메일 발송</th>
                        <td>
                            <input type="radio" name="email_alert_yn" id="email-coupon-rd1" value="Y" checked>
                            <label for="email-coupon-rd1">사용함</label>
                            <input type="radio" name="email_alert_yn" id="email-coupon-rd2" value="N">
                            <label for="email-coupon-rd2">사용안함</label>
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
                <button type="button" name="" class="btn-red" id="coupon-insert-btn">등록하기</button>
            </div>
        </form>
    </div>
</div><!-- 등록 끝 -->
<div class="modal1">
    <div class="modal-content">
        <form method="POST">
            <div class="modal-header">
                <h2>쿠폰 상세보기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <div class="right">
                    <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>쿠폰 정보 다운로드</button>
                </div>
                <h3>발급 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>쿠폰명 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" id="goods-name2" name="goods-name2" placeholder="쿠폰명" value="쿠폰명" >
                        </td>
                    </tr>
                    <tr>
                        <th>공급사</th>
                        <td>
                            <p class="cc2">&#91;판매분류관리 &gt; 공급사 관리&#93;에 등록한 유효한 공급사 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-s2" name="goods-s2" placeholder="ex) S00000000" value="S00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 등록&#40;상세&#41;</th>
                        <td>
                            <p class="cc2">웹 FTP에 접속해 /web/product/big/에 미리 이미지를 등록한 뒤 이미지 명만 입력합니다.
                            </p>
                            <input type="text" id="goods-imgBig2" name="goods-imgBig2" placeholder="ex) sample1.jpg" value="sample1.jpg">
                        </td>
                    </tr>
                    <tr>
                        <th>국가별 공급</th>
                        <td>
                            <input type="checkbox" name="nation1-check" id="nation1-ck1" checked>
                            <label for="nation1-ck1">한국</label>
                            <input type="checkbox" name="nation1-check" id="nation1-ck2">
                            <label for="nation1-ck2">미국</label>
                            <input type="checkbox" name="nation1-check" id="nation1-ck3">
                            <label for="nation1-ck3">중국</label>
                        </td>
                    </tr>
                    <tr>
                        <th>혜택구분 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="radio" id="discount1-radio1" name="discount1-radio" value="one"  checked>
                            <label for="discount1-radio1">할인금액</label>
                            <input type="radio" id="discount1-radio2" name="discount1-radio" value="two">
                            <label for="discount1-radio2">할인율</label>
                        </td>
                    </tr>
                    <tr class="discount1-detail1" >
                        <th>할인금액</th>
                        <td>
                            <input type="text" id="discount2-rd" name="discount2-rd" placeholder="" class="txt-right" value="3,000"> 원
                        </td>
                    </tr>
                    <tr class="discount1-detail2" style="display:none">
                        <th>할인율</th>
                        <td>
                            <input type="text" id="discount2-rd1" name="discount2-rd1" placeholder="" class="txt-right"> %
                        </td>
                    </tr>
                    <tr>
                        <th>발급 구분</th>
                        <td>
                            <select class="option-box-modify" name="modify1-select">
                                <option value="modify1">대상자 지정 발급</option>
                                <option value="modify2">조건부 자동 발급</option>
                                <option value="modify3">고객 다운로드 발급</option>
                            </select>
                            <select class="modify-select" name="modify2-select" id="modify2-select" style="display: none;">
                                <option value="modify2-1" selected="selected">회원가입</option>
                                <option value="modify2-2">배송완료시</option>
                                <option value="modify2-3">기념일(생일)</option>
                                <option value="modify2-4">상품 후기 작성</option>
                                <option value="modify2-5">주문 완료 시</option>
                                <option value="modify2-6">첫 구매 고객</option>
                                <option value="modify2-7">구매 수량 충족시</option>
                            </select>
                            <select class="modify-select" name="modify3-select" id="modify3-select" style="display: none;">
                                <option value="modify3-1">회원 대상</option>
                                <option value="modify3-2">일정기간 미구매 회원 대상</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="goods-detail-table modify1-box option-wrap-modify">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 대상자 지정 발급 -->
                    <tr>
                        <th>발급시점</th>
                        <td>
                            <input type="radio" name="option1-radio1" id="option2-rd1-1" checked>
                            <label for="option2-rd1-1">즉시 발급</label>
                            <input type="radio" name="option1-radio1" id="option2-rd2-1" value="option2-rd2-click1">
                            <label for="option2-rd2-1">지정한 시점에 발급</label>
                            <div id="option2-rd2-txt1" style="display: none;">
                                <input type="text" name="option2-rd2-txt-input" placeholder="ex) 2020-02-28">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="goods-detail-table modify2-box option-wrap-modify">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 조건부 자동 발급 -->
                    <!-- 회원가입 -->
                    <tr class="modify2-box1" style="display: table-row;">
                        <th>발급 대상자 설정 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="join1-radio" id="join1-radio1" checked>
                            <label for="join1-radio1">가입회원</label>
                            <input type="checkbox" name="join1-radio" id="join1-radio2">
                            <label for="join1-radio2">추천인</label>
                            <select name="" id="">
                                <option value="">제한없음</option>
                                <option value="">SMS 수신동의  AND 이메일 수신동의</option>
                                <option value="">SMS 수신동의  OR 이메일 수신동의</option>
                                <option value="">SMS 수신동의</option>
                                <option value="">이메일 수신동의</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 배송 완료 시 -->
                    <tr class="modify2-box2">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc1-mo1" id="pc1-mo1-1" checked>
                            <label for="pc1-mo1-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc1-mo1" id="pc1-mo1-2" checked>
                            <label for="pc1-mo1-2">모바일쇼핑몰</label>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급 가능 구매 금액</th>
                        <td>
                            <select name="" id="">
                                <option value="">주문 금액기준</option>
                                <option value="">실결제 금액기준</option>
                            </select>
                            <select name="box2-out1-select1" id="box2-out1-select1">
                                <option value="box2-in1-1">제한없음</option>
                                <option value="box2-in1-2">최소금액</option>
                                <option value="box2-in1-3">금액 범위</option>
                            </select>
                            <span class="box2-span box2-txt1">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원</span>
                                     </span>
                            <span class="box2-span box2-txt2">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 이상 ~ </span>
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>1회 발급 수량</th>
                        <td>
                            <input type="radio" id="iss1-num1" name="iss1-num" value="I1">
                            <label for="iss1-num1">1장씩 발급</label>
                            <input type="radio" id="iss1-num2" name="iss1-num">
                            <label for="iss1-num2">설정된 수량만큼 발급</label>
                            <select name="iss1-num-select" id="" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                            </select>
                            <span>매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급단위</th>
                        <td>
                            <select name="box2-out1-select2" id="box2-out1-select2">
                                <option value="box2-in2-1">주문서</option>
                                <option value="box2-in2-2">상품</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 발급단위 상품 -->
                    <tr class="modify2-box2-in2" style="display: none;">
                        <th>발급 대상 상품</th>
                        <td>
                            <input type="radio" id="iss1-product1" name="iss1-product" checked>
                            <label for="iss1-product1">제한 없음</label>
                            <input type="radio" id="iss1-product2" name="iss1-product">
                            <label for="iss1-product2">선택 상품 적용</label>
                        </td>
                    </tr>
                    <tr class="modify2-box2-in2" style="display: none;">
                        <th>발급 대상 카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods1-cate" name="goods1-cate" placeholder="ex) 24|29|30">
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count1" name="iss1-count" value="count-I1">
                            <label for="iss1-count1">제한 없음</label>
                            <input type="radio" id="iss1-count2" name="iss1-count" checked>
                            <label for="iss1-count2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn1" name="iss1-yn" value="yn-I1">
                            <label for="iss1-yn1">불가능</label>
                            <input type="radio" id="iss1-yn2" name="iss1-yn" checked>
                            <label for="iss1-yn2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss1-day1" name="iss1-day" value="D5">
                            <label for="iss1-day1">설정안함</label>
                            <input type="radio" id="iss1-day2" name="iss1-day" checked>
                            <label for="iss1-day2">설정함</label>
                            <span>
                                         <input type="text"  placeholder="ex) 2020-02-24" name="day-iss5">
                                         <span> ~ </span>
                                         <input type="text"  placeholder="ex) 2020-03-24" name="day-iss5">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <!-- 기념일(생일) -->
                    <tr class="modify2-box3">
                        <th>기념일 정보</th>
                        <td>
                            <input type="radio" id="birthday1-radio1" name="birthday1-radio" checked>
                            <label for="birthday1-radio1">생일</label>
                            <input type="radio" id="birthday1-radio2" name="birthday1-radio">
                            <label for="birthday1-radio2">결혼 기념일</label>
                            <input type="radio" id="birthday1-radio3" name="birthday1-radio">
                            <label for="birthday1-radio3">배우자 생일</label>
                        </td>
                    </tr>
                    <tr class="modify2-box3">
                        <th>발급대상 회원등급</th>
                        <td>
                            <input type="radio" id="iss1-mem1" name="iss1-mem" checked>
                            <label for="iss1-mem1">모든회원</label>
                            <input type="radio" id="iss1-mem2" name="iss1-mem">
                            <label for="iss1-mem2">일반회원</label>
                        </td>
                    </tr>
                    <tr class="modify2-box3">
                        <th>발급시점</th>
                        <td>
                            <input type="radio" id="modi-iss-1" name="iss1-1" value="IS1">
                            <label for="modi-iss-1">기념일 당일 발급</label>
                            <input type="radio" id="modi-iss-2" name="iss1-1" checked>
                            <label for="modi-iss-2">사용</label>
                            <span><input type="text" value="3" name="IS-ck1" class="txt-right num-width1"> 일 전 선 발행</span>
                        </td>
                    </tr>
                    <!-- 상품 후기 작성 -->
                    <tr class="modify2-box4">
                        <th>후기작성 조건 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            상품사용후기
                            <input type="text" value="1" class="txt-right num-width1"> 개 이상 작성시
                            <span>
                                         ( <input type="checkbox"> 이미지 필수등록 )
                                     </span>
                        </td>
                    </tr>
                    <tr class="modify2-box4">
                        <th>발급대상 회원등급</th>
                        <td>
                            <input type="radio" id="iss1-mem1-1" name="iss1-mem1" checked>
                            <label for="iss1-mem1-1">모든회원</label>
                            <input type="radio" id="iss1-mem1-2" name="iss1-mem1">
                            <label for="iss1-mem1-2">일반회원</label>
                        </td>
                    </tr>
                    <tr class="modify2-box4">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count1-1" name="iss1-count1" value="count-I2">
                            <label for="iss1-count1-1">제한없음</label>
                            <input type="radio" id="iss1-count1-2" name="iss1-count1" checked>
                            <label for="iss1-count1-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count1-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box4">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn-1" name="iss1-yn1" value="yn-I2">
                            <label for="iss1-yn-1">불가능</label>
                            <input type="radio" id="iss1-yn-2" name="iss1-yn1" checked>
                            <label for="iss1-yn-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn1-span"> 매</span>
                        </td>
                    </tr>
                    <!-- 주문 완료 시 -->
                    <tr class="modify2-box5">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc1-mo2" id="pc1-mo2-1" checked>
                            <label for="pc1-mo2-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc1-mo2" id="pc1-mo2-2" checked>
                            <label for="pc1-mo2-2">모바일쇼핑몰</label>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급 가능 구매 금액</th>
                        <td>
                            <select name="" id="">
                                <option value="">주문 금액기준</option>
                                <option value="">실결제 금액기준</option>
                            </select>
                            <select name="box5-out2-select1" id="box5-out2-select1">
                                <option value="box5-in1-1" selected="selected">제한없음</option>
                                <option value="box5-in1-2">최소금액</option>
                                <option value="box5-in1-3">금액 범위</option>
                            </select>
                            <span class="box5-span box5-txt1">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원</span>
                                     </span>
                            <span class="box5-span box5-txt2">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 이상 ~ </span>
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>1회 발급 수량</th>
                        <td>
                            <input type="radio" id="iss1-num1-1" name="iss1-num1" value="I2">
                            <label for="iss1-num1-1">1장씩 발급</label>
                            <input type="radio" id="iss1-num2-2" name="iss1-num1">
                            <label for="iss1-num2-2">설정된 수량만큼 발급</label>
                            <select name="iss1-num1-select" id="" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                            </select>
                            <span>매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급단위</th>
                        <td>
                            <select name="box5-out1-select2" id="box5-out1-select2">
                                <option value="box5-in2-1">주문서</option>
                                <option value="box5-in2-2">상품</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 발급단위 상품 -->
                    <tr class="modify2-box5-in2">
                        <th>발급 대상 상품</th>
                        <td>
                            <input type="radio" id="iss1-product1-1" name="iss1-product1" checked>
                            <label for="iss1-product1-1">제한 없음</label>
                            <input type="radio" id="iss1-product1-2" name="iss1-product1">
                            <label for="iss1-product1-2">선택 상품 적용</label>
                        </td>
                    </tr>
                    <tr class="modify2-box5-in2">
                        <th>발급 대상 카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods1-cate1" name="goods1-cate1" placeholder="ex) 24|29|30">
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count2-1" name="iss1-count2" value="count-I3">
                            <label for="iss1-count2-1">제한 없음</label>
                            <input type="radio" id="iss1-count2-2" name="iss1-count2" checked>
                            <label for="iss1-count2-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count2-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn2-1" name="iss1-yn2" value="yn-I3">
                            <label for="iss1-yn2-1">불가능</label>
                            <input type="radio" id="iss1-yn2-2" name="iss1-yn2" checked>
                            <label for="iss1-yn2-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn2-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss1-day1-1" name="iss1-day1" value="D6">
                            <label for="iss1-day1-1">설정안함</label>
                            <input type="radio" id="iss1-day1-2" name="iss1-day1" checked>
                            <label for="iss1-day1-2">설정함</label>
                            <span>
                                         <input type="text" placeholder="ex) 2020-02-24" name="day-iss7">
                                         <span> ~ </span>
                                         <input type="text" placeholder="ex) 2020-03-24" name="day-iss7">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <!-- 첫 구매 고객 -->
                    <tr class="modify2-box6">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc1-mo3" id="pc1-mo3-1" checked>
                            <label for="pc1-mo3-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc1-mo3" id="pc1-mo3-2" checked>
                            <label for="pc1-mo3-2">모바일쇼핑몰</label>
                        </td>
                    </tr>
                    <tr class="modify2-box6">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss1-day2-1" name="iss1-day2" value="D7">
                            <label for="iss1-day2-1">설정안함</label>
                            <input type="radio" id="iss1-day2-2" name="iss1-day2" checked>
                            <label for="iss1-day2-2">설정함</label>
                            <span>
                                         <input type="text" placeholder="ex) 2020-02-24" name="day-iss8">
                                         <span> ~ </span>
                                         <input type="text" placeholder="ex) 2020-03-24" name="day-iss8">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <!-- 구매 수량 충족시 -->
                    <tr class="modify2-box7">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc1-mo4" id="pc1-mo4-1" checked>
                            <label for="pc1-mo4-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc1-mo4" id="pc1-mo4-2" checked>
                            <label for="pc1-mo4-2">모바일쇼핑몰</label>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>수량 판단 기준</th>
                        <td>
                            <input type="radio" id="num2-1" name="num2-1" checked>
                            <label for="num2-1">상품 수량 기준</label>
                            <input type="radio" id="num2-2" name="num2-1">
                            <label for="num2-2">주문 수량 기준</label>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>최소 구매 수량 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" value="1" class="txt-right num-width1">
                            <span>개</span>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn3-1" name="iss1-yn3" value="yn-I4">
                            <label for="iss1-yn3-1">불가능</label>
                            <input type="radio" id="iss1-yn3-2" name="iss1-yn3" checked>
                            <label for="iss1-yn3-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn3-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss1-day3-1" name="iss1-day3" value="D8">
                            <label for="iss1-day3-1">설정안함</label>
                            <input type="radio" id="iss1-day3-2" name="iss1-day3" checked>
                            <label for="iss1-day3-2">설정함</label>
                            <span>
                                         <input type="text" placeholder="ex) 2020-02-24" name="day-iss9">
                                         <span> ~ </span>
                                         <input type="text" placeholder="ex) 2020-03-24" name="day-iss9">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="goods-detail-table modify3-box option-wrap-modify">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 고객 다운로드 발급 -->
                    <!-- 회원 대상 -->
                    <tr class="modify3-box1">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify3-box1">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count3-1" name="iss1-count3" value="count-I4">
                            <label for="iss1-count3-1">제한 없음</label>
                            <input type="radio" id="iss1-count3-2" name="iss1-count3" checked>
                            <label for="iss1-count3-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count3-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify3-box1">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn4-1" name="iss1-yn4" value="yn-I5">
                            <label for="iss1-yn4-1">불가능</label>
                            <input type="radio" id="iss1-yn4-2" name="iss1-yn4" checked>
                            <label for="iss1-yn4-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn4-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify3-box1">
                        <th>발급시점</th>
                        <td>
                            <input type="radio" id="modi-iss1-1" name="iss1-2" checked>
                            <label for="modi-iss1-1">기념일 당일 발급</label>
                            <input type="radio" id="modi-iss1-2" name="iss1-2" value="iss-val1">
                            <label for="modi-iss1-2">지정한 시점에 발급</label>
                            <div id="modi3-rd2-txt" style="display: none;"><input type="text" name="option1-rd2-txt-input" placeholder="ex) 2020-02-28"></div>
                        </td>
                    </tr>
                    <!-- 일정기간 미구매 회원 대상 -->
                    <tr class="modify3-box2">
                        <th>미구매 기간</th>
                        <td>
                            <select name="" id="" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                                <option value="">11</option>
                                <option value="">12</option>
                            </select>
                            <span> 개월</span>
                        </td>
                    </tr>
                    <tr class="modify3-box2">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify3-box2">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count4-1" name="iss1-count4" value="count-I5">
                            <label for="iss1-count4-1">제한 없음</label>
                            <input type="radio" id="iss1-count4-2" name="iss1-count4" checked>
                            <label for="iss1-count4-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count4-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify3-box2">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn5-1" name="iss1-yn5" value="yn-I6">
                            <label for="iss1-yn5-1">불가능</label>
                            <input type="radio" id="iss1-yn5-2" name="iss1-yn5" checked>
                            <label for="iss1-yn5-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn5-span"> 매</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <h3>사용 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>유효 기간 설정</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.<br>
                                <span class="cc">* 빈 값이면 저장 날짜를 기준으로 하여 1년으로 자동 설정됩니다.</span>
                            </p>
                            <input type="text" id="goods1-validity-start" name="goods1-validity-start" placeholder="ex) 2020-02-28" value="2020-02-28"> ~ <input type="text" id="goods-validity-end2" name="goods-validity-end2" placeholder="ex) 2020-02-28" value="2020-02-28">
                        </td>
                    </tr>
                    <tr>
                        <th>적용 범위</th>
                        <td>
                            <input type="radio" name="apply1-radio" id="apply1-rd1">
                            <label for="apply1-rd1">상품 쿠폰</label>
                            <input type="radio" name="apply1-radio" id="apply1-rd2" checked>
                            <label for="apply1-rd2">주문서 쿠폰</label>
                        </td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods1-cate2" name="goods1-cate2" placeholder="ex) 24|29|30" value="24|29|30">
                        </td>
                    </tr>
                    <tr>
                        <th>사용가능 기준금액</th>
                        <td>
                            <input type="radio" id="goods1-validity1" name="goods1-validity" value="O"  checked>
                            <label for="goods1-validity1">제한 없음</label>
                            <input type="radio" id="goods1-validity2" name="goods1-validity" value="Y">
                            <label for="goods1-validity2">주문 금액 기준</label>
                            <input type="radio" id="goods1-validity3" name="goods1-validity" value="N">
                            <label for="goods1-validity3">상품 금액 기준</label>
                        </td>
                    </tr>
                    <tr class="goods1-validity-detail1" style="display:none">
                        <th>주문 금액 기준</th>
                        <td>
                            <input type="text" id="goods1-validity-start1" name="goods1-validity-start1" placeholder="" class="txt-right" > 원 이상
                        </td>
                    </tr>
                    <tr class="goods1-validity-detail2" style="display:none">
                        <th>상품 금액 기준</th>
                        <td>
                            <input type="text" id="goods1-validity-start2" name="goods1-validity-start2" placeholder="" class="txt-right"> 원 이상
                        </td>
                    </tr>
                    <tr>
                        <th>적용 계산 기준</th>
                        <td>
                            <select name="coupon-date">
                                <option value="할인(쿠폰 제외) 적용 전 결제 금액">할인(쿠폰 제외) 적용 전 결제 금액</option>
                                <option value="할인(쿠폰 제외) 적용 후 결제 금액">할인(쿠폰 제외) 적용 후 결제 금액</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>개별 결제 수단 설정</th>
                        <td>
                            <p class="cc2">상품의 개별 결제수단을 설정할 경우 다음 항목 중 입력합니다.<br><br>
                                무통장입금: cash, 카드결제: card, 적립금: mileage, 실시간 계좌이체: tcash, 가상계좌: icash, 휴대폰결제: cell, 케이페이: kpay, 페이나우: paynow, 페이코: payco, 카카오페이: kakaopay, 스마일페이: smilepay, 네이버페이: naverpay<br>
                                <span class="cc">* 결제 수단이 여러 개인 경우 쉼표&#40;,&#41;로 구분합니다.</span>
                            </p>
                            <input type="text" id="goods-payment2" name="goods-payment2" placeholder="ex) cash, mileage" value="cash, mileage">
                        </td>
                    </tr>
                    <tr>
                        <th>중복적용</th>
                        <td>
                            <input type="radio" name="coupon1-2-radio" id="coupon1-2-rd1">
                            <label for="coupon1-2-rd1">중복사용 가능</label>
                            <input type="radio" name="coupon1-2-radio" id="coupon1-2-rd2" checked>
                            <label for="coupon1-2-rd2">중복사용 불가능</label>
                        </td>
                    </tr>
                    <!-- <tr>
                        <th>사용가능 회원</th>
                        <td>
                            <input type="radio" name="member1-radio" id="member1-rd1">
                            <label for="member1-rd1">모두사용 가능</label>
                            <input type="radio" name="member1-radio" id="member1-rd2" checked>
                            <label for="member1-rd2">회원만 사용 가능</label>
                        </td>
                    </tr> -->
                    <tr>
                        <th>쿠폰 종류</th>
                        <td>
                            <input type="radio" name="kind1-radio" id="kind1-rd1">
                            <label for="kind1-rd1">시리얼 쿠폰</label>
                            <input type="radio" name="kind1-radio" id="kind1-rd2" checked>
                            <label for="kind1-rd2">일반 온라인 쿠폰</label>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <h3>부가 서비스</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>로그인시 쿠폰발급 알림</th>
                        <td>
                            <input type="radio" name="login1-coupon-radio" id="login1-coupon-rd1" checked>
                            <label for="login1-coupon-rd1">사용함</label>
                            <input type="radio" name="login1-coupon-radio" id="login1-coupon-rd2">
                            <label for="login1-coupon-rd2">사용안함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰발급 SMS 발송</th>
                        <td>
                            <input type="radio" name="sms1-coupon-radio1" id="sms1-coupon-rd1" checked>
                            <label for="sms1-coupon-rd1">사용함</label>
                            <input type="radio" name="sms1-coupon-radio1" id="sms1-coupon-rd2">
                            <label for="sms1-coupon-rd2">사용안함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰발급 이메일 발송</th>
                        <td>
                            <input type="radio" name="email1-coupon-radio1" id="email1-coupon-rd1" checked>
                            <label for="email1-coupon-rd1">사용함</label>
                            <input type="radio" name="email1-coupon-radio1" id="email1-coupon-rd2">
                            <label for="email1-coupon-rd2">사용안함</label>
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
                <button type="button" name="detail" class="btn-red" id="coupon-insert-btn">등록하기</button>
                <button type="button" name="detail" class="btn-border-red">발급중단</button>
            </div>
        </form>
    </div>
</div><!-- 상세보기 끝 -->
<%-- <div class="modal2">
    <div class="modal-content">
        <form action="" method="POST">
            <div class="modal-header">
                <h2>쿠폰 상세보기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix"  id="modal2-disabled">
                <div class="right">
                    <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>쿠폰 정보 다운로드</button>
                </div>
                <h3>발급 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>쿠폰명 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" id="goods-name3" name="goods-name3" placeholder="쿠폰명" value="쿠폰명" >
                        </td>
                    </tr>
                    <tr>
                        <th>공급사</th>
                        <td>
                            <p class="cc2">&#91;판매분류관리 &gt; 공급사 관리&#93;에 등록한 유효한 공급사 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-s3" name="goods-s3" placeholder="ex) S00000000" value="S00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 등록&#40;상세&#41;</th>
                        <td>
                            <p class="cc2">웹 FTP에 접속해 /web/product/big/에 미리 이미지를 등록한 뒤 이미지 명만 입력합니다.
                            </p>
                            <input type="text" id="goods-imgBig3" name="goods-imgBig3" placeholder="ex) sample1.jpg" value="sample1.jpg">
                        </td>
                    </tr>
                    <tr>
                        <th>국가별 공급</th>
                        <td>
                            <input type="checkbox" name="nation2-check" id="nation2-ck1" checked>
                            <label for="nation2-ck1">한국</label>
                            <input type="checkbox" name="nation2-check" id="nation2-ck2">
                            <label for="nation2-ck2">미국</label>
                            <input type="checkbox" name="nation2-check" id="nation2-ck3">
                            <label for="nation2-ck3">중국</label>
                        </td>
                    </tr>
                    <tr>
                        <th>혜택구분 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="radio" id="discount2-radio1" name="discount2-radio" value="one"  checked>
                            <label for="discount2-radio1">할인금액</label>
                            <input type="radio" id="discount2-radio2" name="discount2-radio" value="two">
                            <label for="discount2-radio2">할인율</label>
                        </td>
                    </tr>
                    <tr class="discount1-detail1" >
                        <th>할인금액</th>
                        <td>
                            <input type="text" id="discoun3t-rd" name="discount3-rd" placeholder="" class="txt-right" value="3,000"> 원
                        </td>
                    </tr>
                    <tr class="discount1-detail2" style="display:none">
                        <th>할인율</th>
                        <td>
                            <input type="text" id="discount3-rd1" name="discount3-rd1" placeholder="" class="txt-right"> %
                        </td>
                    </tr>
                    <tr>
                        <th>발급 구분</th>
                        <td>
                            <select class="option-box-modify" name="modify1-select">
                                <option value="box-modify1">대상자 지정 발급</option>
                                <option value="box-modify2">조건부 자동 발급</option>
                                <option value="box-modify3">고객 다운로드 발급</option>
                            </select>
                            <select class="modify-select" name="modify2-select" id="modify2-select" style="display: none;">
                                <option value="modify2-1" selected="selected">회원가입</option>
                                <option value="modify2-2">배송완료시</option>
                                <option value="modify2-3">기념일(생일)</option>
                                <option value="modify2-4">상품 후기 작성</option>
                                <option value="modify2-5">주문 완료 시</option>
                                <option value="modify2-6">첫 구매 고객</option>
                                <option value="modify2-7">구매 수량 충족시</option>
                            </select>
                            <select class="modify-select" name="modify3-select" id="modify3-select" style="display: none;">
                                <option value="modify3-1">회원 대상</option>
                                <option value="modify3-2">일정기간 미구매 회원 대상</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="goods-detail-table modify1-box">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 대상자 지정 발급 -->
                    <tr>
                        <th>발급시점</th>
                        <td>
                            <input type="radio" name="option1-radio1" id="option2-rd1-1" checked>
                            <label for="option2-rd1-1">즉시 발급</label>
                            <input type="radio" name="option1-radio1" id="option2-rd2-1" value="option2-rd2-click1">
                            <label for="option2-rd2-1">지정한 시점에 발급</label>
                            <div id="option2-rd2-txt1" style="display: none;">
                                <input type="text" name="option2-rd2-txt-input" placeholder="ex) 2020-02-28">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="goods-detail-table modify2-box">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 조건부 자동 발급 -->
                    <!-- 회원가입 -->
                    <tr class="modify2-box1" style="display: table-row;">
                        <th>발급 대상자 설정 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="join1-radio" id="join1-radio1" checked>
                            <label for="join1-radio1">가입회원</label>
                            <input type="checkbox" name="join1-radio" id="join1-radio2">
                            <label for="join1-radio2">추천인</label>
                            <select name="" id="">
                                <option value="">제한없음</option>
                                <option value="">SMS 수신동의  AND 이메일 수신동의</option>
                                <option value="">SMS 수신동의  OR 이메일 수신동의</option>
                                <option value="">SMS 수신동의</option>
                                <option value="">이메일 수신동의</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 배송 완료 시 -->
                    <tr class="modify2-box2">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc1-mo1" id="pc1-mo1-1" checked>
                            <label for="pc1-mo1-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc1-mo1" id="pc1-mo1-2" checked>
                            <label for="pc1-mo1-2">모바일쇼핑몰</label>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급 가능 구매 금액</th>
                        <td>
                            <select name="" id="">
                                <option value="">주문 금액기준</option>
                                <option value="">실결제 금액기준</option>
                            </select>
                            <select name="box2-out1-select1" id="box2-out1-select1">
                                <option value="box2-in1-1">제한없음</option>
                                <option value="box2-in1-2">최소금액</option>
                                <option value="box2-in1-3">금액 범위</option>
                            </select>
                            <span class="box2-span box2-txt1">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원</span>
                                     </span>
                            <span class="box2-span box2-txt2">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 이상 ~ </span>
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>1회 발급 수량</th>
                        <td>
                            <input type="radio" id="iss1-num1" name="iss1-num" value="I1">
                            <label for="iss1-num1">1장씩 발급</label>
                            <input type="radio" id="iss1-num2" name="iss1-num">
                            <label for="iss1-num2">설정된 수량만큼 발급</label>
                            <select name="iss1-num-select" id="" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                            </select>
                            <span>매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급단위</th>
                        <td>
                            <select name="box2-out1-select2" id="box2-out1-select2">
                                <option value="box2-in2-1">주문서</option>
                                <option value="box2-in2-2">상품</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 발급단위 상품 -->
                    <tr class="modify2-box2-in2" style="display: none;">
                        <th>발급 대상 상품</th>
                        <td>
                            <input type="radio" id="iss1-product1" name="iss1-product" checked>
                            <label for="iss1-product1">제한 없음</label>
                            <input type="radio" id="iss1-product2" name="iss1-product">
                            <label for="iss1-product2">선택 상품 적용</label>
                        </td>
                    </tr>
                    <tr class="modify2-box2-in2" style="display: none;">
                        <th>발급 대상 카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods1-cate" name="goods1-cate" placeholder="ex) 24|29|30">
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count1" name="iss1-count" value="count-I1">
                            <label for="iss1-count1">제한 없음</label>
                            <input type="radio" id="iss1-count2" name="iss1-count" checked>
                            <label for="iss1-count2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn1" name="iss1-yn" value="yn-I1">
                            <label for="iss1-yn1">불가능</label>
                            <input type="radio" id="iss1-yn2" name="iss1-yn" checked>
                            <label for="iss1-yn2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box2">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss1-day1" name="iss1-day" checked>
                            <label for="iss1-day1">설정안함</label>
                            <input type="radio" id="iss1-day2" name="iss1-day">
                            <label for="iss1-day2">설정함</label>
                            <span>
                                         <input type="text"  placeholder="ex) 2020-02-24">
                                         <span> ~ </span>
                                         <input type="text"  placeholder="ex) 2020-03-24">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <!-- 기념일(생일) -->
                    <tr class="modify2-box3">
                        <th>기념일 정보</th>
                        <td>
                            <input type="radio" id="birthday1-radio1" name="birthday1-radio" checked>
                            <label for="birthday1-radio1">생일</label>
                            <input type="radio" id="birthday1-radio2" name="birthday1-radio">
                            <label for="birthday1-radio2">결혼 기념일</label>
                            <input type="radio" id="birthday1-radio3" name="birthday1-radio">
                            <label for="birthday1-radio3">배우자 생일</label>
                        </td>
                    </tr>
                    <tr class="modify2-box3">
                        <th>발급대상 회원등급</th>
                        <td>
                            <input type="radio" id="iss1-mem1" name="iss1-mem" checked>
                            <label for="iss1-mem1">모든회원</label>
                            <input type="radio" id="iss1-mem2" name="iss1-mem">
                            <label for="iss1-mem2">일반회원</label>
                        </td>
                    </tr>
                    <tr class="modify2-box3">
                        <th>발급시점</th>
                        <td>
                            <input type="radio" id="modi-iss-1" name="iss1-1" value="IS1">
                            <label for="modi-iss-1">기념일 당일 발급</label>
                            <input type="radio" id="modi-iss-2" name="iss1-1" checked>
                            <label for="modi-iss-2">사용</label>
                            <span><input type="text" value="3" name="IS-ck1" class="txt-right num-width1"> 일 전 선 발행</span>
                        </td>
                    </tr>
                    <!-- 상품 후기 작성 -->
                    <tr class="modify2-box4">
                        <th>후기작성 조건 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            상품사용후기
                            <input type="text" value="1" class="txt-right num-width1"> 개 이상 작성시
                            <span>
                                         ( <input type="checkbox"> 이미지 필수등록 )
                                     </span>
                        </td>
                    </tr>
                    <tr class="modify2-box4">
                        <th>발급대상 회원등급</th>
                        <td>
                            <input type="radio" id="iss1-mem1-1" name="iss1-mem1" checked>
                            <label for="iss1-mem1-1">모든회원</label>
                            <input type="radio" id="iss1-mem1-2" name="iss1-mem1">
                            <label for="iss1-mem1-2">일반회원</label>
                        </td>
                    </tr>
                    <tr class="modify2-box4">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count1-1" name="iss1-count1" value="count-I2">
                            <label for="iss1-count1-1">제한없음</label>
                            <input type="radio" id="iss1-count1-2" name="iss1-count1" checked>
                            <label for="iss1-count1-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count1-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box4">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn-1" name="iss1-yn1" value="yn-I2">
                            <label for="iss1-yn-1">불가능</label>
                            <input type="radio" id="iss1-yn-2" name="iss1-yn1" checked>
                            <label for="iss1-yn-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn1-span"> 매</span>
                        </td>
                    </tr>
                    <!-- 주문 완료 시 -->
                    <tr class="modify2-box5">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc1-mo2" id="pc1-mo2-1" checked>
                            <label for="pc1-mo2-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc1-mo2" id="pc1-mo2-2" checked>
                            <label for="pc1-mo2-2">모바일쇼핑몰</label>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급 가능 구매 금액</th>
                        <td>
                            <select name="" id="">
                                <option value="">주문 금액기준</option>
                                <option value="">실결제 금액기준</option>
                            </select>
                            <select name="box5-out2-select1" id="box5-out2-select1">
                                <option value="box5-in1-1" selected="selected">제한없음</option>
                                <option value="box5-in1-2">최소금액</option>
                                <option value="box5-in1-3">금액 범위</option>
                            </select>
                            <span class="box5-span box5-txt1">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원</span>
                                     </span>
                            <span class="box5-span box5-txt2">
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 이상 ~ </span>
                                         <input type="text" class="txt-right num-width2">
                                         <span> 원 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>1회 발급 수량</th>
                        <td>
                            <input type="radio" id="iss1-num1-1" name="iss1-num1" value="I2">
                            <label for="iss1-num1-1">1장씩 발급</label>
                            <input type="radio" id="iss1-num2-2" name="iss1-num1">
                            <label for="iss1-num2-2">설정된 수량만큼 발급</label>
                            <select name="iss1-num1-select" id="" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                            </select>
                            <span>매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급단위</th>
                        <td>
                            <select name="box5-out-select2" id="box5-out-select2">
                                <option value="box5-in2-1">주문서</option>
                                <option value="box5-in2-2">상품</option>
                            </select>
                        </td>
                    </tr>
                    <!-- 발급단위 상품 -->
                    <tr class="modify2-box5-in2">
                        <th>발급 대상 상품</th>
                        <td>
                            <input type="radio" id="iss1-product1-1" name="iss1-product1" checked>
                            <label for="iss1-product1-1">제한 없음</label>
                            <input type="radio" id="iss1-product1-2" name="iss1-product1">
                            <label for="iss1-product1-2">선택 상품 적용</label>
                        </td>
                    </tr>
                    <tr class="modify2-box5-in2">
                        <th>발급 대상 카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods1-cate1" name="goods1-cate1" placeholder="ex) 24|29|30">
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count2-1" name="iss1-count2" value="count-I3">
                            <label for="iss1-count2-1">제한 없음</label>
                            <input type="radio" id="iss1-count2-2" name="iss1-count2" checked>
                            <label for="iss1-count2-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count2-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn2-1" name="iss1-yn2" value="yn-I3">
                            <label for="iss1-yn2-1">불가능</label>
                            <input type="radio" id="iss1-yn2-2" name="iss1-yn2" checked>
                            <label for="iss1-yn2-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn2-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box5">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss1-day1-1" name="iss1-day1" checked>
                            <label for="iss1-day1-1">설정안함</label>
                            <input type="radio" id="iss1-day1-2" name="iss1-day1">
                            <label for="iss1-day1-2">설정함</label>
                            <span>
                                         <input type="text" placeholder="ex) 2020-02-24">
                                         <span> ~ </span>
                                         <input type="text" placeholder="ex) 2020-03-24">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <!-- 첫 구매 고객 -->
                    <tr class="modify2-box6">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc1-mo3" id="pc1-mo3-1" checked>
                            <label for="pc1-mo3-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc1-mo3" id="pc1-mo3-2" checked>
                            <label for="pc1-mo3-2">모바일쇼핑몰</label>
                        </td>
                    </tr>
                    <tr class="modify2-box6">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss1-day2-1" name="iss1-day2" checked>
                            <label for="iss1-day2-1">설정안함</label>
                            <input type="radio" id="iss1-day2-2" name="iss1-day2">
                            <label for="iss1-day2-2">설정함</label>
                            <span>
                                         <input type="text" placeholder="ex) 2020-02-24">
                                         <span> ~ </span>
                                         <input type="text" placeholder="ex) 2020-03-24">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    <!-- 구매 수량 충족시 -->
                    <tr class="modify2-box7">
                        <th>주문경로 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="checkbox" name="pc1-mo4" id="pc1-mo4-1" checked>
                            <label for="pc1-mo4-1">PC쇼핑몰</label>
                            <input type="checkbox" name="pc1-mo4" id="pc1-mo4-2" checked>
                            <label for="pc1-mo4-2">모바일쇼핑몰</label>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>수량 판단 기준</th>
                        <td>
                            <input type="radio" id="num2-1" name="num2-1" checked>
                            <label for="num2-1">상품 수량 기준</label>
                            <input type="radio" id="num2-2" name="num2-1">
                            <label for="num2-2">주문 수량 기준</label>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>최소 구매 수량 <span class="cc1">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" value="1" class="txt-right num-width1">
                            <span>개</span>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn3-1" name="iss1-yn3" value="yn-I4">
                            <label for="iss1-yn3-1">불가능</label>
                            <input type="radio" id="iss1-yn3-2" name="iss1-yn3" checked>
                            <label for="iss1-yn3-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn3-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify2-box7">
                        <th>발급대상 주문기간 설정</th>
                        <td>
                            <input type="radio" id="iss1-day3-1" name="iss1-day3" checked>
                            <label for="iss1-day3-1">설정안함</label>
                            <input type="radio" id="iss1-day3-2" name="iss1-day3">
                            <label for="iss1-day3-2">설정함</label>
                            <span>
                                         <input type="text" placeholder="ex) 2020-02-24">
                                         <span> ~ </span>
                                         <input type="text" placeholder="ex) 2020-03-24">
                                         <span> 까지</span>
                                     </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <table class="goods-detail-table modify3-box">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <tbody>
                    <!-- 고객 다운로드 발급 -->
                    <!-- 회원 대상 -->
                    <tr class="modify3-box1">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify3-box1">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count3-1" name="iss1-count3" value="count-I4">
                            <label for="iss1-count3-1">제한 없음</label>
                            <input type="radio" id="iss1-count3-2" name="iss1-count3" checked>
                            <label for="iss1-count3-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count3-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify3-box1">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn4-1" name="iss1-yn4" value="yn-I5">
                            <label for="iss1-yn4-1">불가능</label>
                            <input type="radio" id="iss1-yn4-2" name="iss1-yn4" checked>
                            <label for="iss1-yn4-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn4-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify3-box1">
                        <th>발급시점</th>
                        <td>
                            <input type="radio" id="modi-iss1-1" name="iss1-2" checked>
                            <label for="modi-iss1-1">기념일 당일 발급</label>
                            <input type="radio" id="modi-iss1-2" name="iss1-2" value="iss-val1">
                            <label for="modi-iss1-2">지정한 시점에 발급</label>
                            <div id="modi3-rd2-txt" style="display: none;"><input type="text" name="option1-rd2-txt-input" placeholder="ex) 2020-02-28"></div>
                        </td>
                    </tr>
                    <!-- 일정기간 미구매 회원 대상 -->
                    <tr class="modify3-box2">
                        <th>미구매 기간</th>
                        <td>
                            <select name="" id="" class="num-width3">
                                <option value="">1</option>
                                <option value="">2</option>
                                <option value="">3</option>
                                <option value="">4</option>
                                <option value="">5</option>
                                <option value="">6</option>
                                <option value="">7</option>
                                <option value="">8</option>
                                <option value="">9</option>
                                <option value="">10</option>
                                <option value="">11</option>
                                <option value="">12</option>
                            </select>
                            <span> 개월</span>
                        </td>
                    </tr>
                    <tr class="modify3-box2">
                        <th>발급대상 회원등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">모든회원</option>
                                <option value="">일반회원</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="modify3-box2">
                        <th>발급 수 제한</th>
                        <td>
                            <input type="radio" id="iss1-count4-1" name="iss1-count4" value="count-I5">
                            <label for="iss1-count4-1">제한 없음</label>
                            <input type="radio" id="iss1-count4-2" name="iss1-count4" checked>
                            <label for="iss1-count4-2">제한</label>
                            <span>선착순 최대 <input type="text" class="txt-right num-width1" name="iss1-count4-span"> 매</span>
                        </td>
                    </tr>
                    <tr class="modify3-box2">
                        <th>동일인 재발급 여부</th>
                        <td>
                            <input type="radio" id="iss1-yn5-1" name="iss1-yn5" value="yn-I6">
                            <label for="iss1-yn5-1">불가능</label>
                            <input type="radio" id="iss1-yn5-2" name="iss1-yn5" checked>
                            <label for="iss1-yn5-2">가능</label>
                            <span>추가수량 최대 <input type="text" class="txt-right num-width1" name="iss1-yn5-span"> 매</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <h3>사용 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>유효 기간 설정</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.<br>
                                <span class="cc">* 빈 값이면 저장 날짜를 기준으로 하여 1년으로 자동 설정됩니다.</span>
                            </p>
                            <input type="text" id="goods-validity-start" name="goods-validity-start" placeholder="ex) 2020-02-28"> ~ <input type="text" id="goods-validity-end" name="goods-validity-end" placeholder="ex) 2020-02-28">
                        </td>
                    </tr>
                    <tr>
                        <th>적용 범위</th>
                        <td>
                            <input type="radio" name="apply1-radio" id="apply1-rd1">
                            <label for="apply1-rd1">상품 쿠폰</label>
                            <input type="radio" name="apply1-radio" id="apply1-rd2" checked>
                            <label for="apply1-rd2">주문서 쿠폰</label>
                        </td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <p class="cc2">해당 쿠폰이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="goods1-cate2" name="goods1-cate2" placeholder="ex) 24|29|30">
                        </td>
                    </tr>
                    <tr>
                        <th>사용가능 기준금액</th>
                        <td>
                            <input type="radio" id="goods1-validity1" name="goods1-validity" value="O"  checked>
                            <label for="goods1-validity1">제한 없음</label>
                            <input type="radio" id="goods1-validity2" name="goods1-validity" value="Y">
                            <label for="goods1-validity2">주문 금액 기준</label>
                            <input type="radio" id="goods1-validity3" name="goods1-validity" value="N">
                            <label for="goods1-validity3">상품 금액 기준</label>
                        </td>
                    </tr>
                    <tr class="goods1-validity-detail1" style="display:none">
                        <th>주문 금액 기준</th>
                        <td>
                            <input type="text" id="goods-validity-start1" name="goods-validity-start1" placeholder="" class="txt-right"> 원 이상
                        </td>
                    </tr>
                    <tr class="goods1-validity-detail2" style="display:none">
                        <th>상품 금액 기준</th>
                        <td>
                            <input type="text" id="goods-validity-start2" name="goods-validity-start2" placeholder="" class="txt-right"> 원 이상
                        </td>
                    </tr>
                    <tr>
                        <th>적용 계산 기준</th>
                        <td>
                            <select name="coupon-date">
                                <option value="할인(쿠폰 제외) 적용 전 결제 금액">할인(쿠폰 제외) 적용 전 결제 금액</option>
                                <option value="할인(쿠폰 제외) 적용 후 결제 금액">할인(쿠폰 제외) 적용 후 결제 금액</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>개별 결제 수단 설정</th>
                        <td>
                            <p class="cc2">상품의 개별 결제수단을 설정할 경우 다음 항목 중 입력합니다.<br><br>
                                무통장입금: cash, 카드결제: card, 적립금: mileage, 실시간 계좌이체: tcash, 가상계좌: icash, 휴대폰결제: cell, 케이페이: kpay, 페이나우: paynow, 페이코: payco, 카카오페이: kakaopay, 스마일페이: smilepay, 네이버페이: naverpay<br>
                                <span class="cc">* 결제 수단이 여러 개인 경우 쉼표&#40;,&#41;로 구분합니다.</span>
                            </p>
                            <input type="text" id="goods-payment" name="goods-payment" placeholder="ex) cash, mileage">
                        </td>
                    </tr>
                    <tr>
                        <th>중복적용</th>
                        <td>
                            <input type="radio" name="coupon1-2-radio" id="coupon1-2-rd1">
                            <label for="coupon1-2-rd1">중복사용 가능</label>
                            <input type="radio" name="coupon1-2-radio" id="coupon1-2-rd2" checked>
                            <label for="coupon1-2-rd2">중복사용 불가능</label>
                        </td>
                    </tr>
                    <tr>
                        <th>사용가능 회원</th>
                        <td>
                            <input type="radio" name="member1-radio" id="member1-rd1">
                            <label for="member1-rd1">모두사용 가능</label>
                            <input type="radio" name="member1-radio" id="member1-rd2" checked>
                            <label for="member1-rd2">회원만 사용 가능</label>
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰 종류</th>
                        <td>
                            <input type="radio" name="kind1-radio" id="kind1-rd1">
                            <label for="kind1-rd1">시리얼 쿠폰</label>
                            <input type="radio" name="kind1-radio" id="kind1-rd2" checked>
                            <label for="kind1-rd2">일반 온라인 쿠폰</label>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <h3>부가 서비스</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>로그인시 쿠폰발급 알림</th>
                        <td>
                            <input type="radio" name="login1-coupon-radio" id="login1-coupon-rd1" checked>
                            <label for="login1-coupon-rd1">사용함</label>
                            <input type="radio" name="login1-coupon-radio" id="login1-coupon-rd2">
                            <label for="login1-coupon-rd2">사용안함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰발급 SMS 발송</th>
                        <td>
                            <input type="radio" name="sms1-coupon-radio1" id="sms1-coupon-rd1" checked>
                            <label for="sms1-coupon-rd1">사용함</label>
                            <input type="radio" name="sms1-coupon-radio1" id="sms1-coupon-rd2">
                            <label for="sms1-coupon-rd2">사용안함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>쿠폰발급 이메일 발송</th>
                        <td>
                            <input type="radio" name="email1-coupon-radio1" id="email1-coupon-rd1" checked>
                            <label for="email1-coupon-rd1">사용함</label>
                            <input type="radio" name="email1-coupon-radio1" id="email1-coupon-rd2">
                            <label for="email1-coupon-rd2">사용안함</label>
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
                <button type="button" name="detail" class="btn-red">발급재개</button>
            </div>
        </form>
    </div>
</div> --%>
<script type="text/javascript" src="/assets/js/promotion-coupon.js"></script>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>


