<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
<style>
.npay_storebtn_bx{
	zoom:1.4;
}


</style>
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
			$.toast({
				heading : getMessageAjax('msg.addcart.opCheck'),
				text: '',
				showHideTransition: 'plain', //펴짐
				position: 'bottom-right',
				icon: 'error',
				stack: false
			});
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
		        location.href = "https://m.pay.naver.com/mobile/customer/order.nhn?ORDER_ID="+order_id+"&SHOP_ID=np_xqqgk375177&TOTAL_PRICE="+total_price;
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
			success:function(item_ids){
				var queryStrItemId = ""; 
				item_ids.forEach(function(id){
					queryStrItemId += "ITEM_ID="+id+"&"
				});
				location.href = "https://m.pay.naver.com/mobile/customer/wishList.nhn?SHOP_ID=np_xqqgk375177&"+queryStrItemId, "", "scrollbars=yes,width=400,height=267";
			},
			error:function(e){
				alert("error");
			}
		})
		return;
	}
</script>
<div class="underPurchase">
    <div class="content">
        <form name="defaultForm" id="defaultForm" method="POST" action="/product/productPayment">
        <input type="hidden" name="product_delivery_payment" value="${deliveryPayment}">
        <div class="closeBox">
            <button type="button" class="closeBtn"></button>
        </div>

        <div class="scroll">
        <%--<select class="width-100">
            <option value="" selected>상품선택</option>
        </select>--%>
            ${option}
			<input type="hidden" name="btn-option-value"/>
			<input type="hidden" name="rd-option-value"/>
            <div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>${list.product_name}</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button type="button" class="button number-minus"></button>
                           <input type="number" name="payment_order_quantity" value="1">
                           <button type="button" class="button number-plus"></button>
                            <input type="hidden" name="order_max" value="${list.product_max_limit}" />
                            <input type="hidden" name="order_min" value="${list.product_min_limit}" />
                            <input type="hidden" name="product_option_required" value="${list.product_option_required}" />
                            <input type="hidden" name="option_name"/>
                        </div>
                    </li>
                    <li><h3><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span class="text-sm">${afn:getMessage("korea_won",sessionScope.locale)}</span></h3></li>
                </ul>
            </div>
            <%--<div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button type="button" class="button number-minus"></button>
                           <input type="number" value="1">
                           <button type="button" class="button number-plus"></button>
                        </div>
                    </li>
                    <li><h3>1,500<span class="text-sm">원</span></h3></li>
                </ul>
            </div>--%>
            <ul class="flexbetween mt-2 mb-5">
                <%--<li>
                    <h3>총 합계금액</h3>
                </li>
                <li>
                    <h2 class="red">4,500<span class="text-sm">원</span></h2>
                </li>--%>
                <c:if test="${list.product_delivery_International_type == 'A' }">
                <p>
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
                </p>
                </c:if>
            </ul>
        </div>
        <ul class="footerBtns">
            <li><a href="#" onclick="addShoppingBasketM('${list.product_cd}')">${afn:getMessage("cart",sessionScope.locale)}</a></li>
            <li><a href="#" id="paymentSubmitM">${afn:getMessage("buyNow",sessionScope.locale)}</a></li>
        </ul>
            <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
        </form>
    </div>
    
</div>

<div class="underPop" id="review">
    <div class="content">
        <header>
           <h3>${afn:getMessage("writereview",sessionScope.locale)}</h3>
            <button type="button" class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <p class="text-md mt-2 mb-05">${afn:getMessage("brd_title",sessionScope.locale)} *</p>
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
            <p class="text-md mt-2 mb-05">${afn:getMessage("brd_title",sessionScope.locale)} *</p>
            <input type="text" class="width-100 mb-05" placeholder="${afn:getMessage('msg_below50word',sessionScope.locale)}">
            <input type="checkbox" id="replysns" class="b8 mt-1">
            <label for="replysns">${afn:getMessage("private",sessionScope.locale)}</label>
            <p class="text-md mt-2 mb-05">${afn:getMessage("QA_type",sessionScope.locale)}  * </p>
            <select class="width-100">
                <option value="" selected>${afn:getMessage("QA_order_payment",sessionScope.locale)}</option>
            </select>
            <p class="text-md mt-1 mb-05">${afn:getMessage("brd_content",sessionScope.locale)}</p>
            <div class="textarea mt-05 mb-2">
               <span>${afn:getMessage("limitWords",sessionScope.locale)}</span>
               <textarea class="width-100"></textarea>
            </div>
            <ul class="btns mt-2 mb-0">
                <li><a href="#" onclick="window.close()">${afn:getMessage("QAcancel",sessionScope.locale)}</a></li>
                <li><a href="#" class="active" id="qnaWriteSubmit">${afn:getMessage("registration",sessionScope.locale)}</a></li>
           </ul>
        </content>
    </div>
</div>

    <section class="subheader">
        <div class="goods-slider-wrap">
            <ul class="goods-slider">
                <li><img src='${list.file_1}' onerror="this.src='http://placehold.it/550'"></li>
                 <c:if test="${not empty list.file_5}">
                <li><img src='${list.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
                 </c:if>
            </ul>
<%--            <div class="share-list">--%>
<%--                <a href="#none"><i class="facebook-ic"></i></a>--%>
<%--                <a href="#none"><i class="twitter-ic"></i></a>--%>
<%--                <a href="#none"><i class="kakao-ic"></i></a>--%>
<%--            </div>--%>
        </div>
    </section>
    <section class="wrap">
       <div class="mb-1">
          <%-- <span class="label label-danger">세일</span>
           <span class="label label-warning">쿠폰</span>--%>
       </div>
       <h2 class="my-2">${list.product_brand_name}<br> ${list.product_name}</h2>
       <hr class="grey">
       <ul class="flexbetween py-05 mt-2">
           <li>${afn:getMessage("before_price",sessionScope.locale)}</li>
           <li class="line-through grey"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</li>
       </ul>
       <%--<ul class="flexbetween py-05">
           <li>세일</li>
           <li class="line-through grey">319,000원</li>
       </ul>--%>
       <ul class="flexbetween py-05">
           <li>${afn:getMessage("real_price",sessionScope.locale)}</li>
           <li class="text-lg text-bold red"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}</li>
       </ul>
<%--       <p class="coupon-late py-05"><span class="red text-lg">20% 쿠폰</span><span class="grey text-light mx-1">|</span>19.03.18-19.04.17</p>>--%>
       <%--<ul class="flexbetween py-05">
           <li>카드할인혜택</li>
           <li class="text-bold">삼성카드 청구할인 5%</li>
       </ul>--%>
    </section>
    <section class="subheader">
        <ul class="shareBtns">
            <li><a href="#" class="wish favorite <c:if test="${heart}">on</c:if>"  data-id="${list.product_cd}">

                <i class="heart-empty <c:if test="${heart}">heart-full</c:if>"> </i>
                ${afn:getMessage("mywishlist",sessionScope.locale)}</a></li>
            <li><a href="#" class="share" onclick="share_product('${list.product_cd}', '${list.product_name}')">${afn:getMessage("share",sessionScope.locale)}</a></li>
        </ul>
        <a href="${lineBannerList1.url}" class="width-100">
            <img src="${lineBannerList1.file_1}" class="width-100" /></a>
        <img src="../../assets/img/goods-view/bnr1.jpg" alt="" class="width-100">
        <ul class="taps" id="tap">
           <li><a href="javascript:move(1)" class="active">${afn:getMessage("product_description",sessionScope.locale)}</a></li>
           <li><a href="javascript:move(2)">${afn:getMessage("product_info",sessionScope.locale)}</a></li>
           <li><a href="javascript:move(3)">${afn:getMessage("review",sessionScope.locale)} <span class="red text-sm"><%--65--%></span></a></li>
           <li><a href="javascript:move(4)">${afn:getMessage("qna",sessionScope.locale)} <span class="red text-sm qnaCnt"></span></a></li>
           <li><a href="javascript:move(5)">${afn:getMessage("pro_info_etc2",sessionScope.locale)}</a></li>
       </ul>        
        <div class="my-1" id="content01">
           <c:out value="${list.product_html}" escapeXml="false"/>
        </div>
    </section>
    <section class="wrap">
        <div class="mt-1 mb-3">
            <h3 class="mb-1">${afn:getMessage("view_pro_together",sessionScope.locale)}</h3>
            <hr class="mb-1">
            <div class="shareProducts">
            	<c:if test="${not empty sameSupplierProductList}">
            	<c:forEach var="list" items="${sameSupplierProductList}">
	                <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>" class="product">
	                    <div class="productImg"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
	                    <h5 class="mt-05">${list.product_name}</h5>
	                    <h4 class="text-bold red"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /> <span class="text-sm">${afn:getMessage("korea_won",sessionScope.locale)}</span></h4>
	                </a>
                </c:forEach>
            	</c:if>
            	<c:if test="${empty sameSupplierProductList}">
            		${afn:getMessage("msg.proDetail.none_Togecontent",sessionScope.locale)}
            	</c:if>
       		</div>
        </div>
        <div class="my-1 " id="content02">
             <h3 class="mb-1">${afn:getMessage("prod_es_info",sessionScope.locale)}</h3>
             <hr class="mb-1">
         </div>
         <c:out value="${configtop.market_config_value}" escapeXml="false"/>
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
         <c:out value="${configbot.market_config_value}" escapeXml="false"/>
        <c:import url="/product/productDetailReview"/>
        <!-- <div class="mt-4 mb-2" id="content03">
           <ul class="flexbetween mb-1">
               <li><h3>평가 및 리뷰<span class="red text-md ml-1">65</span></h3></li>
               <li><button class="btn btn-black" id="btn_review">작성하기</button></li>
           </ul>
            <hr>
            <div class="bg_grey p-2 text-center">
                <h2><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-half-fill red"></i></h2>
                <h2 class="text-bold pb-1">4.5</h2>
                <p>225개의 상품평이 있습니다.</p>
                <hr class="grey my-1">
                <ul class="flexbetween py-05">
                   <li>상품</li>
                   <li class="text-md">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i> 5.0
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li>가격</li>
                   <li class="text-md">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-half-fill red mx-05"></i><i class="ri-star-line red"></i> 3.5
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li>배송</li>
                   <li class="text-md">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-line red"></i> 4.0
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li>친절도</li>
                   <li class="text-md">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-half-fill red"></i> 4.5
                   </li>
               </ul>
            </div>
            <hr>
            <ul class="product pb-0">
               <ul class="options pb-0">
                    <li><h5>2019.04.10 <br>김*주</h5></li>
                    <li><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-line red"></i> 4.0</li>
                </ul>
                <ul>
                    <li><img src="http://placehold.it/300x300" alt=""></li>
                    <li>
                       <p>카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서 친절히 답해주셔서 감사하구요, 아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^ 감사합니다</p>
                    </li>
                </ul>
            </ul>
            <ul class="product pb-0">
               <ul class="options pb-0">
                    <li><h5>2019.04.10 <br>김*주</h5></li>
                    <li><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-line red"></i> 4.0</li>
                </ul>
                <ul>
                    <li><img src="http://placehold.it/300x300" alt=""></li>
                    <li>
                       <p>카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서 친절히 답해주셔서 감사하구요, 아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^ 감사합니다</p>
                    </li>
                </ul>
            </ul>
            <ul class="centerBtns mt-3">
                <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
                <li><a href="#" class="active">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
            </ul>
        </div> -->
        <div class="mt-4 mb-2" id="content04">
           <ul class="flexbetween mb-1">
               <li><h3>${afn:getMessage("product_qna2",sessionScope.locale)}<span class="red text-md ml-1"></span></h3></li>
               <li><button class="btn btn-black" data-id="${list.product_cd}" id="productqna">${afn:getMessage("writemyFAQ",sessionScope.locale)}</button></li>
           </ul>
           <hr>
            <div class="goodsQnaList">

            </div>
            <ul class="pagination" style="margin-top:10px;">

                    </ul>
           <%--
           <div class="qnaNothing">${afn:getMessage("msg.proDetail.none_qnacontent",sessionScope.locale)}</div>
           <div class="goodsQna active">
               <div class="goodsHeader">
                  <p>
                       <span class="tapGrey">답변대기</span>
                       <span class="date">2019.05.27</span>
                       <span>Ymaaa***</span>
                  </p>
                  <h4 class="pt-1">유통기한이 개봉 후 몇개월인가요?</h4>
               </div>
               <div class="goodsBody">
                   <div class="goodsBodyQ text-md">
                      <span>${afn:getMessage("qust",sessionScope.locale)}</span>
                       매장에서 봤는데 화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요?
                       <p class="mt-1">
                           <button class="btn">${afn:getMessage("update",sessionScope.locale)}</button>
                           <button class="btn">${afn:getMessage("delete",sessionScope.locale)}</button>
                       </p>
                       
                   </div>
                   <div class="goodsBodyA text-md">
                      <span>${afn:getMessage("brd_A",sessionScope.locale)}</span>
                       안녕하세요, 고객님. 원조이라이프 고객센터입니다. 문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.감사합니다.
                       <p class="mt-1 grey">${afn:getMessage("replyDate",sessionScope.locale)} : 2019.05.07</p>
                   </div>
               </div>
           </div>
           <div class="goodsQna">
               <div class="goodsHeader">
                  <p>
                       <span class="tapRed">답변완료</span>
                       <span class="date">2019.05.27</span>
                       <span>Ymaaa***</span>
                  </p>
                  <h4 class="pt-1">유통기한이 개봉 후 몇개월인가요?</h4>
               </div>
               <div class="goodsBody">
                   <div class="goodsBodyQ text-md">
                      <span>질문</span>
                       매장에서 봤는데 화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요?
                       <p class="mt-1">
                           <button class="btn">수정</button>
                           <button class="btn">삭제</button>   
                       </p>
                       
                   </div>
                   <div class="goodsBodyA text-md">
                      <span>답변</span>
                       안녕하세요, 고객님. 원조이라이프 고객센터입니다. 문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.감사합니다.
                       <p class="mt-1 grey">답변일 : 2019.05.07</p>
                   </div>
               </div>
           </div>--%>
           <%--<ul class="centerBtns mt-3">
                <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
                <li><a href="#" class="active">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
            </ul>--%>
        </div>
        <div class="mt-4 mb-2">
            <h3 class="mb-1">${afn:getMessage("sameSupplierPro",sessionScope.locale)}</h3>
            <hr class="mb-1">
            <div class="shareProducts">
                <div class="shareProducts">
	                <c:if test="${not empty sameSupplierProductList}">
	            	<c:forEach var="list" items="${sameSupplierProductList}">
		                <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>" class="product">
		                    <div class="productImg"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
		                    <h5 class="mt-05">${list.product_name}</h5>
		                    <h4 class="text-bold red"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /> <span class="text-sm">${afn:getMessage("korea_won",sessionScope.locale)}</span></h4>
		                </a>
	                </c:forEach>
	            	</c:if>
	            	<c:if test="${empty sameSupplierProductList}">
	            		${afn:getMessage("msg.proDetail.none_Suppliercontent",sessionScope.locale)}
	            	</c:if>
           		</div>
            </div>
        </div>
        <div class="mt-4 mb-2" id="content05">
            <h3 class="mb-1">${afn:getMessage("pro_info_etc",sessionScope.locale)}</h3>
            <hr>
            <div class="grey bg_grey p-2">
                <h3 class="mb-1">${afn:getMessage("delivery_info",sessionScope.locale)}</h3>
                <hr class="grey mb-1">
                ${list.product_delivery_info}
                <br>
                <b>${afn:getMessage("delivery_forward",sessionScope.locale)}</b>
                <br>
                - (${store_delivery.forward_postcode}) 
                  ${store_delivery.forward_roadAddress}
                  ${store_delivery.forward_extraAddress}
                  <br><br>
                <h3 class="mb-1">${afn:getMessage("returnInfo",sessionScope.locale)}</h3>
                <hr class="grey mb-1">
                <b>${afn:getMessage("returnAdd",sessionScope.locale)}</b>
                <br>
                - (${store_delivery.refund_postcode}) 
                  ${store_delivery.refund_roadAddress}
                  ${store_delivery.refund_extraAddress}
                  <br><br>
                ${list.product_change_info}
                <h3 class="mb-1">${afn:getMessage("refundInfo",sessionScope.locale)}</h3>
                <hr class="grey mb-1">
                ${list.product_service_info}
            </div>
        </div>
    </section>
    <section class="subheader">
        <div class="goods-slider-wrap">
            <ul class="goods-slider">
                <li><img src='${list.file_1}' onerror="this.src='http://placehold.it/550'"></li>
                 <c:if test="${not empty list.file_5}">
                <li><img src='${list.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
                 </c:if>
            </ul>
<%--            <div class="share-list">--%>
<%--                <a href="#none"><i class="facebook-ic"></i></a>--%>
<%--                <a href="#none"><i class="twitter-ic"></i></a>--%>
<%--                <a href="#none"><i class="kakao-ic"></i></a>--%>
<%--            </div>--%>
        </div>
    </section>
    <button type="button" class="btn btn_bottom btn-redcover" id="btn_purchase">${afn:getMessage("buy",sessionScope.locale)}</button>

<script>
$(document).ready(function(){
    callQnalistM('${param.product_cd}',1);

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
    
    $('.goodsQna').on('click',function(){
        $(this).addClass('active');
        $('.goodsQna').not($(this)).removeClass('active');
    })
    $('#btn_review').on('click',function(){
        $('#review').addClass('on');
    })
    $('#btn_qna').on('click',function(){
        var product_cd = $(this).attr("data-id");
        if(isLogin==''){
            $.toast({
                heading: getMessageAjax('msg.nonMemUser'),
                text: [
                    '<a href="/sign/login">'+ getMessageAjax('loginAndUse') +'</a>',
                    '<a href="/sign/signup">'+ getMessageAjax('JoinAndUse') +'</a>',
                ],
                showHideTransition: 'plain', //펴짐
                position: 'bottom-right',
                icon: 'info',
                hideAfter: false
            });
        }else {
            $('#qna').addClass('on');
        }
    })
    $('#btn_purchase').on('click',function(){
        $('.underPurchase').addClass('on');
    })
    $('.popClose').on('click',function(){
        $('.underPop').removeClass('on');
    })
    $('.closeBtn').on('click',function(){
        $('.underPurchase').removeClass('on');
    })
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
/*function wish(){
    if($('.wish').hasClass('on')) $('.wish').removeClass('on');
    else $('.wish').addClass('on');
}*/
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
    var content04 = $('#content04').offset().top - 50;
    var content05 = $('#content05').offset().top - 50;
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
        $('#tap li').eq(3).find('a').removeClass('active');
        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content02) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').addClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
        $('#tap li').eq(3).find('a').removeClass('active');
        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content03) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').addClass('active');
        $('#tap li').eq(3).find('a').removeClass('active');
        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content04) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
        $('#tap li').eq(3).find('a').addClass('active');
        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content05) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
        $('#tap li').eq(3).find('a').removeClass('active');
        $('#tap li').eq(4).find('a').addClass('active');
    }
}
function move(num){
    var offset = '';
    if(num == 1) offset = $('#content01').offset();
    else if (num ==2) offset = $('#content02').offset();
    else if (num ==3) offset = $('#content03').offset();
    else if (num ==4) offset = $('#content04').offset();
    else if (num ==5) offset = $('#content05').offset();
    $('html').animate({scrollTop : offset.top - 100}, 400);
}
</script>

    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>