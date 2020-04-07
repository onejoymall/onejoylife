/*
* var formData = $('#   ').serialize();
* */
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
