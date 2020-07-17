<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!-- <style>
.npay_storebtn_bx{
	zoom:2;
}
</style> -->
<script type="text/javascript">
	var delivery_payment_type = '${list.product_delivery_payment_type}';
	function buy_nc(){
		var option_required_list = $("input[name=product_option_required]").val().split("|");
		var isOptionCheck = false;
		var optionStr = [""];
		option_required_list.forEach(function(el,idx){
			if($(".option"+idx).attr("type") == 'radio'){
				optionStr[0] += (idx != 0 ? "/" : "") + ($(".option"+idx+":checked").val() ? $(".option"+idx+":checked").val() : '');
			}else{
				optionStr[0] += (idx != 0 ? "/" : "") + ($(".option"+idx).val() ? $(".option"+idx).val() : '');
			}
			if(el == 'T'){
				if($(".option"+idx).attr("type") == 'radio'){
					if(!$(".option"+idx+":checked").val()){
						isOptionCheck = true;
					}
				}else{
					if(!$(".option"+idx).val()){
						isOptionCheck = true;
					}
				}
			}
		})

		if(isOptionCheck){
			toastr.options = {
	    	        closeButton: true,
		        progressBar: false,
		        showMethod: 'slideDown',
		        timeOut: 0
		    }
		    toastr.error("", '옵션은 필수사항입니다.');
			return;
		}
	    optionStr[0] = optionStr[0] ? optionStr[0] : ' ';


	    //배송비
	    var shipping_type = "";
	    if($("input[name=product_delivery_payment]").val() == 0){
	    	shipping_type = "FREE"
	    }else{
	    	if(delivery_payment_type == 'C'){
	    		shipping_type = "ONDELIVERY";
	    	}else{
	    		shipping_type = "PAYED";
	    	}
	    }
	    
	    //상품갯수
	    var item_uprice = '${list.product_payment}';
	    var item_tprice = item_uprice * $("input[name=payment_order_quantity]").val();
	    var total_price = item_tprice + (shipping_type == 'ONDELIVERY' ? 0 : parseInt($("input[name=product_delivery_payment]").val()));
	    
	    //데이터
		var formData = {
			SHOP_ID: 'np_xqqgk375177',
			CERTI_KEY: 'FC4BA46C-56EB-4BB6-B089-18DC8FF1CA1A',
			ITEM_ID: ['${list.product_cd}'],
			ITEM_NAME: ['${list.product_name}'],
			ITEM_COUNT: [$("input[name=payment_order_quantity]").val()],
			ITEM_UPRICE: [item_uprice],
			ITEM_TPRICE: [item_tprice],
			ITEM_OPTION: optionStr,
			SHIPPING_PRICE: $("input[name=product_delivery_payment]").val(),
			SHIPPING_TYPE: shipping_type,
			TOTAL_PRICE: total_price,
			BACK_URL: 'http://onejoy-life.com/product/productDetail?product_cd=${list.product_cd}' 
		};

		$.ajax({
			url: "/api/naverPayOrderKey",
			method: 'post',
			data: formData,
			success:function(order_id){
		        location.href = "https://order.checkout.naver.com/customer/order.nhn?ORDER_ID="+order_id+"&SHOP_ID=np_xqqgk375177&TOTAL_PRICE="+total_price;
			},
			error:function(e){
				alert("error");
			}
		})
		return;
	}
	//찜하기
	function wishlist_nc(){
		var item_uprice = '${list.product_payment}';
		var item_image = "http://onejoy-life.com/" + '${list.file_1}';
		var item_thumb = "http://onejoy-life.com/" + '${list.file_1}';
		var item_url = "http://onejoy-life.com/product/productDetail?product_cd=" + '${list.product_cd}';
		
		//데이터
		var formData = {
			SHOP_ID: 'np_xqqgk375177',
			CERTI_KEY: 'FC4BA46C-56EB-4BB6-B089-18DC8FF1CA1A',
			ITEM_ID: ['${list.product_cd}'],
			ITEM_NAME: ['${list.product_name}'],
			ITEM_DESC: [' '],
			ITEM_UPRICE: [item_uprice],
			ITEM_IMAGE: [item_image],
			ITEM_THUMB: [item_thumb],
			ITEM_URL: [item_url] 
		};

		$.ajax({
			url: "/api/naverPayWishKey",
			method: 'post',
			data: formData,
			success:function(item_id){
				console.log(item_id);
				window.open("https://pay.naver.com/customer/wishlistPopup.nhn?SHOP_ID=np_xqqgk375177&ITEM_ID="+item_id, "", "scrollbars=yes,width=400,height=267");
			},
			error:function(e){
				alert("error");
			}
		})
		return;
	}
</script>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="goods-main">
        <h3 class="main-title hide">상품영역</h3>
        <div class="inner">
            <c:import url="/layout/scrollRight"/>
            <div class="goods-slider-wrap">
                <ul class="goods-slider">
                    <li><img src='${list.file_1}'  ></li>
                <c:if test="${not empty list.file_5}">
                    <li><img src='${list.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
                </c:if>
<%--                    <li><img src='${productList.file_6}' onerror="this.src='http://placehold.it/550'" class="product_list_image_sm"></li>--%>
<%--                    <li><img src='${productList.file_7}' onerror="this.src='http://placehold.it/550'" class="product_list_image_sm"></li>--%>
<%--                    <li><img src='${productList.file_8}' onerror="this.src='http://placehold.it/550'" class="product_list_image_sm"></li>--%>
                </ul>
                <div id="bx-pager">
                    <a data-slide-index="0" href=""><img src='${list.file_1}' onerror="this.src='http://placehold.it/80'" ></a>
                    <c:if test="${not empty list.file_5}">
                    <a data-slide-index="1" href=""><img src='${list.file_5}' onerror="this.src='http://placehold.it/80'" ></a>
<%--                    <a data-slide-index="2" href=""><img src='${productList.file_3}' onerror="this.src='http://placehold.it/80'" class="product_list_image_sm"></a>--%>
<%--                    <a data-slide-index="2" href=""><img src='${productList.file_4}' onerror="this.src='http://placehold.it/80'" class="product_list_image_sm"></a>--%>
<%--                    <a data-slide-index="2" href=""><img src='${productList.file_5}' onerror="this.src='http://placehold.it/80'" class="product_list_image_sm"></a>--%>
                    </c:if>
                </div>

                <div class="share-list">
                    <a href="#none"><i class="facebook-ic"></i></a>
                    <a href="#none"><i class="twitter-ic"></i></a>
                    <a href="#none"><i class="kakao-ic"></i></a>
                </div>
            </div>
            <div class="goods-info-wrap">
                <form name="defaultForm" id="defaultForm" method="POST" action="/product/productPayment">
                    <input type="hidden" name="product_delivery_payment" value="${deliveryPayment}">
                    <div class="goods-name-wrap">
                        <p class="goods-name">
<%--                            <span class="tag-sale">세일</span>--%>
<%--                            <span class="tag-coupon">쿠폰</span>--%>
                            ${list.product_name}<br>
                        </p>
                    </div>
                    <div class="goods-price-wrap">
                        <div class="goods-price-row text-gray">
                            <div class="price-title">
                                소비자가
                            </div>
                            <div class="price-number before-price">
                                <fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원
                            </div>
                        </div>
    <%--                    <div class="goods-price-row text-gray">--%>
    <%--                        <div class="price-title">--%>
    <%--                            세일--%>
    <%--                        </div>--%>
    <%--                        <div class="price-number before-price">--%>
    <%--                            31,900원--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
                        <div class="goods-price-row text-gray">
                            <div class="price-title">
                                판매가<br>
    <%--                            <span class="coupon-rate">20% 쿠폰</span><span class="coupon-date">19.03.18-19.04.17</span>--%>
                            </div>
                            <div class="price-number">
                                <span class="real-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</span>
                            </div>
                        </div>
                        <div class="goods-price-row">
                            <div class="price-title">
    <%--                            카드할인혜택--%>
    <%--                            <span class="more-info" tabindex="0">?--%>
    <%--                                <div class="card-info-box"></div></span>--%>

                            </div>
                            <div class="price-number">
    <%--                            삼성카드 청구할인 5%--%>
                            </div>
                        </div>
                    </div>
                    <div class="goods-point-wrap">
                        <div class="goods-point-row">
                            <div class="point-title">ONEJOY 포인트 적립예상</div>
                            <div class="point-number">${list.product_point_rate}%</div>
                        </div>
                    </div>
                    <div class="shipping-fee-wrap">
                        <div class="shipping-fee-row">
                            <div class="shipping-title text-gray">
                                배송안내
                            </div>
                            <div class="shipping-number">
                                ${list.product_delivery_international_type_name} ${list.product_delivery_type_name} 
                                <br>${list.product_delivery_payment_type_name} ${delivery.delivery_payment}
                            </div>
                        </div>
                    </div>
                    <div class="goods-point-wrap">
                        <div class="goods-point-row">
                            <div class="point-title">&nbsp;</div>
                        </div>
                    </div>
                    <div class="cart-option-wrap">


                        ${option}
						<input type="hidden" name="btn-option-value"/>
						<input type="hidden" name="rd-option-value"/>

                    </div>
                    <div class="quantity-box">
                        <span>구매수량</span>
                        <div class="total-quantity">
                            <div class="minus" tabindex="0">-</div>
                            <input type="hidden" name="payment_order_quantity" value="1">
                            <div class="number">1</div>
                            <div class="plus" tabindex="0">+</div>
                        </div>
                    </div>
                    <%--                    <div class="total-price">--%>
                    <%--                        <div class="total-price-title">상품 금액 합계</div>--%>
                    <%--                        <div class="total-price-number"><span>2,230,000</span>원</div>--%>
                    <%--                    </div>--%>



                    <div class="buy-wrap">
                        <button class="incart" type="button" onclick="addShoppingBasket('${list.product_cd}')">장바구니</button>
                        <button class="buynow" type="button" id="paymentSubmit">바로구매</button>
                        <input type="hidden" name="order_max" value="${list.product_max_limit}" />
                        <input type="hidden" name="order_min" value="${list.product_min_limit}" />
                        <input type="hidden" name="product_delivery_bundle_yn" value="${list.product_delivery_bundle_yn}" />
                        <input type="hidden" name="product_store_id" value="${list.product_store_id}" />
                        <input type="hidden" name="product_option_required" value="${list.product_option_required}" />
                        <input type="hidden" name="option_name"/>
                        <button class="favorite" type="button" data-id="${list.product_cd}">

                                <i class="heart-empty <c:if test="${heart}">heart-full</c:if>"> </i>

                        </button>
                    </div>
                    <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">

					<c:if test="${list.product_delivery_International_type == 'A' }">
                    <script type="text/javascript" >
                        naver.NaverPayButton.apply({
                         BUTTON_KEY: "353CD814-8087-4896-AEE9-B9FE1EA7FA7F", // 네이버페이에서 제공받은 버튼 인증 키 입력
                         TYPE: "MA", // 버튼 모음 종류 설정
                         COLOR: 1, // 버튼 모음의 색 설정
                         COUNT: 2, // 버튼 개수 설정. 구매하기 버튼만 있으면(장바구니 페이지) 1, 찜하기 버튼도 있으면(상품 상세 페이지) 2를 입력.
                         ENABLE: "Y", // 품절 등의 이유로 버튼 모음을 비활성화할 때에는 "N" 입력
                         BUY_BUTTON_HANDLER: buy_nc, // 구매하기 버튼 이벤트 Handler 함수 등록, 품절인 경우 not_buy_nc 함수 사용
                         WISHLIST_BUTTON_HANDLER:wishlist_nc, // 찜하기 버튼 이벤트 Handler 함수 등록
                        });
                    </script>
                    </c:if>
                </form>
            </div>
        </div>
    </article>
    <article class="banner-section">
        <div class="inner">
            <a href="${lineBannerList1.url}" class="img-box">
            <img src="${lineBannerList1.file_1}" /></a>
        </div>
    </article>
    <article class="related-goods-section">
        <div class="inner">
            <h2>관련 상품</h2>
            <ul class="related-goods">
            	<c:if test="${not empty relatedProductList}">
            	<c:forEach var="list" items="${relatedProductList}">
	            	<li><a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
	                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
	                    <p class="goods-name">${list.product_name}</p>
	                    <p class="goods-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</p>
	                </a></li>
                </c:forEach>
            	</c:if>
            	<c:if test="${empty relatedProductList}">
            		관련상품이 없습니다.
            	</c:if>
            </ul>
        </div>
    </article>
    <article class="goods-detail-section">
        <div class="inner">
            <div class="goods-detail-wrap" id="goods-description">
                <ul class="detail-nav">
                    <li><a href="#goods-description" class="active"><span>상품설명</span></a></li>
                    <li><a href="#goods-information"><span>상품정보</span></a></li>
                    <li><a href="#goods-review"><span>상품평</span></a></li>
                    <li><a href="#goods-qna"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="description-img">
                    ${list.product_html}
                </div>
            </div>
            <div class="also-viewed-goods">
                <h5>함께 본 상품</h5>
                <ul class="related-goods">
                    <c:if test="${not empty serialProductList}">
	            	<c:forEach var="list" items="${serialProductList}">
		            	<li><a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
		                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
		                    <p class="goods-name">${list.product_name}</p>
		                    <p class="goods-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</p>
		                </a></li>
	                </c:forEach>
	            	</c:if>
	            	<c:if test="${empty serialProductList}">
	            		함께 본 상품이 없습니다.
	            	</c:if>
                </ul>
            </div>
            <div class="goods-detail-wrap" id="goods-information">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information" class="active"><span>상품정보</span></a></li>
                    <li><a href="goods-review"><span>상품평</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <c:out value="${configtop.market_config_value}" escapeXml="false"/>
                
                <div class="goods-information-wrap ">
                    <h5>상품 필수정보</h5>
                    <!-- <p class="goods-name">SM-G05-ZR/SS</p>
                    <p class="goods-subtitle">일반세탁기 WA15M6551KS [15KG / 워블세탁기 / 회오리세탁 / 다이아몬드필터 / 인버터모터 / 무세제통세척]</p> -->
                    <table class="goods-information-table">
                    	<c:if test="${!afn:contains(product_ct_arr,'882') &&
                    				  !afn:contains(product_ct_arr,'32') &&
                    				  !afn:contains(product_ct_arr,'815') &&
                    				  !afn:contains(product_ct_arr,'51') &&
                    				  !afn:contains(product_ct_arr,'50') &&
                    				  !afn:contains(product_ct_arr,'152') &&
                    				  !afn:contains(product_ct_arr,'25') &&
                    				  !afn:contains(product_ct_arr,'461') &&
                    				  !afn:contains(product_ct_arr,'27') &&
                    				  !afn:contains(product_ct_arr,'122') &&
                    				  !afn:contains(product_ct_arr,'126') &&
                    				  !afn:contains(product_ct_arr,'906') &&
                    				  !afn:contains(product_ct_arr,'174')}">
	                        <tr><th>1. 소재</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 색상</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'882')}">
							<tr><th>1. 품명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. KC 인증 필 유뮤(품질경영 및 공산품안전관리법상 안전º품질표시대상공산품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 색상</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 구성품</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 주요 소재</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th> ＊ 구성품 별 제조자가 다른 경우 각 구성품의 제조자, 수입자</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th> ＊ 구성품 별 제조자가 다른 경우 각 구성품의 제조자, 수입자</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 배송º설치비용</th><td>상세페이지 참조</td></tr>
							<tr><th>10. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>11. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'32')}">
							<tr><th>1. 건강기능식품에 관한 법률에 따른 표시사항</th><td>상세페이지 참조</td></tr>
							<tr><th>1-1. 식품의 유형</th><td>상세페이지 참조</td></tr>
							<tr><th>1-2. 생산자 및 소재지, 수입품의 경우 수입자를 함께 표기</th><td>상세페이지 참조</td></tr>
							<tr><th>1-3. 제조연월일, 유통기한 또는 품질유지기한</th><td>상세페이지 참조</td></tr>
							<tr><th>1-4. 포장단위별 용량(중량), 수량</th><td>상세페이지 참조</td></tr>
							<tr><th>1-5. 원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함)</th><td>상세페이지 참조</td></tr>
							<tr><th>1-6. 영양성분</th><td>상세페이지 참조</td></tr>
							<tr><th>1-7. 기능정보</th><td>상세페이지 참조</td></tr>
							<tr><th>1-8. 섭취량, 섭취방법 및 섭취 시 주의사항</th><td>상세페이지 참조</td></tr>
							<tr><th>1-9. 질병의 예방 및 치료를 위한 의약품이 아니라는 내용의 표현</th><td>상세페이지 참조</td></tr>
							<tr><th>1-10. 유전자재조합식품에 해당하는 경우의 표시</th><td>상세페이지 참조</td></tr>
							<tr><th>1-11. 표시광고 사전심의필</th><td>상세페이지 참조</td></tr>
							<tr><th>1-12. 수입식품에 해당하는 경우 "건강기능식품에 관한 법률에 따른 수입신고를 필함"의 문구</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 소비자상담 관련 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'126') ||
									  afn:contains(product_ct_arr,'174')}">
							<tr><th>1. 품명 및 모델명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 전기용품 안전인증 필 유무(전기용품안전관리법상 안전인증대상전기용품, 자율안전확인대상전기용품, 공급자적합성확인대상전기용품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 정격전압, 소비전력, 에너지소비효율등급(에너지이용합리화법상 의무대상상품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 동일모델의 출시년월</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 크기(형태 및 실외기 포함)</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 냉난방면적</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 추가설치비용</th><td>상세페이지 참조</td></tr>
							<tr><th>10. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>11. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'122')}">
							<tr><th>1. 종류</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 소재</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 치수</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자, 수입품의 경우 수입자들 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 재조국</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 취급시 주의사항</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 품질보증기준</th><td>상세페이지 참조</td></tr>
							<tr><th>8. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'27')}">
							<tr><th>1. 품명 및 모델명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 법에 의한 인증, 허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 제조국 또는 원산지</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자, 수입품의 경우 수입자들 함께 표기</th><td>상세페이지 참조</td></tr>
							<tr><th>5. A/S 책임자와 전화번호 또는 소비자상담 관련 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'461')}">
							<tr><th>1. 용량 또는 중량</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 제품 주용 사양(피부타입, 색상(호,번) 등)</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 사용기한 또는 개봉 후 사용기간(개봉 후 사용기 간을 기재할 경우에는 제조연월일을 병행표기)</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 사용방법</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 제조자 및 제조판매업자</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 주요성분(유기농 화장품의 경우 유기농 원료 함량 표함)</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 기능성 화장품의 경우 화장품법에 따른 식품의약 품안전청 심사 필 유무(미백, 주름개선, 자외선차단 등)</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 사용할 때 주의사항</th><td>상세페이지 참조</td></tr>
							<tr><th>10. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>11. 소비자상담관련 전화번호</th><td>상세페이지 참조</td></tr>
							<tr><th colspan="2">※ 사용기한을 기재하는 경우 ex)2013.10, 2013.10~2014.8., 2013.10~, 주문일로부터 1 년 이상 남음
							<br>※ 제조연월일과 개봉 후 사용기간을 기재하는 경우 ex) 제조일 2011.10~2012.4, 개봉후 2 년내 사용 / 주문일로부터 1 년 이내, 개봉후 2 년내 사용</th></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'906')}">
							<tr><th>1. 소재/순도/밴드재질(시계의 경우)</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 중량</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 제조자, 수입품의 수입자를 함께 표기 (병행수입 의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조국(원산지와 가공지 등이 다를 경우 함께 표기)</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 치수</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 착용 시 주의사항</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 주요사양</th><td>상세페이지 참조</td></tr>
							<tr><th>7-1. 귀금속, 보석류 - 등급</th><td>상세페이지 참조</td></tr>
							<tr><th>7-2. 시계-기능, 방수 등</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 보증서 제공여부</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>10. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'25')}">
							<tr><th>1. 식품위생버에 따른 표시사항</th><td>상세페이지 참조</td></tr>
							<tr><th>1-1. 식품의 유형</th><td>상세페이지 참조</td></tr>
							<tr><th>1-2. 생산자 및 소재지, 수입품의 경우 수입자를 함께 표기</th><td>상세페이지 참조</td></tr>
							<tr><th>1-3. 제조연월일, 유통기한 또는 품질유지기한</th><td>상세페이지 참조</td></tr>
							<tr><th>1-4. 포장단위별 용량(중량), 수량</th><td>상세페이지 참조</td></tr>
							<tr><th>1-5. 원재료명 및 함량(농수산물의 원산지 표시에 관한 법률에 따른 원산지 표시 포함)</th><td>상세페이지 참조</td></tr>
							<tr><th>1-6. 영양성분(식품위생법에 따른 영양성분 표시대상식품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>1-7. 유전자재조합식품에 해당하는 경우에 표시</th><td>상세페이지 참조</td></tr>
							<tr><th>1-8. 영유아식 또는 체중조절식품 등에 해당하는 경우 표시광고 사전심의필</th><td>상세페이지 참조</td></tr>
							<tr><th>1-9. 수입식품에 해당하는 경우 '식품위생법에 따른 수입신고를 필함'의 문구</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 소비자상담 관련 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'152')}">
							<tr><th>1. 품명 및 모델명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 동일모델의 출시년월</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 자동차관리법에 따른 자동차부품 자기인증 유무(인증 대상 자동차부품에 한함)</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자, 수입품의 경우 수입자를 함께 표기 (병행수입의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 적용차종</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>9. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'50') ||
									  afn:contains(product_ct_arr,'51')}">
							<tr><th>1. 포장단위별 용량(중량), 수량, 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 생산자. 수입품의 경우 수입자를 함께 표기</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 농수산물의 원산지 표시에 관한 법률에 따른 원산지</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조연월일(포장지 또는 생산연도), 유통기한 또는 품질유지기한</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 관련벙상 표시사항</th><td>상세페이지 참조</td></tr>
							<tr><th>5-1. 농산물 - 농산물품질관리법상 유전자변형농산물 표시, 지리적표시</th><td>상세페이지 참조</td></tr>
							<tr><th>5-2. 축산물 - 축산법에 따른 등급 표시, 쇠고기의 경우 이력관리에 따른 표시 유무</th><td>상세페이지 참조</td></tr>
							<tr><th>5-3. 수산물 -  수산물품질관리법상 유전자변형수산물 표시, 지리적표시</th><td>상세페이지 참조</td></tr>
							<tr><th>5-4. 수입식품에 해당하는 경우 '식품위생법에 따른 수입신고를 필함'의 문구</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 상품구성</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 보관방법 또는 취급방법</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 소비자상담 관련 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${afn:contains(product_ct_arr,'815')}">
							<tr><th>1. 품명 및 모델명</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 재질</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 구성품</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>5. 동일모델의 출시년월</th><td>상세페이지 참조</td></tr>
							<tr><th>6. 제조자, 수입품의 수입자를 함께 표기 (병행수입 의 경우 병행수입 여부로 대체 가능)</th><td>상세페이지 참조</td></tr>
							<tr><th>7. 제조국</th><td>상세페이지 참조</td></tr>
							<tr><th>8. 식품위생법에 따른 수입 기구-용기의 경우 '식품위생법에 따른 수입신고를 필함'의 문구</th><td>상세페이지 참조</td></tr>
							<tr><th>9. 품질보증 기준</th><td>상세페이지 참조</td></tr>
							<tr><th>10. A/S 책임자와 전화번호</th><td>상세페이지 참조</td></tr>
						</c:if>
                    </table>
                </div>
                
                <c:out value="${configbot.market_config_value}" escapeXml="false"/>
            </div>
            <div class="goods-detail-wrap" id="goods-review">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information"><span>상품정보</span></a></li>
                    <li><a href="goods-review" class="active"><span>상품평</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <c:import url="/product/productDetailReview"/>

            <div class="goods-detail-wrap" id="goods-qna">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information"><span>상품정보</span></a></li>
                    <li><a href="goods-review"><span>상품평</span></a></li>
                    <li><a href="goods-qna" class="active"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="qna-wrap">
                    <h5>상품 Q&amp;A</h5>
                    <div class="qna-data-container">
                        <div class="qna-data-option-box">
                                <span class="all active">
                                    <a href="#none">전체&#40;<span>24</span>&#41;</a>
                                </span>
                            <div class="qna-data-option-box-right">
<%--                                <select name="order" class="order-select">--%>
<%--                                    <option value="all">전체</option>--%>
<%--                                    <option value="goods">상품</option>--%>
<%--                                    <option value="shipping">배송</option>--%>
<%--                                    <option value="refund">반품/환불/취소</option>--%>
<%--                                    <option value="etc">기타</option>--%>
<%--                                </select>--%>
                                <button type="button" class="write-review" id="productqna" data-id="${list.product_cd}">작성하기</button>
                            </div>
                        </div>
                        <ul class="qna-data-list">
                        </ul>
                    </div>
                    <ul class="pagination">

                    </ul>
                </div>

            </div>
            <div class="same-product-goods">
                <h5>같은 공급사 상품</h5>
                <ul class="related-goods">
                    <c:if test="${not empty sameSupplierProductList}">
	            	<c:forEach var="list" items="${sameSupplierProductList}">
		            	<li><a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
		                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
		                    <p class="goods-name">${list.product_name}</p>
		                    <p class="goods-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</p>
		                </a></li>
	                </c:forEach>
	            	</c:if>
	            	<c:if test="${empty sameSupplierProductList}">
	            		같은 공급사 상품이 없습니다.
	            	</c:if>
                </ul>
            </div>
            <div class="goods-detail-wrap" id="goods-shipping">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>상품설명</span></a></li>
                    <li><a href="goods-information"><span>상품정보</span></a></li>
                    <li><a href="goods-review"><span>상품평</span></a></li>
                    <li><a href="goods-qna"><span>상품Q &amp; A</span></a></li>
                    <li><a href="goods-shipping" class="active"><span>배송/교환/반품/환불</span></a></li>
                </ul>
                <div class="shipping-wrap">
                    <h5>배송/결제/교환/환불</h5>
                    <div class="shipping-box">
                        <h6>배송 안내<i class="arrow-down"></i></h6>
                        ${list.product_delivery_info}
                        <br>
                        <b>상품 출고지</b>
                        <br>
                        ${store_delivery.forward_value}
                          <br>
                    </div>
                    <div class="return-box">
                        <h6>교환/반품 안내<i class="arrow-down"></i></h6>
                        <br>
                        <b>교환 및 반품 주소</b>
                        <br>
                        ${store_delivery.refund_value}
                          <br><br>
                        ${list.product_change_info}
                    </div>
                    <div class="refund-box">
                        <h6>환불 안내<i class="arrow-down"></i></h6>
                        ${list.product_service_info}
                    </div>
                </div>
            </div>
        </div>
        </div>
    </article>
</section>
<script>
    $(document).ready(function(){
        callQnalist('${param.product_cd}',1);

        $('.goods-slider').bxSlider({
            // auto:false,
            // autoHover:true,
            speed:500,
            mode:'horizontal',
            // autoControls:true,
            // pager:true,
            // controls:true,
            // useCSS:false,
            pagerCustom: '#bx-pager',
            randomStart: false,
            touchEnabled : (navigator.maxTouchPoints > 0),
        });
        $('.related-goods').bxSlider({
            // auto:false,
            mode:'horizontal',
            slideWidth:202,
            moveSlides:4,
            slideMargin:60,
            minSlides:4,
            maxSlides:4,
            speed:500,
            // pager:false,
            // autoControls:true,
            // controls:true,
            // useCSS:false,
            touchEnabled : (navigator.maxTouchPoints > 0),
            randomStart: false,
        });
    });

    $(document).ready(function(){
        $('.notice-list>li').click(function(){
            $(this).children('.notice-content').slideToggle(300);
        });
        $('.notice-list>li').click(function(){
            $(this).children('.notice-date').children('#arrow').toggleClass('arrow-up');
        });
    });

    $(document).ready(function(){
        $('.bnr-header-close').click(function(){
//               $('.bnr-header').css('display','none');
            $('.bnr-header').slideUp(300);
        });
    });

    $(document).ready(function(){
        $('.gnb>li:first-child').mouseover(function(){
            $('.gnb-submenu').show();
        });
        $('.gnb>li:first-child').mouseleave(function(){
            $('.gnb-submenu').hide();
        });
        $('.gnb-submenu>li').mouseover(function(){
            $(this).children('.gnb-submenu-2dp').show();
        });
        $('.gnb-submenu>li').mouseleave(function(){
            $(this).children('.gnb-submenu-2dp').hide();
        });
        $('.gnb-submenu-2dp>li').mouseover(function(){
            $(this).children('.gnb-submenu-3dp').show().animate({
                width: '200px'
            },100);
        });
        $('.gnb-submenu-2dp>li').mouseleave(function(){
            $(this).children('.gnb-submenu-3dp').hide().animate({
                width: '0px'
            },100);
        });
    });

    //헤더 sticky
    $(function(){
        var windowB = $(window),
            headerOffsetTop = $(".gnb-section").offset().top;
        windowB.on("scroll",function(){
            if(windowB.scrollTop()>headerOffsetTop) {
                $(".gnb-section").addClass("sticky");
                $('.header-logo').addClass('mgbt60')
            }else{
                $(".gnb-section").removeClass("sticky");
                $('.header-logo').removeClass('mgbt60')
            }

        });//scroll
        // 윈도우의 스크롤 이벤트를 발생시키는
        // (헤더의 초기 위치를 조정하기 위해)
        windowB.trigger('scroll');
    });//end


    //탭메뉴
    $(document).ready(function(){


        $('.category-wrap span').on('click',function(){
            var tab_id = $(this).attr('data-tab');
            var arti = $(this).parents('article');

            arti.find('span').removeClass('active');
            arti.find('.category-tab-wrap').removeClass('active');

            $(this).addClass('active');
            $("#" + tab_id).addClass('active');

            cateslider.reloadSlider({});

        });

    });

    $(document).ready(function(){
     /*   $('.option-box').click(function(){
//               $('.bnr-header').css('display','none');
            $('.arrow-down').toggleClass('arrow-up');
            $('.option-list').toggleClass('display-block')
        });*/
        /* $('.optionBtn').click(function(){
            $(this).siblings('.optionBtn').removeClass('on');
            $(this).addClass('on');
            var btnOptionValue = "";
            $(".optionBtn.on").each(function(idx){
            	btnOptionValue += (idx != 0 ? "/" : "") + $(this).text();
            });
            $("input[name=btn-option-value]").val(btnOptionValue);
        })
        $('.optionRd').click(function(){
            var raOptionValue = "";
            $(".optionRd:checked").each(function(idx){
            	raOptionValue += (idx != 0 ? "/" : "") + $(this).val();
            });
            $("input[name=rd-option-value]").val(raOptionValue);
        }) */
        $("input[name=product_option_required]").val().split("|").forEach(function(el,idx){
        	$(".option"+idx).on("input",function(){
        		var option_name = ""
        		$("input[name=product_option_required]").val().split("|").forEach(function(element,index){
    	    		if($(".option"+index).attr("type") == 'radio'){
    	    			option_name += (index != 0 ? "/" : "") + ($(".option"+index+":checked").val() ? $(".option"+index+":checked").val() : '');
    				}else{
    					option_name += (index != 0 ? "/" : "") + $(".option"+index).val();
    				}
       			})
        		$("input[name=option_name]").val(option_name);
        	});
    	});

        $('.favorite').click(function(){
            $(this).children('i').toggleClass('heart-full');
        })

        $('.main-title-box').click(function(){
            $(this).parent($('.review-data-box')).toggleClass('active');
        })

        $('.shipping-wrap h6').click(function(){
            $(this).next('table').toggleClass('active');
            $(this).children('i').toggleClass('arrow-up');
        });

        //nav-click
        var menu=$('.detail-nav>li');
        var content=$('.goods-detail-section div.goods-detail-wrap')
        menu.click(function(e){
            e.preventDefault();
            var tg=$(this);
            var i=tg.index();
            var section=content.eq(i);
            var tt=section.offset().top-60;
            $('html,body').stop().animate({scrollTop:tt});
        });//click
    });
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
