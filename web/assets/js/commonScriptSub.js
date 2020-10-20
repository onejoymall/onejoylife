//회원정보수정 약관동의
$(function() {
    $('#ch1').on('change', function () {
        $(this).parents('.r-sec2').find('input:checkbox').prop('checked', $(this).prop('checked'));
    })
})

//찜목록 장바구니 등록
$('.addAllCart').on("click",function(){
    product_cds = [];
    $.each($('input[name=chk]'),function(idx, item){
        if($(this).prop("checked")) addShoppingBasketM($(this).val());
    });
});

//찜목록 리스트 삭제
$('.deleteFavorites').on("click",function(){
    product_cds = [];
    $.each($('input[name=chk]'),function(idx, item){
        if($(this).prop("checked")) deleteFavorite($(this).val());
    });
});
//찜목록 삭제
function deleteFavorite(product_cd) {
    jQuery.ajax({
        type: 'POST',
        data: {"product_cd": product_cd},
        url:'/cart/deleteFavorite',
        success: function (data) {
            if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    // $('#validateError'+index).removeClass('none');
                    // $('#validateError'+index).html('* '+item);
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
                location.href=data.redirectUrl;
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
}

//자주구매하는상품 장바구니 선택담기
$('.addChkCart').on("click",function(){
	product_cds = [];
    $.each($('input[name=chk]'),function(idx, item){
    	if($(this).prop("checked")) addShoppingBasketM($(this).val());
    });
});
//자주구매하는상품 선택 찜 버튼
$('.addChkFavorites').on("click",function(){
	product_cds = [];
    $.each($('input[name=chk]'),function(idx, item){
    	if($(this).prop("checked")) addFavorite($(this).val());
    });
});

//찜하기
function addFavorite(product_cd){
	jQuery.ajax({
        type: 'POST',
        data: {"product_cd": product_cd},
        url:'/cart/addFavorites',
        success: function (data) {
            if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    // $('#validateError'+index).removeClass('none');
                    // $('#validateError'+index).html('* '+item);
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
                $.toast({
                	heading: getMessageAjax('addcartSuccess'),
                    text: [
                        '<a href="/MyPage/ShoppingAddList">' + getMessageAjax('locationFavorite') + '</a>',
                        '<a href="">' + getMessageAjax('shoppingContinue') + '</a>',
                    ],

                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: false,
                });
                // loginAuth(data.access_token);
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
}
//장바구니 전체 선택
$(function(){
    $('#tr-ck1-1').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.lis-body input').prop('checked',true);
        else $('.lis-body input').prop('checked',false);
    });
    
    $('#tr-ck1-2').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.lis-body input').prop('checked',true);
        else $('.lis-body input').prop('checked',false);
    });
});

//회원정보 상세보기
function defaultModalUSer(email){
    $(".modal1").attr("style", "display:block");
    $('#menuGrant').addClass('hidden');
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/memberViewDetail',
        data: {"email":email},
        success: function (data) {
            $("input[name=enable_menu]").prop("checked",false);
            $.each(data.list, function (index, item) {
                //매니저 이상만 메뉴변경 기능 노출
                if(index =='level' && item >= 9){
                    $('#menuGrant').removeClass('hidden');
                }
        	if(index=="enable_mg_menu_id" && data.list.level != 1){
                    item.split("|").forEach(function(el){
                	$("input[name=enable_menu]:checkbox[value="+el+"]").prop("checked",true);
                    });
                }else if(index=="usr_id"){
                    $('input[name=point_paid_user_id]').val(item);
                }else{
                    $('.' + index).html(item);
                }
            });
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
}
//포인트 지급 및 환수
$('.mgPointPaid').on("click",function () {
    var formData = $('#mgPointForm').serialize()
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/MgPointAdd',
        data: formData,
        success: function (data) {
            if (data.validateError) {//toast 오류처리
                $.each(data.validateError, function (index, item) {
                    if (index == "Error") {//
                        alertType = "error";
                        showText = item;
                    } else {
                        alertType = "error";
                        showText = index + getMessageAjax('is3') + " "  + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 2000,
                    afterHidden: function () {
                        location.href = data.redirectUrl;
                    }
                });

            }
        },
        error: function (xhr, status, error) {
            //
            console.log(error,xhr,status );
        },
    });
})
//회원등급설정 사용자,매니저,관리자
$('.modal-level-btn').on("click",function () {
    var formData = $('#mgPointForm').serialize()
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/MgUserLevelUpdate',
        data: formData,
        success: function (data) {
            if (data.success) {//toast 오류처리
        	$.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 2000,
                    afterHidden: function () {
                        location.href = data.redirectUrl;
                    }
                });
            }
        },
        error: function (xhr, status, error) {
            //
            console.log(error,xhr,status );
        },
    });
})
//매니저, 관리자 메뉴 설정
$('.modal-enable-menu-btn').on("click",function () {
    var formData = $('#mgPointForm').serialize();
    enableMenuArr = [];
    $.each($('input[name=enable_menu]'),function(idx, item){
    	if($(this).prop("checked")) enableMenuArr.push($(this).val());
    });
    formData = "enable_menu="+enableMenuArr.join("|") + "&" + formData;
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/MgUserEnableMenuUpdate',
        data: formData,
        success: function (data) {
            if (data.validateError) {//toast 오류처리
                $.each(data.validateError, function (index, item) {
                    if (index == "Error") {//
                        alertType = "error";
                        showText = item;
                    } else {
                        alertType = "error";
                        showText = index + getMessageAjax('is3') + " "  + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 2000,
                    afterHidden: function () {
                        location.href = data.redirectUrl;
                    }
                });

            }
        },
        error: function (xhr, status, error) {
            //
            console.log(error,xhr,status );
        },
    });
})

//배송지 선택삭제
$('#deleteDeliveryInfo').on("click",function () {
    var formData = $('#myDeliveryForm').serialize();
    if(!formData.includes("orderNo=")){
    	alert(getMessageAjax('error.check_addr'));
    	return;
    }
    jQuery.ajax({
        type: 'POST',
        url: '/MyPage/DeliveryAddressDelete',
        data: formData,
        success: function (data) {
            if (data.validateError) {//toast 오류처리
                $.each(data.validateError, function (index, item) {
                    if (index == "Error") {//
                        alertType = "error";
                        showText = item;
                    } else {
                        alertType = "error";
                        showText = index + getMessageAjax('is3') + " "  + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 2000,
                    afterHidden: function () {
                        location.href = data.redirectUrl;
                    }
                });

            }
        },
        error: function (xhr, status, error) {
            //
            console.log(error,xhr,status );
        },
    });
})

//기본배송지 설정
$('#updateDefaultDeliveryInfo').on("click",function () {
    var formData = $('#myDeliveryForm').serialize();
    jQuery.ajax({
        type: 'POST',
        url: '/MyPage/DefaultDeliveryAddressUpdate',
        data: formData,
        success: function (data) {
            if (data.validateError) {//toast 오류처리
                $.each(data.validateError, function (index, item) {
                    if (index == "Error") {//
                        alertType = "error";
                        showText = item;
                    } else {
                        alertType = "error";
                        showText = index + getMessageAjax('is3') + " "  + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 2000,
                    afterHidden: function () {
                        location.href = data.redirectUrl;
                    }
                });

            }
        },
        error: function (xhr, status, error) {
            //
            console.log(error,xhr,status );
        },
    });
})

//새배송지 등록
$("#addDeliveryInfo").click(function(){
    event.preventDefault();
    $(".modal").attr("style", "display:block");
    $("input[name=delivery_user_name]").val('');
    $("select[name=delivery_user_phone_a]").val('010');
    $("input[name=delivery_user_phone_b]").val('');
    $("input[name=delivery_user_phone_c]").val('');
    $("select[name=delivery_user_tel_a]").val('02');
    $("input[name=delivery_user_tel_b]").val('');
    $("input[name=delivery_user_tel_c]").val('');
    $("input[name=postcode]").val('');
    $("input[name=roadAddress]").val('');
    $("input[name=extraAddress]").val('');
    $("input[name=jibunAddress]").val('');
    return;
});

//배송지 수정 모달
$("#updateDeliveryInfo").click(function(){
    event.preventDefault();
    var formData = $('#myDeliveryForm').serialize();
    if(!formData.includes("orderNo=")){
    	alert(getMessageAjax('error.check_addr'));
    	return;
    }
    $(".modal2").attr("style", "display:block");
    jQuery.ajax({
        type: 'POST',
        url: '/MyPage/getDeliveryDetail',
        data: formData,
        success: function (data) {
        	$.each(data.deliveryInfo,function(index, item){
        		$("input[name="+index+"]").val(item);
        		if(index=="delivery_user_phone" || index=="delivery_user_tel"){
        			var number = item.split("-");
        			['a','b','c'].forEach(function(el,idx){
        				$("input[name="+index+"_"+el+"]").val(number[idx]);
        			});
        		}
        	});
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
});
//배송지 수정
$("#updateDeliveryBtn").click(function(){
    var formData = $('#form2').serialize();
    jQuery.ajax({
        type: 'POST',
        url: '/MyPage/updateDeliveryAddress',
        data: formData,
        success: function (data) {
        	if (data.validateError) {//toast 오류처리
                $.each(data.validateError, function (index, item) {
                    if (index == "Error") {//
                        alertType = "error";
                        showText = item;
                    } else {
                        alertType = "error";
                        showText = index + getMessageAjax('is3') + " "  + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 2000,
                    afterHidden: function () {
                        location.href = data.redirectUrl;
                    }
                });

            }
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
});
//배송지 등록
$("#newDeliveryBtn").click(function(){
    var formData = $('#form1').serialize();
    jQuery.ajax({
        type: 'POST',
        url: '/MyPage/insertDeliveryAddress',
        data: formData,
        success: function (data) {
        	if (data.validateError) {//toast 오류처리
                $.each(data.validateError, function (index, item) {
                    if (index == "Error") {//
                        alertType = "error";
                        showText = item;
                    } else {
                        alertType = "error";
                        showText = index + getMessageAjax('is3') + " "  + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{
                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 2000,
                    afterHidden: function () {
                        location.href = data.redirectUrl;
                    }
                });
            }
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
});
//배송지정보 불러오기
$(".sec2-ov>p>label").click(function(){
	var deliverytype = ''; 
	if($(this).attr("for") == 'ra1-3'){
		$("input[name=delivery_user_name]").val('');
		$("select[name=delivery_user_phone_a]").val('010');
		$("input[name=delivery_user_phone_b]").val('');
		$("input[name=delivery_user_phone_c]").val('');
		$("select[name=delivery_user_tel_a]").val('010');
		$("input[name=delivery_user_tel_b]").val('');
		$("input[name=delivery_user_tel_c]").val('');
		$("input[name=postcode]").val('');
		$("input[name=roadAddress]").val('');
		$("input[name=extraAddress]").val('');
		$("input[name=jibunAddress]").val('');
		return;
	}else if($(this).attr("for") == 'ra1-1'){
		deliverytype = 'default';
	}else if($(this).attr("for") == 'ra1-2'){
		deliverytype = 'last';
	}
	
	jQuery.ajax({
        type: 'POST',
        url: '/payment/getDeliveryAddress',
        data: "deliveryType="+deliverytype,
        success: function (data) {

            if(data.delivery!=null ) {
                $.each(data.delivery, function (index, item) {
                    if (index != "order_no" &&
                        index != "product_cd") {
                        $("input[name=" + index + "]").val(item);
                    }
                    if (index == "delivery_user_phone" || index == "delivery_user_tel") {
                        var number = item.split("-");
                        ['a', 'b', 'c'].forEach(function (el, idx) {
                            $("input[name=" + index + "_" + el + "]").val(number[idx]);
                        });
                    }
                });
            }
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
});

$(".sec2-ov>p>label:eq(0)").trigger("click");
//배송지정보 불러오기 모바일
$("input[name=selectAddress]").click(function(){
	var deliverytype = ''; 
	if($(this).attr("id") == 'ra1-3'){
		$("input[name=delivery_user_name]").val('');
		$("select[name=delivery_user_phone_a]").val('010');
		$("input[name=delivery_user_phone_b]").val('');
		$("input[name=delivery_user_phone_c]").val('');
		$("select[name=delivery_user_tel_a]").val('010');
		$("input[name=delivery_user_tel_b]").val('');
		$("input[name=delivery_user_tel_c]").val('');
		$("input[name=postcode]").val('');
		$("input[name=roadAddress]").val('');
		$("input[name=extraAddress]").val('');
		$("input[name=jibunAddress]").val('');
		return;
	}else if($(this).attr("id") == 'ra1-1'){
		deliverytype = 'default';
	}else if($(this).attr("id") == 'ra1-2'){
		deliverytype = 'last';
	}
	
	jQuery.ajax({
        type: 'POST',
        url: '/payment/getDeliveryAddress',
        data: "deliveryType="+deliverytype,
        success: function (data) {
            if(data.delivery!=null ) {
                $.each(data.delivery,function(index, item){
                    if(index != "order_no" &&
                        index != "product_cd"){
                        $("input[name="+index+"]").val(item);
                    }
                    if(index=="delivery_user_phone" || index=="delivery_user_tel"){
                        var number = item.split("-");
                        ['a','b','c'].forEach(function(el,idx){
                            $("input[name="+index+"_"+el+"]").val(number[idx]);
                        });
                    }
                });
            }
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
});
$("input[name=selectAddress]:eq(0)").trigger("click");

//관리자 쿠폰 등록
$("button[name=coupon-confirm-btn]").click(function(){
	var proc = $(this).attr('data-id');
	var formData = new FormData($("#insertForm")[0]);
	jQuery.ajax({
        type: 'POST',
        enctype: 'multipart/form-data',
        data: formData,
        processData: false, // 필수
        contentType: false, // 필수
        url:'/Manager/'+proc+'Coupon',
        success: function (data) {
        	if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else if(data.success){
            	$.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 1000,
                    afterHidden: function () {
                        location.reload();
                    }
                });
            }
        	if(data.e){
        		alert("error");
        	}
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});

//관리자 쿠폰 상세보기
$(".couponDetailBtn, #couponInsertBtn").click(function(){
	if($(this).attr("data-id")){
		$("#couponTitle").text(getMessageAjax('update'));
		$("button[name=coupon-confirm-btn]").attr("data-id","update");
		$("button[name=coupon-confirm-btn]").text(getMessageAjax('replymodi'));
		
		jQuery.ajax({
	        type: 'POST',
	        url: '/Manager/getCouponDetail',
	        data: "coupon_cd="+$(this).attr("data-id"),
	        success: function (data) {
	        	var coupon = data.coupon;
	        	console.log(coupon);
	        	$.each(coupon,function(index, item){
	        		if(	index == 'coupon_name' ||
						index == 'supplier_cd' ||
						index == 'fileName' ||
						index == 'uploadfile' ||
						index == 'coupon_valid_date_start' ||
						index == 'coupon_valid_date_end' ||
						index == 'coupon_ct' ||
						index == 'coupon_use_payment_class' ||
						index == 'coupon_cd'){ //단순텍스트
	        			$("input[name="+index+"]").val(item);
	        		}else if(index == 'coupon_sale_cal_condition'){ //적용계산기준
	        			$("select[name="+index+"]").val(item);
	        		}else if(index == 'country_supply'){ //국가별공급
	        			item.split("|").forEach(function(el){
	        				$("input[name="+index+"][value="+el+"]").prop("checked",true);
	        			});
	        		}else if(index == 'coupon_sale_type'){ //혜택구분
	        			$("input[name="+index+"][value="+item+"]").trigger("click");
	        			$('input[name=coupon_sale_payment]').val(coupon.coupon_sale_payment);
	        			$('input[name=coupon_sale_rate]').val(coupon.coupon_sale_rate);
	        		}else if(index == 'coupon_use_range' ||	
	        				 index == 'coupon_dup_yn' ||
	        				 index == 'login_alert_yn' ||
	        				 index == 'sms_alert_yn' ||
	        				 index == 'email_alert_yn'){ //단순라디오
	        			$("input[name="+index+"][value="+item+"]").trigger("click");
	        		}else if(index == 'coupon_condition'){ //발급구분
	        			switch(item){
	        			case 'T': {
	        				$("select[name=coupon_condition1]").val("T").trigger('change');
	        				$("input[name=coupon_issue_time][value="+coupon.coupon_issue_time+"]").trigger("click");
	        				$("input[name=coupon_issue_time][value"+coupon.coupon_issue_time+"]").trigger("click");
                            $('input[name=coupon_issue_date]').val(coupon.coupon_issue_date);
                            $('input[name=coupon_issued_target_id]').val(coupon.coupon_issued_target_id);
	        				break;
	        			}
	        			case 'J':{
	        				$("select[name=coupon_condition1]").val("next2").trigger('change');
	        				break;
	        			}
	        			case 'D':{
	        				$("select[name=coupon_condition1]").val("next2").trigger('change');
	        				$("select[name=coupon_condition2]").val("D").trigger('change');
	        				if(coupon.coupon_min_amount) $("select[name=box2-out-select1]").val("box2-in1-2").trigger("change");
	        				else $("select[name=box2-out-select1]").val("box2-in1-1").trigger("change");
	        				$('input[name=coupon_min_amount]').val(coupon.coupon_min_amount);
	        				if(coupon.coupon_issue_order_end){
	        					$('input[name=iss-day][value=D2]').trigger("click");
	        					$('input[name=iss-day][value=D2]').trigger("click");
	        				}
	        				else {
	        					$('input[name=iss-day][value=D1]').trigger("click");
	        					$('input[name=iss-day][value=D1]').trigger("click");
	        				}
	        				$('input[name=coupon_issue_order_end]').val(coupon.coupon_issue_order_end);
	        				break;
	        			}
	        			case 'B':{
	        				$("select[name=coupon_condition1]").val("next2").trigger('change');
	        				$("select[name=coupon_condition2]").val("B").trigger('change');
	        				if(coupon.coupon_issue_time == 'B'){
	        					$("input[name=coupon_issue_time][value="+coupon.coupon_issue_time+"]").trigger("click");
	        					$('input[name=coupon_anniversary_before]').val(coupon.coupon_anniversary_before);
	        				}
	        				break;
	        			}
	        			case 'R':{
	        				$("select[name=coupon_condition1]").val("next2").trigger('change');
	        				$("select[name=coupon_condition2]").val("R").trigger('change');
	        				$('input[name=coupon_review_condition]').val(coupon.coupon_review_condition);
	        				break;
	        			}
	        			case 'C':{
	        				$("select[name=coupon_condition1]").val("next2").trigger('change');
	        				$("select[name=coupon_condition2]").val("C").trigger('change');
	        				if(coupon.coupon_min_amount) $("select[name=box2-out-select1]").val("box2-in1-2").trigger("change");
	        				else $("select[name=box2-out-select1]").val("box2-in1-1").trigger("change");
	        				$('input[name=coupon_min_amount]').val(coupon.coupon_min_amount);
	        				if(coupon.coupon_issue_order_end){
	        					$('input[name=iss-day][value=D2]').trigger("click");
	        					$('input[name=iss-day][value=D2]').trigger("click");
	        				}
	        				else {
	        					$('input[name=iss-day][value=D1]').trigger("click");
	        					$('input[name=iss-day][value=D1]').trigger("click");
	        				}
	        				$('input[name=coupon_issue_order_end]').val(coupon.coupon_issue_order_end);
	        				break;
	        			}
	        			case 'F':{
	        				$("select[name=coupon_condition1]").val("next2").trigger('change');
	        				$("select[name=coupon_condition2]").val("F").trigger('change');
	        				if(coupon.coupon_issue_order_end){
	        					$('input[name=iss-day][value=D2]').trigger("click");
	        					$('input[name=iss-day][value=D2]').trigger("click");
	        				}
	        				else {
	        					$('input[name=iss-day][value=D1]').trigger("click");
	        					$('input[name=iss-day][value=D1]').trigger("click");
	        				}
	        				$('input[name=coupon_issue_order_end]').val(coupon.coupon_issue_order_end);
	        				break;
	        			}
	        			case 'S':{
	        				$("select[name=coupon_condition1]").val("next2").trigger('change');
	        				$("select[name=coupon_condition2]").val("S").trigger('change');
	        				$("input[name=coupon_buy_count_condition][value="+coupon.coupon_buy_count_condition+"]").trigger("click");
	        				$('input[name=coupon_min_buy_count]').val(coupon.coupon_min_buy_count);
	        				if(coupon.coupon_issue_order_end){
	        					$('input[name=iss-day][value=D2]').trigger("click");
	        					$('input[name=iss-day][value=D2]').trigger("click");
	        				}
	        				else {
	        					$('input[name=iss-day][value=D1]').trigger("click");
	        					$('input[name=iss-day][value=D1]').trigger("click");
	        				}
	        				$('input[name=coupon_issue_order_end]').val(coupon.coupon_issue_order_end);
	        				break;
	        			}
	        			case 'L':{
	        				$("select[name=coupon_condition1]").val("next3").trigger('change');
	        				$("select[name=coupon_condition3]").val("L").trigger('change');
	        				$("input[name=coupon_issue_time][value="+coupon.coupon_issue_time+"]").trigger("click");
	        				$("input[name=coupon_issue_time][value="+coupon.coupon_issue_time+"]").trigger("click");
	        				$('input[name=coupon_issue_date]').val(coupon.coupon_issue_date);
	        				break;
	        			}
	        			case 'M':{
	        				$("select[name=coupon_condition1]").val("next3").trigger('change');
	        				$("select[name=coupon_condition3]").val("M").trigger('change');
	        				$("select[name=coupon_none_buy_month]").val(coupon.coupon_none_buy_month).trigger('change');
	        				break;
	        			}
	        			}
	        		}
	        	});
	        },
	        error: function (xhr, status, error) {
	            console.log(error,xhr,status );
	        },
	    });
	}else{
		$("#couponTitle").text(getMessageAjax('registration'));
		$("button[name=coupon-confirm-btn]").attr("data-id","insert");
		$("button[name=coupon-confirm-btn]").text(getMessageAjax('register'));
		
		$("input[name=coupon_name]").val("");
		$("input[name=coupon_issued_target_id]").val("");
		$("input[name=supplier_cd]").val("");
		$("input[name=fileName]").val("");
		$("input[name=uploadfile]").val("");
		$("input[name=country_supply]").prop("checked",false);
		$("label[for=discount-radio1]").trigger("click");
		$('input[name=coupon_sale_type]:checked').trigger("click")
		$("input[name=coupon_sale_payment]").val("");
		$("input[name=coupon_sale_rate]").val("");
		$("select[name=coupon_condition1]").val("T").trigger('change');
		$("label[for=option1-rd1]").trigger("click");
		$("input[name=coupon_issue_time]:checked").trigger("click");
		$("select[name=box2-out-select1]").val("box2-in1-1");
		$("input[name=coupon_min_amount]").val("");
		$("label[for=num1-1]").trigger("click");
		$("input[name=coupon_min_buy_count]").val("");
		$("label[for=iss-day1]").trigger("click");
		$("input[name=coupon_issue_order_end]").val("");
		$("select[name=coupon_none_buy_month]").val("1");
		$("input[name=coupon_valid_date_start]").val("");
		$("input[name=coupon_valid_date_end]").val("");
		$("label[for=apply-rd1]").trigger("click");
		$("input[name=coupon_ct]").val("");
		$("label[for=goods-validity1]").trigger("click");
		$("input[name=goods-validity]:checked").trigger("click");
		$("input[name=coupon_use_min_amount]").val("");
		$("select[name=coupon_sale_cal_condition]").val("B");
		$("input[name=coupon_use_payment_class]").val("cash,card,mieage,tcash,icash,cell,kpay,paynow,payco,kakaopay,smilepay,naverpay");
		$("label[for=coupon1-rd2]").trigger("click");
		$("label[for=kind-rd1]").trigger("click");
		$("label[for=login-coupon-rd1]").trigger("click");
		$("label[for=sms-coupon-rd1]").trigger("click");
		$("label[for=email-coupon-rd1]").trigger("click");
	}
});

$("#couponRegButton").click(function(){
	location.href="/MyPage/Coupon-issued?coupon_cd="+$("input[name=coupon_cd]").val();
})

$("#couponBatchUpdateBtn").click(function(){
	if(!$('#defaultListForm input[name=chk]:checked').val()){
		$.toast({
            text: getMessageAjax('error.selectField'),
            showHideTransition: 'plain', //펴짐
            position: 'bottom-right',
            heading: 'Error',
            icon: 'error'
        });
		return;
	}
	
	$(".modal1").attr("style", "display:block");
    $('body').css("overflow", "hidden");
});

//쿠폰 일괄수정
$('#coupon-update-batch-btn').on("click",function(){
    var formData = $('#defaultListForm').serialize();
    var batchUpdateFormData = $('#batchUpdateForm').serialize();
    formData += "&"+batchUpdateFormData;
    var alertType;
    var showText;
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/updateCouponBatch',
        data: formData,
        success: function (data) {
        	if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else if(data.success){
            	$.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 1000,
                    afterHidden: function () {
                        location.reload();
                    }
                });
            }
        	if(data.e){
        		alert("error");
        	}
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});

//회원아이디 조회 모달
$(".userModalBtn").click(function(e){
    $('.dataListView').html();
    e.preventDefault();
    $(".userModal").attr("style", "display:block");
    $('body').css("overflow", "hidden");
    var dataList = commonAjaxListCall('POST','/Manager/CallNormalUserList');
    var html;
    $.each(dataList.getNormalUserList,function (key,value) {
        html +='' +
            '<tr data-id="'+value.usr_id+'">' +
            '<td><div class="codeRadio"></div></td>' +
            '<td>'+(value.username ? value.username : '')+'</td>' +
            '<td>'+value.email+'</td>' +
            '<td>'+value.usr_id+'</td>' +
            '</tr>';
    })
    $('.dataListView').html(html);
    
    //row클릭시 이벤트
    $(".codeSrcTable .userTable tr").on("click",function(){
        $(".codeSrcTable tbody tr").removeClass('active');
        $(this).addClass('active');
        $("input[name=coupon_issued_target_id]").val($(this).attr("data-id"));

        $(".userModal").attr("style", "display:none");
    });
});
//상품 조회 모달
$(".productModalBtn").click(function(e){
	$('.dataListView').html();
	e.preventDefault();
	$(".productModal").attr("style", "display:block");
	$('body').css("overflow", "hidden");
	var dataList = commonAjaxListCall('POST','/Manager/CallStoreProductList');
	var html;
	$.each(dataList.getStoreProductList,function (key,value) {
		html +='' +
		'<tr data-cd="'+value.product_cd+'" data-id="'+value.product_name+'">' +
		'<td><div class="codeRadio"></div></td>' +
		'<td>'+(value.product_cd ? value.product_cd : '')+'</td>' +
		'<td>'+value.product_name+'</td>' +
		'<td>'+parseInt(value.product_payment).toLocaleString('en')+'</td>' +
		'</tr>';
	})
	$('.dataListView').html(html);
	
	//row클릭시 이벤트
	$(".codeSrcTable .sotreProductTable tr").on("click",function(){
		$(".codeSrcTable tbody tr").removeClass('active');
		$(this).addClass('active');
		$("input[name=product_cd]").val($(this).attr("data-cd"));
		$("input[name=product_name]").val($(this).attr("data-id"));
		
		$(".productModal").attr("style", "display:none");
	});
});
//업체 조회 모달
$(".storeModalBtn").click(function(e){
	$('.dataListView').html();
	e.preventDefault();
	$(".storeModal").attr("style", "display:block");
	$('body').css("overflow", "hidden");
	var dataList = commonAjaxListCall('POST','/Manager/CallStoreTargetList');
	var html;
	$.each(dataList.getStoreList,function (key,value) {
		html +='' +
		'<tr data-id="'+value.store_id+'">' +
		'<td><div class="codeRadio"></div></td>' +
		'<td>'+(value.store_id ? value.store_id : '')+'</td>' +
		'<td>'+value.store_name+'</td>' +
		'</tr>';
	})
	$('.dataListView').html(html);
	
	//row클릭시 이벤트
	$(".codeSrcTable .storeTable tr").on("click",function(){
		$(".codeSrcTable tbody tr").removeClass('active');
		$(this).addClass('active');
		$("input[name=target_store_id]").val($(this).attr("data-id"));
		
		$(".storeModal").attr("style", "display:none");
	});
});

//쿠폰다운
$(".couponDownBtn").click(function(){
	jQuery.ajax({
        type: 'POST',
        url: '/MyPage/downloadCoupon',
        data: "coupon_cd="+$(this).attr("data-id"),
        success: function (data) {
        	if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else if(data.success){
            	$.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 1000,
                    afterHidden: function () {
                        location.reload();
                    }
                });
            }
        	if(data.e){
        		alert("error");
        	}
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
})

//비회원 상품 qna
$(document).on("click","#productqna",function () {
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
    }else{
    	// $(this).prev().submit();
        window.open('/Popup/write-qna?product_cd='+product_cd,getMessageAjax('proQnatit'),'width=720, height=600,loaction=no,status=no,scrollbars=yes');
    }
})

//로그인시 아이디 저장
//회원가입 시 영향을 받는다 로그인페이지만 유효하도록 변경
$(function(){
    var key = getCookie("idSave");
    $("#id-input").val(key);

    if($("#id-input").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#saveid").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }

    $("#saveid").change(function(){ // 체크박스에 변화가 있다면,
        if($("#saveid").is(":checked")){ // ID 저장하기 체크했을 때,
           setCookie("idSave", $("#id-input").val(), 30); // 30일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
           deleteCookie("idSave");
        }
    });

    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#id-input").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#saveid").is(":checked")){ // ID 저장하기를 체크한 상태라면,
           setCookie("idSave", $("#id-input").val(), 30); // 30일 동안 쿠키 보관
        }
    });
});

function setCookie(cookieName, value, exdays){
   var exdate = new Date();
   exdate.setDate(exdate.getDate() + exdays);
   var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
   document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName){
   var expireDate = new Date();
   expireDate.setDate(expireDate.getDate() - 1);
   document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

function getCookie(cookieName) {
   cookieName = cookieName + '=';
   var cookieData = document.cookie;
   var start = cookieData.indexOf(cookieName);
   var cookieValue = '';
   if(start != -1){
       start += cookieName.length;
       var end = cookieData.indexOf(';', start);
       if(end == -1)end = cookieData.length;
       cookieValue = cookieData.substring(start, end);
   }
   return unescape(cookieValue);
}


//관리자 > 상품관리 > 경품리스트 > 일괄수정
function listGiveawayUpdate(column,update_value) {
    var formData = $('#defaultListForm').serialize()+'&column='+column+'&update_value='+update_value
    commonAjaxCall("POST","/Manager/giveawayListUpdate",formData);
}

//공유하기
var baseURL = window.location.protocol + "//" + window.location.host;
var share_url = "";
var share_title = "";
function share_giveaway(giveaway_id, name) {
    $('#share_link').val(baseURL + "/giveaway/giveawaydetail?giveaway_id=" + giveaway_id);
    share_url = baseURL + "/giveaway/giveawaydetail?giveaway_id=" + giveaway_id;
    share_title = name;
}
function share_product(product_cd, name) {
    $('#share_link').val(baseURL + "/product/productDetail?product_cd=" + product_cd);
    share_url = baseURL + "/product/productDetail?product_cd=" + product_cd;
    share_title = name;
}

$(document).on('click', '.share-ic', function(e){
    e.preventDefault();
    $('#sharePop').addClass('on');
}).on('click', '#sharePop .bg', function(){
    $('#sharePop').removeClass('on');
});

$(document).on('click', '.share', function(e){
    e.preventDefault();
    $('#sharePop').addClass('on');
}).on('click', '#sharePop .bg', function(){
    $('#sharePop').removeClass('on');
});

function copyURL() {
    var shareURL = document.getElementById("share_link");
    shareURL.value = share_url;

    shareURL.select();
    document.execCommand("copy");

    alert(getMessageAjax('msg.urlCopy'));
}

function snsSubmit(type, title) {
    if(type == 'fackbook'){
        title = share_title;
        SNS.facebook(share_url, title);
    }
    if(share_url.search("P") != -1){
        var product_cd = share_url.slice(-8);
    } else{
        var product_cd = share_url.slice(-2);
    }

    var formData = {"product_cd":product_cd,"name":title, "type": type};
    jQuery.ajax({
        type: 'POST',
        data: formData,
        url:'/layout/sns_share',
        success: function (data) {
            if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
                // loginAuth(data.access_token);
                $.toast({
                    text: "SUCCESS",
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success'
                });
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
}

var SNS  = {
    facebook: function (share_url, title) {
        link = encodeURIComponent(share_url);
        title = encodeURIComponent(title);

        var url = 'http://www.facebook.com/sharer.php?u=' + link + '&t=' + title;

        var newWindow = window.open("about:blank");
        newWindow.location.href=url;
    }
}

//선택 이미지 출력 및 파일명 노출
//부모의 형제 parent().siblings()
//형제 siblings()
$('.uploadBtn').on('change', function(object){
    var sel_file;
    var thisObject = $(this);
    var filename = thisObject.val().split('/').pop().split('\\').pop();
    var files = object.target.files;
    var filesArr =Array.prototype.slice.call(files);
    filesArr.forEach(function (f) {
        if(!f.type.match("image.*")){
            alert(getMessageAjax('msg_review_1-8-1'));
            return false;
        }
        sel_file = f;
        var reader = new FileReader();
        reader.onload = function (e) {
            var imgDisplayType ='copy';
            // if(imgDisplayType =="copy"){
            //     $('.uploadBtn').parent().siblings('img').attr("src",e.target.result);
            //     $('.uploadBtn').siblings('.fileName').val(filename);
            // }else{
                thisObject.parent().siblings('img').attr("src",e.target.result);
                thisObject.siblings('.fileName').val(filename);
            // }

        }
        reader.readAsDataURL(f);
    })
});

//입점업체 신청
$(document).on("click","#modalStoreAddProc",function () {
    if(!pwCheck){
        $('#password_cfValidation').html('* ' + getMessageAjax('error.sign.pwdcfMsg'));
        $('input[name=store_password]').focus();
        $("#password_cfValidation").removeClass("text-success");
        return;
    }
    var formData = new FormData($('#defaultForm')[0]);
    enableMenuArr = [];
    $.each($('input[name=enable_menu]'),function(idx, item){
        if($(this).prop("checked")) enableMenuArr.push($(this).val());
    });
    formData.set("enable_menu", enableMenuArr.join("|"));
    jQuery.ajax({
        type: 'POST',
        enctype: 'multipart/form-data',
        data: formData,
        processData: false, // 필수
        contentType: false, // 필수
        url:'/layout/modalStoreAddProc',
        success: function (data) {
            console.log(data.validateError)
            if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
                // loginAuth(data.access_token);
//                    location.href=data.redirectUrl;
                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 1000,
                    afterHidden: function () {
//                        	location.href=data.redirectUrl;
                        location.reload();
                    }
                });
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
})

var pwCheck = true;

var regExp = /^[a-zA-Z0-9]{6,20}$/;
//패스워드 체크
$(document).on('input','input[name=store_password],input[name=store_passwordCf]',function () {
    pwCheck = false;
    var pw = $('input[name=store_password]').val();
    var pw_cf = $('input[name=store_passwordCf]').val();
    if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
        $("#passwordValidation").text(" * " + getMessageAjax('error.sign.pwdpattern'));
        $("#passwordValidation").removeClass("text-success");
        $("#password_cfValidation").text('');
    }else{
        $("#passwordValidation").text('');
        if(pw != pw_cf){
            $("#password_cfValidation").text(" * " + getMessageAjax('error.sign.pwdDis'));
            $("#password_cfValidation").removeClass("text-success");
        }else{
            pwCheck = true;
            $("#password_cfValidation").text(" * " + getMessageAjax('msg.sign.pwdSuccess'));
            $("#password_cfValidation").addClass("text-success");
        }
    }
    if(!pw && !pw_cf) pwCheck = true;
})

//아이디중복체크
$(document).on("click","#modalstorIdDupCheck",function () {
    var formData = new FormData($('#defaultForm')[0]);
    jQuery.ajax({
        type: 'POST',
        enctype: 'multipart/form-data',
        data: formData,
        processData: false, // 필수
        contentType: false, // 필수
        url:'/layout/modalstoreIdDupCheck',
        success: function (data) {
            if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
                // loginAuth(data.access_token);
                $.toast({
                    text: "SUCCESS",
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success'
                });
                $('#store_id').attr("readonly",true);
                $('#modalstorIdDupCheck').attr('disabled', true);
                $('#modalstorIdDupCheck').html('OK');
                $('input[name=storIdDupCheck]').val('Y');
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
})
//사업자중복체크
$(document).on("click","#modalstorRegDupCheck",function () {
    var formData = new FormData($('#defaultForm')[0]);
    jQuery.ajax({
        type: 'POST',
        enctype: 'multipart/form-data',
        data: formData,
        processData: false, // 필수
        contentType: false, // 필수
        url:'/layout/modalstoreRegDupCheck',
        success: function (data) {
            if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
                // loginAuth(data.access_token);
                $.toast({
                    text: "SUCCESS",
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success'
                });
                $('#store_reg').attr("readonly",true);
                $('#modalstorRegDupCheck').attr('disabled', true);
                $('#modalstorRegDupCheck').html('OK');
                $('input[name=storRegDupCheck]').val('Y');
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
})

//상품제안 등록
$("button[name=proposal-confirm-btn]").click(function(){
	var proc = $(this).attr('data-id');
	var formData = new FormData($("#insertForm")[0]);
	jQuery.ajax({
        type: 'POST',
        enctype: 'multipart/form-data',
        data: formData,
        processData: false, // 필수
        contentType: false, // 필수
        url:'/Manager/'+proc+'Proposal',
        success: function (data) {
        	console.log(data);
        	if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + getMessageAjax('is2') + item;
                    }
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else if(data.success){
            	$.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 1000,
                    afterHidden: function () {
                        location.reload();
                    }
                });
            }
        	if(data.e){
        		alert("error");
        	}
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});

//상품제안 상세보기
$(".proposalDetailBtn, #proposalInsertBtn").click(function(){
	$(".storeModalBtn").show();
	$(".productModalBtn").show();
	
	if($(this).attr("data-id")){
		jQuery.ajax({
	        type: 'POST',
	        url: '/Manager/getProposalDetail',
	        data: "proposal_id="+$(this).attr("data-id"),
	        success: function (data) {
	        	console.log(data);
	        	var proposal = data.proposal;
	        	if(data.mySelf){
	        		$("#proposalTitle").text('수정');
	        		$("button[name=proposal-confirm-btn]").attr("data-id","update");
	        		$("button[name=proposal-confirm-btn]").text("수정");
	        		
	        		$.each(proposal,function(index, item){
		        		$("#insertForm input[name="+index+"]").val(item);
		        		$("#insertForm input[name="+index+"]").prop('readonly', false);
		        		$("#insertForm textarea[name="+index+"]").summernote('code', item);
		        		$("#insertForm textarea[name="+index+"]").summernote('enable');
		        	});
	        	}else{
	        		$("#proposalTitle").text('확인');
	        		$("button[name=proposal-confirm-btn]").attr("data-id","accept");
	        		$("button[name=proposal-confirm-btn]").text("수락");
	        		$(".storeModalBtn").hide();
	        		$(".productModalBtn").hide();
	        		
		        	$.each(proposal,function(index, item){
		        		$("#insertForm input[name="+index+"]").val(item);
		        		$("#insertForm input[name="+index+"]").prop('readonly', true);
		        		$("#insertForm textarea[name="+index+"]").summernote('code', item);
		        		$("#insertForm textarea[name="+index+"]").summernote('disable');
		        	});
	        	}
	        },
	        error: function (xhr, status, error) {
	            console.log(error,xhr,status );
	        },
	    });
	}else{
		$("#proposalTitle").text('등록');
		$("button[name=proposal-confirm-btn]").attr("data-id","insert");
		$("button[name=proposal-confirm-btn]").text("등록");
		
		$("#insertForm input").val("");
		$("#insertForm textarea[name=proposal_html]").summernote('code', "제안 상세 설명을 적어주세요.");
	}
});