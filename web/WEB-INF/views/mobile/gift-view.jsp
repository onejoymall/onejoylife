<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>

<!--
<div class="underPurchase">
    <div class="content">
        <div class="closeBox">
            <button class="closeBtn"></button>  
        </div>
        <div class="scroll">
            <select class="width-100">
                <option value="" selected>상품선택</option>
            </select>
            <select class="width-100 my-1">
                <option value="" selected>옵션선택</option>
            </select>
            <div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button class="button number-minus"></button>
                           <input type="number" name="number" value="1">
                           <button class="button number-plus"></button>
                        </div>
                    </li>
                    <li><h3>1,500<span class="text-sm">원</span></h3></li>
                </ul>
            </div>
            <div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button class="button number-minus"></button>
                           <input type="number" value="1">
                           <button class="button number-plus"></button>
                        </div>
                    </li>
                    <li><h3>1,500<span class="text-sm">원</span></h3></li>
                </ul>
            </div>
            <ul class="flexbetween mt-2 mb-5">
                <li>
                    <h3>총 합계금액</h3>
                </li>
                <li>
                    <h2 class="red">4,500<span class="text-sm">원</span></h2>
                </li>
            </ul>
        </div>
        <ul class="footerBtns">
            <li><a href="#">장바구니</a></li>
            <li><a href="#">바로구매</a></li>
        </ul>
    </div>
    
</div>
-->

<div class="underPop" id="review">
    <div class="content">
        <header>
           <h3>${afn:getMessage("writereview",sessionScope.locale)}</h3>
            <button class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <p class="text-md mt-2 mb-05">${afn:getMessage("title",sessionScope.locale)} *</p>
            <input type="text" class="width-100 mb-05" placeholder="${afn:getMessage('msg_below50word',sessionScope.locale)}">
            <p class="text-md mt-1 mb-05">${afn:getMessage("brd_content",sessionScope.locale)}</p>
            <div class="textarea mt-05">
               <span>${afn:getMessage("limitWords",sessionScope.locale)}</span>
               <textarea class="width-100"></textarea>
            </div>
            <p class="text-md mt-1 mb-05">${afn:getMessage("QA_img",sessionScope.locale)}</p>
            <div class="mb-2">
                <input type="text" class="width-100 mb-1">
                <button class="btn btn-black width-50">${afn:getMessage("QA_findfile",sessionScope.locale)}</button> <span class="ml-1 text-sm grey">${afn:getMessage("msg_faqFile",sessionScope.locale)}</span>
            </div>
            <ul class="btns mt-3 mb-0">
                <li><a href="#">${afn:getMessage("QAcancel",sessionScope.locale)}</a></li>
                <li><a href="#" class="active">${afn:getMessage("registration",sessionScope.locale)}</a></li>
           </ul>
        </content>
    </div>
</div>
<div class="underPop" id="qna">
    <div class="content">
        <header>
           <h3>${afn:getMessage("writeItemQA",sessionScope.locale)}</h3>
            <button class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <p class="text-md mt-2 mb-05">${afn:getMessage("title",sessionScope.locale)} *</p>
            <input type="text" class="width-100 mb-05" placeholder="${afn:getMessage('msg_below50word',sessionScope.locale)}">
            <input type="checkbox" id="replysns" class="b8 mt-1">
            <label for="replysns">${afn:getMessage("private",sessionScope.locale)}</label>
            <p class="text-md mt-2 mb-05">${afn:getMessage("QA_type",sessionScope.locale)} * </p>
            <select class="width-100">
                <option value="" selected>${afn:getMessage("orders_payments",sessionScope.locale)}</option>
            </select>
            <p class="text-md mt-1 mb-05">${afn:getMessage("QA_content",sessionScope.locale)}</p>
            <div class="textarea mt-05 mb-2">
               <span>${afn:getMessage("limitWords",sessionScope.locale)}</span>
               <textarea class="width-100"></textarea>
            </div>
            <ul class="btns mt-2 mb-0">
                <li><a href="#">${afn:getMessage("QAcancel",sessionScope.locale)}</a></li>
                <li><a href="#" class="active">${afn:getMessage("registration",sessionScope.locale)}</a></li>
           </ul>
        </content>
    </div>
</div>

    <section class="subheader">
        <div class="goods-slider-wrap">
            <ul class="goods-slider">
                <li><img src='${detail.file_1}' onerror="this.src='http://placehold.it/550'" ></li>
                <li><img src='${detail.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
            </ul>
<%--            <div class="share-list">--%>
<%--                <a href="#none"><i class="facebook-ic"></i></a>--%>
<%--                <a href="#none"><i class="twitter-ic"></i></a>--%>
<%--                <a href="#none"><i class="kakao-ic"></i></a>--%>
<%--            </div>--%>
        </div>
    </section>
    <section class="wrap">
       <h2 class="my-2">${detail.get("giveaway_name")}</h2>
       <hr class="grey">
       <div class="progress-wrap view">
            <p class="progress-now">${afn:getMessage("parti_rate",sessionScope.locale)} <b class="red">${detail.parti_rate}%</b> (<span><fmt:formatNumber value="${detail.player_count}" groupingUsed="true" /></span>명 참여 중${afn:getMessage("parti_rate_num",sessionScope.locale)})</p>
            <div class="progress-bar">
                <div class="progress-bar-active" style="width:${detail.parti_rate}%"></div>
            </div>
            <p class="parti"><b class="red"><fmt:formatNumber value="${detail.sum_play_point}" groupingUsed="true" /></b> / <fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /> E-point</p>
        </div>
        <ul class="flexbetween py-05 mt-2">
           <li>${afn:getMessage("shippingFee",sessionScope.locale)}</li>
           <li>${delivery.get("delivery_payment")}</li>
       </ul>
       <ul class="flexbetween py-05 mt-1">
            <c:if test="${sessionScope.login}">
               <li>${afn:getMessage("mypoint",sessionScope.locale)}</li>
               <li class="text-lg"><fmt:formatNumber value="${point_amount}" groupingUsed="true" /> point</li>
            </c:if>
            <c:if test="${!sessionScope.login}">
                <a href="<c:url value="/sign/login"/>"> ${afn:getMessage("lgpointchk",sessionScope.locale)}</a>
            </c:if>
        </ul>
       <ul class="flexbetween py-05">
           <li>${afn:getMessage("used_point",sessionScope.locale)}</li>
           <li class="">
               <form name="defaultForm" id="defaultForm" method="post">
                   <input type="number" class="epoint" id="point" name="point" value="${detail.giveaway_play_winner_point - detail.sum_play_point}">
                   <input type="hidden" id="point_amount" name="point_amount" value='${point_amount}'><span></span>
                   <input type="hidden" id="giveaway_id" name="giveaway_id" value='${requestScope.giveaway_id}'>
                   <input type="hidden" id="giveaway_cd" name="giveaway_cd" value='${detail.giveaway_cd}'>
                </form>
<!--               로그인 후 확인-->
           </li>
       </ul>
       <ul class="flexbetween py-05">
           <li>${afn:getMessage("applE-Point",sessionScope.locale)}</li>
           <li class="text-lg text-bold red"><fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /><span class="text-sm"> point</span></li>
       </ul>
        <ul class="winner-wrap flexbetween py-05">
            <li><h3><i class="win-icon"></i></h3></li>
            <li><p class="winner">${detail.email}</p></li>
        </ul>
    </section>
    <section class="subheader">
        <ul class="shareBtns">
            <li><a href="javascript:wish()" class="wish favorite ready" >${afn:getMessage("mywishlist",sessionScope.locale)}</a></li>
            <li><a href="#" class="share" onclick="share_giveaway('${detail.giveaway_id}', '${detail.giveaway_name}')">${afn:getMessage("share",sessionScope.locale)}</a></li>
        </ul>
        <img src="../../assets/img/goods-view/bnr1.jpg" alt="" class="width-100">
        <ul class="taps" id="tap">
           <li><a href="javascript:move(1)" class="active">${afn:getMessage("product_description",sessionScope.locale)}</a></li>
           <li><a href="javascript:move(2)">${afn:getMessage("product_information",sessionScope.locale)}</a></li>
           <li><a href="javascript:move(3)">${afn:getMessage("prize_guide_info",sessionScope.locale)}</a></li>
       </ul>        
        <div class="my-1" id="content01">
           ${detail.giveaway_html}
        </div>
    </section>
    <section class="wrap">
    	<div class="mt-1 mb-3">
            <h3 class="mb-1">함께 본 경품${afn:getMessage("otherUserSeen",sessionScope.locale)}</h3>
            <hr class="mb-1">
            <div class="shareProducts">
            	<c:if test="${not empty serialProductList}">
            	<c:forEach var="list" items="${serialProductList}">
	                <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id=${list.giveaway_cd}"/>" class="product">
	                    <div class="productImg"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
	                    <h5 class="mt-05">${list.giveaway_name}</h5>
	                    <h4 class="text-bold red"><fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /> <span class="text-sm">원${afn:getMessage("korea_won",sessionScope.locale)}</span></h4>
	                </a>
                </c:forEach>
            	</c:if>
            	<c:if test="${empty serialProductList}">
            		${afn:getMessage("msg_notSeenothewrPrize",sessionScope.locale)}
            	</c:if>
       		</div>
        </div>
        <div class="my-1" id="content02">
            <h3 class="mb-1">${afn:getMessage("prod_es_info",sessionScope.locale)}</h3>
            <!-- <hr class="mb-1">
            <h2 class="mb-05">SM-G05-ZR/SS</h2>
            <p>일반세탁기 WA15M6551KS [15KG / 워블세탁기 / 회오리세탁 / 다이아몬드필터 / 인버터모터 / 무세제통세척]</p> -->
        </div>
        <div class="my-1 bg_grey p-2 ">
             <c:if test="${!fn:endsWith(list.product_ct,'882') &&
                 				  !fn:endsWith(list.product_ct,'32') &&
                 				  !fn:endsWith(list.product_ct,'815') &&
                 				  !fn:endsWith(list.product_ct,'51') &&
                 				  !fn:endsWith(list.product_ct,'50') &&
                 				  !fn:endsWith(list.product_ct,'152') &&
                 				  !fn:endsWith(list.product_ct,'25') &&
                 				  !fn:endsWith(list.product_ct,'461') &&
                 				  !fn:endsWith(list.product_ct,'27') &&
                 				  !fn:endsWith(list.product_ct,'122') &&
                 				  !fn:endsWith(list.product_ct,'126') &&
                 				  !fn:endsWith(list.product_ct,'906') &&
                 				  !fn:endsWith(list.product_ct,'174')}">
                <p class="grey pt-2 pb-05">1. 소재</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 색상</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 크기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 제조자</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'882')}">
				<p class="grey pt-2 pb-05">1. 품명</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. KC 인증 필 유뮤(품질경영 및 공산품안전관리법상 안전º품질표시대상공산품에 한함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 색상</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 구성품</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. 주요 소재</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">6. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05"> ＊ 구성품 별 제조자가 다른 경우 각 구성품의 제조자, 수입자</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7. 제조국</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05"> ＊ 구성품 별 제조자가 다른 경우 각 구성품의 제조자, 수입자</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">8. 크기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">9. 배송º설치비용</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">10. 품질보증 기준</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">11. A/S 책임자와 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'32')}">
				<p class="grey pt-2 pb-05">1. 건강기능식품에 관한 법률에 따른 표시사항</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-1. 식품의 유형</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-2. 생산자 및 소재지, 수입품의 경우 수입자를 함께 표기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-3. 제조연월일, 유통기한 또는 품질유지기한</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-4. 포장단위별 용량(중량), 수량</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-5. 원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-6. 영양성분</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-7. 기능정보</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-8. 섭취량, 섭취방법 및 섭취 시 주의사항</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-9. 질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-10. 유전자재조합식품에 해당하는 경우의 표시</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-11. 표시광고 사전심의필</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-12. 수입식품에 해당하는 경우 "건강기능식품에 관한 법률에 따른 수입신고를 필함"의 문구</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 소비자상담 관련 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'126') ||
						  fn:endsWith(list.product_ct,'174')}">
				<p class="grey pt-2 pb-05">1. 품명 및 모델명</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 전기용품 안전인증 필 유무(전기용품안전관리법상 안전인증대상전기용품, 자율안전확인대상전기용품, 공급자적합성확인대상전기용품에 한함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 정격전압, 소비전력, 에너지소비효율등급(에너지이용합리화법상 의무대상상품에 한함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 동일모델의 출시년월</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">6. 제조국</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7. 크기(형태 및 실외기 포함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">8. 냉난방면적</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">9. 추가설치비용</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">10. 품질보증 기준</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">11. A/S 책임자와 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'122')}">
				<p class="grey pt-2 pb-05">1. 종류</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 소재</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 치수</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 제조자, 수입품의 경우 수입자들 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. 재조국</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">6. 취급시 주의사항</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7. 품질보증기준</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">8. A/S 책임자와 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'27')}">
				<p class="grey pt-2 pb-05">1. 품명 및 모델명</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 법에 의한 인증, 허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 제조국 또는 원산지</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 제조자, 수입품의 경우 수입자들 함께 표기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. A/S 책임자와 전화번호 또는 소비자상담 관련 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'461')}">
				<p class="grey pt-2 pb-05">1. 용량 또는 중량</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 제품 주용 사양(피부타입, 색상(호,번) 등)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 사용기한 또는 개봉 후 사용기간(개봉 후 사용기 간을 기재할 경우에는 제조연월일을 병행표기)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 사용방법</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. 제조자 및 제조판매업자</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">6. 제조국</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7. 주요성분(유기농 화장품의 경우 유기농 원료 함량 표함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">8. 기능성 화장품의 경우 화장품법에 따른 식품의약 품안전청 심사 필 유무(미백, 주름개선, 자외선차단 등)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">9. 사용할 때 주의사항</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">10. 품질보증 기준</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">11. 소비자상담관련 전화번호</p><h3>상세페이지 참조</h3>
				<tr><th colspan="2">※ 사용기한을 기재하는 경우 ex)2013.10, 2013.10~2014.8., 2013.10~, 주문일로부터 1 년 이상 남음
				<br>※ 제조연월일과 개봉 후 사용기간을 기재하는 경우 ex) 제조일 2011.10~2012.4, 개봉후 2 년내 사용 / 주문일로부터 1 년 이내, 개봉후 2 년내 사용</th></tr>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'906')}">
				<p class="grey pt-2 pb-05">1. 소재/순도/밴드재질(시계의 경우)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 중량</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 제조자, 수입품의 수입자를 함께 표기 (병행수입 의 경우 병행수입 여부로 대체 가능)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 제조국(원산지와 가공지 등이 다를 경우 함께 표기)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. 치수</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">6. 착용 시 주의사항</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7. 주요사양</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7-1. 귀금속, 보석류 - 등급</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7-2. 시계-기능, 방수 등</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">8. 보증서 제공여부</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">9. 품질보증 기준</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">10. A/S 책임자와 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'25')}">
				<p class="grey pt-2 pb-05">1. 식품위생버에 따른 표시사항</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-1. 식품의 유형</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-2. 생산자 및 소재지, 수입품의 경우 수입자를 함께 표기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-3. 제조연월일, 유통기한 또는 품질유지기한</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-4. 포장단위별 용량(중량), 수량</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-5. 원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-6. 영양성분(식품위생법에 따른 영양성분 표시대상식품에 한함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-7. 유전자재조합식품에 해당하는 경우에 표시</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-8. 영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">1-9. 수입식품에 해당하는 경우 '식품위생법에 따른 수입신고를 필함'의 문구</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 소비자상담 관련 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'152')}">
				<p class="grey pt-2 pb-05">1. 품명 및 모델명</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 동일모델의 출시년월</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 자동차관리법에 따른 자동차부품 자기인증 유무(인증 대상 자동차부품에 한함)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. 제조국</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">6. 크기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7. 적용차종</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">8. 품질보증 기준</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">9. A/S 책임자와 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'50') ||
						  fn:endsWith(list.product_ct,'51')}">
				<p class="grey pt-2 pb-05">1. 포장단위별 용량(중량), 수량, 크기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 생산자. 수입품의 경우 수입자를 함께 표기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 농수산물의 원산지 표시에 관한 법률에 따른 원산지</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 제조연월일(포장지 또는 생산연도), 유통기한 또는 품질유지기한</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. 관련벙상 표시사항</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5-1. 농산물 - 농산물품질관리법상 유전자변형농산물 표시, 지리적표시</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5-2. 축산물 - 축산법에 따른 등급 표시, 쇠고기의 경우 이력관리에 따른 표시 유무</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5-3. 수산물 -  수산물품질관리법상 유전자변형수산물 표시, 지리적표시</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5-4. 수입식품에 해당하는 경우 '식품위생법에 따른 수입신고를 필함'의 문구</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">6. 상품구성</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7. 보관방법 또는 취급방법</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">8. 소비자상담 관련 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
			<c:if test="${fn:endsWith(list.product_ct,'815')}">
				<p class="grey pt-2 pb-05">1. 품명 및 모델명</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">2. 재질</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">3. 구성품</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">4. 크기</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">5. 동일모델의 출시년월</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">6. 제조자, 수입품의 수입자를 함께 표기 (병행수입 의 경우 병행수입 여부로 대체 가능)</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">7. 제조국</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">8. 식품위생법에 따른 수입 기구-용기의 경우 '식품위생법에 따른 수입신고를 필함'의 문구</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">9. 품질보증 기준</p><h3>상세페이지 참조</h3>
				<p class="grey pt-2 pb-05">10. A/S 책임자와 전화번호</p><h3>상세페이지 참조</h3>
			</c:if>
         </div>
         <div class="mt-4 mb-2">
            <h3 class="mb-1">관련 경품</h3>
            <hr class="mb-1">
            <div class="shareProducts">
                <div class="shareProducts">
	                <c:if test="${not empty relatedProductList}">
	            	<c:forEach var="list" items="${relatedProductList}">
		                <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id=${list.giveaway_id}"/>" class="product">
		                    <div class="productImg"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
		                    <h5 class="mt-05">${list.giveaway_name}</h5>
		                    <h4 class="text-bold red"><fmt:formatNumber value="${list.giveaway_play_winner_point}" groupingUsed="true" /> <span class="text-sm">원</span></h4>
		                </a>
	                </c:forEach>
	            	</c:if>
	            	<c:if test="${empty relatedProductList}">
	            		관련 경품이 없습니다.
	            	</c:if>
           		</div>
            </div>
        </div>
        <div class="mt-4 mb-2" id="content03">
            <h3 class="mb-1">경품응모/당첨방식/세금</h3>
            <hr>
            <div class="grey bg_grey p-2">
                <h3 class="mb-1">경품 응모</h3>
                <hr class="grey mb-1">
                <p class="pb-05">배송지역</p>
                <h4>전국(일부 도서지역 제외)</h4>
                <p class=" pt-2 pb-05">배송비</p>
                <ol>
                    <li>전국 무료배송 (일부 도서지역 제외)이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.</li> 
                    <li>동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료</li>
                    <li>동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과</li>
                    <li>기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex)제주 : 5,500원, 섬지역 7,000원)</li>
                    <li>교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.
                    (단, 일부 지역 추가 요금 발생 ex) 제주 : 11,000원, 섬지역 14,000원)</li>
                </ol>
                <p class="pt-2 pb-05">업체상품</p>
                <h4 class="pb-2">업체 배송 정책에 따라 업체 배송 기사가 직접 배송하거나 택배로 발송될 수 있습니다.</h4>
                <h5 class="pb-1">직접 배송 상품</h5>
                <ol class="pb-1">
                    <li>익일 배송이 원칙이며, 주문 시 희망 배송일을 신청하실 수 있습니다.</li>
                    <li>업체 사정에 의해 상품수량이 부족하여 배송이 지연되거나 안 될 수 있습니다.</li>
                    <li>도서산간 지역의 경우 반드시 자격을 갖춘 가스 사업소에서 설치해야 하므로 직접 설치에서 제외됩니다.</li>
                    <li>설치 시 추가 설치 비용이 발생할 수 있습니다.</li>
                </ol>
                <h5 class="pb-1">택배 배송 상품</h5>
                <ol class="mb-2">
                    <li>택배 상품은 결제 후 2~3일의 배송 기간이 소요됩니다.</li>
                    <li>도서산간 지역의 경우 배송 기간이 지연될 수 있습니다.</li>
                </ol>
                
                <h3 class="mb-1">당첨 방식</h3>
                <hr class="grey mb-1">
                <p class="pb-05">배송지역</p>
                <h4>전국(일부 도서지역 제외)</h4>
                <p class=" pt-2 pb-05">배송비</p>
                <ol class="mb-2">
                    <li>전국 무료배송 (일부 도서지역 제외)이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.</li> 
                    <li>동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료</li>
                    <li>동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과</li>
                    <li>기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex)제주 : 5,500원, 섬지역 7,000원)</li>
                    <li>교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.
                    (단, 일부 지역 추가 요금 발생 ex) 제주 : 11,000원, 섬지역 14,000원)</li>
                </ol>
                <h3 class="mb-1">경품 세금 안내</h3>
                <hr class="grey mb-1">
                <p class="pb-05">배송지역</p>
                <h4>전국(일부 도서지역 제외)</h4>
                <p class=" pt-2 pb-05">배송비</p>
                <ol class="mb-2">
                    <li>전국 무료배송 (일부 도서지역 제외)이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.</li> 
                    <li>동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료</li>
                    <li>동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과</li>
                    <li>기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex)제주 : 5,500원, 섬지역 7,000원)</li>
                    <li>교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.
                    (단, 일부 지역 추가 요금 발생 ex) 제주 : 11,000원, 섬지역 14,000원)</li>
                </ol>
            </div>
        </div>
    </section>
        <section class="subheader">
        <div class="goods-slider-wrap">
            <ul class="goods-slider">
                <li><img src='${detail.file_1}' onerror="this.src='http://placehold.it/550'" ></li>
                <li><img src='${detail.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
            </ul>
<%--            <div class="share-list">--%>
<%--                <a href="#none"><i class="facebook-ic"></i></a>--%>
<%--                <a href="#none"><i class="twitter-ic"></i></a>--%>
<%--                <a href="#none"><i class="kakao-ic"></i></a>--%>
<%--            </div>--%>
        </div>
    </section>
    <button class="btn btn_bottom btn-redcover buynow" id="formSubmit">바로 응모하기</button>
</body>
<script>
$(document).ready(function(){
     $('.goods-slider').bxSlider({
        auto:false,
        autoHover:true,
        speed:500,
        mode:'horizontal',
        autoControls:false,
        pager:true,
        touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
    });
//     $('#shareProducts, #shareProducts2').bxSlider({
//        auto:false,
//        autoHover:true,
//        minSlides: 1,
//        maxSlides: 3,
//        moveSlides : 1,
//        speed:500,
//        slideMargin: 10,
//        slideWidth : 110,
//        mode:'horizontal',
//        autoControls:false,
//        pager:false,
//        touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
//    });
    $('.goodsQna').on('click',function(){
        $(this).addClass('active');
        $('.goodsQna').not($(this)).removeClass('active');
    })
    $('#btn_review').on('click',function(){
        $('#review').addClass('on');
    })
    $('#btn_qna').on('click',function(){
        $('#qna').addClass('on');
    })
//    $('#formSubmit').on('click',function(){
//        $('.underPurchase').addClass('on');
//    })
    $('.popClose').on('click',function(){
        $('.underPop').removeClass('on');
    })
//    $('.closeBtn').on('click',function(){
//        $('.underPurchase').removeClass('on');
//    })
    $('.button').on('click',function(){
        if($(this).hasClass('number-minus')){
            var value = $(this).next().val();
            if(Number(value) > 1) $(this).next().val(Number(value) - 1);
        } else {
            var value = $(this).prev().val();
            $(this).prev().val(Number(value) + 1);
        }
    })
    fix();
});
$(window).scroll(function(){ 
    taps();
});
function wish(){
    if($('.wish').hasClass('on')) $('.wish').removeClass('on');
    else $('.wish').addClass('on');
}
function fix(){
    var top = $(document).scrollTop();
    var content01 = $('#content01').offset().top;
//    if(top > content01) $('#tap').addClass('fix');
//    else $('#tap').removeClass('fix');
    if(top > content01){
        $('#tap').insertAfter('.top-inner'); $('.header').attr('style', 'height:82px');
    }else{
        $('#tap').insertBefore('#content01'); $('.header').attr('style', '');
    }
}
function taps(){
    var top = $(document).scrollTop() + 80;
    var content01 = $('#content01').offset().top - 50;
    var content02 = $('#content02').offset().top - 50;
    var content03 = $('#content03').offset().top - 50;
//    var content04 = $('#content04').offset().top - 50;
//    var content05 = $('#content05').offset().top - 50;
//    if(top > content01) $('#tap').addClass('fix');
//    else $('#tap').removeClass('fix');
    if(top > content01){
        $('#tap').insertAfter('.top-inner'); $('.header').attr('style', 'height:82px');
    }else{
        $('#tap').insertBefore('#content01'); $('.header').attr('style', '');
    }
    if(top > content01) {
        $('#tap li').eq(0).find('a').addClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
//        $('#tap li').eq(3).find('a').removeClass('active');
//        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content02) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').addClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
//        $('#tap li').eq(3).find('a').removeClass('active');
//        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content03) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').addClass('active');
//        $('#tap li').eq(3).find('a').removeClass('active');
//        $('#tap li').eq(4).find('a').removeClass('active');
    }
//    if(top > content04) {
//        $('#tap li').eq(0).find('a').removeClass('active');
//        $('#tap li').eq(1).find('a').removeClass('active');
//        $('#tap li').eq(2).find('a').removeClass('active');
//        $('#tap li').eq(3).find('a').addClass('active');
//        $('#tap li').eq(4).find('a').removeClass('active');
//    }
//    if(top > content05) {
//        $('#tap li').eq(0).find('a').removeClass('active');
//        $('#tap li').eq(1).find('a').removeClass('active');
//        $('#tap li').eq(2).find('a').removeClass('active');
//        $('#tap li').eq(3).find('a').removeClass('active');
//        $('#tap li').eq(4).find('a').addClass('active');
//    }
}
function move(num){
    var offset = '';
    if(num == 1) offset = $('#content01').offset();
    else if (num ==2) offset = $('#content02').offset();
    else if (num ==3) offset = $('#content03').offset();
//    else if (num ==4) offset = $('#content04').offset();
//    else if (num ==5) offset = $('#content05').offset();
    $('html').animate({scrollTop : offset.top - 100}, 400);
}
</script>


    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>