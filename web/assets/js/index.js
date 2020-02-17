 
$(document).ready(function(){
    $('.top-first-ul li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('.top-first-ul li').removeClass('on');
        $('.main-top-first .ul-tab-box').removeClass('on');

        $(this).addClass('on');
        $("#"+tab_id).addClass('on');
    })
});
$(document).ready(function(){
    $('.main-tab-box p').click(function(){
        var tab_id = $(this).attr('data-tab');
        $('.main-tab-box p').removeClass('on');
        $('.main-content .tab-box').removeClass('on');
        $(this).addClass('on');
        $("#"+tab_id).addClass('on');
    })
$(document).ready(function(){
    $(".category-tree-2dp").hide();
        $(".category-tree li a").click(function(){
            event.preventDefault();
            $(this).next().slideToggle(300);
        });
    });
    $(function(){
        $('.category-tree li>a').click(function(){
        $('.category-tree li>a').removeClass('active');
        $(this).addClass('active');
        });
    })
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
    //file upload
    var uploadFile = $('.fileBox .uploadBtn');

    uploadFile.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }
        $(this).siblings('.fileName').val(filename);
    });

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
        });
        $(".modal-close").click(function(){
            $(".modal").attr("style", "display:none");
        });

        $(".product-list1").click(function(){
            $(".modal1").attr("style", "display:block");
        });
        $(".modal-close1").click(function(){
            $(".modal1").attr("style", "display:none");
        });
        $(".product-list2").click(function(){
            $(".modal2").attr("style", "display:block");
        });
        $(".modal-close2").click(function(){
            $(".modal2").attr("style", "display:none");
        });
    });
    $(function(){
        $("button[name='detail']").click(function(){
            $(".modal").attr("style", "display:block");
        });
        $(".modal-close").click(function(){
            $(".modal").attr("style", "display:none");
        });
        $("button[name='detail1']").click(function(){
            $(".modal1").attr("style", "display:block");
        });
        $(".modal-close").click(function(){
            $(".modal1").attr("style", "display:none");
        });
    });
    //modal
    $(function(){
         $("button[name='detail']").click(function(){
            $(".modal").attr("style", "display:block");
        });
        $(".modal-close").click(function(){
            $(".modal").attr("style", "display:none");
        });

        $("button[name='detail0']").click(function(){
            $(".modal1").attr("style", "display:block");
        });
        $(".modal-close").click(function(){
            $(".modal1").attr("style", "display:none");
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
    });
    $(".modal-close").click(function(){
        $(".modal").attr("style", "display:none");
    });

    $("button[name='detail1']").click(function(){
        $(".modal1").attr("style", "display:block");
    });
    $(".modal-close").click(function(){
        $(".modal1").attr("style", "display:none");
    });
    $(".search-even-but").click(function(){
        $(".modal2").attr("style", "display:block");
    });
    $(".modal-close2").click(function(){
        $(".modal2").attr("style", "display:none");
    });
    $("button[name='detail2']").click(function(){
        $(".modal3").attr("style", "display:block");
    });
    $(".modal-close3").click(function(){
        $(".modal3").attr("style", "display:none");
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




//ckeditor
// CKEDITOR.replace( 'editor' );
// CKEDITOR.replace( 'editor1' );
