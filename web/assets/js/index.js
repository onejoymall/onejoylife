 
$(document).ready(function(){
    $('.top-first-ul li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('.top-first-ul li').removeClass('on');
        $('.main-top-first .ul-tab-box').removeClass('on');

        $(this).addClass('on');
        $("#"+tab_id).addClass('on');
    });
});
$(document).ready(function(){
    $('.main-tab-box p').click(function(){
        var tab_id = $(this).attr('data-tab');
        $('.main-tab-box p').removeClass('on');
        $('.main-content .tab-box').removeClass('on');
        $(this).addClass('on');
        $("#"+tab_id).addClass('on');
    });
$(document).ready(function(){
    $(".category-tree-2dp").hide();
        $(".category-tree li a").click(function(){
            event.preventDefault();
            $(this).next().slideToggle(300);
        });
    $(function(){
        $('.category-tree li>a').click(function(){
        $('.category-tree li>a').removeClass('active');
        $(this).addClass('active');
        });
    });
});






$(document).ready(function(){
    $('.notice-section-ul li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('.notice-section-ul li').removeClass('on');
        $('.notice-section .ul-tab-box').removeClass('on');

        $(this).addClass('on');
        $("#"+tab_id).addClass('on');
    });
});
$(document).ready(function(){
    $('.goods-list-tab th').click(function(){
        var data_id = $(this).attr('data-tab');
        $('.goods-list-tab th').removeClass('on');
        $('.in-list-tab').removeClass('on');
        $(this).addClass('on');
        $("#"+data_id).addClass('on');
    });
});
    // 달력
    $(function() { 
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            showMonthAfterYear:true,
            monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
            numberOfMonths: [1,1],
        });
        $(".date_pick").datepicker();                    
    });
    //시간
    $(function(){
    	$('.time_pick').timepicker({
		    timeFormat: 'hh:mm p',
		    interval: 60,
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
    })
    //file upload
    // var uploadFile = $('.fileBox .uploadBtn');
    //
    // uploadFile.on('change', function(){
    //     if(window.FileReader){
    //         var filename = $(this)[0].files[0].name;
    //     } else {
    //         var filename = $(this).val().split('/').pop().split('\\').pop();
    //     }
    //     $(this).siblings('.fileName').val(filename);
    // });

    var uploadFile2 = $('.fileBox2 .uploadBtn2');
    uploadFile2.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        $(this).siblings('.fileName2').val(filename);
    });
    // 모달
    $(function(){
         $(".product-list").click(function(){
            $(".modal").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".modal-close").click(function(){
            $(".modal").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });

        $(".product-list1").click(function(){
            $(".modal1").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".modal-close1").click(function(){
            $(".modal1").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
        $(".product-list2").click(function(){
            $(".modal2").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".modal-close2").click(function(){
            $(".modal2").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("button[name='detail']").click(function(){
            $(".modal").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".modal-close").click(function(){
            $(".modal").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
        $("button[name='detail1']").click(function(){
            $(".modal1").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $("button[name='detail0']").click(function(){
            $(".modal1").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
    });
    //매출현황 modal
    $(function(){
         $(".modal-open").click(function(){
             if($('.modal2').css('display') == 'none'){
                $(".modal2").attr("style", "display:block");
                $(".modal-content2").animate({
                    bottom: 0
                }, 100,'easeOutBounce');
                $('.modal-open').animate({
                    bottom:'400px'
                },100,'easeOutBounce');
                $('body').css("overflow", "hidden");
             }else{
                $(".modal-content2").animate({
                    bottom:'-400px'
                }, 100,'easeOutBounce');
                $('.modal-open').animate({
                    bottom:'0px'
                },100,'easeOutBounce');
                $(".modal2").attr("style", "display:none");
                $('body').css("overflow", "auto");
             }
        });
        $('.modal2').click(function(){
            $('.modal-open').trigger("click");
        });
    });
    //checkbox1
    //company-app, category, 
    $(function(){
        $('#all-chk').click(function(){
            var chk = $(this).is(':checked');//.attr('checked');
            if(chk) $('.goods-list-wrap input').prop('checked',true);
            else $('.goods-list-wrap input').prop('checked',false);
        });
    });
    $('#all-chk1').click(function(){
            var chk = $(this).is(':checked');//.attr('checked');
            if(chk) $('.goods-list-wrap1 input').prop('checked',true);
            else $('.goods-list-wrap1 input').prop('checked',false);
        });
    //checkbox2
    $(function(){
        $('#all-chk1').click(function(){
            var chk = $(this).is(':checked');//.attr('checked');
            if(chk) $('.sort-wrap-table1 input').prop('checked',true);
            else $('.sort-wrap-table1 input').prop('checked',false);
        });
        $('#all-chk2').click(function(){
            var chk = $(this).is(':checked');//.attr('checked');
            if(chk) $('.sort-wrap-table2 input').prop('checked',true);
            else $('.sort-wrap-table2 input').prop('checked',false);
        });
    });
    $(function(){
        $('#all-chk2').click(function(){
            var chk = $(this).is(':checked');//.attr('checked');
            if(chk) $('.goods-detail-table input').prop('checked',true);
            else $('.goods-detail-table input').prop('checked',false);
        });
    });
});

//promotion.html
//checkbox
$(function(){
    $('#all-chk1').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.sort-wrap-table1 input').prop('checked',true);
        else $('.sort-wrap-table1 input').prop('checked',false);
    });
    $('#all-chk2').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.sort-wrap-table2 input').prop('checked',true);
        else $('.sort-wrap-table2 input').prop('checked',false);
    });
    $('#all-chk3').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.sort-wrap-table3 input').prop('checked',true);
        else $('.sort-wrap-table3 input').prop('checked',false);
    });
    $('#all-chk4').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.sort-wrap-table4 input').prop('checked',true);
        else $('.sort-wrap-table4 input').prop('checked',false);
    });
    $('#all-chk5').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.sort-wrap-table5 input').prop('checked',true);
        else $('.sort-wrap-table5 input').prop('checked',false);
    });
    $('#all-chk6').click(function(){
        var chk = $(this).is(':checked');//.attr('checked');
        if(chk) $('.goods-list-wrap6 input').prop('checked',true);
        else $('.goods-list-wrap6 input').prop('checked',false);
    });
});
//modal
$(function(){
    $("button[name='detail']").click(function(){
        $(".modal").attr("style", "display:block");
        $("body").css("overflow", "hidden");
    });
    $(".modal-close").click(function(){
        $(".modal").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });

    $("button[name='detail1']").click(function(){
        $(".modal1").attr("style", "display:block");
        $('body').css("overflow", "hidden");
    });
    $(".modal-close").click(function(){
        $(".modal1").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });
    $(".search-even-but").click(function(){
        $(".modal2").attr("style", "display:block");
        $('body').css("overflow", "hidden");
    });
    $(".modal-close2").click(function(){
        $(".modal2").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });
    $("button[name='detail2']").click(function(){
        $(".modal3").attr("style", "display:block");
        $('body').css("overflow", "hidden");
    });
    $(".modal-close3").click(function(){
        $(".modal3").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });

    $("button[name='mo-btn']").click(function(){
        $(".modal2").attr("style", "display:block");
        $('body').css("overflow", "hidden");
    });
    $(".modal-close4").click(function(){
        $(".modal2").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });

    $(".member-list-btn").click(function(){
        $(".modal3").attr("style", "display:block");
        $('body').css("overflow", "hidden");
    });
    $(".modal3-close").click(function(){
        $(".modal3").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });
    $(".member-add").click(function(){
        $(".modal2").attr("style", "display:block");
        $('body').css("overflow", "hidden");
    });
    $(".modal2-close").click(function(){
        $(".modal2").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });
    $("button[name='detail2-1']").click(function(){
        $(".modal2").attr("style", "display:block");
        $('body').css("overflow", "hidden");
    });
    $(".modal-close").click(function(){
        $(".modal2").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });
    $("button[name='detail3']").click(function(){
        $(".modal3").attr("style", "display:block");
        $('body').css("overflow", "hidden");
    });
    $(".modal-close").click(function(){
        $(".modal3").attr("style", "display:none");
        $('body').css("overflow", "auto");
    });
});
//file upload
var uploadFile1 = $('.fileBox1 .uploadBtn1');
uploadFile1.on('change', function(){
    if(window.FileReader){
        var filename1 = $(this)[0].files[0].name;
    } else {
        var filename1 = $(this).val().split('/').pop().split('\\').pop();
    }
    $(this).siblings('.fileName1').val(filename1);
});

var uploadFile2 = $('.fileBox2 .uploadBtn2');
uploadFile2.on('change', function(){
    if(window.FileReader){
        var filename2 = $(this)[0].files[0].name;
    } else {
        var filename2 = $(this).val().split('/').pop().split('\\').pop();
    }
    $(this).siblings('.fileName2').val(filename2);
});

var uploadFile3 = $('.fileBox3 .uploadBtn3');
uploadFile3.on('change', function(){
    if(window.FileReader){
        var filename3 = $(this)[0].files[0].name;
    } else {
        var filename3 = $(this).val().split('/').pop().split('\\').pop();
    }
    $(this).siblings('.fileName3').val(filename3);
});

$(function(){
    //사용가능 기준금액
    $('input[name=goods-validity]').click(function(){
        if($('input[name=goods-validity]:checked').val() == "Y"){
            $('tr.goods-validity-detail1').attr('style','display:table-row');
            $('tr.goods-validity-detail2').attr('style','display:none')
            $('tr.goods-validity-detail2 input[type=text]').val('');
        }
        else if($('input[name=goods-validity]:checked').val() == "N"){
            $('tr.goods-validity-detail2').attr('style','display:table-row');
            $('tr.goods-validity-detail1').attr('style','display:none');
            $('tr.goods-validity-detail1 input[type=text]').val('');
        }
        else if($('input[name=goods-validity]:checked').val() == "O"){
            $('tr.goods-validity-detail2').attr('style','display:none');
            $('tr.goods-validity-detail1').attr('style','display:none');
            $('tr.goods-validity-detail1 input[type=text]').val('');
            $('tr.goods-validity-detail2 input[type=text]').val('');
        }
    })
    // 혜택구분 promotion-coupon.html
    $('input[name=discount-radio]').click(function(){
        if($('input[name=discount-radio]:checked').val() == "one"){
            $('tr.discount-detail1').attr('style','display:table-row');
            $('tr.discount-detail2').attr('style','display:none')
            $('tr.discount-detail2 input[type=text]').val('');
        }
        else{
            $('tr.discount-detail2').attr('style','display:table-row');
            $('tr.discount-detail1').attr('style','display:none')
            $('tr.discount-detail1 input[type=text]').val('');
        }
    })
    
    //발급구분 promotion-coupon.html
    $('.option-box').change(function() {
        var state = $('.option-box option:selected').val();
        if ( state == 'option1' ) {
            $('.option1-box').show();
            $('#option2-select').hide();
            $('#option3-select').hide();
            $('.option2-box').hide();
            $('.option3-box').hide();
        }
        else if ( state == 'option2' ) {
            $('#option2-select').show();
            $('.option2-box').show();
            $('.option1-box').hide();
            $('#option3-select').hide();
            $('.option3-box').hide();
        } 
        else if (state == 'option3' ){
            $('#option3-select').show();
            $('.option3-box').show();
            $('#option2-select').hide();
            $('.option2-box').hide();
            $('.option1-box').hide();
        }
    });
    $('#option2-select').change(function() {
        var state1 = $('#option2-select option:selected').val();
        if ( state1 == 'option2-1' ) {
            $('table.option2-box').children('tr').attr('style','display:none');
            $('.option2-box1').show();
            
        }
        else if ( state1 == 'option2-2' ) {
            $('table.option2-box').children('tr').attr('style','display:none');
            $('.option2-box2').show();
        }
    });

});
$(function(){
    //품목구성방식1
    $('input[name=goods-compType]').click(function(){
        if($('input[name=goods-compType]:checked').val() == "T"){
            $('tr.goods-compType-t-detail').attr('style','display:table-row');
        }else{
            $('tr.goods-compType-t-detail').attr('style','display:none');
            $('input[name=goods-optionType]').prop('checked',false);
        }
    })
    $('input[name=goods-compType]').click(function(){
        if($('input[name=goods-compType]:checked').val() == "E"){
            $('tr.goods-compType-e-detail').attr('style','display:table-row');
        }else{
            $('tr.goods-compType-e-detail').attr('style','display:none');
            $('input[name=goods-optionSet-name]').val('');
        }
    })
    //필수여부1
    $('input:radio[name=goods-compType]').on('click', function(){
        if($("input[name=goods-compType]:checked").val() == "T"){
            $("input:text[name=goods-option-mandatory]").attr("disabled",true);
            // radio 버튼의 value 값이 T라면 비활성화

        }else{$("input:text[name=goods-option-mandatory]").attr("disabled",false);
            // 활성화
        }
    });
    //품목구성방식2
    $('input[name=goods-compType2]').click(function(){
        if($('input[name=goods-compType2]:checked').val() == "T2"){
            $('tr.goods-compType-t-detail2').attr('style','display:table-row');
        }else{
            $('tr.goods-compType-t-detail2').attr('style','display:none');
            $('input[name=goods-optionType2]').prop('checked',false);
        }
    })
    $('input[name=goods-compType2]').click(function(){
        if($('input[name=goods-compType2]:checked').val() == "E2"){
            $('tr.goods-compType-e-detail2').attr('style','display:table-row');
        }else{
            $('tr.goods-compType-e-detail2').attr('style','display:none');
            $('input[name=goods-optionSet-name]').val('');
        }
    })
    //필수여부2
    $('input:radio[name=goods-compType2]').on('click', function(){
        if($("input[name=goods-compType2]:checked").val() == "T2"){
            $("input:text[name=goods-option-mandatory2]").attr("disabled",true);
            // radio 버튼의 value 값이 T라면 비활성화

        }else{$("input:text[name=goods-option-mandatory2]").attr("disabled",false);
            // 활성화
        }
    });
    // 공지
    $('#date-ck1').on('click', function(){
        if($("#date-ck1:checked").val() == "T"){
            $(".check-in1 *").attr("disabled",false);

        }else{$(".check-in1 *").attr("disabled",true);
        }
    });
    $('#date-ck2').on('click', function(){
        if($("#date-ck2:checked").val() == "T2"){
            $(".check-in2 *").attr("disabled",false);

        }else{$(".check-in2 *").attr("disabled",true);
        }
    });
    $('#authority-rd6-n').on('click', function(){
        if($("#authority-rd6-n:checked").val() == "T2"){
            $(".noti-ck-box *").attr("disabled",true);

        }else{$(".noti-ck-box *").attr("disabled",false);
        }
    });
});
