<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ include file="/WEB-INF/views/mall/cert_conf.jsp"%>
<%
	String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS").format(new Date())); // 요청번호 생성 예제
%>
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
		    toastr.error("", "${afn:getMessage('msg.addcart.opCheck',sessionScope.locale)}");
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
	
	/* 리턴시 콜백함수 */
	function phoneCallback(frm){
		var obj = {}
		for ( i = 0 ; i < frm.length ; i++ ) {
			obj[frm.elements[i].name] = frm.elements[i].value;
        }
		
		if(obj.cert_enc_use == 'Y' && obj.res_cd == '0000'){
			$('#phoneBtn').addClass("bg-success");
            $('#phoneBtn').text("${afn:getMessage('certiOk',sessionScope.locale)}");
            $('#phoneBtn').attr("id","");
            $('input[name=phone]').val(obj.phone_no);
            $('input[name=username]').val(obj.user_name);
            $('input[name=sex]').val(obj.sex_code);
            $('input[name=birth]').val(obj.birth_day);
		}else{
			alert("${afn:getMessage('certiFail',sessionScope.locale)}");
		}
	}
    // 인증창 종료 후 인증데이터 리턴 함수
    function auth_data( frm )
    {
        var auth_form     = document.form_auth;
        var nField        = frm.elements.length;
        var response_data = "";

        // up_hash 검증 
        if( frm.up_hash.value != auth_form.veri_up_hash.value )
        {
            alert("${afn:getMessage('error.sign.uphashRiskTamp',sessionScope.locale)}");
            
        }              
        
       /* 리턴 값 모두 찍어보기 (테스트 시에만 사용) */
       /*  var form_value = "";

        for ( i = 0 ; i < frm.length ; i++ )
        {
            form_value += "["+frm.elements[i].name + "] = [" + frm.elements[i].value + "]\n";
        }
        console.log(frm); */
        phoneCallback(frm)
    }
    
    // 인증창 호출 함수
    function auth_type_check()
    {
        var auth_form = document.form_auth;

        if( auth_form.ordr_idxx.value == "" )
        {
            alert( "${afn:getMessage('error.sign.reNum_Required',sessionScope.locale)}" );

            return false;
        }
        else
        {
            if( ( navigator.userAgent.indexOf("Android") > - 1 || navigator.userAgent.indexOf("iPhone") > - 1 ) == false ) // 스마트폰이 아닌경우
            {
             var return_gubun;
             var width  = 410;
             var height = 500;

             var leftpos = screen.width  / 2 - ( width  / 2 );
             var toppos  = screen.height / 2 - ( height / 2 );

             var winopts  = "width=" + width   + ", height=" + height + ", toolbar=no,status=no,statusbar=no,menubar=no,scrollbars=no,resizable=no";
             var position = ",left=" + leftpos + ", top="    + toppos;

             var AUTH_POP = window.open('','auth_popup', winopts + position);
            }
            
            auth_form.target = "auth_popup"; // !!주의 고정값 ( 리턴받을때 사용되는 타겟명입니다.)
            auth_form.action = "/sign/kcpcert_proc_req"; // 인증창 호출 및 결과값 리턴 페이지 주소
            window.name='window';
            auth_form.submit();
            return true;
        }
    }	
	
</script>
<form name="form_auth">
	<!-- 요청번호 -->
	<input type="hidden" name="ordr_idxx" value="<%= ordr_idxx %>"/>
	<!-- 요청종류 -->
    <input type="hidden" name="req_tx"       value="cert"/>
    <!-- 요청구분 -->
    <input type="hidden" name="cert_method"  value="01"/>
    <!-- 웹사이트아이디 : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
    <input type="hidden" name="web_siteid"   value="<%= g_conf_web_siteid %>"/> 
    <!-- 노출 통신사 default 처리시 아래의 주석을 해제하고 사용하십시요 
         SKT : SKT , KT : KTF , LGU+ : LGT
    <input type="hidden" name="fix_commid"      value="KTF"/>
    -->
    <!-- 사이트코드 : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
    <input type="hidden" name="site_cd"      value="<%= g_conf_site_cd %>" />               
    <!-- Ret_URL : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
    <input type="hidden" name="Ret_URL"      value="<%= g_conf_Ret_URL %>" />
    <!-- cert_otp_use 필수 ( 메뉴얼 참고)
         Y : 실명 확인 + OTP 점유 확인 , N : 실명 확인 only
    -->
    <input type="hidden" name="cert_otp_use" value="Y"/>
    <!-- cert_enc_use 필수 (고정값 : 메뉴얼 참고) -->
    <input type="hidden" name="cert_enc_use" value="Y"/>
    <!-- 리턴 암호화 고도화 -->
    <input type="hidden" name="cert_enc_use_ext" value="Y"/>

    <input type="hidden" name="res_cd"       value=""/>
    <input type="hidden" name="res_msg"      value=""/>

    <!-- up_hash 검증 을 위한 필드 -->
    <input type="hidden" name="veri_up_hash" value=""/>

    <!-- 본인확인 input 비활성화 -->
    <input type="hidden" name="cert_able_yn" value="Y"/>

    <!-- web_siteid 검증 을 위한 필드 -->
    <input type="hidden" name="web_siteid_hashYN" value=""/>

    <!-- 가맹점 사용 필드 (인증완료시 리턴)-->
    <input type="hidden" name="param_opt_1"  value="opt1"/> 
    <input type="hidden" name="param_opt_2"  value="opt2"/> 
    <input type="hidden" name="param_opt_3"  value="opt3"/> 
</form>

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
                    <a href="#none" onclick="snsSubmit('fackbook', '');"><i class="facebook-ic" onclick="share_product('${list.product_cd}', '${list.product_name}')"></i></a>
<%--                    <a href="#none"><i class="twitter-ic"></i></a>--%>
<%--                    <a href="#none"><i class="kakao-ic"></i></a>--%>
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
                                ${afn:getMessage("before_price",sessionScope.locale)}
                            </div>
                            <div class="price-number before-price">
                                <fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}
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
                                ${afn:getMessage("real_price",sessionScope.locale)}<br>
    <%--                            <span class="coupon-rate">20% 쿠폰</span><span class="coupon-date">19.03.18-19.04.17</span>--%>
                            </div>
                            <div class="price-number">
                                <span class="real-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>${afn:getMessage("korea_won",sessionScope.locale)}</span>
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
                            <div class="point-title">ONEJOY ${afn:getMessage("pointAccEx",sessionScope.locale)}</div>
                            <div class="point-number">${list.product_point_rate}%</div>
                        </div>
                    </div>
                    <div class="shipping-fee-wrap">
                        <div class="shipping-fee-row">
                            <div class="shipping-title text-gray">
                                ${afn:getMessage("delivery_info",sessionScope.locale)}
                            </div>
                            <div class="shipping-number">
                                <c:forEach var="companyList" items="${companyList}" varStatus="status">
                                    <c:if test="${companyList.Code eq list.delivery_t_code}">
                                        <c:set var="t_code_name" value="${companyList.Name}"/>
                                    </c:if>
                                </c:forEach>
                                ${list.product_delivery_international_type_name} ${list.product_delivery_type_name}
                                <br><c:out value="${t_code_name}"/> ${list.product_delivery_payment_type_name} ${delivery.delivery_payment}
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
                        <span>${afn:getMessage("saleCount",sessionScope.locale)}</span>
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
                        <button class="incart" type="button" onclick="addShoppingBasket('${list.product_cd}')">${afn:getMessage("cart",sessionScope.locale)}</button>
                        <button class="buynow" type="button" id="paymentSubmit">${afn:getMessage("buyNow",sessionScope.locale)}</button>
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
            <h2>${afn:getMessage("relePro",sessionScope.locale)}</h2>
            <ul class="related-goods">
            	<c:if test="${not empty relatedProductList}">
            	<c:forEach var="list" items="${relatedProductList}">
	            	<li><a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
	                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
	                    <p class="goods-name">${list.product_name}</p>
	                    <p class="goods-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>${afn:getMessage("korea_won",sessionScope.locale)}</p>
	                </a></li>
                </c:forEach>
            	</c:if>
            	<c:if test="${empty relatedProductList}">
            		${afn:getMessage("msg.proDetail.none_Relecontent",sessionScope.locale)}
            	</c:if>
            </ul>
        </div>
    </article>
    <article class="goods-detail-section">
        <div class="inner">
            <div class="goods-detail-wrap" id="goods-description">
                <ul class="detail-nav">
                    <li><a href="#goods-description" class="active"><span>${afn:getMessage("product_description",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-information"><span>${afn:getMessage("product_info",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-review"><span>${afn:getMessage("product_review",sessionScope.locale)}</span></a></li>
                    <li><a href="#goods-qna"><span>${afn:getMessage("product_qna",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-shipping"><span>${afn:getMessage("pro_info_etc",sessionScope.locale)}</span></a></li>
                </ul>
                <div class="description-img">
                    ${list.product_html}
                </div>
            </div>
            <div class="also-viewed-goods">
                <h5>${afn:getMessage("view_pro_together",sessionScope.locale)}</h5>
                <ul class="related-goods">
                    <c:if test="${not empty serialProductList}">
	            	<c:forEach var="list" items="${serialProductList}">
		            	<li><a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
		                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
		                    <p class="goods-name">${list.product_name}</p>
		                    <p class="goods-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>${afn:getMessage("korea_won",sessionScope.locale)}</p>
		                </a></li>
	                </c:forEach>
	            	</c:if>
	            	<c:if test="${empty serialProductList}">
	            		${afn:getMessage("msg.proDetail.none_Togecontent",sessionScope.locale)}
	            	</c:if>
                </ul>
            </div>
            <div class="goods-detail-wrap" id="goods-information">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>${afn:getMessage("product_description",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-information" class="active"><span>${afn:getMessage("product_info",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-review"><span>${afn:getMessage("product_review",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-qna"><span>${afn:getMessage("product_qna",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-shipping"><span>${afn:getMessage("pro_info_etc",sessionScope.locale)}</span></a></li>
                </ul>
                <c:out value="${configtop.market_config_value}" escapeXml="false"/>

                <div class="goods-information-wrap ">
                    <h5>${afn:getMessage("prod_es_info",sessionScope.locale)}</h5>
                    <!-- <p class="goods-name">SM-G05-ZR/SS</p>
                    <p class="goods-subtitle">일반세탁기 WA15M6551KS [15KG / 워블세탁기 / 회오리세탁 / 다이아몬드필터 / 인버터모터 / 무세제통세척]</p> -->
                    <table class="goods-information-table">
                    	<c:if test="${empty product_definition}">
	                        <tr><th>1. 소재</th><td>상세페이지 참조</td></tr>
							<tr><th>2. 색상</th><td>상세페이지 참조</td></tr>
							<tr><th>3. 크기</th><td>상세페이지 참조</td></tr>
							<tr><th>4. 제조자</th><td>상세페이지 참조</td></tr>
						</c:if>
						<c:if test="${not empty product_definition}">
							<c:forEach var="map" items="${product_definition}">
								<c:forEach var="definition" items="${map}">
									<tr><th>${definition.key}</th><td>${definition.value}</td></tr>
								</c:forEach>
							</c:forEach>
						</c:if>
                    </table>
                </div>

                <c:out value="${configbot.market_config_value}" escapeXml="false"/>
            </div>
            <div class="goods-detail-wrap" id="goods-review">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>${afn:getMessage("product_description",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-information"><span>${afn:getMessage("product_info",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-review" class="active"><span>${afn:getMessage("product_review",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-qna"><span>${afn:getMessage("product_qna",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-shipping"><span>${afn:getMessage("pro_info_etc",sessionScope.locale)}</span></a></li>
                </ul>
                <c:import url="/product/productDetailReview"/>

            <div class="goods-detail-wrap" id="goods-qna">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>${afn:getMessage("product_description",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-information"><span>${afn:getMessage("product_info",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-review"><span>${afn:getMessage("product_review",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-qna" class="active"><span>${afn:getMessage("product_qna",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-shipping"><span>${afn:getMessage("pro_info_etc",sessionScope.locale)}</span></a></li>
                </ul>
                <div class="qna-wrap">
                    <h5>${afn:getMessage("product_qna2",sessionScope.locale)}</h5>
                    <div class="qna-data-container">
                        <div class="qna-data-option-box">
                                <span class="all active">
                                    <a href="#none">${afn:getMessage("all",sessionScope.locale)}&#40;<span>24</span>&#41;</a>
                                </span>
                            <div class="qna-data-option-box-right">
<%--                                <select name="order" class="order-select">--%>
<%--                                    <option value="all">전체</option>--%>
<%--                                    <option value="goods">상품</option>--%>
<%--                                    <option value="shipping">배송</option>--%>
<%--                                    <option value="refund">반품/환불/취소</option>--%>
<%--                                    <option value="etc">기타</option>--%>
<%--                                </select>--%>
                                <button type="button" class="write-review" id="productqna" data-id="${list.product_cd}">${afn:getMessage("writemyFAQ",sessionScope.locale)}</button>
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
                <h5>${afn:getMessage("sameSupplierPro",sessionScope.locale)}</h5>
                <ul class="related-goods">
                    <c:if test="${not empty sameSupplierProductList}">
	            	<c:forEach var="list" items="${sameSupplierProductList}">
		            	<li><a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
		                    <div class="img-box"><img src="${list.file_1}"  onerror="this.src='http://placehold.it/200'"/></div>
		                    <p class="goods-name">${list.product_name}</p>
		                    <p class="goods-price"><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>${afn:getMessage("korea_won",sessionScope.locale)}</p>
		                </a></li>
	                </c:forEach>
	            	</c:if>
	            	<c:if test="${empty sameSupplierProductList}">
	            		${afn:getMessage("msg.proDetail.none_Suppliercontent",sessionScope.locale)}
	            	</c:if>
                </ul>
            </div>
            <div class="goods-detail-wrap" id="goods-shipping">
                <ul class="detail-nav">
                    <li><a href="goods-description"><span>${afn:getMessage("product_description",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-information"><span>${afn:getMessage("product_info",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-review"><span>${afn:getMessage("product_review",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-qna"><span>${afn:getMessage("product_qna",sessionScope.locale)}</span></a></li>
                    <li><a href="goods-shipping" class="active"><span>${afn:getMessage("pro_info_etc",sessionScope.locale)}</span></a></li>
                </ul>
                <div class="shipping-wrap">
                    <h5>${afn:getMessage("pro_info_etc",sessionScope.locale)}</h5>
                    <div class="shipping-box">
                        <h6>${afn:getMessage("delivery_info",sessionScope.locale)}<i class="arrow-down"></i></h6>
                        ${list.product_delivery_info}
                        <br>
                        <b>${afn:getMessage("delivery_forward",sessionScope.locale)}</b>
                        <br>
                        ${store_delivery.forward_value}
                          <br>
                    </div>
                    <div class="return-box">
                        <h6>${afn:getMessage("returnInfo",sessionScope.locale)}<i class="arrow-down"></i></h6>
                        <br>
                        <b>${afn:getMessage("returnAdd",sessionScope.locale)}</b>
                        <br>
                        ${store_delivery.refund_value}
                          <br><br>
                        ${list.product_change_info}
                    </div>
                    <div class="refund-box">
                        <h6>${afn:getMessage("refundInfo",sessionScope.locale)}<i class="arrow-down"></i></h6>
                        ${list.product_service_info}
                    </div>
                </div>
                <article class="banner-section">
		        <div class="inner">
		            <a href="${lineBannerList1.url}" class="img-box">
		            <img src="${lineBannerList1.file_1}" /></a>
		        </div>
		    </article>
            </div>
        </div>
        </div>
    </article>
</section>
   <div id="joinPop" class="">
       <div class="bg"></div>
       <div class="md-content">
           <h2><span>원조이몰</span> 회원가입</h2>
            <div class="form-out2">
			<form method="GET" name="defaultJoinform" id="defaultJoinform">
                    <table>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">${afn:getMessage("idEmail",sessionScope.locale)}</p>
                                <div class="mem-id2 id2-w">
                                    <input name="email" id="email" type="text" placeholder="이메일을 입력해주세요."  required>
                                    <a class="btn-auth" id="emailChk"><span>중복체크</span></a>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er" id="emailValidation">
                                &nbsp;
                            </td>
                        </tr>
                 
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">${afn:getMessage("phone",sessionScope.locale)}</p>
                                <div class="mem-id2 id2-w" onclick="return auth_type_check();">
                                 <!-- <input name="phone" id="phone" type="text" class="num-txt" readonly>-->
                                    <input name="sex" id="sex" type="hidden" readonly>
                                    <input name="birth" id="birth" type="hidden" readonly>
                                    <input name="username" id="username" type="hidden" readonly>
                                    <input name="phone" id="phone" type="text" class="num-txt" readonly>
                                    <a href="javascript:return auth_type_check()" class="btn-auth" id="phoneBtn" ><span>${afn:getMessage("certi",sessionScope.locale)}</span></a>
                                    <!-- <a href="" class="none"><span>인증완료</span></a>
                                    <a href="" class="none"><span>300s</span></a> -->
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er"  id="phoneValidation">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">${afn:getMessage("pwd",sessionScope.locale)}</p>
                                <div class="mem-id2">
                                    <input name="password" id="password" type="password"  placeholder="${afn:getMessage('msg.signPwdMsg',sessionScope.locale)}">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er"  id="passwordValidation">
                                    &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">${afn:getMessage("pswdCfm",sessionScope.locale)}</p>
                                <div class="mem-id2">
                                    <input name="password_cf"  id="password_cf" type="password" placeholder="${afn:getMessage('msg.signPwdcfMsg',sessionScope.locale)}">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er" id="password_cfValidation">
                              &nbsp;
                            </td>
                        </tr>
                    </table>
                    <div class="form-ch">
                        <input type="checkbox" name="option" id="ch">
                        <label for="ch">
                            <div class="ch-p-box">
                                <p>${afn:getMessage("Iam",sessionScope.locale)} <strong>${afn:getMessage("14years",sessionScope.locale)}</strong>
                                ${afn:getMessage("or",sessionScope.locale)}, 
                                <a href="#termsmodal" rel="modal:open"  class="tos1">${afn:getMessage("terms",sessionScope.locale)},</a>
                                <a href="#termsmodal2" rel="modal:open" class="tos2">  ${afn:getMessage("3terms",sessionScope.locale)},</a>
                                <a href="#termsmodal3"  rel="modal:open"class="tos3"> ${afn:getMessage("privacy",sessionScope.locale)}</a>
                                		${afn:getMessage("msg.sign.agreeMsg",sessionScope.locale)}</p>
                            </div>
                        </label>
                    </div>
                    <div class="join-box">
                        <a href="javascript:void(0)"  id="formSignUpSubmit1">${afn:getMessage("join",sessionScope.locale)}</a>
                    </div>
                </form>
            </div>
            <div class="sns-login-wrap">
                <div class="sns-login-inner">
                    <div class="sns-login-ttl">
                       <div class="ttl-line"></div>
                        <span>${afn:getMessage("msg.login.orSocialLogin",sessionScope.locale)}</span>
                        <div class="ttl-line"></div>
                     </div>
                     <button type="button" id="kakao-login-btn" class="kko-login-btn">
                     <i class="kko-ic"></i>카카오 계정으로 회원가입</button>
                         <button type="button" class="nv-login-btn"><i class="nv-ic"></i>네이버 계정으로 회원가입</button>
                         <button type="button" class="fb-login-btn"><i class="fb-ic"></i>페이스북 계정으로 회원가입</button>
                         <button type="button" class="ln-login-btn"><i class="ln-ic"></i>LINE 계정으로 회원가입</button>
                      <!--  <a id="kakao-login-btn"></a> -->
                </div>
            </div>
       </div>
    
    </div>


    <script src="https://sdk.amazonaws.com/js/aws-sdk-2.610.0.min.js"></script>
<script>

$('.kko-login-btn').click(function () {
    window.open('https://kauth.kakao.com/oauth/authorize?client_id=edae5e01f6d81723613c9cd06f550593&redirect_uri=<c:out value="${siteUrl}"/>/Popup/kakao&response_type=code','_blank','width=750, height=900');
});

    var pwCheck = false;
    $('#formSignUpSubmit1').on("click",function () {

        var password = $('#password').val();
        var password_cf = $('#password_cf').val();
        var formData = $('#defaultJoinform').serialize();
         $('.er').html('');

        if(!pwCheck){
           $('#password_cfValidation').html('* ${afn:getMessage("error.sign.pwdcfMsg",sessionScope.locale)}');
        }else if($('#ch').is(":checked")) {
            $('.loading-bar-wrap').removeClass("hidden");
                jQuery.ajax({
                    type:"GET",
                    // contentType: 'application/json',
                    url:"/sign/signupProc",
                    // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
                    data:formData,
                    success : function(data) {
                        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                        // TODO
                        console.log(data)
                        if(data.validateError){
                            $.each(data.validateError, function (index, item) {
                               console.log(data);
                                if(index != "Error"){//일반에러메세지
                                    $('#'+index+'Validation').html(item);
                                return;
                                }
                            });
                        }else{
                            location.href=data.redirectUrl;
                        }

                    },
                    complete : function(data) {
                        // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                        // TODO
                        $('.loading-bar-wrap').addClass("hidden");
                    },
                    error : function(xhr, status, error) {
                        console.log(xhr+status+error);
                    }
                });

        }else{
           alert('${afn:getMessage("error.sign.termsRequest",sessionScope.locale)}');
        }
    })

//이메일 다시 입력시
$(document).on("propertychange change keyup paste input",".mem-id2 > input[name=email]",function () {

    $('#emailChk').removeClass('btn-success')
    $('#emailChk').text('${afn:getMessage("duplication_check",sessionScope.locale)}');
});
//이메일중복체크
$(document).on("click","#emailChk",function () {
    $('.er').html('');
    var formData = $('#defaultJoinform').serialize();
    $('.loading-bar-wrap').removeClass("hidden");

    jQuery.ajax({
        type:"GET",
        // contentType: 'application/json',
        url:"/sign/emailChk",
        // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
        data:formData,

        success : function(data) {
            // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
            // TODO

            if(data.validateError){
                $.each(data.validateError, function (index, item) {
                    if(index != "Error"){//일반에러메세지
                        $('#'+index+'Validation').html(item);
                    }
                });
            }else{
                $('#emailChk').addClass('btn-success')
                $('#emailChk').text('${afn:getMessage("Usable",sessionScope.locale)}')
            }
        },

        complete : function(data) {
            // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
            // TODO
            $('.loading-bar-wrap').addClass("hidden");
        },
        error : function(xhr, status, error) {
            console.log(xhr+status+error);
        }
    });
})
// var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
var regExp = /^[a-zA-Z0-9]{6,20}$/;
//패스워드 체크
$(document).on('input','input[name=password],input[name=password_cf]',function () {
    pwCheck = false;
    var pw = $('input[name=password]').val();
    var pw_cf = $('input[name=password_cf]').val();
    if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
        $("#passwordValidation").text("* ${afn:getMessage('error.sign.pwdpattern',sessionScope.locale)}");
        $("#passwordValidation").removeClass("text-success");
        $("#password_cfValidation").text('');
    }else{
        $("#passwordValidation").addClass("text-success");
        $("#passwordValidation").text("* ${afn:getMessage('msg.pw_use',sessionScope.locale)}");

        if(pw != pw_cf){
            $("#password_cfValidation").removeClass("text-success");
            $("#password_cfValidation").text("* ${afn:getMessage('error.sign.pwdDis',sessionScope.locale)}");

        }else{
            pwCheck = true;
            $("#password_cfValidation").addClass("text-success");
            $("#password_cfValidation").text("* ${afn:getMessage('msg.sign.pwdSuccess',sessionScope.locale)}");
        }
    }
})

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
