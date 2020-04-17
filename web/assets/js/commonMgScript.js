/*
* var formData = $('#   ').serialize();
*
* $(document).on("click","",function () {

})
*
* */

//선택 상품준비중처리
$(document).on("click","#productReadySubmit",function () {
    var formData = $('#defaultListForm').serialize()+'&payment_status=I';
    commonAjaxCall("post","/Manager/paymentStatusUpdate",formData)
})
//선택 배송준비중처리
$(document).on("click","#deliveryReadySubmit",function () {
    var formData = $('#defaultListForm').serialize()+'&payment_status=D';
    commonAjaxCall("post","/Manager/paymentStatusUpdate",formData)
})
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
                    '<tr>' +
                    '<td><button class="btn-default" type="button" id="mgOptionDetail" data-id="'+item.product_option_code+'" onclick="$(\'.default-modal\').attr(\'style\',\'display:none\');">선택</button>'+item.product_option_code+'</td>' +
                    '<td>'+item.product_option_set_name+'</td>' +
                    '<td>'+item.product_option_memo+'</td>' +
                    '</tr>';
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

//기본배송관련 스크립트
$(document).on("change","#shipping-fee",function(){
    var shipR='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>배송비 <input type="text" id="product_delivery_payment" name="product_delivery_payment"> 원을 고정적으로 부과함.</td></tr>';
    var shipM='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td><p class="cc2">구매 금액이 30,000원 미만일 때 배송비 2,500원을 부과하려면 30000|2500 입력</p><input type="text" id="shippingFee-detail" name="product_delivery_payment" placeholder="ex) 30000|2500"></td></tr>';
    var shipD='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">20,000원 이상~30,000원 미만일 때 배송비 2,000원을 부과하고 30,000원 이상~50,000원 미만일 때 배송비 1,000원을 부과하려면<br>20000|30000|2000//30000|50000|1000 입력</p><input type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 20000|30000|2000//30000|50000|1000"></td></tr>';
    var shipW='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">3kg 이상~5kg 미만일 때 배송비 2,000원을 부과하고 5kg 이상~7kg 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000"></td></tr>';
    var shipC='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">3개 이상~5개 미만일 때 배송비 2,000원을 부과하고 5개 이상~7개 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000"></td></tr>';
    var shipN='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>주문 금액에 상관 없이 수량에 따라 배송료 <input type="text" id="product_delivery_payment" name="product_delivery_payment">원을 부과함.</td></tr>';

    if($('select[name=product_delivery_payment_class]').val() == "R"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipR);
    }else if($('select[name=product_delivery_payment_class]').val() == "M"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipM);
    }else if($('select[name=product_delivery_payment_class]').val() == "D"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipD);
    }else if($('select[name=product_delivery_payment_class]').val() == "W"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipW);
    }else if($('select[name=product_delivery_payment_class]').val() == "C"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipC);
    }else if($('select[name=product_delivery_payment_class]').val() == "N"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipN);
    }else if($('select[name=product_delivery_payment_class]').val() == "T"){
        $('.shippingFee-detail-wrap').remove();
    }
    $('.shippingFee-detail-wrap').removeClass("shippingFee-detail-wrap");
});
//배송비
$(document).on("click",'.goods-shipping',function(){
    if($(this).val() == "T"){
        $('tr.shipping-t-detail').removeClass('hidden');
        $('tr.shipping-f-detail input').val('');
    }else{
        $('tr.shipping-t-detail').addClass('hidden');
        $('tr.shipping-t-detail input').val('');
    }
});
//기본배송 정보 저장
$(document).on("click","#systemDeliveryFormSubmit",function () {
    var formData = $('#defaultForm').serialize();
    commonAjaxCall("POST","/Save/systemDelivery",formData);
})
