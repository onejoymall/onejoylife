/*
* var formData = $('#   ').serialize();
* */
//옵션 리스트
$(document).on("click","#callOption",function () {
    var html='' +
        '<table class="table">' +
            '<thead><th>옵션코드</th><th>옵션명</th><th>옵션설명</th>' +
            '</thead>' +
            '<tbody>';
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/listOption',

        success: function (data) {
            // console.log(data.list);
            $('.default-modal').attr('style','display:block');
            $('.default-modal h2').html('상품 옵션');
            $.each(data.list, function (key, item) {
                html+='' +
                    '<td><button class="btn-default" type="button" id="mgOptionDetail" data-id="'+item.product_option_code+'" onclick="$(\'.default-modal\').attr(\'style\',\'display:block\');">선택</button>'+item.product_option_code+'</td>' +
                    '<td>'+item.product_option_name+'</td>' +
                    '<td>'+item.product_option_memo+'</td>' +
                    '';
            });
            html+='' +
                    '</tbody>' +
                '</table>';
            $('.default-modal .modal-body').html(html);
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
})
//옵션 상세보기
$(document).on("click","#mgOptionDetail",function () {
    $(".modal").attr("style", "display:block");
    var dataId = $(this).attr("data-id");
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/selectOption',
        data: {"product_option_code":dataId},
        success: function (data) {
            $.each(data.list, function (index, item) {
                $('input[name='+index+']').val(item);
                // if(index=='product_brand_use_yn' && item=='Y'){
                //     $('input:radio[name=product_brand_use_yn]').eq(0).click();
                // }
                // if(index=='product_brand_use_yn' && item=='N'){
                //     $('input:radio[name=product_brand_use_yn]').eq(1).click();
                // }
            });
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
})
//옵션 추가
$(document).on("click","#mgOptionAddSubmit",function () {
    var formData = $('#mgOptionAdd').serialize();
    jQuery.ajax({
        type: 'POST',
        data: formData,
        url:'/Manager/optionAddProc',
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
            alert("error");
        }
    });
})
//브랜드 상세보기
$(document).on("click","#mgBrandDetail",function () {
    $(".modal").attr("style", "display:block");
    var dataId = $(this).attr("data-id");
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/selectBrand',
        data: {"product_brand":dataId},
        success: function (data) {
            $.each(data.list, function (index, item) {
                $('input[name='+index+']').val(item);
                if(index=='product_brand_use_yn' && item=='Y'){
                    $('input:radio[name=product_brand_use_yn]').eq(0).click();
                }
                if(index=='product_brand_use_yn' && item=='N'){
                    $('input:radio[name=product_brand_use_yn]').eq(1).click();
                }
            });
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
})
//브랜드 추가
$(document).on("click","#mgBrandAddSubmit",function () {
    var formData = $('#mgBrandAdd').serialize();
    jQuery.ajax({
        type: 'POST',
        data: formData,
        url:'/Manager/brandAddProc',
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
            alert("error");
        }
    });
})
//회원등급 추가
$(document).on("click","#userGrantAddSubmit",function () {
    var formData = $('#userGrantAdd').serialize();
    jQuery.ajax({
        type: 'POST',
        data: formData,
        url:'/Manager/userGrantAddProc',
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
            alert("error");
        }
    });
})

//회원 권한 리스트 삭제
$('#mgUserGrantListSubmit').on("click",function(){
    var formData = $('#mgUserGrantList').serialize();
    var alertType;
    var showText;
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/ListDelete',
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
                location.href="/Manager/member-management";
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});
//회원정보 상세보기
$(document).on("click","#mgUserGrantListUpdateSubmit",function () {
    $(".modal2").attr("style", "display:block");
    var user_grant_no = $(this).attr("data-id");
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/selectUserGrant',
        data: {"user_grant_no":user_grant_no},
        success: function (data) {
            $.each(data.list, function (index, item) {
                $('input[name='+index+']').val(item);
            });
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
    });
})
//권한 변경
$(document).on("click","#gradeChange",function () {
    var formData = $('#defaultListForm').serialize();
    var alertType;
    var showText;
    jQuery.ajax({
        type: 'POST',
        url: '/Manager/userGrantListUpdate',
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
                location.href="/Manager/member-management";
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
})
