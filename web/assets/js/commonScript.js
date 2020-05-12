//결과 후 페이지 이동시
function commonAjaxCall(type,url,formData){
    jQuery.ajax({
        type: type,
        url: url,
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
                    hideAfter: 1000,
                    afterHidden: function () {
                        location.href = data.redirectUrl;
                    }
                });
            }
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        }
    });
}
//목록형또는 결과만 사용할경우
function commonAjaxListCall(type,url,formData){
    var alertType;
    var showText;
    var hideAfterType;
    var dataList = $.ajax({
        type: type,
        url: url,
        data:formData,
        async: false,
        success: function (data) {

            if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {

                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else if(index == "Info"){
                        alertType = "info";
                        showText = index + " (은) " + item;
                        hideAfterType=false;
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
                        icon: alertType,
                        hideAfterType: hideAfterType,
                    });
                });
            }
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        }
    }).responseText;
    return JSON.parse(dataList);
}
//자주구매하는 상품 결제
$(document).on("click",".favoriteSubmit",function () {
    if(isLogin==''){
        $.toast({
            heading: '비회원 주문 중입니다.',
            text: [
                '<a href="/sign/login">로그인 후 이용</a>',
                '<a href="/sign/signup">회원 가입 후 이용</a>',
                '<a href="#" onclick="$(this).prev().submit();">비 회원 주문</a>',
            ],
            showHideTransition: 'plain', //펴짐
            position: 'top-right',
            icon: 'info',
            hideAfter: false
        });
    }else{
    	$(this).prev().submit();
    }
})

//비회원 결제
$(document).on("click","#paymentSubmit",function () {

    var order = $('input[name=payment_order_quantity]').val();
    var max = $('input[name=order_max]').val();
    var min = $('input[name=order_min]').val();

    if(max != 0){
        if (order < min || order > max ) {
            $.toast({
                text: '최대/최소 주문 수량을 확인하세요.',
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error',
                stack: false
            });
        } else if(isLogin==''){
            $.toast({
                heading: '비회원 주문 중입니다.',
                text: [
                    '<a href="/sign/login">로그인 후 이용</a>',
                    '<a href="/sign/signup">회원 가입 후 이용</a>',
                    '<a href="#" onclick="$(\'#defaultForm\').submit();">비 회원 주문</a>',
                ],
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                icon: 'info',
                hideAfter: false
            });
        }else{
            $('#defaultForm').submit();
        }
    } else {
        if(isLogin==''){
            $.toast({
                heading: '비회원 주문 중입니다.',
                text: [
                    '<a href="/sign/login">로그인 후 이용</a>',
                    '<a href="/sign/signup">회원 가입 후 이용</a>',
                    '<a href="#" onclick="$(\'#defaultForm\').submit();">비 회원 주문</a>',
                ],
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                icon: 'info',
                hideAfter: false
            });
        }else{
            $('#defaultForm').submit();
        }
    }
})
//찜
$('.favorite').click(function(){
    $(this).children('i').toggleClass('heart-full');

    jQuery.ajax({
        type: 'POST',
        data: {"product_cd":$(this).attr("data-id")},
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
                    text: "등록 완료",
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
});
//상품구매수량 변경
$('.minus').click(function () {
    var data =  $("input[name=payment_order_quantity]");
    data.val(Number(data.val())-1);
    $('.number').html(data.val());
});
$('.plus').click(function () {
    var data =  $("input[name=payment_order_quantity]");
    data.val(Number(data.val())+1);
    $('.number').html(data.val());
});

//날짜 지정
function setDatepickerToday(datepicker,mt,dt) { var d = new Date(); datepicker.datepicker("setDate", new Date(d.getFullYear(), d.getMonth()+mt, d.getDate()+dt) ); }
$(document).on("click",".ra-num",function () {
    $('.ra-num').removeClass("on");
    $(this).addClass("on");
    if($(this).attr("data-id")=="con1"){
        setDatepickerToday($('input[name=start_date]'),0,0);
        setDatepickerToday($('input[name=end_date]'),0,0);
    }
    if($(this).attr("data-id")=="con2"){
        setDatepickerToday($('input[name=start_date]'),0,-7);
        setDatepickerToday($('input[name=end_date]'),0,0);
    }
    if($(this).attr("data-id")=="con3"){
        setDatepickerToday($('input[name=start_date]'),-1,0);
        setDatepickerToday($('input[name=end_date]'),0,0);
    }
    if($(this).attr("data-id")=="con4"){
        setDatepickerToday($('input[name=start_date]'),-3,0);
        setDatepickerToday($('input[name=end_date]'),0,0);
    }
    if($(this).attr("data-id")=="con5"){
        setDatepickerToday($('input[name=start_date]'),-6,0);
        setDatepickerToday($('input[name=end_date]'),0,0);
    }
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
//관리자 카테고리 관리
    // 카테고리 선택
    function selectCategory(category_id){
        //데이터 초기화

        $('input[name=pd_category_id]').val(category_id);
        $('input[name=pd_category_upper_code]').val(category_id);
        $('input[name=pd_category_name_add]').attr('placeholder','카테고리선택');

        $('input:radio[name=pd_cagetory_use_yn]').eq(1).click();
        $('input:radio[name=pd_category_main_view]').eq(1).click();
        $('input:radio[name=pd_category_main_view_sp]').eq(1).click();
        $('input:radio[name=pd_category_event_use_yn]').eq(1).click();
        $('input:radio[name=banner_use_yn]').eq(1).click();
        $('input:radio[name=event_use_yn]').eq(1).click();
        $('input[name=pd_category_event_title]').val('');
        $('input[name=pd_category_event_memo]').val('');
        $('input[name=pd_category_event_start]').val('');
        $('input[name=pd_category_event_end]').val('');
        $('input[name=pd_category_name]').val('');
        $('input[name=banner_title]').val('');
        $('input[name=banner_memo]').val('');
        $('input[name=banner_start_date]').val('');
        $('input[name=banner_end_date]').val('');
         $('input[event_title]').val('');
         $('input[event_memo]').val('');
         $('input[event_start_date]').val('');
         $('input[event_end_date]').val('');
        $('.file_link').attr('src','');
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/productCategorySelect',
            data: {'pd_category_id':category_id},
            success: function (data) {

               var categorySelect = data.categorySelect;
                console.log(categorySelect);
                $('input[name=manager_name]').val(categorySelect.manager_name);
                $('input[name=pd_category_name]').val(categorySelect.pd_category_name);
                $('input[name=pd_category_name_add]').attr('placeholder',categorySelect.pd_category_name+' 하위 분류')

                $('#product_cnt').html(categorySelect.product_cnt);

                $('input[name=pd_category_event_title]').val(categorySelect.pd_category_event_title);
                $('input[name=pd_category_event_memo]').val(categorySelect.pd_category_event_memo);
                $('input[name=pd_category_event_start]').val(categorySelect.pd_category_event_start);
                $('input[name=pd_category_event_end]').val(categorySelect.pd_category_event_end);

                $('input[name=banner_title]').val(categorySelect.banner_title);
                $('input[name=banner_memo]').val(categorySelect.banner_memo);
                $('input[name=banner_start_date]').val(categorySelect.banner_start_date);
                $('input[name=banner_end_date]').val(categorySelect.banner_end_date);

                $('input[name=event_title]').val(categorySelect.event_title);
                $('input[name=event_memo]').val(categorySelect.event_memo);
                $('input[name=event_start_date]').val(categorySelect.event_start_date);
                $('input[name=event_end_date]').val(categorySelect.event_end_date);

                $('input:radio[name=pd_category_event_use_yn][value=\''+categorySelect.pd_category_event_use_yn+'\']').prop("checked",true);
                $('input:radio[name=banner_use_yn][value=\''+categorySelect.banner_use_yn+'\']').prop("checked",true);
                $('input:radio[name=event_use_yn][value=\''+categorySelect.event_use_yn+'\']').prop("checked",true);

                $('.file_link').attr('src',categorySelect.file_link);
                $('.file_link2').attr('src',categorySelect.file_link2);
                $('.file_link3').attr('src',categorySelect.file_link3);
                $('.file_link4').attr('src',categorySelect.file_link4);
                $('.file_link5').attr('src',categorySelect.file_link5);

            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });

    }
    //카테고리 등록 및 업데이트
    function addCategory(categoryUpperCd,category_name) {

        var pd_category_upper_code= $('input[name=pd_category_upper_code]').val();
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/productCategoryAddProc',
            data: {'pd_category_upper_code': categoryUpperCd, 'pd_category_name': category_name,'pd_category_upper_code':pd_category_upper_code},
            success: function (data) {
                if (data.validateError) {
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
                            position: 'top-left',
                            heading: 'Error',
                            icon: 'error'
                        });
                    });
                }else {
                    $.toast({
                        text: 'Registering ......',
                        showHideTransition: 'plain', //펴짐
                        position: 'top-left',
                        icon: 'info',
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
    }
    //카테고리 기획전 등록
    $(document).on("click","#formCtegorySubmit",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/productCategoryDisplayProc',
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
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    //카테고리 삭제
    function deleteCategory() {
        var category_id = $('input[name=pd_category_id]').val();
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/productCategoryDeleteProc',
            data: {'pd_category_id': category_id},
            success: function (data) {
                if (data.validateError) {
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
                            position: 'top-left',
                            heading: 'Error',
                            icon: 'error'
                        });
                    });
                }else{
                    $.toast({
                        text: 'Deleting ......',
                        showHideTransition: 'plain', //펴짐
                        position: 'top-left',
                        hideAfter: 2000,
                        afterHidden: function () {
                            location.href=data.redirectUrl;
                        }
                    });
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    }
    //메인화면 MD
    function mdSlideCategorySelect(category_id,mainViewType){
        selectedList.reloadSlider();
        $('.selected-list').html();
            var html='';
        jQuery.ajax({
            type: 'POST',
            url: '/product/mainList',
            data: {'product_ct':category_id,'mainViewType':mainViewType},
            success: function (data) {

                if(data.mdSlideCategorySelect){

                    $.each(data.mdSlideCategorySelect, function (index,productList) {
                        html+='' +
                            ' <li>\n' +
                            '     <a href="/product/productDetail?product_cd='+productList.product_cd+'">\n' +
                            '         <div class="img-box">\n' +
                            '             <img src="'+productList.file_1+'" onerror="this.src=\'http://placehold.it/190x190\'" height="190">\n' +
                            '             <i class="share-ic"></i>\n' +
                            '         </div>\n' +
                            '         <div class="product-info">\n' +
                            '             <p class="info-production">'+productList.product_made_company_name+'</p>\n' +
                            '             <p class="info-product-name">'+productList.product_name+'</p>\n' +
                            '             <p class="info-price"><span class="price-before">\n' +
                            '                '+productList.product_user_payment+'원</span>\n' +
                            '                 <i class="right-arrow"></i>'+productList.product_payment+'원</p>\n' +
                            '             <p class="info-score">\n' +
                            '                 <i class="star-ic"></i>\n' +
                            '                 <span class="score-number">4.5</span>\n' +
                            '                 <span class="score-text">5,324개 평가</span>\n' +
                            '             </p>\n' +
                            '         </div>\n' +
                            '     </a>\n' +
                            ' </li>' +
                            '';

                    });
                    $('.selected-list').html(html);
                    selectedList.reloadSlider();
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
//슬라이더 선언

    }
    //메인화면 카테고리
    function categorySlideCategorySelect(category_id){
            selectedList.reloadSlider();
            $('.category-list').html();
            var html='';
            jQuery.ajax({
                type: 'POST',
                url: '/product/mainList',
                data: {'product_ct':category_id},
                success: function (data) {

                    if(data.mdSlideCategorySelect){

                        $.each(data.mdSlideCategorySelect, function (index,productList) {
                            html+='' +
                                ' <li>\n' +
                                '     <a href="/product/productDetail?product_cd='+productList.product_cd+'">\n' +
                                '         <div class="img-box">\n' +
                                '             <img src="'+productList.file_1+'" onerror="this.src=\'http://placehold.it/190x190\'" height="190">\n' +
                                '             <i class="share-ic"></i>\n' +
                                '         </div>\n' +
                                '         <div class="product-info">\n' +
                                '             <p class="info-production">'+productList.product_made_company_name+'</p>\n' +
                                '             <p class="info-product-name">'+productList.product_name+'</p>\n' +
                                '             <p class="info-price"><span class="price-before">\n' +
                                '                '+productList.product_user_payment+'원</span>\n' +
                                '                 <i class="right-arrow"></i>'+productList.product_payment+'원</p>\n' +
                                '             <p class="info-score">\n' +
                                '                 <i class="star-ic"></i>\n' +
                                '                 <span class="score-number">4.5</span>\n' +
                                '                 <span class="score-text">5,324개 평가</span>\n' +
                                '             </p>\n' +
                                '         </div>\n' +
                                '     </a>\n' +
                                ' </li>' +
                                '';

                        });
                        $('.category-list').html(html);
                        categoryList.reloadSlider();
                    }
                },
                error: function (xhr, status, error) {
                    alert("error");
                }
            });
        //슬라이더 선언

        }
//관리자 카테고리 관리 end
    //공통 리스트 삭제
    $('.commonlistDelete').on("click",function(){
        var formData = $('#defaultForm').serialize();
        var alertType;
        var showText;
        jQuery.ajax({
            type: 'POST',
            url: '/MyPage/commonListDelete',
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
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    });
    //장바구니 삭제
    $(document).on("click","button.x",function(){
        var product_cd = $(this).attr("data-id");
        jQuery.ajax({
            type: 'POST',
            data: {"product_cd":product_cd},
            url:'/cart/deletecart',
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
                        text: "장바구니 삭제 완료",
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        // heading: 'Error',
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
    });
    //장바구니 등록
    function addShoppingBasket(product_cd) {
        var formData = 'product_cd='+product_cd+"&"+$('#defaultForm').serialize();
        var filter = "win16|win32|win64|macintel|mac|";
        var order = $('input[name=payment_order_quantity]').val();
        var max = $('input[name=order_max]').val();
        var min = $('input[name=order_min]').val();
        if(max != 0) {
            if (order < min || order > max) {
                if(navigator.platform){
                    if(filter.indexOf(navigator.platform.toLowerCase()) < 0) {
                        $.toast({
                            text: '최대/최소 주문 수량을 확인하세요.',
                            showHideTransition: 'plain', //펴짐
                            position: 'mid-center',
                            heading: 'Error',
                            icon: 'error',
                            stack: false
                        });
                    } else {
                        $.toast({
                            text: '최대/최소 주문 수량을 확인하세요.',
                            showHideTransition: 'plain', //펴짐
                            position: 'top-right',
                            heading: 'Error',
                            icon: 'error',
                            stack: false
                        });
                    }
                }
            } else {
                jQuery.ajax({
                    type: 'POST',
                    data: formData,
                    url:'/cart/addcart',
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
                                if(navigator.platform){
                                    if(filter.indexOf(navigator.platform.toLowerCase()) < 0){
                                        // $.toast().reset('all');//토스트 초기화
                                        $.toast({
                                            text: showText,
                                            showHideTransition: 'plain', //펴짐
                                            position: 'mid-center',
                                            heading: 'Error',
                                            icon: 'error'
                                        });
                                    } else {
                                        // $.toast().reset('all');//토스트 초기화
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

                            if(filter.indexOf(navigator.platform.toLowerCase()) < 0) {
                                $.toast({
                                    heading: '등록 성공!',
                                    text: [
                                        '<a href="/MyPage/ShoppingBasket">장바구니 이동</a>',
                                        '<a href="">쇼핑 계속!</a>',
                                    ],

                                    showHideTransition: 'plain', //펴짐
                                    position: 'mid-center',
                                    icon: 'success',
                                    hideAfter: false,
                                });
                            } else {
                                $.toast({
                                    heading: '등록 성공!',
                                    text: [
                                        '<a href="/MyPage/ShoppingBasket">장바구니 이동</a>',
                                        '<a href="">쇼핑 계속!</a>',
                                    ],

                                    showHideTransition: 'plain', //펴짐
                                    position: 'top-right',
                                    icon: 'success',
                                    hideAfter: false,
                                });
                            }
                            // loginAuth(data.access_token);
                            // location.href=data.redirectUrl;
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("error");
                    }
                });
            }
        } else {
            jQuery.ajax({
                type: 'POST',
                data: formData,
                url:'/cart/addcart',
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
                            if(navigator.platform){
                                if(filter.indexOf(navigator.platform.toLowerCase()) < 0){
                                    // $.toast().reset('all');//토스트 초기화
                                    $.toast({
                                        text: showText,
                                        showHideTransition: 'plain', //펴짐
                                        position: 'mid-center',
                                        heading: 'Error',
                                        icon: 'error'
                                    });
                                } else {
                                    // $.toast().reset('all');//토스트 초기화
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

                        if(filter.indexOf(navigator.platform.toLowerCase()) < 0) {
                            $.toast({
                                heading: '등록 성공!',
                                text: [
                                    '<a href="/MyPage/ShoppingBasket">장바구니 이동</a>',
                                    '<a href="">쇼핑 계속!</a>',
                                ],

                                showHideTransition: 'plain', //펴짐
                                position: 'mid-center',
                                icon: 'success',
                                hideAfter: false,
                            });
                        } else {
                            $.toast({
                                heading: '등록 성공!',
                                text: [
                                    '<a href="/MyPage/ShoppingBasket">장바구니 이동</a>',
                                    '<a href="">쇼핑 계속!</a>',
                                ],

                                showHideTransition: 'plain', //펴짐
                                position: 'top-right',
                                icon: 'success',
                                hideAfter: false,
                            });
                        }
                        // loginAuth(data.access_token);
                        // location.href=data.redirectUrl;
                    }
                },
                error: function (xhr, status, error) {
                    alert("error");
                }
            });
        }

    }
    //장바구니 전체 주문
    $(document).on("click","#allOrder",function () {
        $('input[name=chk]').prop("checked",true);
        $('#defaultForm').attr("action","/product/productPaymentCart")
        if(isLogin==''){
            $.toast({
                heading: '비회원 주문 중입니다.',
                text: [
                    '<a href="/sign/signup">회원 가입 후 이용</a>',
                    '<a href="#" onclick="$(\'#defaultForm\').submit();">비 회원 주문</a>',
                ],
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                icon: 'info',
                hideAfter: false
            });
        }else{


            $('#defaultForm').submit();
        }

    })
    $(document).on("click",".cartPaymentOrder",function () {
        var filter = "win16|win32|win64|mac|macintel";
        $('#defaultForm').attr("action","/product/productPaymentCart");
        if($(this).attr("data-id") =='allCheck'){
            $('input[name=chk]').prop("checked",true);
        }
        if($('input[name=chk]:checked').length <= 0){

            if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {

                $.toast({
                    heading: '결제 할 상품을 선택하세요.',
                    // text: [
                    //     '<a href="/sign/signup">회원 가입 후 이용</a>',
                    //     '<a href="#" onclick="$(\'#defaultForm\').submit();">비 회원 주문</a>',
                    // ],
                    showHideTransition: 'plain', //펴짐
                    position: 'mid-center',
                    icon: 'info',
                });
            } else {

                $.toast({
                    heading: '결제 할 상품을 선택하세요.',
                    // text: [
                    //     '<a href="/sign/signup">회원 가입 후 이용</a>',
                    //     '<a href="#" onclick="$(\'#defaultForm\').submit();">비 회원 주문</a>',
                    // ],
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
                    icon: 'info',
                });
            }
        }else{
            if(isLogin==''){
                if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
                    $.toast({
                        heading: '비회원 주문 중입니다.',
                        text: [
                            '<a href="/sign/login">로그인 후 이용</a>',
                            '<a href="/sign/signup">회원 가입 후 이용</a>',
                            '<a href="#" onclick="$(\'#defaultForm\').submit();">비 회원 주문</a>',
                        ],
                        showHideTransition: 'plain', //펴짐
                        position: 'mid-center',
                        icon: 'info',
                        hideAfter: false
                    });
                } else {
                    $.toast({
                        heading: '비회원 주문 중입니다.',
                        text: [
                            '<a href="/sign/login">로그인 후 이용</a>',
                            '<a href="/sign/signup">회원 가입 후 이용</a>',
                            '<a href="#" onclick="$(\'#defaultForm\').submit();">비 회원 주문</a>',
                        ],
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        icon: 'info',
                        hideAfter: false
                    });
                }

            }else{

                $('#defaultForm').submit();
            }
        }
    });
    //장바구니 수량변경
    $('.payment_order_quantity').on("change",function(){
        var payment_order_quantity= $(this).val();
        var cart_cd= $(this).attr('data-id');
        var order = $('input[name=payment_order_quantity]').val();
        var max = $('input[name=order_max]').val();
        var min = $('input[name=order_min]').val();
        jQuery.ajax({
            type: 'POST',
            data: {"cart_cd":cart_cd,"payment_order_quantity":payment_order_quantity},
            url:'/cart/updateCart',
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

                } else if (order < min || (max != 0 && order > max)) {
                    $.toast({
                        text: '최대/최소 주문 수량을 확인하세요.',
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error',
                        stack: false
                    });
                } else {
                    $.toast({
                        heading: '주문 수량 변경 완료!',
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        icon: 'success',
                        hideAfter: 1500,
                        afterHidden: function () {
                            location.href = '/MyPage/ShoppingBasket';
                        }
                    });
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    });
    //상품카피
    function productCopy(productCd){
        jQuery.ajax({
            type: 'POST',
            data: {"request_product_cd":productCd},
            url:'/Manager/productCopyProc',
            success: function (data) {
                console.log(data.validateError)
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
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    }
    //상품수정
    $(document).on("click","#productUpdate",function () {
        var formData = new FormData($('#defaultForm')[0]);
        //수정중인 페이징 기억
        formData.append("page", $('input[name=page]').val() ? $('input[name=page]').val() : 1);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/productUpdateProc',
            success: function (data) {
                console.log(data)
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
                    // loginAuth(data.access_token);
                    // location.href=data.redirectUrl;
                    $.toast({
                        text: 'success',
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        icon: 'success',
                        hideAfter: 1000,
                        afterHidden: function () {
                            // location.href = data.redirectUrl;
                            $(".modal-close").click();
                            location.reload();
                        }
                    });
                }
            },
            error: function (xhr, status, error) {
                console.log("xhr >> "+xhr+" status >> "+ status+" error >> "+ error)
            }
        });
    })
    //경품수정
    $(document).on("click","#giveawayUpdate",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/GiveawayUpdateProc',
            success: function (data) {
                console.log(data.validateError)
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
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    //경품등록
    $(document).on("click","#formGiveawaySubmit",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/GiveawayAddProc',
            success: function (data) {
                console.log(data.validateError)
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
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    //상품등록
    $(document).on("click","#formProductSubmit",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/productAddProc',
            success: function (data) {
                console.log(data.validateError)
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
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    })
    function resetStoreForm(){
        $(".modal1").attr("style", "display:block");
        $('#defaultForm')[0].reset();
        $('#store_reg').attr("readonly",false);
        $('#store_id').attr("readonly",false);
        $('#storIdDupCheck').attr('disabled', false);
        $('#storIdDupCheck').html('중복확인');
        $('#storRegDupCheck').attr('disabled', false);
        $('#storRegDupCheck').html('중복확인');
        $('#formStoreSubmit').removeClass('hidden');
        $('.updateBtn').addClass('hidden');
        $('body').css("overflow", "hidden");
    }
    $("button[name='detail0']").click(function(){
        resetStoreForm();
    });
    //교환 신청 선택
    function selectDeliveryRefund(order_no){
        var file_link='';
        $(".modal1").attr("style", "display:block");
        // $('input:radio[name=store_reg_type]').eq(0).click();
        var html;
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/selectDeliveryRefund',
            data: {"order_no":order_no},
            success: function (data) {
                $.each(data.list, function (index, item) {
                    $('.' + index).html(item);
                    if(index=="delivery_t_code"){
                        $('select[name=delivery_t_code]').val(item);
                    }
                    if(index=="delivery_t_invoice"){
                        $('input[name=delivery_t_invoice]').val(item);
                    }
                    if(index=="payment_status" && item=="W"){
                        html='<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'R\')">배송처리</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="F"){
                        html='<button type="button" name="cancel" class="btn-red cancelbtn on" onclick="refundCancel(\''+$.trim(order_no)+'\',\'S\')">교환완료</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="H"){
                        html='' +
                            '<button type="button" name="cancel" class="btn-red cancelbtn on" onclick="refundCancel(\''+$.trim(order_no)+'\',\'G\')">반품완료</button>' +
                            '<button type="button" name="cancel" class="btn-red cancelbtn on" onclick="refundCancel(\''+$.trim(order_no)+'\',\'J\')">반품거절</button>' +
                            '';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="F"){
                        html='' +
                            '<button type="button" name="cancel" class="btn-red cancelbtn on" onclick="refundCancel(\''+$.trim(order_no)+'\',\'S\')">교환완료</button>' +
                            '<button type="button" name="cancel" class="btn-red cancelbtn on" onclick="refundCancel(\''+$.trim(order_no)+'\',\'E\')">교환거절</button>' +
                            '';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="R"){
                        html='<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'C\')">결제취소</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="O"){
                        html='' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'C\')">결제취소</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="D"){
                        html='' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'C\')">결제취소</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="delivery_start_date" || index=="reg_date"){
                        $('.' + index).html($.datepicker.formatDate('yy-mm-dd', new Date(item)));

                    }
                    // $('#setDefaultButton').html('<button type="button" name="detail" class="btn-gray" onclick="refundCancel(\''+$.trim(order_no)+'\',\'W\')">교환/반품 취소</button>');
                });
            },
            error: function (xhr, status, error) {
                alert(error);
            },
        });
    }
    //주문현황 선택
    function selectPayment(order_no){
        var file_link='';
        $(".modal1").attr("style", "display:block");
        // $('input:radio[name=store_reg_type]').eq(0).click();
        var html;
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/selectPayment',
            data: {"order_no":order_no},
            success: function (data) {
                $.each(data.list, function (index, item) {
                    $('.' + index).html(item);
                    if(index=="delivery_t_code"){
                        $('select[name=delivery_t_code]').val(item);
                    }
                    if(index=="delivery_t_invoice"){
                        $('input[name=delivery_t_invoice]').val(item);
                    }
                    if(index=="payment_status" && item=="W" || item=="D" || item=="I"){
                        html='' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'I\')">상품준비중</button>' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'D\')">배송준비중</button>' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'R\')">배송처리</button>' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'C\')">결제취소</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="R"){
                        html='<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'R\')">배송정보수정</button>' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'O\')">배송완료</button>' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'W\')">배송취소</button>' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'C\')">결제취소</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="H"){
                        html='' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'G\')">반품확인(결제취소)</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="payment_status" && item=="O"){
                        html='' +
                            '<button type="button" name="detail" class="btn-gray" onclick="deliverySave(\''+$.trim(order_no)+'\',\'C\')">결제취소</button>';
                        $('#setButton').html(html);
                    }
                    if(index=="delivery_start_date" || index=="reg_date"){
                        $('.' + index).html($.datepicker.formatDate('yy-mm-dd', new Date(item)));

                    }
                    // $('#setDefaultButton').html('<button type="button" name="detail" class="btn-gray" onclick="refundCancel(\''+$.trim(order_no)+'\',\'W\')">교환/반품 취소</button>');
                });
            },
            error: function (xhr, status, error) {
                alert(error);
            },
        });
    }

    //교환 반품 취소
    function refundCancel(order_no,delivery_status){
        var formData = $('#saveDelivery').serialize()+'&order_no='+order_no+'&delivery_status='+delivery_status+'&payment_status='+delivery_status;
        $.ajax({
            type: 'POST',
            data: formData,
            url:'/Manager/refundCancel',
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
                    $.toast({
                        text: data.success,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        icon: 'success',
                        hideAfter: 2000,
                        afterHidden: function () {
                            location.href=data.redirectUrl;
                        }
                    });
                    // loginAuth(data.access_token);
                    // location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert(error);
            },
        })
    }
    //배송정보 저장
    function deliverySave(order_no,delivery_status){
        var formData = $('#saveDelivery').serialize()+'&order_no='+order_no+'&delivery_status='+delivery_status+'&payment_status='+delivery_status;
        $.ajax({
            type: 'POST',
            data: formData,
            url:'/Manager/SaveDelivery',
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
                    $.toast({
                        text: data.success,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        icon: 'success',
                        hideAfter: 2000,
                        afterHidden: function () {
//                            location.href=data.redirectUrl;
                            location.reload();
                        }
                    });
                    // loginAuth(data.access_token);
                    // location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert(error);
            },
        })
    }
    //입점업체등록
    $(document).on("click","#formStoreSubmit",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/storeAddProc',
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
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    //입점업체 선택
    function defaultModalStore (store_id){
        var file_link='';
        $(".modal1").attr("style", "display:block");
        // $('input:radio[name=store_reg_type]').eq(0).click();
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/storeViewDetail',
            data: {"store_id":store_id},
            success: function (data) {
                $.each(data.list, function (index, item) {
                    $('input[name^="' + index + '"]').val(item);
                    if(index=='file_1'){
                        $('.fileDownload').html('<a href="'+item+'" target="_blank">'+data.list.file_name+'</a>');
                    }
                    // if(index=='store_reg_type' && item ==''){
                    //     $('input:radio[name=store_reg_type]').eq(0).click();
                    // }else{
                    //     $('input:radio[name=store_reg_type]').eq(1).click();
                    // }
                });
                $('#store_reg').attr("readonly",true);
                $('#store_id').attr("readonly",true);
                $('#storIdDupCheck').attr('disabled', true);
                $('#storIdDupCheck').html('OK');
                $('#storRegDupCheck').attr('disabled', true);
                $('#storRegDupCheck').html('OK');
                $('#formStoreSubmit').addClass('hidden');
                $('.updateBtn').removeClass('hidden');
            },
            error: function (xhr, status, error) {
                alert(error);
            },
        });
    }
    //입점업체수정
    $(document).on("click","#storeUpdateSubmit",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/storeUpdateProc',
            success: function (data) {
                console.log(data.validateError)
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
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    //입점업체 승인
    $(document).on("click","#storeApproval",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/storeApproval',
            success: function (data) {
                console.log(data.validateError)
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
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    //아이디중복체크
    $(document).on("click","#storIdDupCheck",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/storeIdDupCheck',
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
                    // loginAuth(data.access_token);
                    $.toast({
                        text: "SUCCESS",
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        icon: 'success'
                    });
                    $('#store_id').attr("readonly",true);
                    $('#storIdDupCheck').attr('disabled', true);
                    $('#storIdDupCheck').html('OK');
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    //사업자중복체크
    $(document).on("click","#storRegDupCheck",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/storeRegDupCheck',
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
                    // loginAuth(data.access_token);
                    $.toast({
                        text: "SUCCESS",
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        icon: 'success'
                    });
                    $('#store_reg').attr("readonly",true);
                    $('#storRegDupCheck').attr('disabled', true);
                    $('#storRegDupCheck').html('OK');
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    $('.code-wrap-button').click(function(){
        $('.code-wrap').toggleClass('active');
    });
    //배송비 구분 변경에따라
    $('select[name=product_delivery_payment_class]').change(function(){
        var shipR='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>배송비 <input type="text" id="product_delivery_payment" name="product_delivery_payment"> 원을 고정적으로 부과함.</td></tr>';
        var shipM='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td><p class="cc2">구매 금액이 30,000원 미만일 때 배송비 2,500원을 부과하려면 30000|2500 입력</p><input type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 30000|2500"></td></tr>';
        var shipD='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">20,000원 이상~30,000원 미만일 때 배송비 2,000원을 부과하고 30,000원 이상~50,000원 미만일 때 배송비 1,000원을 부과하려면<br>20000|30000|2000//30000|50000|1000 입력</p><input type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 20000|30000|2000//30000|50000|1000"></td></tr>';
        var shipW='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">3kg 이상~5kg 미만일 때 배송비 2,000원을 부과하고 5kg 이상~7kg 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000"></td></tr>';
        var shipC='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">3개 이상~5개 미만일 때 배송비 2,000원을 부과하고 5개 이상~7개 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text" id="product_delivery_payment" name="product_delivery_payment" placeholder="ex) 3|5|2000//5|7|7000"></td></tr>';
        var shipN='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>주문 금액에 상관 없이 수량에 따라 배송료 <input type="text" id="product_delivery_payment" name="product_delivery_payment">원을 부과함.</td></tr>';

        if($(this).val() == "R"){
            $('.shippingFee-detail-wrap').remove();
            $('.shipping-fee-tr').after(shipR);
        }else if($(this).val() == "M"){
            $('.shippingFee-detail-wrap').remove();
            $('.shipping-fee-tr').after(shipM);
        }else if($(this).val() == "D"){
            $('.shippingFee-detail-wrap').remove();
            $('.shipping-fee-tr').after(shipD);
        }else if($(this).val() == "W"){
            $('.shippingFee-detail-wrap').remove();
            $('.shipping-fee-tr').after(shipW);
        }else if($(this).val() == "C"){
            $('.shippingFee-detail-wrap').remove();
            $('.shipping-fee-tr').after(shipC);
        }else if($(this).val() == "N"){
            $('.shippingFee-detail-wrap').remove();
            $('.shipping-fee-tr').after(shipN);
        }else if($(this).val() == "T"){
            $('.shippingFee-detail-wrap').remove();
        }
    });
    //유효기간
    // $('input[name=product_validity_yn]').on("change",function() {
    //     var selectValue = $(this).val();
    //     $('.goods-validity-detail').removeClass('show-table-row');
    //     if(selectValue=="Y"){
    //         $('.goods-validity-detail').addClass('show-table-row');
    //     }
    // });
    //추가 입력 옵션
    $('input[name=product_add_option]').on("change",function() {
        var selectValue = $(this).val();
        $('.product_add_option_name').removeClass('show-table-row');
        $('.product_add_option_required').removeClass('show-table-row');
        $('.product_add_option_max_lang').removeClass('show-table-row');
        if(selectValue=="Y"){
            $('.product_add_option_name').addClass('show-table-row');
            $('.product_add_option_required').addClass('show-table-row');
            $('.product_add_option_max_lang').addClass('show-table-row');
        }
    });
    //품목구성방식
    $('.product_option_yn').on('change',function () {

        var selectValue = $(this).val();
        if(selectValue=="Y"){
            $('.option-group').addClass("show-table-row");
        }else{
            $('.option-group').removeClass("show-table-row");
            $('.option-group').addClass("hidden");
        }
    });
    $('input[name=product_option_class]').on("change",function() {
        var selectValue = $(this).val();

        $('.option-group-2').removeClass('show-table-row');
        $('.option-group-3').removeClass('show-table-row');
        if (selectValue == "T") {
            $('.option-group-2').addClass('show-table-row');
        } else if (selectValue == "E") {
            $('.option-group-3').addClass('show-table-row');
        }else{


            // $('input[name=product_option_class]').prop('checked',false);
        }
    });
    //판매가 대체문구
    $('input:radio[name=salePrice-replace]').on('click', function(){
        if($("input:radio[name=salePrice-replace]:checked").val() == "Y"){
            $("input:text[name=product_payment_memo]").attr("disabled",false);
            $("input:text[name=product_payment_memo]").focus();
            // radio 버튼의 value 값이 1이라면 활성화

        }else{$("input:text[name=product_payment_memo]").attr("disabled",true);
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
    //상품등록 과세
    $(document).on("change",".goods-tax",function () {
        var objValue='';
        var objTaxDetail =$('#goods-taxation-detail').val();
        if($(this).val()=="A"){
            objValue =$(this).val()+"|"+objTaxDetail;
        }else{
            objValue= $(this).val()
        }
        $('#product_tex_class').val(objValue)
    });
    //상품등록 과세율 수정
    $(document).on("onkeyup","input[name=goods-taxation-detail]",function () {
        var selectTex=$('input:radio[name=goods-tax]').val();

        if(selectTex=="A"){
            objValue =selectTex+"|"+$(this).val();
        }
        $(this).val(objValue);
    })
    /**
     * 이미지 파일 업로드
     */
    function uploadSummernoteImageFile(file, editor) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/Manager/uploadSummernoteImageFile",
            contentType : false,
            processData : false,
            success : function(data) {
                console.log(data)
                //항상 업로드된 파일의 url이 있어야 한다.
                $(editor).summernote('insertImage', data.url);
            }
        });
    }
    //에디터
    $(document).ready(function (){
        $('#summernote').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 320,
            lang: 'ko-KR', // default: 'en-US'
            callbacks: {	//여기 부분이 이미지를 첨부하는 부분
                onImageUpload : function(files) {
                    uploadSummernoteImageFile(files[0],this);
                }
            }
        });
        $('#summernote2').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 320,
            lang: 'ko-KR',
            callbacks: {
                onImageUpload : function(files) {
                    uploadSummernoteImageFile(files[0],this);
                }
            }
        });
        $('#editor3').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 120,
            lang: 'ko-KR',
            callbacks: {
                onImageUpload : function(files) {
                    uploadSummernoteImageFile(files[0],this);
                }
            } // default: 'en-US'
        });
        $('#editor4').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 120,
            lang: 'ko-KR',
            callbacks: {
                onImageUpload : function(files) {
                    uploadSummernoteImageFile(files[0],this);
                }
            }
        });
        $('#editor5').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 120,
            lang: 'ko-KR',
            callbacks: {
                onImageUpload : function(files) {
                    uploadSummernoteImageFile(files[0],this);
                }
            }
        });
        $('#editor6').summernote({
            placeholder: 'Hello stand alone ui',
            tabsize: 2,
            height: 120,
            lang: 'ko-KR',
            callbacks: {
                onImageUpload : function(files) {
                    uploadSummernoteImageFile(files[0],this);
                }
            }
        });
    });
    function categoryProc(){
        //분류저장
        var product_ct='';
        $('.selectCtCodeList').each(function (index) {

            if(index == 0 ){
                product_ct+= $(this).val();
            }else{
                product_ct+="|"+$(this).val();
            }
        });

        $('#product_ct').val(product_ct);
        //신상품 영역
        var product_new_class='';
        var newPaYn='';

        $('.newPa').each(function (index) {
            if($(this).is(":checked")){
                newPaYn = 'Y'
            }else{
                newPaYn = 'N'
            }
            if(index == 0 ){
                product_new_class+= newPaYn;
            }else{
                product_new_class+="|"+newPaYn;
            }
        });
        $('#product_new_class').val(product_new_class);
        //추천상품 영역
        var product_md_class='';

        $('.mdPa').each(function (index) {
            if($(this).is(":checked")){
                newPaYn = 'Y'
            }else{
                newPaYn = 'N'
            }
            if(index == 0 ){
                product_md_class+= newPaYn;
            }else{
                product_md_class+="|"+newPaYn;
            }
        });
        $('#product_md_class').val(product_md_class);
        //특가상품 영역
        var product_sp_class='';

        $('.spPa').each(function (index) {
            if($(this).is(":checked")){
                newPaYn = 'Y'
            }else{
                newPaYn = 'N'
            }
            if(index == 0 ){
                product_sp_class+= newPaYn;
            }else{
                product_sp_class+="|"+newPaYn;
            }
        });
        $('#product_sp_class').val(product_sp_class);
    }
    $(document).on("change",".newPa",function () {
        categoryProc()
    })
    $(document).on("change",".mdPa",function () {
        categoryProc()
    })
    $(document).on("change",".spPa",function () {
        categoryProc()
    })
    //상품 분류 선택
    $('#addCategoryList').click(function () {
        // $('#product_ct').val($('#selectCtCode').val());
        var selectCodeEach = true;
        var selectCtCode =$('#selectCtCode').val();
        $('.selectCtCodeList').each(function () {

            if($(this).val()==$('#selectCtCode').val()){
                selectCodeEach = false;
            }
        });

        var ctText = "" +
            "<tr id='ctid"+selectCtCode+"'>" +
            "<td>"+
                $('#category1t').text() + $('#category2t').text() + $('#category3t').text() +
                "<input type='hidden' name='selectCtCodeList[]'  class='selectCtCodeList' value='"+selectCtCode+"'>" +
            "</td>" +
            "<td>" +
                // "<label for='pa1'> <input type='checkbox' name='defaultPa' id='pa1'>일반상품 영역</label><br>" +
                "<label for='pa2'> <input type='checkbox' name='newPa[]' checked class='newPa'>신상품 영역</label><br>" +
                "<label for='pa3'> <input type='checkbox' name='mdPa[]' class='mdPa'>추천상품 영역</label><br>" +
                "<label for='pa4'> <input type='checkbox' name='spPa[]' class='spPa'>특가상품 영역</label>" +
            "</td>" +
            "<td>" +
                "<button type='button' class='btn-default' onclick=\"$('#ctid"+selectCtCode+"').remove();categoryProc()\">선택 분류 삭제</button>" +
            "</td>"
            "</tr>";
        if(selectCodeEach){
            $('#addCategoryView').append(ctText);
            categoryProc();
        }else{
            $.toast({
                text: "이미 선택한 카테고리 입니다.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        }

    });
    //상품 선택업데이트 > 분류 선택
    $('.addCategoryList').click(function () {
        // $('#product_ct').val($('#selectCtCode').val());
        var selectCodeEach = true;
        var selectCtCode =$('#selectCtCode').val();
        $('.selectCtCodeList').each(function () {

            if($(this).val()==$('#selectCtCode').val()){
                selectCodeEach = false;
            }
        });

        var ctText = "" +
            "<tr id='ctid"+selectCtCode+"'>" +
            "<td>"+
            $('#category1t').text() + $('#category2t').text() + $('#category3t').text() +
            "<input type='hidden' name='selectCtCodeList[]'  class='selectCtCodeList' value='"+selectCtCode+"'>" +
            "</td>" +
            "<td>" +
            // "<label for='pa1'> <input type='checkbox' name='defaultPa' id='pa1'>일반상품 영역</label><br>" +
            "<label for='pa2'> <input type='checkbox' name='newPa[]' checked class='newPa'>신상품 영역</label><br>" +
            "<label for='pa3'> <input type='checkbox' name='mdPa[]' class='mdPa'>추천상품 영역</label><br>" +
            "<label for='pa4'> <input type='checkbox' name='spPa[]' class='spPa'>특가상품 영역</label>" +
            "</td>" +
            "<td>" +
            "<button type='button' class='btn-default' onclick=\"$('#ctid"+selectCtCode+"').remove();categoryProc()\">선택 분류 삭제</button>" +
            "</td>"
        "</tr>";
        if(selectCodeEach){
            $('.addCategoryView').append(ctText);
            categoryProc();
        }else{
            $.toast({
                text: "이미 선택한 카테고리 입니다.",
                showHideTransition: 'plain', //펴짐
                position: 'top-right',
                heading: 'Error',
                icon: 'error'
            });
        }

    });
    //상품 등록 및 상세보기 카테고리
    $('.UpdateProductCatetorySubmit').on("click",function () {
        if($('input[name=chk]:checked').length < 1){
            alert('수정 할 상품을 목록에서 선택하세요')
        }else{
            $('#addCategoryView').children().remove();
            $('.addCategoryView').children().remove();
            $('.UpdateProductCatetory').attr('style','display:block');
        }


    });
    $('.updateCategorySubmitBtn').on("click",function () {
        var product_ct = $('#product_ct').val();
        var product_new_class = $('#product_new_class').val();
        var product_md_class = $('#product_md_class').val();
        var product_sp_class = $('#product_sp_class').val();
        var formData = $('#defaultListForm').serialize()+
            '&product_ct='+product_ct+
            '&product_new_class='+product_new_class+
            '&product_md_class='+product_md_class+
            '&product_sp_class='+product_sp_class
        commonAjaxCall("POST","/Manager/productListCategoryUpdate",formData);
    });
    $('.selectCategory').on("click",function(){
        //소분류 초기화
        $('#category2t').empty();
        $('#category3t').empty();
        $('#subCategory').empty();
        $('#tirdCategory').empty();

        $('.category2t').empty();
        $('.category3t').empty();
        $('.subCategory').empty();
        $('.tirdCategory').empty();
        var uppper_code =$(this).attr("data-id");
        var text = $(this).text();
        $('.selectCategory').removeClass('font-weight-bold')
        $(this).addClass("font-weight-bold");
        var html="<ul>";
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/productCategoryList',
            data: {"pd_category_upper_code":uppper_code},
            success: function (data) {
                console.log(data.list);
                $.each(data.list, function (index, item) {
                    html +="<li class='subCategoryList' data-id='"+item.pd_category_id+"'>"+item.pd_category_name+"</li>";
                });
                html += "</ul>";
                //중분류 표시
                $('#subCategory').empty();
                $('#subCategory').html(html);
                //선택 카테고리 표기
                $('#category1t').html("[대분류] " + text)

                //중분류 표시
                $('.subCategory').empty();
                $('.subCategory').html(html);
                //선택 카테고리 표기
                $('.category1t').html("[대분류] " + text)
                //
                $('#selectCtCode').val(uppper_code);
            },
            error: function (xhr, status, error) {
                alert(error);
            }
        });
    });
    $(document).on("click",".subCategoryList",function(){
        var uppper_code =$(this).attr("data-id");
        var text = $(this).text();
        //중분류 초기화
        $('#category3').val('');
        $('#category3t').empty();
        $('.category3').val('');
        $('.category3t').empty();
        $('.subCategoryList').removeClass('font-weight-bold');
        $(this).addClass("font-weight-bold");
        var html="<ul>";
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/productCategoryList',
            data: {"pd_category_upper_code":uppper_code},
            success: function (data) {
                console.log(data.list);
                $.each(data.list, function (index, item) {
                    html +="<li class='tirdCategoryList' data-id='"+item.pd_category_id+"'>"+item.pd_category_name+"</li>";
                });
                html += "</ul>";
                //중분류 표시
                $('#tirdCategory').empty();
                $('#tirdCategory').html(html);
                //선택 카테고리 표기

                $('#category2t').html(" > [중분류] "+text);

                //중분류 표시
                $('.tirdCategory').empty();
                $('.tirdCategory').html(html);
                //선택 카테고리 표기

                $('.category2t').html(" > [중분류] "+text);
                //
                $('#selectCtCode').val(uppper_code);
            },
            error: function (xhr, status, error) {
                alert(error);
            }
        });

    });
    $(document).on("click",".tirdCategoryList",function(){
        var uppper_code =$(this).attr("data-id");
        var text = $(this).text();
        $('.tirdCategoryList').removeClass('font-weight-bold');
        $(this).addClass("font-weight-bold");
        //선택 카테고리 표기
        $('#category3t').html(" > [소분류] "+text)
        $('#category3').val(uppper_code)

        //선택 카테고리 표기
        $('.category3t').html(" > [소분류] "+text)
        $('.category3').val(uppper_code)
        //
        $('#selectCtCode').val(uppper_code);
    });
    //배송시요청사항
    $("#delivery_message_select").on("change",function () {
        $("#delivery_message_box").hide();

        if($(this).val()=="self"){
            $("#delivery_message_box").show();
            $("#delivery_message_box").removeClass("hidden");
        }else{
            $("#delivery_message").val($(this).find('option:selected').text());
        }

    });
    //modal
    //특수문자 태그변환
    function ConvertSystemSourcetoHtml(str){
        str = str.replace(/</g,"&lt;");
        str = str.replace(/>/g,"&gt;");
        str = str.replace(/\"/g,"&quot;");
        str = str.replace(/\'/g,"&#39;");
        str = str.replace(/\n/g,"<br />");
        return str;
    }
    //상품상세보기
    function defaultModal (product_cd){
        $('#addCategoryView').children().remove();
            var file_link='';
            $("#modelDetail").attr("style", "display:block");
            var resultData;
            jQuery.ajax({
                type: 'POST',
                url: '/Manager/viewDetail',
                data: {"product_cd":product_cd},
                success: function (data) {
                    console.log(data.list)
                    resultData=data.list;
                    $.each(data.list, function (index, item) {
                        if(index=="product_html"){
                            $('#summernote').summernote('code', item);
                        }else if(index=="product_mobile_html"){
                            $('#summernote2').summernote('code', item);
                        }else if(index=="product_payment_info"){
                            $('#editor3').summernote('code', item);
                        }else if(index=="product_delivery_info"){
                            $('#editor4').summernote('code', item);
                        }
                        else if(index=="product_change_info"){
                            $('#editor5').summernote('code', item);
                        }
                        else if(index=="product_service_info"){
                            $('#editor6').summernote('code', item);
                        }else{

                        }

                        if(index=="product_delivery_class" && item=="T"){
                            $('.shippingFee-detail-wrap').remove();
                        }
                        if(index=="product_delivery_payment_class"){

                            callDelivery(item);
                        }
                        $('input:text[name^="'+index+'"]').val(item);
                        $('select[name='+index+']').val(item);
                        $('input:radio[name='+index+'][value=\'' + item + '\']').prop('checked',true);
                    });
                    $('input[name^="product_validity_end"]').val(data.list.product_validity_end);
                    $('input:radio[name=product_validity_yn][value=\'' + data.list.product_validity_yn + '\']').prop('checked',true);

                    $('.file_link1').attr("src",resultData.file_1);
                    $('.file_link2').attr("src",resultData.file_2);
                    $('.file_link3').attr("src",resultData.file_3);
                    $('.file_link4').attr("src",resultData.file_4);
                    $('.file_link5').attr("src",resultData.file_5);
                    $('input[name^="product_cd"]').val(product_cd);
                    categorySplit(resultData.product_ct,resultData.product_new_class,resultData.product_md_class,resultData.product_sp_class)
                },
                error: function (xhr, status, error) {
                    alert(error);
                }
            });
        }
        $('#changeDeliveryPaymentClass').on("change",function () {
            callDelivery($(this).val());
        });
    //상품 상세보기 시 기존 저장된 카테고리 출력
    function categorySplit(arrDataCt,arrDataNewPa,arrDataMbPa,arrDataSpPa){
        console.log(arrDataCt);
        var ctText ='';
        var newPaChecked="";
        var mbPaChecked="";
        var spPaChecked="";
        var categoryData;
        arrDataNewPa = arrDataNewPa.split("|");
        arrDataMbPa = arrDataMbPa.split("|");
        arrDataSpPa = arrDataSpPa.split("|");

        $.each(arrDataCt.split("|"),function (key,value) {
            categoryData = commonAjaxListCall("POST","/Manager/viewCategoryDetail",{"pd_category_id":value});
            console.log(arrDataNewPa[key]);
            if(arrDataNewPa[key]=="Y"){
                newPaChecked="checked"
            }else{
                newPaChecked=""
            }
            if(arrDataMbPa[key]=="Y"){
                mbPaChecked="checked"
            }else{
                mbPaChecked=""
            }
            if(arrDataSpPa[key]=="Y"){
                spPaChecked="checked"
            }else{
                spPaChecked=""
            }
            ctText += "" +
                "<tr id='ctid"+value+"'>" +
                    "<td>"+
                    categoryData.getCatetoryView.categoryViewName+
                    "<input type='hidden' name='selectCtCodeList[]'  class='selectCtCodeList' value='"+value+"'>" +
                    "</td>" +
                    "<td>" +
                    // "<label for='pa1'> <input type='checkbox' name='defaultPa' id='pa1'>일반상품 영역</label><br>" +
                    "<label for='pa2'> <input type='checkbox' name='newPa[]' class='newPa' "+newPaChecked+">신상품 영역</label><br>" +
                    "<label for='pa3'> <input type='checkbox' name='mdPa[]'  class='mdPa' "+mbPaChecked+">추천상품 영역</label><br>" +
                    "<label for='pa4'> <input type='checkbox' name='spPa[]'  class='spPa' "+spPaChecked+">특가상품 영역</label>" +
                    "</td>" +
                    "<td>" +
                    "<button type='button' class='btn-default' onclick=\"$('#ctid"+value+"').remove();categoryProc()\">선택 분류 삭제</button>" +
                    "</td>"
                "</tr>";
        });
        $('#addCategoryView').append(ctText);
    }
    //관리자 > 상품 상세보기 > 기본 배송비 구분에따른 출력
    function callDelivery(product_delivery_payment_class,product_delivery_payment) {
        var shipR = '' +
            '<tr class="changeDeliveryTr shipping-t-detail">' +
            '<th>배송비 상세 설정</th>' +
                '<td>배송비 ' +
                    '<input type="text" id="product_delivery_payment" name="product_delivery_payment" value="'+product_delivery_payment+'"> 원을 고정적으로 부과함.' +
                '</td>' +
            '</tr>';
        var shipM = '' +
            '<tr class="changeDeliveryTr shipping-t-detail">' +
                '<th>배송비 상세 설정</th>' +
                '<td>' +
                '<p class="cc2">구매 금액이 30,000원 미만일 때 배송비 2,500원을 부과하려면 30000|2500 입력</p>' +
                    '<input type="text" id="shippingFee-detail" name="product_delivery_payment" value="'+product_delivery_payment+'" placeholder="ex) 30000|2500">' +
                '</td>' +
            '</tr>';
        var shipD = '' +
            '<tr class="changeDeliveryTr shipping-t-detail long">' +
                '<th>배송비 상세 설정</th>' +
                '<td>' +
                    '<p class="cc2">20,000원 이상~30,000원 미만일 때 배송비 2,000원을 부과하고 30,000원 이상~50,000원 미만일 때 배송비 1,000원을 부과하려면<br>20000|30000|2000//30000|50000|1000 입력</p>' +
                    '<input type="text" id="product_delivery_payment" name="product_delivery_payment" value="'+product_delivery_payment+'" placeholder="ex) 20000|30000|2000//30000|50000|1000">' +
                '</td>' +
            '</tr>';
        var shipW = '' +
            '<tr class="changeDeliveryTr shipping-t-detail long">' +
                '<th>배송비 상세 설정</th>' +
                '<td>' +
                    '<p class="cc2">3kg 이상~5kg 미만일 때 배송비 2,000원을 부과하고 5kg 이상~7kg 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p>' +
                    '<input type="text" id="product_delivery_payment" name="product_delivery_payment" value="'+product_delivery_payment+'" placeholder="ex) 3|5|2000//5|7|7000">' +
                '</td>' +
            '</tr>';
        var shipC = '' +
            '<tr class="changeDeliveryTr shipping-t-detail long">' +
                '<th>배송비 상세 설정</th>' +
                '<td>' +
                    '<p class="cc2">3개 이상~5개 미만일 때 배송비 2,000원을 부과하고 5개 이상~7개 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p>' +
                    '<input type="text" id="product_delivery_payment" name="product_delivery_payment" value="'+product_delivery_payment+'" placeholder="ex) 3|5|2000//5|7|7000">' +
                '</td>' +
            '</tr>';
        var shipN = '' +
            '<tr class="changeDeliveryTr shipping-t-detail"><th>배송비 상세 설정</th>' +
            '<td>주문 금액에 상관 없이 수량에 따라 배송료 ' +
                '<input type="text" id="product_delivery_payment" name="product_delivery_payment" value="'+product_delivery_payment+'">원을 부과함.' +
            '</td>' +
            '</tr>';

        // $('.changeDeliveryTr').remove();
        if (product_delivery_payment_class== "R") {

            $('.shipping-fee-tr').after(shipR);


        } else if (product_delivery_payment_class == "M") {

            $('.shipping-fee-tr').after(shipM);

        } else if (product_delivery_payment_class == "D") {

            $('.shipping-fee-tr').after(shipD);

        } else if (product_delivery_payment_class == "W") {

            $('.shipping-fee-tr').after(shipW);

        } else if (product_delivery_payment_class == "C") {

            $('.shipping-fee-tr').after(shipC);

        } else if (product_delivery_payment_class == "N") {

            $('.shipping-fee-tr').after(shipN);

        } else if (product_delivery_payment_class == "T") {


        }
        // $('.shippingFee-detail-wrap').attr('style','display:table-row');
    }
    //경품상세보기
    function defaultModalGiveaway (giveaway_cd){
        var file_link='';
        $(".modal").attr("style", "display:block");
        var resultData;
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/giveawayViewDetail',
            data: {"giveaway_cd":giveaway_cd},
            success: function (data) {
                console.log(data.list)
                resultData=data.list;
                $.each(data.list, function (index, item) {
                    $('input[name^="'+index+'"]').val(item);
                    $('#'+index).val(item);
                    if(index=="giveaway_html"){
                        $('#summernote').summernote('code', item);

                    }
                    if(index=="giveaway_mobile_html"){
                        $('#summernote2').summernote('code', item);
                    }
                    if(index=="giveaway_payment_info"){
                        $('#editor3').summernote('code', item);
                    }
                    if(index=="giveaway_delivery_info"){
                        $('#editor4').summernote('code', item);
                    }
                    if(index=="giveaway_change_info"){
                        $('#editor5').summernote('code', item);
                    }
                    if(index=="giveaway_service_info"){
                        $('#editor6').summernote('code', item);
                    }
                });
                /*var ele1 =$('input[name^="file_1"]').val();
                var ele2 =$('input[name^="file_2"]').val();
                var ele3 =$('input[name^="file_3"]').val();
                var ele4 =$('input[name^="file_4"]').val();
                var ele5 =$('input[name^="file_5"]').val();

                $('.product_detail_image').attr('src',ele1.replace(/(<([^>]+)>)/ig,""));
                $('.product_list_image').attr('src',ele2.replace(/(<([^>]+)>)/ig,""));
                $('.product_list_image_sm').attr('src',ele3.replace(/(<([^>]+)>)/ig,""));
                $('.product_list_image_response').attr('src',ele4.replace(/(<([^>]+)>)/ig,""));
                $('.product_add_image').attr('src',ele5.replace(/(<([^>]+)>)/ig,""));*/
                $('.file_link1').attr("src",resultData.file_1);
                $('.file_link2').attr("src",resultData.file_2);
                $('.file_link3').attr("src",resultData.file_3);
                $('.file_link4').attr("src",resultData.file_4);
                $('.file_link5').attr("src",resultData.file_5);
                $('input[name^="giveaway_cd"]').val(giveaway_cd);
            },
            error: function (xhr, status, error) {
                alert(error);
            }
        });
    }


    $(".modal-close").click(function(){
        $(".modal").attr("style", "display:none");
    });

    //rest
    $('#formSubmit').on("click",function () {
        var formData = $('#defaultForm').serialize();
        var alertType;
        var showText;

        jQuery.ajax({
            type: $('#defaultForm').attr('method'),
            url: postUrl,
            // enctype: 'multipart/form-data',
            data: formData,
            success: function (data) {
                // console.log(data.validateError)
                if (data.validateError) {
                    $('.validateError').empty();
                    console.log(data);
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
                        var filter = "win16|win32|win64|mac|macintel";

                        if (filter.indexOf(navigator.platform.toLowerCase()) < 0) {
                            $.toast({
                                text: showText,
                                showHideTransition: 'plain', //펴짐
                                position: 'mid-center',
                                heading: 'Error',
                                icon: 'error',
                            });
                        } else {
                            $.toast({
                                text: showText,
                                showHideTransition: 'plain', //펴짐
                                position: 'top-right',
                                heading: 'Error',
                                icon: 'error',
                            });
                        }
                    });

                } else {
                    // loginAuth(data.access_token);
                    if (data.success) {
                        $.toast({
                            text: 'success',
                            showHideTransition: 'plain', //펴짐
                            position: 'top-right',
                            icon: 'success',
                            hideAfter: 2000,
                            afterHidden: function () {
                            	location.href=data.redirectUrl;
                            }
                        });
                    } else{
                    	if(data.redirectUrl){
                    		location.href=data.redirectUrl;	
                    	}else{
                    		$.toast({
                                text: "ERROR",
                                showHideTransition: 'plain', //펴짐
                                position: 'mid-center',
                                heading: 'Error',
                                icon: 'error',
                            });
                    	}
                    }
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    });
    //공통 리스트 삭제
    $('#listDelete').on("click",function(){
        var formData = $('#defaultListForm').serialize();
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
//                    location.href=data.redirectUrl;
                	$.toast({
                        text: 'success',
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        icon: 'success',
                        hideAfter: 500,
                        afterHidden: function () {
	                        location.reload();
	                    }
                    });
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    });
    // function fn_formSubmit(){
    //     document.form1.submit();
    // }

    $('.ready').on("click",function () {
        $.toast().reset('all');//토스트 초기화
        $.toast({
            text: "준비중입니다.",
            showHideTransition: 'plain', //펴짐
            position: 'top-right',
            heading: "Info",
            icon: 'info'
            // showHideTransition: 'slide', //슬라이드
            // showHideTransition: 'fade' //서서히나타남
            // position: 'top-left',
            // position: 'bottom-right',
            // position: 'bottom-left',
        });
        return false;
    })
    $("#daumMapCall").on("click",function () {
    //다음 지도
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('input[name=postcode]').val(data.zonecode);
                $('input[name=roadAddress]').val(roadAddr);
                $('input[name=jibunAddress]').val(data.jibunAddress);

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    $('input[name=extraAddress]').val(extraRoadAddr);
                } else {
                    $('input[name=extraAddress]').val('');
                }
//
//                var guideTextBox =  $('input[name=guide]');
//                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//                if(data.autoRoadAddress) {
//                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
//                    guideTextBox.style.display = 'block';
//
//                } else if(data.autoJibunAddress) {
//                    var expJibunAddr = data.autoJibunAddress;
//                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
//                    guideTextBox.style.display = 'block';
//                } else {
//                    guideTextBox.innerHTML = '';
//                    guideTextBox.style.display = 'none';
//                }
            }
        }).open();
    });
    $("#daumMapCall2").on("click",function () {
    //다음 지도
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('input[name=refund_postcode]').val(data.zonecode);
            $('input[name=refund_roadAddress]').val(roadAddr);
            $('input[name=refund_jibunAddress]').val(data.jibunAddress);

            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                $('input[name=refund_extraAddress]').val(extraRoadAddr);
            } else {
                $('input[name=refund_extraAddress]').val('');
            }
//
//            var guideTextBox =  $('input[name=refund_guide]');
//            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//            if(data.autoRoadAddress) {
//                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
//                guideTextBox.style.display = 'block';
//
//            } else if(data.autoJibunAddress) {
//                var expJibunAddr = data.autoJibunAddress;
//                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
//                guideTextBox.style.display = 'block';
//            } else {
//                guideTextBox.innerHTML = '';
//                guideTextBox.style.display = 'none';
//            }
        }
    }).open();
});
    $('#SearchDelivery').click(function () {
        var child;
        var order_no=$(this).attr("data-id");
        if(child != undefined){
            child.close()
        }

        child = window.open('/Popup/DeliverySearch?order_no='+order_no,'_blank','width=750, height=900');
    });
    
    $('.review-write').click(function () {
        var child;
        var order_no=$(this).attr("data-id");
        if(child != undefined){
            child.close()
        }

        child = window.open('/Popup/review-write?order_no='+order_no,'_blank','width=750, height=900');
    });
    
    $('.review-update').click(function () {
        var child;
        var order_no=$(this).attr("data-id");
        if(child != undefined){
            child.close()
        }

        child = window.open('/Popup/review-update?order_no='+order_no,'_blank','width=750, height=900');
    });
    
    $('.review-delete').click(function () {
    	if(confirm("삭제하시겠습니까?")){
    		var order_no = $(this).attr("data-id");
    		jQuery.ajax({
    	        type: 'POST',
    	        data: "order_no="+order_no,
    	        url:'/MyPage/deleteReview',
    	        success: function (data) {
    	        	if(data.success){
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
    	        },
    	        error: function (xhr, status, error) {
    	            alert("error");
    	        }
    	    });
    	}else{
    		return false;
    	}
    });


    $('input[name=product_delivery_International_type]').on("click",function () {
        $('#main-search-form input[name=product_delivery_International_type]').remove();
        var value = '';
        $('input[name=product_delivery_International_type]:checked').each(function (key){
            if(key > 0){
                value +="^"
            }
            value +=$(this).val();
        })
        $('#main-search-form').append(
            '<input type="hidden" name="product_delivery_International_type" value="'+value+'">'
        )
        $('#main-search-form').submit();
    })
    // $('input[name=product_delivery_International_type]').on("click",function () {
    //     $('#main-search-form input[name=product_delivery_International_type]').remove();
    //
    //     $('input[name=product_delivery_International_type]:checked').each(function (){
    //         $('#main-search-form').append(
    //             '<input type="hidden" name="product_delivery_International_type" value="'+$(this).val()+'">'
    //         )
    //     });
    // })
    $('input[name=product_delivery_payment_class]').on("click",function () {
        $('#main-search-form input[name=product_delivery_payment_class]').remove();
        var value = '';
        $('input[name=product_delivery_payment_class]:checked').each(function (key){
            if(key > 0){
                value +="^"
            }
            value +=$(this).val();
        })
        $('#main-search-form').append(
            '<input type="hidden" name="product_delivery_payment_class" value="'+value+'">'
        );
        $('#main-search-form').submit();
    })
    $('input[name=product_brand]').on("click",function () {
        $('#main-search-form input[name=product_brand]').remove();
        var value = '';
        $('input[name=product_brand]:checked').each(function (key){
            if(key > 0){
                value +="^"
            }
            value +=$(this).val();
        })
        $('#main-search-form').append(
            '<input type="hidden" name="product_brand" value="'+value+'">'
        );
        $('#main-search-form').submit();
    })
    $('input[name=product_option_color]').on("click",function () {
        $('#main-search-form input[name=product_option_color]').remove();
        var value = '';
        $('input[name=product_option_color]:checked').each(function (key){
            if(key > 0){
                value +="^"
            }
            value +=$(this).val();
        })
        $('#main-search-form').append(
            '<input type="hidden" name="product_option_color" value="'+value+'">'
        );
        $('#main-search-form').submit();
    })
    $('input[name=product_score]').on("click",function () {
        $('#main-search-form input[name=product_score]').remove();
        var value = '';
        $('input[name=product_score]:checked').each(function (key){
            if(key > 0){
                value +="^"
            }
            value +=$(this).val();
        })
        $('#main-search-form').append(
            '<input type="hidden" name="product_score" value="'+value+'">'
        );
        $('#main-search-form').submit();
    })
    function setPaymentfilter(to,be) {
        var dataId = $('this').attr('data-id');
        $('#main-search-form input[name=searchToPayment]').remove();
        $('#main-search-form input[name=searchBePayment]').remove();
            $('#main-search-form').append(
                '<input type="hidden" name="searchToPayment" value="'+to+'">' +
                '<input type="hidden" name="searchBePayment" value="'+be+'">'
            )
            $('#searchToPayment').val(to);
            $('#searchBePayment').val(be);
        $('#main-search-form').submit();
    }

    $('.back-arr').on("click",function () {
        window.history.back();
    })
    //게시판글쓰기
    function chkInputValue(id, msg){
        if ( $.trim($(id).val()) == "") {
            alert(msg+" 입력해주세요.");
            $(id).focus();
            return false;
        }
        return true;
    }
    function fn_formSubmit(login){

        if ( ! chkInputValue("#brdwriter", "작성자 이름을")) return;
        if ( ! chkInputValue("#brdtitle", "제목을")) return;
        if ( ! chkInputValue("#brdmemo", "내용을")) return;
        if(!login){
            if ( ! chkInputValue("#password", "비밀번호")) return;
        }

        $("#form1").submit();
    }
    //동적 최소높이
$(document).ready(function(){
    var dp1Height = $('.gnb-submenu').height();
    $('.gnb-submenu-2dp').css({'min-height':+dp1Height+'px'});
    $('.gnb-submenu>li').mouseover(function(){
        var dp2Height = $(this).find($('.gnb-submenu-2dp')).height();
        $(this).find($('.gnb-submenu-3dp')).css({'min-height':+dp2Height+'px'});
    });
});

//상품코드정보 조회 모달
$(".codeSrc").click(function(e){
    $('.dataListView').html();
    e.preventDefault();
    $(".codeSrcModal").attr("style", "display:block");
    $('body').css("overflow", "hidden");
    $(".srcButton").attr("data-id",$(this).attr("data-id"));
    var dataList = commonAjaxListCall('POST','/Manager/CallCodeList',{"product_class_code_type":$(this).attr("data-id")});
    var html;
    $.each(dataList.getProductCodeList,function (key,value) {
        html +='' +
            '<tr data-id="'+value.product_class_code+'">' +
            '<td><div class="codeRadio"></div></td>' +
            '<td>'+value.product_class_code+'</td>' +
            '<td>'+value.product_class_name+'</td>' +
            '<td>'+value.product_class_code_type_name+'</td>' +
            '</tr>';
    })
    $('.dataListView').html(html);

    callTableTrStyle($(this).attr("data-id"))
});
//상품코드등록
$(".srcButton").click(function(e){
    commonAjaxListCall('POST','/Save/codeInsert',{"product_class_code_type":$(this).attr("data-id"),"product_class_name":$('input[name=product_class_name]').val()});
    // commonAjaxListCall('POST','/Manager/CallCodeList',{"product_class_code_type":$(this).attr("data-id")});
    var dataList = commonAjaxListCall('POST','/Manager/CallCodeList',{"product_class_code_type":$(this).attr("data-id")});
    var html;
    $.each(dataList.getProductCodeList,function (key,value) {
        html +='' +
            '<tr data-id="'+value.product_class_code+'">' +
            '<td><div class="codeRadio"></div></td>' +
            '<td>'+value.product_class_code+'</td>' +
            '<td>'+value.product_class_name+'</td>' +
            '<td>'+value.product_class_code_type_name+'</td>' +
            '</tr>';
    })
    $('.dataListView').html(html);
    callTableTrStyle($(this).attr("data-id"))
});

function callTableTrStyle(type){
    $(".codeSrcTable tbody tr").on("click",function(){
        $(".codeSrcTable tbody tr").removeClass('active');
        $(this).addClass('active');
        if(type == "O"){
            $('input[name=product_origin]').val( $(this).attr("data-id"));
        }
        if(type == "B"){
            $('input[name=product_brand]').val( $(this).attr("data-id"));
        }
        if(type == "M"){
            $('input[name=product_made_company_cd]').val( $(this).attr("data-id"));
        }
        if(type == "T"){
            $('input[name=product_trend]').val( $(this).attr("data-id"));
        }
        if(type == "S"){
            $('input[name=product_supplier]').val( $(this).attr("data-id"));
        }

        $(".codeSrcModal").attr("style", "display:none");
    });

}
//저장 후 결과만
function commonAjaxSaveCall(type,url,formData,popup=false){
    var alertType;
    var showText;
    var hideAfterType;
    var heading;
    var dataList = $.ajax({
        type: type,
        url: url,
        data:formData,
        async: false,
        success: function (data) {

            if (data.validateError) {
                $('.validateError').empty();
                $.each(data.validateError, function (index, item) {
                    if(index == "Info"){
                        if(!data.isLogin){
                            alertType = "info";
                            // heading = "<button type='button' class='btn-default' id='toastLoginLink'>로그인</button>"
                            heading = "Info"
                            showText = item
                            hideAfterType=false;
                        }
                    }else if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                        heading = "Error";
                        hideAfterType=2000;
                    }else{
                        alertType = "error";
                        showText = item;
                        heading = "Error"
                        showText = index + " (은) " + item;
                        hideAfterType=2000;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: heading,
                        icon: alertType,
                        hideAfter: hideAfterType,
                    });
                });
            }else{

                $.toast({
                    text: 'success',
                    showHideTransition: 'plain', //펴짐
                    position: 'top-right',
                    icon: 'success',
                    hideAfter:2000,
                    afterHidden: function () {
                        if(popup){
                            window.close()
                        }
                    }
                });
            }
        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );
        }
    }).responseText;
    return JSON.parse(dataList);
}
//Q&A 등록
$('#qnaWriteSubmit').on("click",function () {
    var formData = $('#defaultForm').serialize()
    commonAjaxSaveCall("POST","/Save/writeQna",formData,true)
    opener.parent.callQnalist($('input[name=product_cd]').val(),1);
})
$(document).on("click",'#toastLoginLink',function () {
    opener.location.href='/sign/login';
    window.close();
})
//상품 문의 ajaxPaging 구현필요
function callQnalist(product_cd,page=1) {
    var formData = {"product_cd":product_cd,"page":page};
    var dataList = commonAjaxListCall("POST","/product/listQna",formData);
    var html='';
    var qnaAnswer='';
    var lock='';
    var paging ='';
    $('.qna-data-list').html('');

    $.each(dataList.list,function (key,value) {

        if(value.rewriter_name != null){
            qnaAnswer = '<span class="waiting">답변완료</span>';
        }else{
            qnaAnswer = '<span class="complete">답변대기</span>';
        }
        if(value.qna_open_type=="T"){
            lock='<i class="lock-ic"></i>'
        }else{
            lock='';
        }
        html +='' +
            '<li class="qna-data-item">' +
                '<div class="main-title-box" tabindex="0">' +
                    '<div class="qna-sort"><span>'+value.qna_type_name+'</span></div>' +
                    '<div class="qna-title"><span>'+value.qna_title+'</span>'+lock+'</div>' +
                    '<div class="qna-answer">'+qnaAnswer+'</div>' +
                    '<div class="qna-author"><span>'+value.email+'</span></div>' +
                    '<div class="qna-date"><span>'+value.reg_date+'</span></div>' +
                '</div>';
        //비공개 시 글쓴이만 열람 가능
        html +='' +
                '<div class="content-box">\n';
        if(value.qna_writer_id == dataList.usr_id){
            html +='' +
                '    <div class="qna-setting-box">\n' +
                '        <button type="button" class="modify">수정</button>\n' +
                '        <button type="button" class="delete" onclick="deleteSelectQna()">삭제</button>\n' +
                '    </div>\n';
        }
        //공개
        if(value.qna_open_type == "F"){
            html +='' +
                '    <div class="qna-content-body">\n' +
                '       <div class="qna-content-body-q">\n' +
                '            <p class="q-sort">Q</p>\n' +
                '            <p>\n' + value.qna_memo +'</p>\n' +
                '       </div>\n' +
                '       <div class="qna-content-body-a">\n' +
                '            <p class="a-sort">A</p>\n' +
                '            <p>\n' +value.qna_rewrite_memo +'</p>\n' +
                '    </div>\n' +
                '    <p class="answer-date">답변일 : '+value.qna_rewrite_reg_date+'</p>';
        //비공개
        }else{
            if(value.qna_writer_id == dataList.usr_id){
                html +='' +
                    '    <div class="qna-content-body">\n' +
                    '       <div class="qna-content-body-q">\n' +
                    '            <p class="q-sort">Q</p>\n' +
                    '            <p>\n' + value.qna_memo +'</p>\n' +
                    '       </div>\n' +
                    '       <div class="qna-content-body-a">\n' +
                    '            <p class="a-sort">A</p>\n' +
                    '            <p>\n' +value.qna_rewrite_memo +'</p>\n' +
                    '    </div>\n' +
                    '    <p class="answer-date">답변일 : '+value.qna_rewrite_reg_date+'</p>';
            }else{
                html +='' +
                    '    <div class="qna-content-body">\n' +
                    '       <div class="qna-content-body-q">\n' +
                    '            <p>비공개 글입니다.</p>\n' +
                    '       </div>\n'+
                    '    </div>\n';
            }
        }
        html +='' +
                '</div>\n';
        html +='' +
            '</li>';
    });

    $('.qna-data-option-box .all a span').html(dataList.listCnt);
    $('.qna-data-list').append(html);
    $('.pagination').html('');
    $('.pagination').append(ajaxPaging(dataList.pageVO,product_cd))
}
$('#secret').on("change",function () {
    if($(this).is(":checked")){
        $('input[name=qna_open_type]').val("T");
    }else{
        $('input[name=qna_open_type]').val("F");
    }
})
function ajaxPaging(pageVO,key){
    var html='';
    var active='';
    html +='' +

        '    <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="callQnalist(\''+key+'\',1)">≪</a></li>\n' +
        '    <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="callQnalist(\''+key+'\','+(pageVO.page-1)+')">＜</a></li>\n';
    for(var i=pageVO.pageStart;i<=pageVO.pageEnd;i++){

        if(i == pageVO.page){
            active='active';
        }else{
            active='';
        }
        html +='' +
            '    <li class="page-item"><a class="page-link '+active+'" href="javascript:void(0)" onclick="callQnalist(\''+key+'\','+i+')">'+i+'</a></li>\n';
    }

    html +='' +
        '    <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="callQnalist(\''+key+'\','+(pageVO.page+1)+')">＞</a></li>\n' +
        '    <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="callQnalist(\''+key+'\','+(pageVO.totPage)+')">≫</a></li>\n';
        '    <li class="page-item"><a class="page-link" href="#">＞</a></li>\n' +
        '    <li class="page-item"><a class="page-link" href="#">≫</a></li>\n';
    return html;
}
//관리자 > 상품관리 > 일괄 수정
function listProductUpdate(column,update_value) {
    var formData = $('#defaultListForm').serialize()+'&column='+column+'&update_value='+update_value
    commonAjaxCall("POST","/Manager/productListUpdate",formData);
}
//관리자 > 상푼관리 > 재구 수정
function  listProductUpdateStock() {
    if($('input[name=chk]:checked').length <1){
        alert("수정할 대상을 선택하세요");
    }else{
        $('.UpdateStock').attr("style","display:block");
    }

    // updateStockSubmit
}
$('#updateStockSubmit').on("click",function () {
    var formData = $('#defaultListForm').serialize()+'&product_stock_use_yn='+$('input[name=product_stock_use_yn]').val()+'&product_stock_quantity='+$('input[name=product_stock_quantity]').val()
    commonAjaxCall("POST","/Manager/productListUpdateStock",formData);

})

//클립보드복사
function copyToClipboard(val) {
  var t = document.createElement("textarea");
  document.body.appendChild(t);
  t.value = val;
  t.select();
  document.execCommand('copy');
  document.body.removeChild(t);
  alert("copy!")
}

//엑셀다운버튼
//$(".excelBtn").on("click",function(){
//	var type = $(this).attr("data-id");
//	$('form:eq(0)').append(`
//		<button type='submit' formaction='/${type}/downloadExcelFile'>submit</button>
//	`);
//	$('form:eq(0) button:last').click();
//	$('form:eq(0) button:last').remove();
//});

//선택다운버튼
$(".excelBtn").on("click",function(){
	if(!$('#defaultListForm input[name=chk]:checked').val()){
		$.toast({
            text: "다운받을 항목을 선택해주세요.",
            showHideTransition: 'plain', //펴짐
            position: 'top-right',
            heading: 'Error',
            icon: 'error'
        });
		return;
	}
	
	var type = $(this).attr("data-id");
	$('#defaultListForm').append(`
		<button type='submit' formaction='/${type}/downloadExcelFile'>submit</button>
	`);
	$('#defaultListForm button:last').click();
	$('#defaultListForm button:last').remove();
})
