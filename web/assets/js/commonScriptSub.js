//회원정보수정 약관동의
$(function() {
    $('#ch1').on('change', function () {
        $(this).parents('.r-sec2').find('input:checkbox').prop('checked', $(this).prop('checked'));
    })
})

//장바구니 전체 등록
$('.addAllCart').on("click",function(){
    var formData = $('#defaultForm').serialize();
    var alertType;
    var showText;
    jQuery.ajax({
        type: 'POST',
        url: '/cart/addAllCart',
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
                        showText = index + " (은) " + item;
                    }
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
                $.toast({
                    heading: '등록 성공!',
                    text: [
                        '<a href="/MyPage/ShoppingBasket">장바구니 이동</a>',
                        '<a href="/">쇼핑 계속!</a>',
                    ],

                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
                    icon: 'success',
                    hideAfter: false,
                });
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});
//자주구매하는상품 장바구니 선택담기
$('.addChkCart').on("click",function(){
	product_cds = [];
    $.each($('input[name=chk]'),function(idx, item){
    	if($(this).prop("checked")) addShoppingBasket($(this).val());
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
                        showText = index + " (은) " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    var filter = "win16|win32|win64|macintel|mac|";
                    if(navigator.platform){
                        if(filter.indexOf(navigator.platform.toLowerCase()) < 0){
                            $.toast({
                                text: showText,
                                showHideTransition: 'plain', //펴짐
                                position: 'mid-center',
                                heading: 'Error',
                                icon: 'error'
                            });
                        } else {
                            $.toast({
                                text: showText,
                                showHideTransition: 'plain', //펴짐
                                position: 'top-right',
                                heading: 'Error',
                                icon: 'error'
                            });
                        }
                    }
                });

            } else {
                $.toast({
                	heading: '등록 성공!',
                    text: [
                        '<a href="/MyPage/ShoppingAddList">찜목록 이동</a>',
                        '<a href="/">쇼핑 계속!</a>',
                    ],

                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
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
                        showText = index + "는 (은) " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
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
                    position: 'top-right',
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
                        showText = index + "는 (은) " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
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
                        showText = index + "는 (은) " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
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
                        showText = index + "는 (은) " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
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
});

//배송지 수정 모달
$("#updateDeliveryInfo").click(function(){
    event.preventDefault();
    $(".modal2").attr("style", "display:block");
    var formData = $('#myDeliveryForm').serialize();
    jQuery.ajax({
        type: 'POST',
        url: '/MyPage/getDeliveryDetail',
        data: formData,
        success: function (data) {
        	$.each(data.deliveryInfo,function(index, item){
        		$(`input[name=${index}]`).val(item);
        		if(index=="delivery_user_phone" || index=="delivery_user_tel"){
        			var number = item.split("-");
        			['a','b','c'].forEach(function(el,idx){
        				$(`input[name=${index}_${el}]`).val(number[idx]);
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
                        showText = index + "는 (은) " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
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
                        showText = index + "는 (은) " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });
            }else{
                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
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
        	$.each(data.delivery,function(index, item){
        		if(index != "order_no"){
        			$(`input[name=${index}]`).val(item);
        		}
        		if(index=="delivery_user_phone" || index=="delivery_user_tel"){
        			var number = item.split("-");
        			['a','b','c'].forEach(function(el,idx){
        				$(`input[name=${index}_${el}]`).val(number[idx]);
        			});
        		}
        	});
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
});
$(".sec2-ov>p>label:eq(0)").trigger("click");

//관리자 쿠폰 등록
$("#coupon-insert-btn").click(function(){
	var formData = new FormData($("#insertForm")[0]);
	jQuery.ajax({
        type: 'POST',
        enctype: 'multipart/form-data',
        data: formData,
        processData: false, // 필수
        contentType: false, // 필수
        url:'/manager/insertCoupon',
        success: function (data) {
        	if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + " (은) " + item;
                    }
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
            	$.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
                    icon: 'success',
                    hideAfter: 2000,
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
