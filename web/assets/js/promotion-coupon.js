// modal
$(function(){
    $("button[name='detail']").click(function(){
        $(".modal").attr("style", "display:block");
    });

    $(".modal-close").click(function(){
        $(".modal").attr("style", "display:none");
    });
    
    // 혜택구분
    $('input[name=coupon_sale_type]').on("input change click",function(){
        if($('input[name=coupon_sale_type]:checked').val() == "amount"){
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
    // option-coupon
    $('.option-box').change(function(){
        var state=$('.option-box option:selected').attr("data-id");
        $('.option-select, .option-wrap').hide();
        $('.' + state + '-box, #' + state + '-select').show();
        $('#option2-select').val("J").trigger('change');
        $('#option3-select').val("L").trigger('change');
        
        if(state == 'option1'){
        	$('.option1-box').show();
        	$('.option0-box').show(); 
        }else{
        	$('.option0-box').hide();
        }
        if(state == 'option2'){
        	$('.option1-box').hide(); 
        }
    });
    $('.option-box, #option2-select, #option3-select').change(function(){
        $('.option-wrap').find('option:eq(0)').trigger('change');
    });
    
    $('#option2-select').change(function() {
        var state1 = $('#option2-select option:selected').attr("data-id");
        var state1i = $('#option2-select option:selected').index();
        var state1ii = state1i + 1;
        var stateOri = state1ii; 
        if(state1ii == 3){
        	$('.option1-box').show(); 
        	$(".option1-box1").hide();
        	$("input[name=coupon_issue_time]:radio[value='A']").prop("checked",true);
        }else{
        	$('.option1-box').hide(); 
        	$(".option1-box1").show();
        	$(".option2-box3").hide();
        	$("input[name=coupon_issue_time]:radio[value='N']").prop("checked",true);
        }
        if(state1ii == 5) state1ii = 2;
        if(state1ii == 6) state1ii = 2;
        $('.option2-box tbody').children('tr').attr('style','display:none');
        $('.option2-box' + state1ii).show();
        if(stateOri == 6) $(".option2-box2-1").hide();
        if(state1ii == 7) $('.option2-box2-2').show();
    });

    $('#box2-out-select1').change(function() {
        var state = $('#box2-out-select1 option:selected').val();
        if ( state == 'box2-in1-1' ) {
            $('.box2-span').hide();
        }
        else if ( state == 'box2-in1-2' ) {
            $('.box2-txt1').show();
            $('.box2-txt2').hide();
        }
        else if ( state == 'box2-in1-3' ) {
            $('.box2-txt2').show();
            $('.box2-txt1').hide();
        }
    });
    $('#box2-out-select2').change(function() {
        var state = $('#box2-out-select2 option:selected').val();
        if ( state == 'box2-in2-1' ) {
            $('.option2-box2-in2').hide();
        }
        else if ( state == 'box2-in2-2' ) {
            $('.option2-box2-in2').show();
        }
    });

    $('#box5-out-select1').change(function() {
        var state = $('#box5-out-select1 option:selected').val();
        if ( state == 'box5-in1-1' ) {
            $('.box5-span').hide();
        }
        else if ( state == 'box5-in1-2' ) {
            $('.box5-txt1').show();
            $('.box5-txt2').hide();
        }
        else if ( state == 'box5-in1-3' ) {
            $('.box5-txt2').show();
            $('.box5-txt1').hide();
        }
    });
    $('#box5-out-select2').change(function() {
        var state = $('#box5-out-select2 option:selected').val();
        if ( state == 'box5-in2-1' ) {
            $('.option2-box5-in2').hide();
        }
        else if ( state == 'box5-in2-2' ) {
            $('.option2-box5-in2').show();
        }
    });
    $('#option3-select').change(function() {
        var state1 = $('#option3-select option:selected').attr("data-id");
        if ( state1 == 'option3-1' ) {
            $('.option3-box tbody').children('tr').attr('style','display:none');
            $('.option3-box1').show();
            $('.option1-box').show(); 
        }
        else if ( state1 == 'option3-2' ) {
            $('.option3-box tbody').children('tr').attr('style','display:none');
            $('.option3-box2').show();
            $('.option1-box').hide();
        }
        $("#option2-select option:eq(0)").prop("selected", true);
    });
    // 발급시점
    $('input:radio[name=coupon_issue_time]').on('click', function(){
        if($("input[name=coupon_issue_time]:checked").val() == "E"){
            $("input:text[name=coupon_anniversary_before]").attr("disabled",true);
            
        }else{$("input:text[name=coupon_anniversary_before]").attr("disabled",false);
        }
    });

    $('input[name=coupon_issue_time]').click(function(){
        if($('input[name=coupon_issue_time]:checked').val() == "S"){
            $('#option1-rd2-txt').attr('style','display:table-row');
        }else{
            $('#option1-rd2-txt').attr('style','display:none');
        }
    })
    $('input[name=iss1]').click(function(){
        if($('input[name=iss1]:checked').val() == "iss-val"){
            $('#option3-rd2-txt').attr('style','display:table-row');
        }else{
            $('#option3-rd2-txt').attr('style','display:none');
        }
    })
    // 발급수 제한, 재발급 여부
    $('input:radio[name=iss-count]').on('click', function(){
        if($("input[name=iss-count]:checked").val() == "count-I1"){
            $("input:text[name=iss-count-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-count-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-yn]').on('click', function(){
        if($("input[name=iss-yn]:checked").val() == "yn-I1"){
            $("input:text[name=iss-yn-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-yn-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-count1]').on('click', function(){
        if($("input[name=iss-count1]:checked").val() == "count-I2"){
            $("input:text[name=iss-count1-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-count1-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-yn1]').on('click', function(){
        if($("input[name=iss-yn1]:checked").val() == "yn-I2"){
            $("input:text[name=iss-yn1-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-yn1-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-count2]').on('click', function(){
        if($("input[name=iss-count2]:checked").val() == "count-I3"){
            $("input:text[name=iss-count2-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-count2-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-yn2]').on('click', function(){
        if($("input[name=iss-yn2]:checked").val() == "yn-I3"){
            $("input:text[name=iss-yn2-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-yn2-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-yn3]').on('click', function(){
        if($("input[name=iss-yn3]:checked").val() == "yn-I4"){
            $("input:text[name=iss-yn3-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-yn3-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-count3]').on('click', function(){
        if($("input[name=iss-count3]:checked").val() == "count-I4"){
            $("input:text[name=iss-count3-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-count3-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-yn4]').on('click', function(){
        if($("input[name=iss-yn4]:checked").val() == "yn-I5"){
            $("input:text[name=iss-yn4-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-yn4-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-count4]').on('click', function(){
        if($("input[name=iss-count4]:checked").val() == "count-I5"){
            $("input:text[name=iss-count4-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-count4-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-yn5]').on('click', function(){
        if($("input[name=iss-yn5]:checked").val() == "yn-I6"){
            $("input:text[name=iss-yn5-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss-yn5-span]").attr("disabled",false);
        }
    });
    //발급수량
    $('input:radio[name=iss-num]').on('click', function(){
        if($("input[name=iss-num]:checked").val() == "I1"){
            $("select[name=iss-num-select]").attr("disabled",true);
            
        }else{$("select[name=iss-num-select]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-num1]').on('click', function(){
        if($("input[name=iss-num1]:checked").val() == "I2"){
            $("select[name=iss-num1-select]").attr("disabled",true);
            
        }else{$("select[name=iss-num1-select]").attr("disabled",false);
        }
    });
    // 주문기간 설정
    $('input:radio[name=iss-day]').on('click', function(){
        if($("input[name=iss-day]:checked").val() == "D1"){
            $("input[name=coupon_issue_order_end]").attr("disabled",true);
            
        }else{
        	$("input[name=coupon_issue_order_end]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-day1]').on('click', function(){
        if($("input[name=iss-day1]:checked").val() == "D2"){
            $("input[name=day-iss2]").attr("disabled",true);
            
        }else{$("input[name=day-iss2]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-day2]').on('click', function(){
        if($("input[name=iss-day2]:checked").val() == "D3"){
            $("input[name=day-iss3]").attr("disabled",true);
            
        }else{$("input[name=day-iss3]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss-day3]').on('click', function(){
        if($("input[name=iss-day3]:checked").val() == "D4"){
            $("input[name=day-iss4]").attr("disabled",true);
            
        }else{$("input[name=day-iss4]").attr("disabled",false);
        }
    });
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
});

// modal1
$(function(){
    $("button[name='detail1']").click(function(){
        $(".modal1").attr("style", "display:block");
    });
    $(".modal-close").click(function(){
        $(".modal1").attr("style", "display:none");
    });
    // 혜택구분
    $('input[name=discount1-radio]').click(function(){
        if($('input[name=discount1-radio]:checked').val() == "one"){
            $('tr.discount1-detail1').attr('style','display:table-row');
            $('tr.discount1-detail2').attr('style','display:none')
            $('tr.discount1-detail2 input[type=text]').val('');
        }
        else{
            $('tr.discount1-detail2').attr('style','display:table-row');
            $('tr.discount1-detail1').attr('style','display:none')
            $('tr.discount1-detail1 input[type=text]').val('');
        }
    })
    // option-coupon
    $('.option-box-modify').change(function(){
        var state=$('.option-box-modify option:selected').val();
        $('.modify-select, .option-wrap-modify').hide();
        $('.' + state + '-box, #' + state + '-select').show();
        $('#modify2-select option:eq(0)').trigger('change');
        $('#modify3-select option:eq(0)').trigger('change');
    });
    $('.option-box-modify, #modify2-select, #modify3-select').change(function(){
        $('.option-wrap-modify').find('option:eq(0)').trigger('change');
    });

     $('#modify2-select').change(function() {
        var state1 = $('#modify2-select option:selected').val();
        var state1i = $('#modify2-select option:selected').index();
        var state1ii = state1i + 1;
        $('.modify2-box tbody').children('tr').attr('style','display:none');
        $('.modify2-box' + state1ii).show();
         
    });

    $('#box2-out1-select1').change(function() {
        var state = $('#box2-out1-select1 option:selected').val();
        if ( state == 'box2-in1-1' ) {
            $('.box2-span').hide();
        }
        else if ( state == 'box2-in1-2' ) {
            $('.box2-txt1').show();
            $('.box2-txt2').hide();
        }
        else if ( state == 'box2-in1-3' ) {
            $('.box2-txt2').show();
            $('.box2-txt1').hide();
        }
    });
    $('#box2-out-select2').change(function() {
        var state = $('#box2-out2-select2 option:selected').val();
        if ( state == 'box2-in2-1' ) {
            $('.modify2-box2-in2').hide();
        }
        else if ( state == 'box2-in2-2' ) {
            $('.modify2-box2-in2').show();
        }
    });

    $('#box5-out2-select1').change(function() {
        var state = $('#box5-out2-select1 option:selected').val();
        if ( state == 'box5-in1-1' ) {
            $('.box5-span').hide();
        }
        else if ( state == 'box5-in1-2' ) {
            $('.box5-txt1').show();
            $('.box5-txt2').hide();
        }
        else if ( state == 'box5-in1-3' ) {
            $('.box5-txt2').show();
            $('.box5-txt1').hide();
        }
    });
    $('#box5-out1-select2').change(function() {
        var state = $('#box5-out1-select2 option:selected').val();
        if ( state == 'box5-in2-1' ) {
            $('.modify2-box5-in2').hide();
        }
        else if ( state == 'box5-in2-2' ) {
            $('.modify2-box5-in2').show();
        }
    });
    $('#modify3-select').change(function() {
        var state1 = $('#modify3-select option:selected').val();
        if ( state1 == 'modify3-1' ) {
            $('.modify3-box tbody').children('tr').attr('style','display:none');
            $('.modify3-box1').show();
        }
        else if ( state1 == 'modify3-2' ) {
            $('.modify3-box tbody').children('tr').attr('style','display:none');
            $('.modify3-box2').show();
        }
        $("#modify2-select option:eq(0)").prop("selected", true);
    });
    // 발급시점
    $('input[name=option1-radio1]').click(function(){
        if($('input[name=option1-radio1]:checked').val() == "option2-rd2-click1"){
            $('#option2-rd2-txt1').attr('style','display:table-row');
        }else{
            $('#option2-rd2-txt1').attr('style','display:none');
        }
    })
    $('input:radio[name=coupon_issue_time]').on('change', function(){
        if($("input[name=coupon_issue_time]:checked").val() == "A"){
            $("input:text[name=coupon_anniversary_before]").attr("disabled",true);
            
        }else{$("input:text[name=coupon_anniversary_before]").attr("disabled",false);
        }
    });
    $('input[name=iss1-2]').click(function(){
        if($('input[name=iss1-2]:checked').val() == "iss-val1"){
            $('#modi3-rd2-txt').attr('style','display:table-row');
        }else{
            $('#modi3-rd2-txt').attr('style','display:none');
        }
    })
    // 발급수 제한, 재발급 여부
    $('input:radio[name=iss1-count]').on('click', function(){
        if($("input[name=iss1-count]:checked").val() == "count-I1"){
            $("input:text[name=iss1-count-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-count-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-yn]').on('click', function(){
        if($("input[name=iss1-yn]:checked").val() == "yn-I1"){
            $("input:text[name=iss1-yn-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-yn-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-count1]').on('click', function(){
        if($("input[name=iss1-count1]:checked").val() == "count-I2"){
            $("input:text[name=iss1-count1-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-count1-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-yn1]').on('click', function(){
        if($("input[name=iss1-yn1]:checked").val() == "yn-I2"){
            $("input:text[name=iss1-yn1-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-yn1-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-count2]').on('click', function(){
        if($("input[name=iss1-count2]:checked").val() == "count-I3"){
            $("input:text[name=iss1-count2-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-count2-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-yn2]').on('click', function(){
        if($("input[name=iss1-yn2]:checked").val() == "yn-I3"){
            $("input:text[name=iss1-yn2-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-yn2-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-yn3]').on('click', function(){
        if($("input[name=iss1-yn3]:checked").val() == "yn-I4"){
            $("input:text[name=iss1-yn3-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-yn3-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-count3]').on('click', function(){
        if($("input[name=iss1-count3]:checked").val() == "count-I4"){
            $("input:text[name=iss1-count3-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-count3-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-yn4]').on('click', function(){
        if($("input[name=iss1-yn4]:checked").val() == "yn-I5"){
            $("input:text[name=iss1-yn4-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-yn4-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-count4]').on('click', function(){
        if($("input[name=iss1-count4]:checked").val() == "count-I5"){
            $("input:text[name=iss1-count4-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-count4-span]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-yn5]').on('click', function(){
        if($("input[name=iss1-yn5]:checked").val() == "yn-I6"){
            $("input:text[name=iss1-yn5-span]").attr("disabled",true);
            
        }else{$("input:text[name=iss1-yn5-span]").attr("disabled",false);
        }
    });
    //발급수량
    $('input:radio[name=iss1-num]').on('click', function(){
        if($("input[name=iss1-num]:checked").val() == "I1"){
            $("select[name=iss1-num-select]").attr("disabled",true);
            
        }else{$("select[name=iss1-num-select]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-num1]').on('click', function(){
        if($("input[name=iss1-num1]:checked").val() == "I2"){
            $("select[name=iss1-num1-select]").attr("disabled",true);
            
        }else{$("select[name=iss1-num1-select]").attr("disabled",false);
        }
    });
    // 주문기간 설정
    $('input:radio[name=iss1-day]').on('click', function(){
        if($("input[name=iss1-day]:checked").val() == "D5"){
            $("input[name=day-iss6]").attr("disabled",true);
            
        }else{$("input[name=day-iss6]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss1-day1]').on('click', function(){
        if($("input[name=iss1-day1]:checked").val() == "D6"){
            $("input[name=day-iss7]").attr("disabled",true);
            
        }else{$("input[name=day-iss7]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss2-day2]').on('click', function(){
        if($("input[name=iss2-day2]:checked").val() == "D7"){
            $("input[name=day-iss8]").attr("disabled",true);
            
        }else{$("input[name=day-iss8]").attr("disabled",false);
        }
    });
    $('input:radio[name=iss3-day3]').on('click', function(){
        if($("input[name=iss3-day3]:checked").val() == "D8"){
            $("input[name=day-iss9]").attr("disabled",true);
            
        }else{$("input[name=day-iss9]").attr("disabled",false);
        }
    });
    //사용가능 기준금액
    $('input[name=goods1-validity]').click(function(){
        if($('input[name=goods1-validity]:checked').val() == "Y"){
            $('tr.goods1-validity-detail1').attr('style','display:table-row');
            $('tr.goods1-validity-detail2').attr('style','display:none')
            $('tr.goods1-validity-detail2 input[type=text]').val('');
        }
        else if($('input[name=goods1-validity]:checked').val() == "N"){
            $('tr.goods1-validity-detail2').attr('style','display:table-row');
            $('tr.goods1-validity-detail1').attr('style','display:none');
            $('tr.goods1-validity-detail1 input[type=text]').val('');
        }
        else if($('input[name=goods1-validity]:checked').val() == "O"){
            $('tr.goods1-validity-detail2').attr('style','display:none');
            $('tr.goods1-validity-detail1').attr('style','display:none');
            $('tr.goods1-validity-detail1 input[type=text]').val('');
            $('tr.goods1-validity-detail2 input[type=text]').val('');
        }
    })
    
});
// madal2
$(function(){
    $("button[name='detail2']").click(function(){
        $(".modal2").attr("style", "display:block");
    });
    $(".modal-close").click(function(){
        $(".modal2").attr("style", "display:none");
    });
    $('#modal2-disabled *').prop("disabled", true);
});