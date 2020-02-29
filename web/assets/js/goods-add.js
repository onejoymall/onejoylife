$(document).ready(function(){
    $('.top-first-ul li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('.top-first-ul li').removeClass('on');
        $('.main-top-first .ul-tab-box').removeClass('on');

        $(this).addClass('on');
        $("#"+tab_id).addClass('on');
    });
});

//checkbox
$(function(){
   $('#all-chk').click(function(){
      var chk = $(this).is(':checked');//.attr('checked');
       if(chk) $('.goods-list-wrap input').prop('checked',true);
       else $('.goods-list-wrap input').prop('checked',false);
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

//
$(function(){
   $('button[name="back"]').click(function(){
       alert('저장하지 않고 돌아가시겠습니까?');
   });
});

//텍스트 에디터


//과세
$('input:radio[name=goods-tax]').on('click', function(){
    if($("input[name=goods-tax]:checked").val() == "A"){
        $("input[name=goods-taxation-detail]").attr("disabled",false);
        $("input[name=goods-taxation-detail]").focus();
        // radio 버튼의 value 값이 1이라면 활성화

    }else{$("input[name=goods-taxation-detail]").attr("disabled",true);
        // radio 버튼의 value 값이 0이라면 비활성화
    }
});

//판매가 대체문구
$('input:radio[name=salePrice-replace]').on('click', function(){
    if($("input:radio[name=salePrice-replace]:checked").val() == "Y"){
        $("input:text[name=sp-replace-text]").attr("disabled",false);
        $("input:text[name=sp-replace-text]").focus();
        // radio 버튼의 value 값이 1이라면 활성화

    }else{$("input:text[name=sp-replace-text]").attr("disabled",true);
        // radio 버튼의 value 값이 0이라면 비활성화
    }
});

//품목구성방식
$('input[name=goods-compType]').click(function(){
    if($('input[name=goods-compType]:checked').val() == "T"){
        $('tr.goods-compType-t-detail').attr('style','display:table-row');
    }else{
        $('tr.goods-compType-t-detail').attr('style','display:none');
        $('input[name=goods-optionType]').prop('checked',false);
    }
});
$('input[name=goods-compType]').click(function(){
    if($('input[name=goods-compType]:checked').val() == "E"){
        $('tr.goods-compType-e-detail').attr('style','display:table-row');
    }else{
        $('tr.goods-compType-e-detail').attr('style','display:none');
        $('input[name=goods-optionSet-name]').val('');
    }
});


//필수여부
$('input:radio[name=goods-compType]').on('click', function(){
    if($("input[name=goods-compType]:checked").val() == "T"){
        $("input:text[name=goods-option-mandatory]").attr("disabled",true);
        // radio 버튼의 value 값이 T라면 비활성화

    }else{$("input:text[name=goods-option-mandatory]").attr("disabled",false);
        // 활성화
    }
});

//추가입력옵션
$('input[name=goods-addInput]').click(function(){
    if($('input[name=goods-addInput]:checked').val() == "Y"){
        $('tr.goods-addInput-detail').attr('style','display:table-row');
    }else{
        $('tr.goods-addInput-detail').attr('style','display:none');
        $('tr.goods-addInput-detail input[type=text]').val('');
    }
});

//유효기간
 $('input[name=goods-validity]').click(function(){
    if($('input[name=goods-validity]:checked').val() == "Y"){
        $('tr.goods-validity-detail').attr('style','display:table-row');
    }else{
        $('tr.goods-validity-detail').attr('style','display:none');
        $('tr.goods-validity-detail input[type=text]').val('');
    }
});

//배송비
$('input[name=goods-shipping]').click(function(){
    if($('input[name=goods-shipping]:checked').val() == "T"){
        $('tr.shipping-t-detail').attr('style','display:table-row');
        $('tr.shipping-f-detail').attr('style','display:none');
        $('tr.shipping-f-detail input').val('');
    }else{
        $('tr.shipping-t-detail').attr('style','display:none');
        $('tr.shipping-f-detail').attr('style','display:table-row');
        $('tr.shipping-t-detail input').val('');
    }
});

$('select[name=shipping-fee]').change(function(){
    var shipR='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>배송비 <input type="text" id="shippingFee-detail" name="shippingFee-detail"> 원을 고정적으로 부과함.</td></tr>';
    var shipM='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td><p class="cc2">구매 금액이 30,000원 미만일 때 배송비 2,500원을 부과하려면 30000|2500 입력</p><input type="text" id="shippingFee-detail" name="shippingFee-detail" placeholder="ex) 30000|2500"></td></tr>';
    var shipD='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">20,000원 이상~30,000원 미만일 때 배송비 2,000원을 부과하고 30,000원 이상~50,000원 미만일 때 배송비 1,000원을 부과하려면<br>20000|30000|2000//30000|50000|1000 입력</p><input type="text" id="shippingFee-detail" name="shippingFee-detail" placeholder="ex) 20000|30000|2000//30000|50000|1000"></td></tr>';
    var shipW='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">3kg 이상~5kg 미만일 때 배송비 2,000원을 부과하고 5kg 이상~7kg 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text" id="shippingFee-detail" name="shippingFee-detail" placeholder="ex) 3|5|2000//5|7|7000"></td></tr>';
    var shipC='<tr class="shippingFee-detail-wrap shipping-t-detail long"><th>배송비 상세 설정</th><td><p class="cc2">3개 이상~5개 미만일 때 배송비 2,000원을 부과하고 5개 이상~7개 미만일 때 배송비 5,000원을 부과하려면<br>3|5|2000//5|7|7000 입력</p><input type="text" id="shippingFee-detail" name="shippingFee-detail" placeholder="ex) 3|5|2000//5|7|7000"></td></tr>';
    var shipN='<tr class="shippingFee-detail-wrap shipping-t-detail"><th>배송비 상세 설정</th><td>주문 금액에 상관 없이 수량에 따라 배송료 <input type="text" id="shippingFee-detail" name="shippingFee-detail">원을 부과함.</td></tr>';

    if($('select[name=shipping-fee]').val() == "R"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipR);
    }else if($('select[name=shipping-fee]').val() == "M"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipM);
    }else if($('select[name=shipping-fee]').val() == "D"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipD);
    }else if($('select[name=shipping-fee]').val() == "W"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipW);
    }else if($('select[name=shipping-fee]').val() == "C"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipC);
    }else if($('select[name=shipping-fee]').val() == "N"){
        $('.shippingFee-detail-wrap').remove();
        $('.shipping-fee-tr').after(shipN);
    }else if($('select[name=shipping-fee]').val() == "T"){
        $('.shippingFee-detail-wrap').remove();
    }
});

//국가코드
$('.code-wrap-button').click(function(){
   $('.code-wrap').toggleClass('active'); 
});

//seo
$('input[name=goods-seo]').click(function(){
    if($('input[name=goods-seo]:checked').val() == "Y"){
        $('tr.seo-detail').attr('style','display:table-row');
    }else{
        $('tr.seo-detail').attr('style','display:none');
        $('tr.seo-detail input[type=text]').val('');
    }
});