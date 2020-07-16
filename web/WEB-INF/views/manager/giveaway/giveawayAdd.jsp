<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">경품 등록</h2>
            <div class="main-hd-btn-wrap">
<%--                <button type="button" name="goods-add-copy" class="btn-red">복사 등록</button>--%>
<%--                <button type="button" name="goods-add-bulk" class="btn-red"><i class="exel-ic"></i>대량 등록</button>--%>
            </div>
            <div class="main-hd-btn-wrap left">
                <button type="button" name="back" class="btn-default" onclick="location.href='/Manager/Giveaway'"><i class="arrow-left-ic"></i>리스트로 돌아가기</button>
            </div>
        </div>
        <div class="goods-detail-wrap">
            <div class="right">
<%--                <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>상품 정보 다운로드</button>--%>
            </div>
            <form name="defaultForm" id="defaultForm" method="post" enctype="multipart/form-data" action="<c:url value="/Manager/GiveawayAddProc"/>">
                <h3>기본 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>자체 상품 코드</th>
                        <td>
                            <input type="text" id="product_market_cd" name="giveaway_market_cd" placeholder="ex) ABCDEF1">
                        </td>
                    </tr>
                    <tr>
                        <th>경품 추첨 설정</th>
                        <td>
                            <p class="cc2">경품의 자동 추첨 기준 포인트를 입력합니다.<br>
                                <span class="cc">* 설정된 기준 포인트 달성시 자동추첨 됩니다.</span><br>
                            </p>
                            <input type="text" id="giveaway_play_winner_point" name="giveaway_play_winner_point" >
                        </td>
                    </tr>
                    <tr>
                        <th>경품 응모 최대 포인트</th>
                        <td>
                            <p class="cc2">경품의 응모 가능한 최대 포인트를 입력합니다.<br>
<%--                                <span class="cc">* 이볅된 기준 포인트 달성시 자동추첨 됩니다.</span><br>--%>
                            </p>
                            <input type="text" id="giveaway_play_max_point" name="giveaway_play_max_point" >
                        </td>
                    </tr>
                    <tr>
                        <th>경품 응모 최소 포인트</th>
                        <td>
                            <p class="cc2">경품의 응모 가능한 최소 포인트를 입력합니다.<br>
<%--                                <span class="cc">* 이볅된 기준 포인트 달성시 자동추첨 됩니다.</span><br>--%>
                            </p>
                            <input type="text" id="giveaway_play_min_point" name="giveaway_play_min_point" >
                        </td>
                    </tr>
                    <tr>
                        <th>진열</th>
                        <td>
                            <input type="radio" id="goods-exposure" name="giveaway_use_yn" value="Y" checked>
                            <label for="goods-exposure">진열</label>
                            <input type="radio" id="goods-hide" name="giveaway_use_yn" value="N">
                            <label for="goods-hide">숨김</label>
                        </td>
                    </tr>
                    <tr>
                        <th>판매</th>
                        <td>
                            <input type="radio" id="goods-sale" name="giveaway_sale_yn" value="Y" checked>
                            <label for="goods-sale">판매</label>
                            <input type="radio" id="goods-notsale" name="giveaway_sale_yn" value="N">
                            <label for="goods-notsale">판매 안 함</label>
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
                            <input type="text" id="product_ct" name="giveaway_ct" placeholder="ex) 24|29|30" value="${list[0].pd_category_id}">
                        </td>
                    </tr>

                    <tr>
                        <th>상품명<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 250byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="giveaway_name" name="giveaway_name">
                        </td>
                    </tr>
                    <tr>
                        <th>영문 상품명<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 250byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="giveaway_name_en" name="giveaway_name_en">
                        </td>
                    </tr>
                    <tr>
                        <th>상품명&#40;관리용&#41;</th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 50byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="giveaway_name_mg" name="giveaway_name_mg">
                        </td>
                    </tr>
                    <tr>
                        <th>공급사 상품명</th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 250byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="giveaway_supply_pd_name" name="giveaway_supply_pd_name">
                        </td>
                    </tr>
                    <tr>
                        <th>모델명</th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 100byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="giveaway_model_name" name="giveaway_model_name" value="AD-2">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 요약 설명<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <p class="cc2"><span class="cc">* 최대 120byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="giveaway_summary_memo" name="giveaway_summary_memo" value="">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 간략 설명</th>
                        <td>
                            <input type="text" id="giveaway_brief_memo" name="giveaway_brief_memo" value="">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 상세 설명</th>
                        <td>
                            <textarea name="giveaway_html" id="summernote">상품 상세 설명을 적어주세요.</textarea>
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
                            <textarea name="giveaway_mobile_html" id="summernote2">모바일용 상품 상세 설명을 적어주세요.</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>검색어 설정</th>
                        <td>
                            <p class="cc2"><span class="cc">* 쉼표&#40;,&#41;로 구분하여 복수 설정 가능</span><br>
                                <span class="cc">* 최대 200byte 까지만 등록됩니다.</span></p>
                            <input type="text" id="giveaway_keyword" name="giveaway_keyword" placeholder="ex) 치마, 스커트, 봄, 신상품">
                        </td>
                    </tr>
                    <tr>
                        <th>과세 구분</th>
                        <td>
                            <input type="radio" id="goods-taxation" name="goods-tax" class="goods-tax" value="A" checked>
                            <label for="goods-taxation">과세 상품</label>
                            <label for="goods-taxation-detail">&#40;과세율 : </label>
                            <input type="number" id="goods-taxation-detail" name="goods-taxation-detail" placeholder=""><span>%&#41;</span>
                            <input type="radio" id="goods-taxFree" name="goods-tax" class="goods-tax" value="B">
                            <label for="goods-taxFree">면세 상품</label>
                            <input type="radio" id="goods-taxZero" name="goods-tax"class="goods-tax" value="C">
                            <label for="goods-taxZero">영세 상품</label>
                            <input type="hidden" name="giveaway_tex_class" id="giveaway_tex_class" value="A|0">
                        </td>
                    </tr>
                    <tr>
                        <th>소비자가<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <input type="text" id="giveaway_user_payment" name="giveaway_user_payment"> 원
                        </td>
                    </tr>
                    <tr>
                        <th>공급가</th>
                        <td>
                            <input type="text" id="giveaway_company_payment" name="giveaway_company_payment"> 원
                        </td>
                    </tr>

                    <tr>
                        <th>판매가</th>
                        <td>
                            <input type="text" id="giveaway_payment" name="giveaway_payment"> 원
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
                            <input type="text" id="sp-replace-text" name="giveaway_payment_memo" placeholder="200byte까지 등록 가능. ex) 임시 품절 상품" disabled>
                        </td>
                    </tr>
                    <tr>
                        <th>상품정보고시</th>
                        <td class="giveaway_definition_td">
                            <p class="cc2">상품 필수정보에 들어가는정보입니다. 내용입력하지 않으면 카테고리별 기본설정이사용됩니다. <a>※쉼표(,) 사용금지</a>
                            </p>
                        </td>
                    </tr>
<%--                    <tr>
                        <th>예상 마감기간</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.
                            </p>
                            <input type="text" id="giveaway_date_start" name="giveaway_date_start" placeholder="ex) 2020-02-28"> ~
                            <input type="text" id="giveaway_date_end" name="giveaway_date_end" placeholder="ex) 2020-02-28">
                        </td>
                    </tr>--%>
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
                            <input type="radio" id="limited-quantity-p" name="giveaway_order_limit_quantity" value="P">
                            <label for="limited-quantity-p">상품</label>
                            <input type="radio" id="limited-quantity-o" name="giveaway_order_limit_quantity" value="O" checked>
                            <label for="limited-quantity-o">품목</label>
                        </td>
                    </tr>
                    <tr>
                        <th>주문 수량 제한</th>
                        <td>
                            최소 <input type="number" id="limited-quantity-min" name="giveaway_min_limit"> ~ 최대 <input type="number" id="limited-quantity-max" name="giveaway_max_limit"><span class="cc">* 최소값은 1 이상, 최대값은 빈 값일 경우 '제한 없음'으로 저장됩니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>적립금</th>
                        <td>
                            <input type="number" id="goods-savings" name="giveaway_point_rate">
                            <span class="cc">* 값을 입력하지 않으면 '기본 설정 사용'으로 저장됩니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>적립금 구분</th>
                        <td>
                            <input type="radio" id="goods-savings-p" name="giveaway_point_class" value="P" checked>
                            <label for="goods-savings-p">상품 금액에 비례</label>
                            <input type="radio" id="goods-savings-w" name="giveaway_point_class" value="W">
                            <label for="goods-savings-w">임의 금액</label>
                        </td>
                    </tr>
                    <tr>
                        <th>공통 이벤트 정보</th>
                        <td>
                            <input type="radio" id="goods-event-y" name="giveaway_go_event_yn" value="Y" checked>
                            <label for="goods-event-y">표시함</label>
                            <input type="radio" id="goods-event-n" name="giveaway_go_event_yn" value="N">
                            <label for="goods-event-n">표시 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>성인 인증</th>
                        <td>
                            <input type="radio" id="goods-adult-y" name="giveaway_adult_yn" value="Y">
                            <label for="goods-adult-y">사용함</label>
                            <input type="radio" id="goods-adult-n" name="giveaway_adult_yn" value="N" checked>
                            <label for="goods-adult-n">사용 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>옵션 사용</th>
                        <td>
                            <input type="radio" id="goods-option-y" name="giveaway_option_yn" class="product_option_yn" value="Y">
                            <label for="goods-option-y">상품 옵션 사용함</label>
                            <input type="radio" id="goods-option-n" name="giveaway_option_yn" class="product_option_yn" value="N" checked>
                            <label for="goods-option-n">사용 안 함</label>
                        </td>
                    </tr>
                    <tr class="option-group-1 hidden">
                        <th>품목 구성 방식</th>
                        <td>
                            <input type="radio" id="goods-compType-t" name="giveaway_option_class" value="T" checked>
                            <label for="goods-compType-t">조합형</label>
                            <input type="radio" id="goods-compType-e" name="giveaway_option_class" value="E">
                            <label for="goods-compType-e">상품연동형</label>
                            <input type="radio" id="goods-compType-f" name="giveaway_option_class" value="F">
                            <label for="goods-compType-f">독립선택형</label>
                        </td>
                    </tr>
                    <tr class="option-group-2 hidden">
                        <th>옵션 표시 방식</th>
                        <td>
                            <input type="radio" id="goods-optionType-c" name="giveaway_option_view_type" value="C">
                            <label for="goods-optionType-c">일체선택형</label>
                            <input type="radio" id="goods-optionType-s" name="giveaway_option_view_type" value="S">
                            <label for="goods-optionType-s">분리선택형</label>
                        </td>
                    </tr>
                    <tr class="option-group-3 hidden">
                        <th>옵션 세트명</th>
                        <td>
                            <input type="text" id="goods-optionSet-name" name="goods-optionSet-name">
                        </td>
                    </tr>
                    <tr>
                        <th>옵션 입력</th>
                        <td>
                            <p class="cc2">옵션 입력 방식 : 옵션명A&#123;옵션값a|옵션값b|옵션값c&#125;//옵션명B&#123;옵션값d|옵션값e|옵션값f&#125;</p>
                            <input type="text" id="goods-option-detail" name="giveaway_option_input" placeholder="ex) 색상&#123;빨강|파랑|초록&#125;//사이즈&#123;55|66|77&#125;">
                        </td>
                    </tr>
                    <tr>
                        <th>옵션 스타일</th>
                        <td><p class="cc2">셀렉트박스: S, 미리보기 : P, 텍스트버튼: B, 라디오버튼: R<br>
                            <span class="cc">* '옵션입력'의 미리보기 옵션 순서대로 값이 저장됩니다.</span><br>
                            <span class="cc">* 빈 값이거나 옵션의 개수보다 적게 입력되었을 경우 남은 순서대로 '셀렉트박스(S)'로 저장됩니다.</span><br>
                            <span class="cc">* 미리보기(P)로 입력한 옵션은 색상 설정을 필수 입력해야 합니다.</span></p>
                            <input type="text" id="goods-option-style" name="giveaway_option_style" placeholder="ex) P,B,S">
                        </td>
                    </tr>
                    <tr>
                        <th>색상 설정</th>
                        <td>
                            <p class="cc2">옵션 입력 방식 : &#123;색상값a|색상값b|색상값c&#125;//&#123;색상값d|색상값e|색상값f&#125;<br>
                                <span class="cc">* '옵션입력'의 미리보기 옵션 순서대로 값이 저장됩니다.</span></p>
                            <input type="text" id="goods-option-color" name="giveaway_option_color" placeholder="ex) &#123;#ff0000|#0033cc&#125;//&#123;#da294a|#000000|#e9e9e9&#125;">
                        </td>
                    </tr>
                    <tr>
                        <th>필수 여부</th>
                        <td>
                            <p class="cc2">필수: T, 선택: F<br>
                                <span class="cc">* 옵션 입력의 옵션명 개수만큼 bar(|)형태로 구분해 입력합니다.</span><br>
                                <span class="cc">* 품목 구성 방식이 상품연동형, 독립선택형일 경우에만 입력합니다.</span><br>
                            </p>
                            <input type="text" id="goods-option-mandatory" name="giveaway_option_required" placeholder="ex) T|F|T">
                        </td>
                    </tr>
                    <tr>
                        <th>품절 표시 문구</th>
                        <td>
                            <p class="cc2">품목생성형 옵션 품절 시 표시할 문구를 입력합니다.<br>
                                <span class="cc">* 빈 값인 경우 '품절'로 표시됩니다.</span><br>
                                <span class="cc">* 최대 250byte까지만 등록됩니다.</span><br>
                            </p>
                            <input type="text" id="goods-stockout" name="giveaway_sold_out_memo" placeholder="ex) 품절">
                        </td>
                    </tr>
                    <tr>
                        <th>추가 입력 옵션</th>
                        <td>
                            <input type="radio" id="goods-addInput-y" name="giveaway_add_option" value="Y">
                            <label for="goods-addInput-y">사용함</label>
                            <input type="radio" id="goods-addInput-n" name="giveaway_add_option" value="N" checked>
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
                            <input type="text" id="goods-addInput-name" name="giveaway_add_option_name" placeholder="ex) 이름|사은품 입력">
                        </td>
                    </tr>
                    <tr class="product_add_option_required hidden" >
                        <th>추가 입력 옵션 선택/필수 여부</th>
                        <td>
                            <p class="cc2">필수: T, 선택: F<br>
                                <span class="cc">* '추가 입력 옵션 명칭' 개수만큼 순서대로 bar(|)로 구분해 입력합니다.</span><br>
                                <span class="cc">* 최대 250byte까지만 등록됩니다.</span><br>
                            </p>
                            <input type="text" id="goods-addInput-mandatory" name="giveaway_add_option_required" placeholder="ex) T|F|T">
                        </td>
                    </tr>
                    <tr class="product_add_option_max_lang hidden" >
                        <th>추가 입력 옵션 글자수(자)</th>
                        <td>
                            <p class="cc2">
                                <span class="cc">* '추가 입력 옵션 명칭' 개수만큼 순서대로 bar(|)로 구분해 제한입력 글자수를 입력합니다.</span>
                            </p>
                            <input type="text" id="goods-ch-count" name="giveaway_add_option_max_lang" placeholder="ex) 10|15|5">
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
                            <%--                            <p class="cc2">웹 FTP에 접속해 /web/product/big/에 미리 이미지를 등록한 뒤 이미지 명만 입력합니다.--%>
                            <%--                            </p>--%>
<%--                            <input type="file" id="goods-imgBig" name="uploadfile" placeholder="ex) sample1.jpg" value="1">--%>
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
                            <%--                            <p class="cc2">웹 FTP에 접속해 /web/product/midium/에 미리 이미지를 등록한 뒤 이미지 명만 입력합니다.--%>
                            <%--                            </p>--%>
                            <%--<input type="file" id="goods-imgMidium" name="uploadfile2" placeholder="ex) sample1.jpg" value="2">--%>
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
                            <%--                            <p class="cc2">웹 FTP에 접속해 /web/product/tiny/에 미리 이미지를 등록한 뒤 이미지 명만 입력합니다.--%>
                            <%--                            </p>--%>
<%--                            <input type="file" id="goods-imgTiny" name="uploadfile3" placeholder="ex) sample1.jpg" value="3">--%>
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
                            <%--                            <p class="cc2">웹 FTP에 접속해 /web/product/small/에 미리 이미지를 등록한 뒤 이미지 명만 입력합니다.--%>
                            <%--                            </p>--%>
<%--                            <input type="file" id="goods-imgSmall" name="uploadfile4" placeholder="ex) sample1.jpg" value="4">--%>
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
                            <%--                            <p class="cc2">웹 FTP에 접속해 /web/product/extra/excel에 미리 이미지를 등록한 뒤 이미지 명만 입력합니다.<br>--%>
                            <%--                                <span class="cc">* bar(|)를 구분자로 하여 최대 20개 연속 입력할 수 있습니다.</span><br>--%>
                            <%--                                <span class="cc">* 최대 20개까지만 등록되며 21번째 이미지부터는 등록되지 않습니다.</span>--%>
                            <%--                            </p>--%>
<%--                            <input type="file" id="goods-imgSmall" name="uploadfile5" placeholder="ex) sample1.jpg" value="4">--%>
                        </td>
                    </tr>

                    <tr>
                        <th>제조사</th>
                        <td>
                            <p class="cc2">&#91;판매분류관리 &#62; 제조사 관리&#93;에 등록한 유효한 제조사 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-m" name="giveaway_made_company_cd" placeholder="ex) M00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>공급사</th>
                        <td>
                            <p class="cc2">&#91;판매분류관리 &#62; 공급사 관리&#93;에 등록한 유효한 공급사 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-s" name="giveaway_supplier" placeholder="ex) S00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>브랜드</th>
                        <td>
                            <p class="cc2">&#91;판매분류관리 &#62; 브랜드 관리&#93;에 등록한 유효한 브랜드 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-b" name="giveaway_brand" placeholder="ex) B00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>트렌드</th>
                        <td>
                            <p class="cc2">&#91;판매분류관리 &#62; 트렌드 관리&#93;에 등록한 유효한 트렌드 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-t" name="giveaway_trend" placeholder="ex) T00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>자체 분류</th>
                        <td>
                            <p class="cc2">&#91;판매분류관리 &#62; 자체분류 관리&#93;에 등록한 유효한 자체 분류 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-c" name="giveaway_self_class_cd" placeholder="ex) C00000000">
                        </td>
                    </tr>
                    <tr>
                        <th>제조일자</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.
                            </p>
                            <input type="text" id="goods-mDate" name="giveaway_create_date" placeholder="ex) 2020-02-28">
                        </td>
                    </tr>
                    <tr>
                        <th>출시일자</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD&#41;으로 입력합니다.
                            </p>
                            <input type="text" id="goods-rDate" name="giveaway_release_date" placeholder="ex) 2020-02-28">
                        </td>
                    </tr>
                    <tr>
                        <th>유효 기간 사용 여부</th>
                        <td>
                            <input type="radio" id="goods-validity-y" name="giveaway_validity_yn" value="Y">
                            <label for="goods-validity-y">사용함</label>
                            <input type="radio" id="goods-validity-n" name="giveaway_validity_yn" value="N" checked>
                            <label for="goods-validity-n">사용 안 함</label>
                            <span class="cc">* 사용 안 함을 선택할 경우, 입력했던 사항은 초기화됩니다.</span>
                        </td>
                    </tr>
                    <tr class="goods-validity-detail hidden">
                        <th>유효 기간</th>
                        <td>
                            <p class="cc2">날짜형식 &#40;YYYY-MM-DD~YYYY-MM-DD&#41;으로 입력합니다.<br>
                                <span class="cc">* 빈 값이면 저장 날짜를 기준으로 하여 1년으로 자동 설정됩니다.</span>
                            </p>
                            <input type="text" id="goods-validity-start" name="giveaway_validity" placeholder="ex) 2020-02-28~2021-02-28">
                        </td>
                    </tr>
                    <tr>
                        <th>원산지</th>
                        <td>
                            <p class="cc2"><a href="#">&#91;상품 코드정보조회&#93;</a>를 통해 검색하거나 <a href="#">&#91;전체 코드정보다운로드&#93;</a>를 통해 확인된 유효한 원산지 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-origin" name="giveaway_origin" placeholder="ex) 1575">
                        </td>
                    </tr>
                    <tr>
                        <th>상품부피&#40;cm&#41;</th>
                        <td>
                            <p class="cc2"><span class="cc">* 가로, 세로, 높이 값을 bar&#40;|&#41;로 구분해서 입력합니다</span><br>
                                <span class="cc">* 소수점 첫째 자리까지 입력가능하며 최대 10,000단위까지만 입력할 수 있습니다.</span><br>
                                <span class="cc">* 빈 값인 경우 '사용 안 함'으로 저장됩니다.</span>
                            </p>
                            <input type="text" id="goods-volume" name="giveaway_cm" placeholder="ex) 가로30cm, 세로 50cm, 높이 20.50cm인 경우 → 30|50|20.5">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 결제 안내</th>
                        <td>
                            <p class="cc2"><span class="cc">* 빈 값인 경우 '기본설정'으로 저장됩니다.</span></p>
                            <textarea name="giveaway_payment_info" id="editor3"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>상품 배송 안내</th>
                        <td>
                            <p class="cc2"><span class="cc">* 빈 값인 경우 '기본설정'으로 저장됩니다.</span></p>
                            <textarea name="giveaway_delivery_info" id="editor4"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>교환/반품 안내</th>
                        <td>
                            <p class="cc2"><span class="cc">* 빈 값인 경우 '기본설정'으로 저장됩니다.</span></p>
                            <textarea name="giveaway_change_info" id="editor5"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>서비스 문의/안내</th>
                        <td>
                            <p class="cc2"><span class="cc">* 빈 값인 경우 '기본설정'으로 저장됩니다.</span></p>
                            <textarea name="giveaway_service_info" id="editor6"></textarea>
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
                            <input type="radio" id="goods-shipping-t" name="giveaway_delivery_class" value="T" checked>
                            <label for="goods-shipping-t">배송 정보 개별 설정</label>
                            <input type="radio" id="goods-shipping-f" name="giveaway_delivery_class" value="F" >
                            <label for="goods-shipping-f">기본 설정 사용</label>
                        </td>
                    </tr>
                    <tr>
                        <th>배송 방법</th>
                        <td>
                            <select name="giveaway_delivery_type">
                                <option value="A">택배</option>
                                <option value="B">빠른등기</option>
                                <option value="C">일반등기</option>
                                <option value="E">퀵배송</option>
                                <option value="F">기타</option>
                                <option value="G">화물배송</option>
                                <option value="H">매장직접수령</option>
                                <option value="I">배송 필요 없음</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>국내/해외 배송<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <select name="giveaway_delivery_International_type">
                                <option value="A">국내 배송</option>
                                <option value="B">국내/해외 배송</option>
                                <option value="C">해외 배송</option>
                            </select>
                            <span class="cc">* 국내 배송을 포함하지 않은 단독 해외 배송은 해외 쇼핑몰에서만 사용할 수 있습니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>배송 지역</th>
                        <td>
                            <input type="text" id="shipping-area2" name="giveaway_delivery_locale" placeholder="ex) 전국">
                            <span class="cc">* 최대 40byte까지만 등록됩니다.</span>
                        </td>
                    </tr>
                    <tr>
                        <th>배송비 선결제 설정<span class="cc-red">&#40;필수&#41;</span></th>
                        <td>
                            <select name="giveaway_delivery_payment_type">
                                <option value="C">착불</option>
                                <option value="P">선결제</option>
                                <option value="B">선결제/착불</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>배송 기간</th>
                        <td>
                            <p class="cc2">1부터 99까지의 숫자를 사용해 입력합니다.</p>
                            <input type="text" id="shipping-period" name="giveaway_delivery_date" placeholder="ex) 배송 기간이 2~4일 걸릴 경우 '2|4'라고 입력">
                        </td>
                    </tr>
                    <tr class="shipping-fee-tr shipping-t-detail">
                        <th>배송비 구분</th>
                        <td>
                            <select name="giveaway_delivery_payment_class">
                                <option value="T">배송비 무료</option>
                                <option value="R">고정 배송비 사용</option>
                                <option value="M">구매 금액에 따른 부과</option>
                                <option value="D">구매 금액별 차등 배송료 사용</option>
                                <option value="W">상품 무게별 차등 배송료 사용</option>
                                <option value="C">상품 수량별 차등 배송료 사용</option>
                                <option value="N">상품 수량에 비례하여 배송료 부과</option>
                            </select>
                            <span class="cc">* 옵션을 새로 선택하면 상세 설정 내역이 초기화됩니다.</span>
                        </td>
                    </tr>
                    <tr class="shipping-f-detail">
                        <th>스토어픽업 설정</th>
                        <td>
                            <input type="radio" id="goods-storePickup-y" name="giveaway_delivery_store_pickup" value="Y">
                            <label for="goods-storePickup-y">사용함</label>
                            <input type="radio" id="goods-storePickup-n" name="giveaway_delivery_store_pickup" value="N" checked>
                            <label for="goods-storePickup-n">사용 안 함</label>
                        </td>
                    </tr>
                    <tr>
                        <th>상품 전체 중량&#40;kg&#41;</th>
                        <td>
                            <p class="cc2"><span class="cc">* 소수점 둘째 자리까지 입력할 수 있습니다.</span></p>
                            <input type="text" id="giveaway_kg" name=giveaway_kg">Kg
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
                            <input type="text" id="goods-HScode" name="giveaway_global_hs_code" placeholder="ex) CHN|60064100r">
                        </td>
                    </tr>
                    <tr>
                        <th>상품구분&#40;해외통관용&#41;</th>
                        <td>
                            <p class="cc2"><a href="#">&#91;상품 코드정보조회&#93;</a>를 통해 검색하거나 <a href="#">&#91;전체 코드정보다운로드&#93;</a>를 통해 확인된 상품구분&#40;해외통관용&#41; 코드를 입력합니다.
                            </p>
                            <input type="text" id="goods-code-overseas" name="giveaway_global_clearance" placeholder="ex) AAAA0000">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 소재</th>
                        <td>
                            <p class="cc2">상품의 소재 정보를 입력합니다.
                            </p>
                            <input type="text" id="goods-material" name="giveaway_material" placeholder="ex) 나일론 80%, 실크 20%">
                        </td>
                    </tr>
                    <tr>
                        <th>영문 상품 소재&#40;해외통관용&#41;</th>
                        <td>
                            <p class="cc2">소재 정보를 영문으로 입력합니다.<span class="span cc">* 대문자 'AUTO'를 입력할 경우 '상품 소재' 항목에 입력한 데이터가 자동 번역됩니다.</span>
                            </p>
                            <input type="text" id="goods-material-en" name="giveaway_material_en" placeholder="ex) Rayon 80%, Silk 20%">
                        </td>
                    </tr>
                    <tr>
                        <th>옷감&#40;해외통관용&#41;</th>
                        <td>
                            <p class="cc2">상품이 의류일 경우 해외통관용 옷감 정보를 입력합니다.<span class="span cc">* 편물: knit, 직물: woven으로 입력합니다.</span>
                            </p>
                            <input type="text" id="goods-fabric-en" name="giveaway_fabric" placeholder="ex) knit">
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
                            <input type="radio" id="goods-seo-y" name="giveaway_seo_yn" value="Y" checked>
                            <label for="goods-seo-y">노출함</label>
                            <input type="radio" id="goods-seo-n" name="giveaway_seo_yn" value="N">
                            <label for="goods-seo-n">노출 안 함</label>
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br> Title</th>
                        <td>
                            <p class="cc2">상품별 브라우저 Title 값을 원할 경우 입력합니다.
                            </p>
                            <input type="text" id="goods-seo-title" name="giveaway_seo_title">
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br> Author</th>
                        <td>
                            <p class="cc2">상품별 메타태그 Author 값을 원할 경우 입력합니다.
                            </p>
                            <input type="text" id="goods-seo-author" name="giveaway_seo_author">
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br> Description</th>
                        <td>
                            <p class="cc2">상품별 메타태그 Description 값을 원할 경우 입력합니다.
                            </p>
                            <input type="text" id="goods-seo-description" name="giveaway_seo_description">
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br> Keywords</th>
                        <td>
                            <p class="cc2">상품별 메타태그 Keywords 값을 원할 경우 입력합니다.
                                <span class="cc">* 쉼표&#40;,&#41;로 구분합니다.</span>
                            </p>
                            <input type="text" id="goods-seo-keywords" name="giveaway_seo_keywords" placeholder="ex) Keyword1, Keyword2">
                        </td>
                    </tr>
                    <tr class="seo-detail">
                        <th>검색엔진 최적화&#40;SEO&#41;<br>상품 이미지 Alt 텍스트</th>
                        <td>
                            <p class="cc2">상품 이미지에 Alt 텍스트를 넣을 경우 입력합니다.
                            </p>
                            <input type="text" id="goods-seo-alt" name="giveaway_seo_alt">
                        </td>
                    </tr>
                    <tr>
                        <th>개별 결제 수단 설정</th>
                        <td>
                            <p class="cc2">상품의 개별 결제수단을 설정할 경우 다음 항목 중 입력합니다.<br><br>
                                무통장입금: cash, 카드결제: card, 적립금: mileage, 실시간 계좌이체: tcash, 가상계좌: icash, 휴대폰결제: cell, 케이페이: kpay, 페이나우: paynow, 페이코: payco, 카카오페이: kakaopay, 스마일페이: smilepay, 네이버페이: naverpay<br>
                                <span class="cc">* 결제 수단이 여러 개인 경우 쉼표&#40;,&#41;로 구분합니다.</span>
                            </p>
                            <input type="text" id="goods-payment" name="giveaway_payment_type" placeholder="ex) cash, mileage">
                        </td>
                    </tr>
                    <tr>
                        <th>상품 배송 유형 코드</th>
                        <td>
                            <p class="cc2">상품의 배송 유형을 설정할 경우 다음 항목 중 입력합니다.<br><br>
                                사입배송: D, 직접배송: C, 기타: E|창고코드<br>
                                <span class="cc">* 기타(E)의 경우 김포 창고 코드가 2이면 'E|2'로 입력</span><br>
                                <span class="cc">* 빈 값일 경우 직접등록(C)으로 자동 등록됩니다.</span>
                            </p>
                            <input type="text" id="goods-shipping-code" name="giveaway_delivery_type_code" placeholder="ex) E|2">
                        </td>
                    </tr>
                    <tr>
                        <th>메모</th>
                        <td>
                            <p class="cc2">각 상품별로 상품 메모 정보를 입력합니다.<br>
                                <span class="cc">* 상품 메모는 업로드마다 1개씩 추가됩니다.</span>
                            </p>
                            <input type="text" id="goods-memo" name="giveaway_memo">
                        </td>
                    </tr>
                    </tbody>
                </table>
                <button type="button" id="formGiveawaySubmit" class="btn-red">저장하기</button>
                <input type="hidden" name="file_1">
                <input type="hidden" name="file_2">
                <input type="hidden" name="file_3">
                <input type="hidden" name="file_4">
                <input type="hidden" name="file_5">
                <input type="hidden" name="giveaway_cd">
            </form>
        </div>
    </div>
</main>
<script type="text/javascript">
$(function(){
	var html = '<p class="giveaway_definition">' +
					'<input type="text" name="giveaway_definition_key" placeholder="ex) 에너지소비효율등급">' +
					'<input type="text" name="giveaway_definition_value" placeholder="ex) 3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음">' +
					'<button type="button" class="goods-list-btn giveaway_definition_add_btn">+</button>' +
					'<button type="button" class="goods-list-btn redBtn giveaway_definition_del_btn">x</button>' +
				'</p>';
	$(".giveaway_definition_td").append(html);
});
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>