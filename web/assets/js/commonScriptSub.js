//회원정보수정 약관동의
$(function() {
    $('#ch1').on('change', function () {
        $(this).parents('.r-sec2').find('input:checkbox').prop('checked', $(this).prop('checked'));
        if($(this).is(":checked")){
            $('#ch2').val('Y');
            $('#ch3').val('Y');
        } else {
            $('#ch2').val('N');
            $('#ch3').val('N');
        }
    })

    $('#ch2').click(function () {
        if($(this).is(":checked")){
            $(this).val('Y');
        } else {
            $(this).val('N');
        }
    })

    $('#ch3').click(function () {
        if($(this).is(":checked")){
            $(this).val('Y');
        } else {
            $(this).val('N');
        }
    })
})
//장바구니 전체 등록
function addAllShoppingBasket(product_cd) {
    var formData = $('#defaultForm').serialize();
    var alertType;
    var showText;
    jQuery.ajax({
        type: 'POST',
        data: formData,
        url:'/cart/addAllcart',
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
                    text: "장바구니 등록 완료",
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
                    icon: 'success'
                });
                // loginAuth(data.access_token);
                location.href=data.redirectUrl;
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
}

$(function(){
    $('#tr-ck1-1').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.lis-body input').prop('checked',true);
        else $('.lis-body input').prop('checked',false);
    });
});

//회원정보 상세보기
function defaultModalUSer (email){
    $(".modal1").attr("style", "display:block");
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/memberViewDetail',
        data: {"email":email},
        success: function (data) {
            $.each(data.list, function (index, item) {
                $('.' + index).html(item);
            });
        },
        error: function (xhr, status, error) {
            alert(error);
        },
    });
}