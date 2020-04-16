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

//장바구니 전체 선택
$(function(){
    $('#tr-ck1-1').click(function(){
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