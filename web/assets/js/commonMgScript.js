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
    // $(".modal").attr("style", "display:block");
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
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
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
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
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
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
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
                        position: 'bottom-right',
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
                        position: 'bottom-right',
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

//회원관리 - 메일보내기
$(document).on("click","#sendmail",function () {
    $('.loading-bar-wrap').removeClass("hidden");
	var formData = $("#member-sendmail").serialize();
	jQuery.ajax({
		type:"GET",
		url:"/Manager/authemail",
		data:formData,

		success : function(data) {
			// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			// TODO
			console.log(data);
			if(data.validateError){
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
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error',
                    });
				});
			} else {
                if (data.success) {
                	alert("처리되었습니다.");
                	self.close();
                	location.reload();
                } else{
            		$.toast({
                        text: "ERROR",
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error',
                    });
                }
            }
		},

		complete : function(data) {
            $('.loading-bar-wrap').addClass("hidden");
            $(".modal4").attr("style", "display:none");
		},
		error : function(xhr, status, error) {
			console.log(xhr+status+error);
		}
	});
})

//회원관리 - SMS 보내기
$(document).on("click","#sendsms",function () {
    $('.loading-bar-wrap').removeClass("hidden");
	var formData = $("#member-sms").serialize();
	jQuery.ajax({
		type:"POST",
		url:"/Manager/sendsms",
		data:formData,

		success : function(data) {
			// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			// TODO
			console.log(data);
			if(data.validateError){
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
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error',
                    });
				});
			} else {
                if (data.success) {
                	alert("처리되었습니다.");
                	self.close();
                	location.reload();
                } else{
            		$.toast({
                        text: "ERROR",
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error',
                    });
                }
            }
		},

		complete : function(data) {
            $('.loading-bar-wrap').addClass("hidden");
            $(".modal5").attr("style", "display:none");
		},
		error : function(xhr, status, error) {
			console.log(xhr+status+error);
		}
	});
})

// 배송비 구분 선택 박스 변경 시
$(document).on("change","#shipping-fee",function(){
	var shipR='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>배송비 <input class="onlyNumber" class="onlyNumber" type="text" id="product_delivery_payment" name="product_delivery_payment"> 원을 고정적으로 부과함.</td></tr>';
    var shipM='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td><p class="cc2">구매 금액이 30,000원 미만일 때 배송비 2,500원을 부과하려면 30000|2500 입력</p><input class="onlyNumberAndPipe" type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 30000|2500"></td></tr>';
    var shipD='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">20,000원 이상~30,000원 미만일 때 배송비 2,000원을 부과하고 30,000원 이상~50,000원 미만일 때 배송비 1,000원을 부과하려면<br>20000|30000|2000//30000|50000|1000 입력</p><input class="onlyNumberAndPipe" type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 20000|30000|2000//30000|50000|1000"></td></tr>';
    var shipW='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">3kg 이상~5kg 미만일 때 배송비 2,000원을 부과하고 5kg 이상~7kg 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input class="onlyNumberAndPipe" type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000"></td></tr>';
    var shipC='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">3개 이상~5개 미만일 때 배송비 2,000원을 부과하고 5개 이상~7개 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input class="onlyNumberAndPipe" type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000"></td></tr>';
    var shipN='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>주문 금액에 상관 없이 수량에 따라 배송료 <input class="onlyNumber" type="text" id="product_delivery_payment" name="product_delivery_payment">원을 부과함.</td></tr>';

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
    $('.shippingFee-detail-wrap').attr('style','display:table-row');

    validationNumber();
});
//기본 배송 설정 클릭
$(document).on("click",'.goods-shipping',function(){
    if($(this).val()=="F"){
        var data = commonAjaxListCall("post","/Manager/getDefaultDelivery","");
        var product_delivery_payment =data.list.product_delivery_payment;
        var product_delivery_payment_class = data.list.product_delivery_payment_class;
        $('.changeDeliveryTr').remove();

        $.each(data.list,function (key,value) {
            $('input:text[name="'+key+'"]').val(value);
            $('input:radio[name="'+key+'"][value=\''+value+'\']').prop('checked',true);
            $('select[name='+key+']').val(value);
        })
        callDelivery(product_delivery_payment_class,product_delivery_payment);
    }
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
            alert("이미지파일만 등록 가능합니다.");
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
$('.uploadBtnVideo').on('change', function(object){
    var sel_file;
    var thisObject = $(this);
    var filename = thisObject.val().split('/').pop().split('\\').pop();
    console.log(object.target);
    var files = object.target.files;
    var filesArr =Array.prototype.slice.call(files);
    var maxSize = 100 * 1024 * 1024;
    filesArr.forEach(function (f) {
    	if(files[0].size > maxSize){
    		alert("크기 100MB 미만의 파일만 등록 가능합니다.");
            return false;
    	}
        if(!f.type.match("video.*")){
            alert("동영상파일만 등록 가능합니다.");
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
$('.uploadBtnExcel').on('change', function(object){
    var sel_file;
    var thisObject = $(this);
    var filename = thisObject.val().split('/').pop().split('\\').pop();
    var files = object.target.files;
    var filesArr =Array.prototype.slice.call(files);
    filesArr.forEach(function (f) {
        if(!filename.match(/^.+\.xlsx?$/)){
            alert("엑셀파일만 등록 가능합니다.");
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

$(".basicNoToolbar").summernote({
    height: 100,
    toolbar: false,
    placeholder: 'type with apple, orange, watermelon and lemon',
    hint: {
        words: ['apple', 'orange', 'watermelon', 'lemon'],
        match: /\b(\w{1,})$/,
        search: function (keyword, callback) {
            callback($.grep(this.words, function (item) {
                return item.indexOf(keyword) === 0;
            }));
        }
    }
});

//지역별 배송비 사용설정
$("input[name=product_delivery_area_yn]").click(function(){
	$.ajax({
		url: "/Manager/updateDeliveryArea",
		method: "post",
		data: "product_delivery_area_yn="+$(this).val(),
		success:function(data){
			if(data.success){
				$.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'bottom-right',
                    icon: 'success',
                    hideAfter: 500,
                    afterHidden: function () {
                        location.reload();
                    }
                });
			}
		},
		error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
	});
});

//지역별 배송비 등록
$("#areaInsertBtn").click(function(){
	var formData = $('#defaultForm').serialize();
	$.ajax({
		url: "/Manager/insertDeliveryArea",
		method: "post",
		data: formData,
		success:function(data){
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
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            }
			if(data.success){
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
		},
		error: function (xhr, status, error) {
            console.log(error,xhr,status );
        },
	});
});

//상품정보고시 + x
$(document).on('click', '.product_definition_add_btn', function(){
	var html = '<p class="product_definition">' +
                    '<input type="text" name="product_definition_key" placeholder="ex) 에너지소비효율등급">' +
                    '<input type="text" name="product_definition_value" placeholder="ex) 3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음">' +
                    '<button type="button" class="goods-list-btn product_definition_add_btn">+</button>' +
                    '<button type="button" class="goods-list-btn redBtn product_definition_del_btn">x</button>' +
                '</p>';
	$(this).parent().after(html);
});
$(document).on('click', '.product_definition_del_btn', function(){
	if($('.product_definition_del_btn').length > 1){
		$(this).parent().remove();
	}
});
$(document).on('click', '.giveaway_definition_add_btn', function(){
	var html = '<p class="giveaway_definition">' +
                    '<input type="text" name="giveaway_definition_key" placeholder="ex) 에너지소비효율등급">' +
                    '<input type="text" name="giveaway_definition_value" placeholder="ex) 3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음">' +
                    '<button type="button" class="goods-list-btn giveaway_definition_add_btn">+</button>' +
                    '<button type="button" class="goods-list-btn redBtn giveaway_definition_del_btn">x</button>' +
                '</p>';
	$(this).parent().after(html);
});
$(document).on('click', '.giveaway_definition_del_btn', function(){
	if($('.giveaway_definition_del_btn').length > 1){
		$(this).parent().remove();
	}
});

//상품정보고시 모달버튼
$(document).on("click",".definitionModalBtn",function () {
	var id = $(this).attr("data-id");
	var text = '';
	var html = '<p class="cc2">상품 필수정보에 들어가는정보입니다. <a>※쉼표(,) 사용금지</a></p>';
	$("input[name=product_definition_id]").val('');
	
	if(id){
		text = "수정";
		$(".definitionInsertUpdateBtn").attr("data-id","update");
		var detail = commonAjaxListCall("post","/Manager/definitionDetail",{"product_definition_id": id}).list;
		
		var keys = detail['product_definition_key'].split(",");
    	var vals = detail['product_definition_value'].split(",");
    	keys.forEach(function(el, idx){
    		html += '<p class="product_definition">' +
                        '<input type="text" name="product_definition_key" placeholder="ex) 에너지소비효율등급" value="' + keys[idx] + '">' +
                        '<input type="text" name="product_definition_value" placeholder="ex) 3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음" value="' + vals[idx] + '">' +
                        '<button type="button" class="goods-list-btn product_definition_add_btn">+</button>' +
                        '<button type="button" class="goods-list-btn redBtn product_definition_del_btn">x</button>' +
                    '</p>';
    	});
    	
    	if(detail.up_up_code){
    		$(".category1").val(detail.up_up_code).trigger("change");
    		setTimeout(function(){
    			$(".category2").val(detail.up_code).trigger("change");
    			setTimeout(function(){
    				$(".category3").val(detail.cur_code).trigger("change");
    			},50);
			},50);
    	}else if(detail.up_code){
    		$(".category1").val(detail.up_code).trigger("change");
    		setTimeout(function(){
    			$(".category2").val(detail.cur_code).trigger("change");
    		},50);
    	}else{
    		$(".category1").val(detail.cur_code).trigger("change");
    	}
    	
    	$("input[name=product_definition_id]").val(detail.product_definition_id);
	}else{
		text = "등록";
		$(".definitionInsertUpdateBtn").attr("data-id","insert");
		html += '<p class="product_definition">' +
		            '<input type="text" name="product_definition_key" placeholder="ex) 에너지소비효율등급">' +
		            '<input type="text" name="product_definition_value" placeholder="ex) 3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음">' +
		            '<button type="button" class="goods-list-btn product_definition_add_btn">+</button>' +
		            '<button type="button" class="goods-list-btn redBtn product_definition_del_btn">x</button>' +
		        '</p>';
		$(".category1").val('').trigger("change");
	}
	
	$(".product_definition_td").html(html);
	$("#definitionModalTitle").text(text);
	$("#definitionModalBtnSpan").text(text);
});

//상품정보고시 등록&수정
$(document).on("click",".definitionInsertUpdateBtn",function () {
	var isDefinitionCheck = false;
	$(".product_definition").each(function(el){
	    $(this).children('input').each(function(el){
	        if(!$(this).val()) isDefinitionCheck = true;
	    })
	});
	
	if(isDefinitionCheck) {
        $.toast({
            text: "상품정보고시 는(은) 필수항목입니다",
            showHideTransition: 'plain', //펴짐
            position: 'bottom-right',
            heading: 'Error',
            icon: 'error'
        });
		return;
	}
	
	var type = $(this).attr("data-id");
	var formData =  $("#mgDefinitionForm").serialize();
	console.log('/Manager/'+type+"Definition");
	commonAjaxCall('post','/Manager/'+type+"Definition",formData);
});

$(document).on("click","#taxInvoceSendBtn",function () {

	var formData = $("#taxInvoiceForm").serialize();
	
	jQuery.ajax({
        type: 'post',
        url: "/api/taxInvoice",
        data:formData,
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
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                });

            } else {
            	if (data.success){
            		alert("처리되었습니다.");
            		self.close();
            	}else{
            		$.toast({
                        text: "ERROR",
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error'
                    });
            	}
            }
        },
        error: function (e){
        	console.log(e);
        }
    });
});