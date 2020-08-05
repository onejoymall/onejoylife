<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">상품 등록</h2>
            <div class="main-hd-btn-wrap">
<%--                <button type="button" name="goods-add-copy" class="btn-red">복사 등록</button>--%>
<%--                <button type="button" name="goods-add-bulk" class="btn-red"><i class="exel-ic"></i>대량 등록</button>--%>
            </div>
            <div class="main-hd-btn-wrap left">
                <button type="button" name="back" class="btn-default" onclick="location.href='/Manager/Product'"><i class="arrow-left-ic"></i>리스트로 돌아가기</button>
            </div>
        </div>
        <div class="goods-detail-wrap">
            <div class="right">
<%--                <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>상품 정보 다운로드</button>--%>
            </div>
            <form name="defaultForm" id="defaultForm" method="post" enctype="multipart/form-data" action="<c:url value="/Manager/productAddProc"/>">
            	<h3>라이브 쇼핑 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
	                    <tr>
	                        <th>동영상 구분</th>
	                        <td>
	                        	<input type="radio" id="goods-sale1" name="product_live_type" value="" checked>
	                            <label for="goods-sale1">일반상품</label>
	                            <input type="radio" id="goods-sale" name="product_live_type" value="U">
	                            <label for="goods-sale">유튜브</label>
	                            <input type="radio" id="goods-notsale" name="product_live_type" value="M">
	                            <label for="goods-notsale">직접 업로드</label>
	                        </td>
	                    </tr>
	                    <tr class="hidden" id="typeU">
	                        <th>유튜브 영상 ID</th>
	                        <td>
	                            <input type="text" name="product_youtube_id" placeholder="ex) Xq0r6OHPsQc">
	                        </td>
	                    </tr>
	                    <tr class="hidden" id="typeM">
	                        <th>동영상 등록</th>
	                        <td>
	                            <div class="fileBox">
	                                <input type="text" class="fileName" name="fileName" readonly="readonly">
	                                <label for="pdImg6" class="btn_file">파일찾기</label>
	                                <input type="file" id="pdImg6" name="uploadfile6" class="uploadBtnVideo">
	                            </div>
	                        </td>
                    	</tr>
                    </tbody>
                </table>
                <h3>기본 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
<%--                    <tr>--%>
<%--                        <th>상품 코드<span class="cc-red">&#40;필수&#41;</span></th>--%>
<%--                        <td>--%>
<%--                            <input type="text" id="product_cd" name="product_cd" placeholder="ex) P000001">--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th>자체 상품 코드</th>
                        <td>
                            <input type="text" id="product_market_cd" name="product_market_cd" placeholder="ex) ABCDEF1">
                        </td>
                    </tr>
                    <tr>
                        <th>진열</th>
                        <td>
                            <input type="radio" id="goods-exposure" name="product_use_yn" value="Y" checked>
                            <label for="goods-exposure">진열</label>
                            <input type="radio" id="goods-hide" name="product_use_yn" value="N">
                            <label for="goods-hide">숨김</label>
                        </td>
                    </tr>
                    <tr>
                        <th>판매</th>
                        <td>
                            <input type="radio" id="goods-sale" name="product_sale_yn" value="Y" checked>
                            <label for="goods-sale">판매</label>
                            <input type="radio" id="goods-notsale" name="product_sale_yn" value="N">
                            <label for="goods-notsale">판매 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>국가별 노출</th>
                        <td>
                            <input type="checkbox" id="product_exposure_kr" name="product_exposure_kr" value="Y" checked>
                            <label for="product_exposure_kr">대한민국</label>
                            <input type="checkbox" id="product_exposure_usa" name="product_exposure_usa" value="Y">
                            <label for="product_exposure_usa">미국</label>
                            <input type="checkbox" id="product_exposure_cn" name="product_exposure_cn" value="Y">
                            <label for="product_exposure_cn">중국</label>
                            <input type="checkbox" id="product_exposure_jp" name="product_exposure_jp" value="Y">
                            <label for="product_exposure_jp">일본</label>
                        </td>
                    </tr>
                    <tr>
                        <th>상품 형태</th>
                        <td>
                            <input type="radio" id="product_type_1" name="product_type" value="p" checked>
                            <label for="product_type_1">일반 상품</label>
                            <input type="radio" id="product_type_2" name="product_type" value="t">
                            <label for="product_type_2">티켓</label>
                            <input type="radio" id="product_type_3" name="product_type" value="r">
                            <label for="product_type_3">여행</label>
                        </td>
                    </tr>
                    <tr>
                        <th>회원 전용 상품</th>
                        <td>
                            <input type="radio" id="goods-member-only1" name="product_use_member_yn" value="Y" >
                            <label for="goods-member-only1">회원 전용</label>
                            <input type="radio" id="goods-member-only2" name="product_use_member_yn" value="N" checked>
                            <label for="goods-member-only2">제한 없음</label>
                            <span class="cc">* 회원 전용 상품으로 설정 시 회원에게만 노출됩니다.</span>
                        </td>
                    </tr>

                    <tr>
                        <th>상품 분류 선택</th>
                        <td class="category">
                            <table >
                                <colgroup>
                                    <col width='33%' />
                                    <col width='33%' />
                                    <col width='33%' />
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>대분류</th> <th>중분류</th> <th>소분류</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <ul>
                                            <c:if test="${not empty list}">
                                                <c:forEach var="categoryList" items="${list}">
                                                    <li class="selectCategory" data-id="${categoryList.pd_category_id}">${categoryList.pd_category_name}</li>
                                                </c:forEach>
                                            </c:if>
                                        </ul>
                                    </td>
                                    <td id="subCategory"></td>
                                    <td id="tirdCategory"></td>
                                </tr>
                                </tbody>
                            </table>
                            <span id="category1t">[대분류] ${list[0].pd_category_name}</span>
                            <span id="category2t"></span>
                            <span id="category3t"></span>

                           <input type="hidden" name="selectCtCode" id="selectCtCode" value="${list[0].pd_category_id}">

                            <button class="btn-default" type="button" id="addCategoryList">추가</button>
                            <br>
                            <table>
                                <colgroup>
                                    <col width="50%">
                                    <col width="25%">
                                    <col width="25%">
                                </colgroup>
                                <tbody id="addCategoryView">

                                </tbody>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <th>상품분류 번호</th>
                        <td>
                            <p class="cc2">해당 상품이 속할 상품 분류 번호(상품 카테고리 번호)를 입력합니다.<br>
                                <span class="cc">* 분류 번호는 상품 분류관리에서 분류URL 항목의 가장 마지막 숫자입니다.</span><br>
                                <span class="cc">* 상품 분류의 분류URL이 /product/list.html?cale_no=7 이라면 7을 입력합니다.</span><br>
                                <span class="cc">* 분류 개수가 많은 경우는 10|20|21 등으로 입력합니다.</span><br></p>
                            <input type="text" id="product_ct" name="product_ct" placeholder="ex) 24|29|30" value="${list[0].pd_category_id}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>상품 분류 신상품 영역</th>
                        <td>
                            <p class="cc2">신상품 영역에 진열함:Y, 진열 안 함: N로 입력합니다.<br>
                                <span class="cc">* '분류번호'에 여러 개의 분류번호가 있는 경우 Y|N|N 등으로 입력합니다.</span></p>
                            <input type="text" id="product_new_class" name="product_new_class" placeholder="ex) N|Y|Y" value="Y" readonly>
                        </td>
                    </tr>

                    <tr>
                        <th>상품 분류 추천상품 영역</th>
                        <td>
                            <p class="cc2">추천 상품 영역에 진열함:Y, 진열 안 함: N로 입력합니다.<br>
                                <span class="cc">* '분류번호'에 여러 개의 분류번호가 있는 경우 Y|N|N 등으로 입력합니다.</span></p>
                            <input type="text" id="product_md_class" name="product_md_class" placeholder="ex) N|Y|Y" value="N" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>상품 분류 특가상품 영역</th>
                        <td>
                            <p class="cc2">특가 상품 영역에 진열함:Y, 진열 안 함: N로 입력합니다.<br>
                                <span class="cc">* '분류번호'에 여러 개의 분류번호가 있는 경우 Y|N|N 등으로 입력합니다.</span></p>
                            <input type="text" id="product_sp_class" name="product_sp_class" placeholder="ex) N|Y|Y" value="N" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th>상품명<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 250byte 까지만 등록됩니다. 상품명이 너무 긴 경우(100자이상) 화면에따라 줄임처리(...) 될 수 있습니다.</span></p>
                            <input type="text" id="product_name" name="product_name">
                        </td>
                    </tr>
                    <tr>
                        <th>영문 상품명</th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 250byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="product_name_en" name="product_name_en">
                        </td>
                    </tr>
                    <tr>
                        <th>상품명&#40;관리용&#41;</th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 50byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="product_name_mg" name="product_name_mg">
                        </td>
                    </tr>
                    <tr>
                        <th>공급사 상품명</th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 250byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="product_supply_pd_name" name="product_supply_pd_name">
                        </td>
                    </tr>
                    <tr>
                        <th>모델명</th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 100byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="product_model_name" name="product_model_name" value="AD-2">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 요약 설명</th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 120byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="product_summary_memo" name="product_summary_memo" value="">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 간략 설명</th>
                        <td>
                            <input type="text" id="product_brief_memo" name="product_brief_memo" value="">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 상세 설명</th>
                        <td>
                            <textarea name="product_html" id="summernote">상품 상세 설명을 적어주세요.</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>모바일 상품 상세 설명 설정</th>
                        <td>
                            <input type="radio" id="goods-info-mobile1" name="goods-info-mobile" value="A" checked>
                            <label for="goods-info-mobile1">상품 상세 설명과 동일</label>
                            <input type="radio" id="goods-info-mobile2" name="goods-info-mobile" value="M">
                            <label for="goods-info-mobile2">직접 등록</label>
                        </td>
                    </tr>
                    <tr>
                        <th>모바일 상품 상세 설명</th>
                        <td>
                            <textarea name="product_mobile_html" id="summernote2">모바일용 상품 상세 설명을 적어주세요.</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>검색어 설정</th>
                        <td>
                            <p class="cc2"><span class="cc">* 쉼표&#40;,&#41;로 구분하여 복수 설정 가능</span><br>
                                <span class="cc">* 최대 200byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="product_keyword" name="product_keyword" placeholder="ex) 치마, 스커트, 봄, 신상품">
                        </td>
                    </tr>
                    <tr>
                        <th>과세 구분</th>
                        <td>
                            <input type="radio" id="goods-taxation" name="product_tex_class" class="goods-tax" value="A" checked>
                            <label for="goods-taxation">과세 상품</label>
                            <label for="goods-taxation-detail">&#40;과세율 : </label>
                            <input class="onlyNumber" type="number" id="goods-taxation-detail" name="goods-taxation-detail" placeholder=""><span>%&#41;</span>
                            <input type="radio" id="goods-taxFree" name="product_tex_class" class="goods-tax" value="B">
                            <label for="goods-taxFree">면세 상품</label>
                            <input type="radio" id="goods-taxZero" name="product_tex_class"class="goods-tax" value="C">
                            <label for="goods-taxZero">영세 상품</label>
<%--                            <input type="hidden" name="product_tex_class" id="product_tex_class" value="A|0">--%>
                        </td>
                    </tr>
                    <tr>
                        <th>소비자가</th>
                        <td>
                            <input class="onlyNumber" type="text" id="product_user_payment" name="product_user_payment"> 원
                        </td>
                    </tr>
                    <tr>
                        <th>공급가<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <input class="onlyNumber" type="text" id="product_company_payment" name="product_company_payment"> 원
                        </td>
                    </tr>

                    <tr>
                        <th>판매가<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <input class="onlyNumber" type="text" id="product_payment" name="product_payment"> 원
                        </td>
                    </tr>
<%--                    <tr>--%>
<%--                        <th>상품가</th>--%>
<%--                        <td>--%>
<%--                            <input type="text" id="" name="product_payment"> 원--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th>판매가 대체 문구 사용</th>
                        <td>
                            <input type="radio" id="sp-replace-y" name="salePrice-replace" value="Y">
                            <label for="sp-replace-y">사용함</label>
                            <input type="radio" id="sp-replace-n" name="salePrice-replace" value="N" checked>
                            <label for="sp-replace-n">사용 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>판매가 대체 문구</th>
                        <td>
                            <input type="text" id="sp-replace-text" name="product_payment_memo" placeholder="200byte까지 등록 가능. ex) 임시 품절 상품" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th>판매 기간 사용 여부</th>
                        <td>
                            <input type="radio" id="product_validity_y" name="product_validity_yn" value="Y">
                            <label for="product_validity_y">사용함</label>
                            <input type="radio" id="product_validity_n" name="product_validity_yn" value="N" checked>
                            <label for="product_validity_n">사용 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>판매 기간</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.
                            </p>
                            <input type="text" id="goods-sDate-start" name="product_validity_start" placeholder="ex) 2020-02-28"> ~ <input type="text" id="goods-sDate-end" name="product_validity_end" placeholder="ex) 2020-02-28">
                        </td>
                    </tr>
                    <tr>
                        <th>상품정보고시</th>
                        <td class="product_definition_td">
                            <p class="cc2">상품 필수정보에 들어가는정보입니다. 내용입력하지 않으면 카테고리별 기본설정이사용됩니다. <a>※쉼표(,) 사용금지</a>
                            </p>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <h3>옵션 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>주문 수량 제한 기준</th>
                        <td>
                            <input type="radio" id="limited-quantity-p" name="product_order_limit_quantity" value="P">
                            <label for="limited-quantity-p">상품</label>
                            <input type="radio" id="limited-quantity-o" name="product_order_limit_quantity" value="O" checked>
                            <label for="limited-quantity-o">품목</label>
                        </td>
                    </tr>
                    <tr>
                        <th>주문 수량 제한</th>
                        <td>
                            최소 <input class="onlyNumber" type="number" id="limited-quantity-min" name="product_min_limit"> ~ 최대 <input class="onlyNumber" type="number" id="limited-quantity-max" name="product_max_limit"><span class="cc">* 최소값은 1 이상, 최대값은 빈 값일 경우 '제한 없음'으로 저장됩니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>적립금</th>
                        <td>
                            <input class="onlyNumberAndDot" type="text" id="goods-savings" name="product_point_rate">%
                            <span class="cc">* 값을 입력하지 않으면 '기본 설정 사용'으로 저장됩니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>적립금 구분</th>
                        <td>
                            <input type="radio" id="goods-savings-p" name="product_point_class" value="P" checked>
                            <label for="goods-savings-p">상품 금액에 비례</label>
                            <!-- <input type="radio" id="goods-savings-w" name="product_point_class" value="W">
                            <label for="goods-savings-w">임의 금액</label> -->
                        </td>
                    </tr>
                    <tr>
                        <th>공통 이벤트 정보</th>
                        <td>
                            <input type="radio" id="goods-event-y" name="product_go_event_yn" value="Y" checked>
                            <label for="goods-event-y">표시함</label>
                            <input type="radio" id="goods-event-n" name="product_go_event_yn" value="N">
                            <label for="goods-event-n">표시 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>성인 인증</th>
                        <td>
                            <input type="radio" id="goods-adult-y" name="product_adult_yn" value="Y">
                            <label for="goods-adult-y">사용함</label>
                            <input type="radio" id="goods-adult-n" name="product_adult_yn" value="N" checked>
                            <label for="goods-adult-n">사용 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>옵션 사용</th>
                        <td>
                            <input type="radio" id="goods-option-y" name="product_option_yn" class="product_option_yn" value="Y">
                            <label for="goods-option-y">상품 옵션 사용함</label>
                            <input type="radio" id="goods-option-n" name="product_option_yn" class="product_option_yn" value="N" checked>
                            <label for="goods-option-n">사용 안 함</label>
                        </td>
                    </tr>
                    <tr class="option-group hidden">
                        <th>옵션명</th>
                        <td>
                            <input type="text" id="product_option_set_name" name="product_option_set_name">
                            <button class="btn-default" type="button" id="callOption">옵션불러오기</button>
                        </td>
                    </tr>
                    <tr class="option-group hidden">
                        <th>옵션 입력</th>
                        <td>
                            <p class="cc2">옵션 입력 방식 : 옵션 값 명A&#123;옵션값a|옵션값b|옵션값c&#125;//옵션 값 명B&#123;옵션값d|옵션값e|옵션값f&#125;</p>
                            <input type="text" name="product_option_input" placeholder="ex) 색상&#123;빨강|파랑|초록&#125;//사이즈&#123;55|66|77&#125;">
                        </td>
                    </tr>
                    <tr class="option-group hidden">
                        <th>옵션 스타일</th>
                        <td><p class="cc2">셀렉트박스: P, 텍스트버튼: B, 라디오버튼: R<br>
                            <input type="text" id="goods-option-style" name="product_option_style" placeholder="ex) P,B,R">
                        </td>
                    </tr>
                    <tr class="option-group hidden">
                        <th>색상 설정</th>
                        <td>
                            <p class="cc2">옵션 입력 방식 : &#123;색상값a|색상값b|색상값c&#125;//&#123;색상값d|색상값e|색상값f&#125;<br>
                                <span class="cc">* '옵션입력'의 미리보기 옵션 순서대로 값이 저장됩니다.</span></p>
                            <input type="text" id="goods-option-color" name="product_option_color" placeholder="ex) &#123;#ff0000|#0033cc&#125;//&#123;#da294a|#000000|#e9e9e9&#125;">
                        </td>
                    </tr>
                    <tr class="option-group hidden">
                        <th>필수 여부</th>
                        <td>
                            <p class="cc2">필수: T, 선택: F<br>
                                <span class="cc">* 옵션 입력의 옵션명 개수만큼 bar(|)형태로 구분해 입력합니다.</span><br>
                            </p>
                            <input type="text" id="goods-option-mandatory" name="product_option_required" placeholder="ex) T|F|T">
                        </td>
                    </tr>
                    <tr>
                        <th>품절 표시 문구</th>
                        <td>
                            <p class="cc2">품목생성형 옵션 품절 시 표시할 문구를 입력합니다.<br>
                                <span class="cc">* 빈 값인 경우 '품절'로 표시됩니다.</span><br>
                                <span class="cc">* 최대 250byte까지만 등록됩니다.</span><br>
                            </p>
                            <input type="text" id="goods-stockout" name="product_sold_out_memo" placeholder="ex) 품절">
                        </td>
                    </tr>
                    <tr>
                        <th>추가 입력 옵션</th>
                        <td>
                            <input type="radio" id="goods-addInput-y" name="product_add_option" value="Y">
                            <label for="goods-addInput-y">사용함</label>
                            <input type="radio" id="goods-addInput-n" name="product_add_option" value="N" checked>
                            <label for="goods-addInput-n">사용 안 함</label>
                            <span class="cc">* 사용 안 함을 선택할 경우, 입력했던 사항은 초기화됩니다.</span>
                        </td>
                    </tr>
                    <tr class="product_add_option_name hidden" >
                        <th>추가 입력 옵션 명칭</th>
                        <td>
                            <p class="cc2">
                                <span class="cc">* 추가 입력 옵션 명칭을 원하는 개수만큼 bar(|)로 구분해 입력합니다.</span><br>
                                <span class="cc">* 최대 250byte까지만 등록됩니다.</span>
                            </p>
                            <input type="text" id="goods-addInput-name" name="product_add_option_name" placeholder="ex) 이름|사은품 입력">
                        </td>
                    </tr>
                    <tr class="product_add_option_required hidden" >
                        <th>추가 입력 옵션 선택/필수 여부</th>
                        <td>
                            <p class="cc2">필수: T, 선택: F<br>
                                <span class="cc">* '추가 입력 옵션 명칭' 개수만큼 순서대로 bar(|)로 구분해 입력합니다.</span><br>
                                <span class="cc">* 최대 250byte까지만 등록됩니다.</span><br>
                            </p>
                            <input type="text" id="goods-addInput-mandatory" name="product_add_option_required" placeholder="ex) T|F|T">
                        </td>
                    </tr>
                    <tr class="product_add_option_max_lang hidden" >
                        <th>추가 입력 옵션 글자수(자)</th>
                        <td>
                            <p class="cc2">
                                <span class="cc">* '추가 입력 옵션 명칭' 개수만큼 순서대로 bar(|)로 구분해 제한입력 글자수를 입력합니다.</span>
                            </p>
                            <input type="text" id="goods-ch-count" name="product_add_option_max_lang" placeholder="ex) 10|15|5">
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 등록&#40;상세&#41;</th>
                        <td>
                            <img src="" onerror="this.src='http://placehold.it/150'" width="150" class="file_link1"/>
                            <div class="fileBox">
                                <input type="text" class="fileName" name="fileName" readonly="readonly">
                                <label for="pdImg1" class="btn_file">파일찾기</label>
                                <input type="file" id="pdImg1" name="uploadfile" class="uploadBtn">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 등록&#40;목록&#41;</th>
                        <td>
                            <img src="" onerror="this.src='http://placehold.it/150'" width="150" class="file_link2"/>
                            <div class="fileBox">
                                <input type="text" class="fileName" name="fileName" readonly="readonly">
                                <label for="pdImg2" class="btn_file">파일찾기</label>
                                <input type="file" id="pdImg2" name="uploadfile2" class="uploadBtn">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 등록&#40;작은목록&#41;</th>
                        <td>
                            <img src="" onerror="this.src='http://placehold.it/150'" width="150" class="file_link3"/>
                            <div class="fileBox">
                                <input type="text" class="fileName" name="fileName" readonly="readonly">
                                <label for="pdImg3" class="btn_file">파일찾기</label>
                                <input type="file" id="pdImg3" name="uploadfile3" class="uploadBtn">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 등록&#40;축소&#41;</th>
                        <td>
                            <img src="" onerror="this.src='http://placehold.it/150'" width="150" class="file_link4"/>
                            <div class="fileBox">
                                <input type="text" class="fileName" name="fileName" readonly="readonly">
                                <label for="pdImg4" class="btn_file">파일찾기</label>
                                <input type="file" id="pdImg4" name="uploadfile4" class="uploadBtn">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>이미지 등록&#40;추가&#41;</th>
                        <td>
                            <img src="" onerror="this.src='http://placehold.it/150'" width="150" class="file_link5"/>
                            <div class="fileBox">
                                <input type="text" class="fileName" name="fileName" readonly="readonly">
                                <label for="pdImg5" class="btn_file">파일찾기</label>
                                <input type="file" id="pdImg5" name="uploadfile5" class="uploadBtn">
                            </div>
                        </td>
                    </tr>
<%--                    <tr>--%>
<%--                        <th>이미지 등록&#40;추가&#41;</th>--%>
<%--                        <td>--%>
<%--                            <div class="basicNoToolbar"></div>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <th>재고 현황</th>--%>
<%--                        <td>--%>
<%--                            <input type="number" id="goods-stock" name="goods-stock">--%>
<%--                            <span class="cc">* 현재 재고 갯수를 숫자로 적어주세요.</span>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th>제조사</th>
                        <td>
                            <p class="cc2"><a href="#" class="codeSrc" data-id ="M">&#91;상품 코드정보조회&#93;</a>
                            </p>
                            <input type="text" id="goods-m" name="product_made_company_cd" placeholder="ex) M00000000">
                        </td>
                    </tr>
                    <c:if test="${sessionScope.adminLogin == 'admin'}">
                    <tr>
                        <th>공급사</th>
                        <td>
                            <p class="cc2"><a href="#" class="codeSrc" data-id ="S">&#91;상품 코드정보조회&#93;</a>
                            </p>
                            <input type="text" id="goods-s" name="product_supplier" placeholder="입점업체 코드" readonly="readonly">
                            <input type="text" name="product_store_id" readonly="readonly" placeholder="입점업체 id" />
                        </td>
                    </tr>
                    </c:if>
                    <tr>
                        <th>브랜드</th>
                        <td>
                            <p class="cc2"><a href="#" class="codeSrc" data-id ="B">&#91;상품 코드정보조회&#93;</a>
                            </p>
                            <input type="text" id="goods-b" name="product_brand" placeholder="ex) B00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>트렌드</th>
                        <td>
                            <p class="cc2"><a href="#" class="codeSrc" data-id ="T">&#91;상품 코드정보조회&#93;</a>
                            </p>
                            <input type="text" id="goods-t" name="product_trend" placeholder="ex) T00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>자체 분류</th>
                        <td>
                            <input type="text" id="goods-c" name="product_self_class_cd" placeholder="ex) C00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>제조일자</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.
                            </p>
                            <input type="text" id="goods-mDate" name="product_create_date" placeholder="ex) 2020-02-28">
                        </td>
                    </tr>
                    <tr>
                        <th>출시일자</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.
                            </p>
                            <input type="text" id="goods-rDate" name="product_release_date" placeholder="ex) 2020-02-28">
                        </td>
                    </tr>
<%--                    <tr>--%>
<%--                        <th>유효 기간 사용 여부</th>--%>
<%--                        <td>--%>
<%--                            <input type="radio" id="goods-validity-y" name="product_validity_yn" value="Y">--%>
<%--                            <label for="goods-validity-y">사용함</label>--%>
<%--                            <input type="radio" id="goods-validity-n" name="product_validity_yn" value="N" checked>--%>
<%--                            <label for="goods-validity-n">사용 안 함</label>--%>
<%--                            <span class="cc">* 사용 안 함을 선택할 경우, 입력했던 사항은 초기화됩니다.</span>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    <tr class="goods-validity-detail hidden">--%>
<%--                        <th>유효 기간</th>--%>
<%--                        <td>--%>
<%--                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD~YYYY-MM-DD&#41;으로 입력합니다.<br>--%>
<%--                                <span class="cc">* 빈 값이면 저장 날짜를 기준으로 하여 1년으로 자동 설정됩니다.</span>--%>
<%--                            </p>--%>
<%--                            <input type="text" id="goods-validity-start" name="product_validity" placeholder="ex) 2020-02-28~2021-02-28">--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th>원산지</th>
                        <td>
                            <p class="cc2"><a href="#" class="codeSrc" data-id ="O">&#91;상품 코드정보조회&#93;</a>
                            </p>
                            <input type="text" id="goods-origin" name="product_origin" placeholder="ex) 1575">
                        </td>
                    </tr>
                    <tr>
                        <th>상품부피&#40;cm&#41;</th>
                        <td>
                            <p class="cc2"><span class="cc">* 가로, 세로, 높이 값을 bar&#40;|&#41;로 구분해서 입력합니다</span><br>
                                <span class="cc">* 소수점 첫째 자리까지 입력가능하며 최대 10,000단위까지만 입력할 수 있습니다.</span><br>
                                <span class="cc">* 빈 값인 경우 '사용 안 함'으로 저장됩니다.</span>
                            </p>
                            <input type="text" id="goods-volume" name="product_cm" placeholder="ex) 가로30cm, 세로 50cm, 높이 20.50cm인 경우 → 30|50|20.5">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 결제 안내</th>
                        <td>
                            <p class="cc2"><span class="cc">* 빈 값인 경우 '기본설정'으로 저장됩니다.</span></p>
                            <textarea name="product_payment_info" id="editor3"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>상품 배송 안내</th>
                        <td>
                            <p class="cc2"><span class="cc">* 빈 값인 경우 '기본설정'으로 저장됩니다.</span></p>
                            <textarea name="product_delivery_info" id="editor4"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>교환/반품 안내</th>
                        <td>
                            <p class="cc2"><span class="cc">* 빈 값인 경우 '기본설정'으로 저장됩니다.</span></p>
                            <textarea name="product_change_info" id="editor5"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>서비스 문의/안내</th>
                        <td>
                            <p class="cc2"><span class="cc">* 빈 값인 경우 '기본설정'으로 저장됩니다.</span></p>
                            <textarea name="product_service_info" id="editor6"></textarea>
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
                        <th>배송정보</th>
                        <td>
                            <input type="radio" id="goods-shipping-t" name="product_delivery_class" value="T" class="goods-shipping">
                            <label for="goods-shipping-t">배송 정보 개별 설정</label>
                            <input type="radio" id="goods-shipping-f" name="product_delivery_class" value="F" checked class="goods-shipping">
                            <label for="goods-shipping-f">기본 설정 사용</label><a href="/Manager/Delivery">[보기 > ]</a>
                        </td>
                    </tr>
                    <tr class="shipping-t-detail hidden">
                        <th>배송 방법</th>
                        <td>
                            <select name="product_delivery_type">
                                <option value="A" <c:if test="${detail.product_delivery_type eq 'A' }">selected</c:if>>택배</option>
                                <option value="B" <c:if test="${detail.product_delivery_type eq 'B' }">selected</c:if>>빠른등기</option>
                                <option value="C" <c:if test="${detail.product_delivery_type eq 'C' }">selected</c:if>>일반등기</option>
                                <option value="E" <c:if test="${detail.product_delivery_type eq 'E' }">selected</c:if>>퀵배송</option>
                                <option value="F" <c:if test="${detail.product_delivery_type eq 'F' }">selected</c:if>>기타</option>
                                <option value="G" <c:if test="${detail.product_delivery_type eq 'G' }">selected</c:if>>화물배송</option>
                                <option value="H" <c:if test="${detail.product_delivery_type eq 'H' }">selected</c:if>>매장직접수령</option>
                                <option value="I" <c:if test="${detail.product_delivery_type eq 'I' }">selected</c:if>>배송 필요 없음</option>
                            </select>
                            <select name="delivery_t_code">
                                <c:forEach var="companyList" items="${companyList}" varStatus="status">
                                    <option value="${companyList.Code}">${companyList.Name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr class="shipping-t-detail hidden">
                        <th>국내/해외 배송<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <select name="product_delivery_International_type">
                                <option value="A" <c:if test="${detail.product_delivery_International_type eq 'A' }">selected</c:if>>국내 배송</option>
                                <option value="B" <c:if test="${detail.product_delivery_International_type eq 'B' }">selected</c:if>>국내/해외 배송</option>
                                <option value="C" <c:if test="${detail.product_delivery_International_type eq 'C' }">selected</c:if>>해외 배송</option>
                            </select>
                            <span class="cc">* 국내 배송을 포함하지 않은 단독 해외 배송은 해외 쇼핑몰에서만 사용할 수 있습니다.</span>
                        </td>
                    </tr>
                    <tr class="shipping-t-detail hidden">
                        <th>배송 지역</th>
                        <td>
                            <input type="text" name="product_delivery_locale" id="shipping-area2" value="${detail.product_delivery_locale}"/>
                            <%--                                    <input type="text" id="shipping-area2" name="product_delivery_locale" placeholder="ex) 전국">--%>
                            <span class="cc">* 최대 40byte까지만 등록됩니다.</span>
                        </td>
                    </tr>
                    <tr class="shipping-t-detail hidden" >
                        <th>배송비 선결제 설정<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <select name="product_delivery_payment_type">
                                <option value="C">착불</option>
                                <option value="P">선결제</option>
                                <option value="B">선결제/착불</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="shipping-t-detail hidden" >
                        <th>배송 기간</th>
                        <td>
                            <p class="cc2">1부터 99까지의 숫자를 사용해 입력합니다.</p>
                            <input type="text" id="shipping-period" name="product_delivery_date" value="${detail.product_delivery_date}" placeholder="ex) 배송 기간이 2~4일 걸릴 경우 '2|4'라고 입력">
                        </td>
                    </tr>
                    <tr class="shipping-fee-tr shipping-t-detail hidden" >
                        <th>배송비 구분</th>
                        <td>
                            <select name="product_delivery_payment_class" id="shipping-fee">
                                <option value="T" <c:if test="${detail.product_delivery_payment_class eq 'T' }">selected</c:if>>배송비 무료</option>
                                <option value="R" <c:if test="${detail.product_delivery_payment_class eq 'R' }">selected</c:if>>고정 배송비 사용</option>
                                <option value="M" <c:if test="${detail.product_delivery_payment_class eq 'M' }">selected</c:if>>구매 금액에 따른 부과</option>
                                <option value="D" <c:if test="${detail.product_delivery_payment_class eq 'D' }">selected</c:if>>구매 금액별 차등 배송료 사용</option>
                                <option value="W" <c:if test="${detail.product_delivery_payment_class eq 'W' }">selected</c:if>>상품 무게별 차등 배송료 사용</option>
                                <option value="C" <c:if test="${detail.product_delivery_payment_class eq 'C' }">selected</c:if>>상품 수량별 차등 배송료 사용</option>
                                <option value="N" <c:if test="${detail.product_delivery_payment_class eq 'N' }">selected</c:if>>상품 수량에 비례하여 배송료 부과</option>
                            </select>
                            <span class="cc">* 옵션을 새로 선택하면 상세 설정 내역이 초기화됩니다.</span>
                        </td>
                    </tr>
                    <c:if test="${detail.product_delivery_payment_class eq 'R' }">
                        <tr class="shippingFee-detail-wrap shipping-t-detail hidden"><th>배송비 상세 설정</th><td>배송비 <input type="text" name="product_delivery_payment" value="${detail.product_delivery_payment}"> 원을 고정적으로 부과함.</td></tr>'
                    </c:if>
                    <c:if test="${detail.product_delivery_payment_class eq 'M' }">
                        <tr class="shippingFee-detail-wrap shipping-t-detail hidden"><th>배송비 상세 설정</th><td><p class="cc2">구매 금액이 30,000원 미만일 때 배송비 2,500원을 부과하려면 30000|2500 입력</p><input type="text" id="shippingFee-detail" name="product_delivery_payment" placeholder="ex) 30000|2500"  value="${detail.product_delivery_payment}"></td></tr>
                    </c:if>
                    <c:if test="${detail.product_delivery_payment_class eq 'D' }">
                        <tr class="shippingFee-detail-wrap shipping-t-detail  hidden long"><th>배송비 상세 설정</th><td><p class="cc2">20,000원 이상~30,000원 미만일 때 배송비 2,000원을 부과하고 30,000원 이상~50,000원 미만일 때 배송비 1,000원을 부과하려면<br>20000|30000|2000//30000|50000|1000 입력</p><input type="text"  name="product_delivery_payment" placeholder="ex) 20000|30000|2000//30000|50000|1000" value="${detail.product_delivery_payment}"></td></tr>
                    </c:if>
                    <c:if test="${detail.product_delivery_payment_class eq 'W' }">
                        <tr class="shippingFee-detail-wrap shipping-t-detail  hidden long"><th>배송비 상세 설정</th><td><p class="cc2">3kg 이상~5kg 미만일 때 배송비 2,000원을 부과하고 5kg 이상~7kg 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text"  name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000" value="${detail.product_delivery_payment}"></td></tr>
                    </c:if>
                    <c:if test="${detail.product_delivery_payment_class eq 'C' }">
                        <tr class="shippingFee-detail-wrap shipping-t-detail  hidden long"><th>배송비 상세 설정</th><td><p class="cc2">3개 이상~5개 미만일 때 배송비 2,000원을 부과하고 5개 이상~7개 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text" i name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000" value="${detail.product_delivery_payment}"></td></tr>
                    </c:if>
                    <c:if test="${detail.product_delivery_payment_class eq 'N' }">
                        <tr class="shippingFee-detail-wrap shipping-t-detail hidden"><th>배송비 상세 설정</th><td>주문 금액에 상관 없이 수량에 따라 배송료 <input type="text" name="product_delivery_payment" value="${detail.product_delivery_payment}">원을 부과함.</td></tr>
                    </c:if>
                    <tr class="shipping-f-detail">
                        <th>스토어픽업 설정</th>
                        <td>
                            <input type="radio" id="goods-storePickup-y" name="product_delivery_store_pickup" value="Y" <c:if test="${detail.product_delivery_store_pickup eq 'Y' }">selected</c:if>>
                            <label for="goods-storePickup-y">사용함</label>
                            <input type="radio" id="goods-storePickup-n" name="product_delivery_store_pickup" value="N" <c:if test="${detail.product_delivery_store_pickup eq 'N' }">selected</c:if>>
                            <label for="goods-storePickup-n">사용 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>상품 전체 중량&#40;kg&#41;</th>
                        <td>
                            <p class="cc2"><span class="cc">* 소수점 둘째 자리까지 입력할 수 있습니다.</span></p>
                            <input class="onlyNumberAndDot" type="text" id="product_kg" name="product_kg" value='0'>Kg
                        </td>
                    </tr>
                    <tr>
                        <th>HS코드</th>
                        <td style="position:relative">
                            <p class="cc2">국가 별로 HS코드를 따로 입력하려면 쉼표&#40;,&#41;로 구분해 입력합니다.
                                <span class="cc">ex&#41; CHN|60064100,JPN|081310000</span><br>
                                국가 코드 없이 HS코드를 입력할 경우 대한민국 HS코드로 저장됩니다.
                                <span class="cc">* 대한민국 HS코드는 10자리만 입력할 수 있습니다.</span><br>
                                <button type="button" class="code-wrap-button cc-blue">국가 코드 정보 확인하기</button>
                            </p>
                            <div class="code-wrap">
                                <p>미국: USA, EU: EU, 일본: JPN, 중국: CHN, 대만: TWN, 호주: AUS, 칠레: CHL, 브라질: BRA, 페루: PER, 러시아: RUS, 사우디아라비아: SAU, 멕시코: MEX, 태국: THA, 베트남: VNM, 인도네시아: IDN, 싱가포르: SGP, 필리핀: PHL, 말레이시아: MYS, 인도: IND, 노르웨이: NOR, 스위스: CHE, 캐나다: CAN, 뉴질랜드: NZL</p>
                            </div>
                            <input type="text" id="goods-HScode" name="product_global_hs_code" placeholder="ex) CHN|60064100r">
                        </td>
                    </tr>
                    <tr>
                        <th>상품구분&#40;해외통관용&#41;</th>
                        <td>
                            <p class="cc2"><a href="#">&#91;상품 코드정보조회&#93;</a>를 통해 검색하거나 <a href="#">&#91;전체 코드정보다운로드&#93;</a>를 통해 확인된 상품구분&#40;해외통관용&#41; 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-code-overseas" name="product_global_clearance" placeholder="ex) AAAA0000">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 소재</th>
                        <td>
                            <p class="cc2">상품의 소재 정보를 입력합니다.
                            </p>
                            <input type="text" id="goods-material" name="product_material" placeholder="ex) 나일론 80%, 실크 20%">
                        </td>
                    </tr>
                    <tr>
                        <th>영문 상품 소재&#40;해외통관용&#41;</th>
                        <td>
                            <p class="cc2">소재 정보를 영문으로 입력합니다.<span class="span cc">* 대문자 'AUTO'를 입력할 경우 '상품 소재' 항목에 입력한 데이터가 자동 번역됩니다.</span>
                            </p>
                            <input type="text" id="goods-material-en" name="product_material_en" placeholder="ex) Rayon 80%, Silk 20%">
                        </td>
                    </tr>
                    <tr>
                        <th>옷감&#40;해외통관용&#41;</th>
                        <td>
                            <p class="cc2">상품이 의류일 경우 해외통관용 옷감 정보를 입력합니다.<span class="span cc">* 편물: knit, 직물: woven으로 입력합니다.</span>
                            </p>
                            <input type="text" id="goods-fabric-en" name="product_fabric" placeholder="ex) knit">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <h3>검색 최적화 및 기타</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>검색엔진 최적화&#40;SEO&#41;<br>노출 설정</th>
                        <td>
                            <input type="radio" id="goods-seo-y" name="product_seo_yn" value="Y" checked>
                            <label for="goods-seo-y">노출함</label>
                            <input type="radio" id="goods-seo-n" name="product_seo_yn" value="N">
                            <label for="goods-seo-n">노출 안 함</label>
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br> Title</th>
                        <td>
                            <p class="cc2">상품별 브라우저 Title 값을 원할 경우 입력합니다.
                            </p>
                            <input type="text" id="goods-seo-title" name="product_seo_title">
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br> Author</th>
                        <td>
                            <p class="cc2">상품별 메타태그 Author 값을 원할 경우 입력합니다.
                            </p>
                            <input type="text" id="goods-seo-author" name="product_seo_author">
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br> Description</th>
                        <td>
                            <p class="cc2">상품별 메타태그 Description 값을 원할 경우 입력합니다.
                            </p>
                            <input type="text" id="goods-seo-description" name="product_seo_description">
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br> Keywords</th>
                        <td>
                            <p class="cc2">상품별 메타태그 Keywords 값을 원할 경우 입력합니다.
                                <span class="cc">* 쉼표&#40;,&#41;로 구분합니다.</span>
                            </p>
                            <input type="text" id="goods-seo-keywords" name="product_seo_keywords" placeholder="ex) Keyword1, Keyword2">
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br>상품 이미지 Alt 텍스트</th>
                        <td>
                            <p class="cc2">상품 이미지에 Alt 텍스트를 넣을 경우 입력합니다.
                            </p>
                            <input type="text" id="goods-seo-alt" name="product_seo_alt">
                        </td>
                    </tr>
                    <tr>
                        <th>개별 결제 수단 설정</th>
                        <td>
                            <p class="cc2">상품의 개별 결제수단을 설정할 경우 다음 항목 중 입력합니다.<br><br>
                                무통장입금: cash, 카드결제: card, 적립금: mileage, 실시간 계좌이체: tcash, 가상계좌: icash, 휴대폰결제: cell, 케이페이: kpay, 페이나우: paynow, 페이코: payco, 카카오페이: kakaopay, 스마일페이: smilepay, 네이버페이: naverpay<br>
                                <span class="cc">* 결제 수단이 여러 개인 경우 쉼표&#40;,&#41;로 구분합니다.</span>
                            </p>
                            <input type="text" id="goods-payment" name="product_payment_type" placeholder="ex) cash, mileage">
                        </td>
                    </tr>
<%--                    <tr>--%>
<%--                        <th>상품 배송 유형 코드</th>--%>
<%--                        <td>--%>
<%--                            <p class="cc2">상품의 배송 유형을 설정할 경우 다음 항목 중 입력합니다.<br><br>--%>
<%--                                사입배송: D, 직접배송: C, 기타: E|창고코드<br>--%>
<%--                                <span class="cc">* 기타(E)의 경우 김포 창고 코드가 2이면 'E|2'로 입력</span><br>--%>
<%--                                <span class="cc">* 빈 값일 경우 직접등록(C)으로 자동 등록됩니다.</span>--%>
<%--                            </p>--%>
<%--                            <input type="text" id="goods-shipping-code" name="product_delivery_type_code" placeholder="ex) E|2">--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th>메모</th>
                        <td>
                            <p class="cc2">각 상품별로 상품 메모 정보를 입력합니다.<br>
<%--                                <span class="cc">* 상품 메모는 업로드마다 1개씩 추가됩니다.</span>--%>
                            </p>
                            <input type="text" id="goods-memo" name="product_memo">
                        </td>
                    </tr>
<%--                    <tr>--%>
<%--                        <th>추가항목01_<br>$추가항목명</th>--%>
<%--                        <td>--%>
<%--                            <p class="cc2">[상품관리 &#62; 상품표시관리 &#62; 상품정보표시설정]에서 항목 추가 시 추가한 순서대로 제공되는 항목입니다.<br>--%>
<%--                                <span class="cc">* 최대 250byte까지만 등록됩니다.</span>--%>
<%--                            </p>--%>
<%--                            <input type="text" id="goods-additional" name="goods-additional">--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    </tbody>
                </table>
<%--                <table class="goods-detail-table">--%>
<%--                    <colgroup>--%>
<%--                        <col width="142px">--%>
<%--                        <col width="800px">--%>
<%--                    </colgroup>--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <th>예약등록</th>--%>
<%--                        <td>--%>
<%--                            <p class="cc2">상품을 등록할 시간을 미리 예약할 수 있습니다.<br>--%>
<%--                                <span class="cc">* YYYY-MM-DD-HH-MM 연도-월-날짜-시간-분 순으로 입력합니다.</span><br>--%>
<%--                                <span class="cc">* 시간은 24시 체계로 입력합니다. ex&#41; 낮 2시 = 14시</span>--%>
<%--                            </p>--%>
<%--                            <input type="text" id="goods-reserve" name="goods-reserve" placeholder="ex) 2020-02-28-18-32">--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
                <button type="button" id="formProductSubmit" class="btn-red">저장하기</button>
            </form>
        </div>
    </div>
</main>
<div class="modal codeSrcModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>분류코드 정보조회</h2>
            <button type="button" class="modal-close">×</button>
        </div>
        <div class="modal-body">
            <div class="src-wrap clearfix">
                <input type="text" name="product_class_name" class="srcInput" >

                <button type="button" type="button" class="srcButton" data-id="O">등록</button>

            </div>
            <div class="wrap">
                <table class="codeSrcTable">
                    <colgroup>
                        <col width="5%">
                        <col width="10%">
                        <col width="50%">
                        <col width="13%">
                        <col width="12%">
                    </colgroup>
                    <thead>
                    <td></td>
                    <td>분류코드</td>
                    <td>분류코드명</td>
                    <td>종류</td>
                    <td>관리</td>    
                    </thead>
                    <tbody class="dataListView">

                    </tbody>
                </table>
            </div>
            <button class="btn-red mr-10" id="code-com">입력하기</button>
        </div>
    </div>
</div>

<div class="modal modal1">
    <div class="modal-content">
        <form name="defaultForm1" id="defaultForm1" method="multipart/form-data">
            <div class="modal-header">
               <h2>입점업체 등록</h2>
                <button type="button" class="modal-close1">×</button>
            </div>
            <div class="modal-body clearfix">
                <h3>기본정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>입점사 ID</th>
                            <td>
                                <input type="text" id="store_id" name="store_id">
                                <button type="button" class="btn_file" id="storIdDupCheck">중복확인</button>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호 설정</th>
                            <td>
                                <p><input type="password" name="store_password" placeholder="비밀번호"></p>
                                <p><input type="password" name="store_passwordCf" placeholder="비밀번호 확인"></p>
                                <p class="s-font">- 영문 대소문자 또는 숫자, 특수문자 중 2가지 이상 조합으로 10-20자 미만</p>
                                <p class="s-font">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</p>
                            </td>
                        </tr>

                    </tbody>
                </table>
                <h3>판매자</h3>
                <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>상호</th>
                                <td>
                                    <input type="text" id="store_name" name="store_name">
                                </td>
                            </tr>
                            <tr>
                                <th>사업자등록번호</th>
                                <td>
<%--                                        <input type="radio" id="table-ra1" name="store_reg_type" value="D">--%>
<%--                                        <label for="table-ra1">개인</label>--%>
<%--                                        <input type="radio" id="table-ra2" name="store_reg_type" VALUE="C">--%>
<%--                                        <label for="table-ra2">법인</label>--%>
                                    <input type="text" id="store_reg" name="store_reg">
                                    <button type="button" class="btn_file" id="storRegDupCheck">중복확인</button>
                                </td>
                            </tr>
                            <tr>
                                <th>대표자</th>
                                <td>
                                    <input type="text" id="store_ceo_name" name="store_ceo_name">
                                </td>
                            </tr>
                            <tr>
                                <th>업태/업종</th>
                                <td>
                                    <input type="text" id="store_type" name="store_type"> / <input type="text" id="store_item" name="store_item">
                                </td>
                            </tr>

                            <tr>
                                <th>사업자등록증 사본</th>
                                <td>
                                    <div class="fileBox">
                                        <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">
                                        <label for="uploadBtn" class="btn_file">파일찾기</label>
                                        <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
                                        <div class="fileDownload">

                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>통신판매신고번호</th>
                                <td>
                                    <input type="text" id="store_online_reg" name="store_online_reg">
                                </td>
                            </tr>
                            <tr>
                                <th>전화</th>
                                <td>
                                    <input type="text" id="store_tel" name="store_tel">
                                </td>
                            </tr>
                            <tr>
                                <th>메일</th>
                                <td>
                                    <input type="text" id="store_mail" name="store_mail">
                                </td>
                            </tr>
                            <tr>
                                <th>팩스</th>
                                <td>
                                    <input type="text" id="store_fax" name="store_fax">
                                </td>
                            </tr>
                            <tr>
                                <th>사업장 주소</th>
                                <td class="address-td">
                                    <p><input type="text" id="postcode" name="postcode"><button type="button" class="ad-but" id="daumMapCall">우편번호</button></p>
                                    <p><span>(도로명)</span><input type="text" id="roadAddress" name="roadAddress" class="ad-input"></p>
                                    <p><span>(지번)</span><input type="text" id="jibunAddress" name="jibunAddress" class="ad-input"></p>
                                    <p><span>(공통상세)</span><input type="text" id="extraAddress" name="extraAddress" class="ad-input"></p>
                                </td>
                            </tr>
                            <tr>
                                <th>계산서 수신메일</th>
                                <td>
                                    <input type="text" id="tex_email" name="tex_email">
                                </td>
                            </tr>
                            <tr>
                                <th>계좌번호</th>
                                <td>
                                    <input type="text" id="store_bank_account" name="store_bank_account">
                                </td>
                            </tr>
                            <tr>
                                <th>예금주</th>
                                <td>
                                    <input type="text" id="store_bank_holder" name="store_bank_holder">
                                </td>
                            </tr>
                            <tr>
                                <th>은행명</th>
                                <td>
                                    <input type="text" id="store_bank_name" name="store_bank_name">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                <button type="button" id="formStoreSubmitProduct" class="btn-red">등록하기</button>
                <div class="updateBtn hidden">
                    <button type="button" id="storeApproval" class="btn-red">승인</button>
                    <button type="button" id="storeUpdateSubmit" class="btn-red">수정</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="/assets/js/goods-add.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
<script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
<script type="text/javascript" src="/assets/js/index.js"></script>
<script>
$(function(){
	var html = '<p class="product_definition">' +
				    '<input type="text" name="product_definition_key" placeholder="ex) 에너지소비효율등급">' +
				    '<input type="text" name="product_definition_value" placeholder="ex) 3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음">' +
				    '<button type="button" class="goods-list-btn product_definition_add_btn">+</button>' +
				    '<button type="button" class="goods-list-btn redBtn product_definition_del_btn">x</button>' +
				'</p>';
	$(".product_definition_td").append(html);
	$("input[name=product_live_type]").on("input click",function(){
		var type=$(this).val();
		if(type){
			if(type=='U'){
				$("#typeU").removeClass("hidden");
				$("#typeM").addClass("hidden");
			}else{
				$("#typeM").removeClass("hidden");
				$("#typeU").addClass("hidden");
			}
		}else{
			$("#typeU").addClass("hidden");
			$("#typeM").addClass("hidden");
		}
	})
})

$("select[name=product_delivery_type]").on('click', function () {
    if ($("select[name=product_delivery_type]").find("option:selected").val() == "A") {
        $("select[name=delivery_t_code]").attr("disabled", false);
    } else {
        $("select[name=delivery_t_code]").attr("disabled", true);
    }
})
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>