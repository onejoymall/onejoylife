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
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/productUpdateProc',
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
                alert("error");
            }
        });
    })
    $('.code-wrap-button').click(function(){
        $('.code-wrap').toggleClass('active');
    });
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
    $('input[name=product_validity_yn]').on("change",function() {
        var selectValue = $(this).val();
        $('.goods-validity-detail').removeClass('show-table-row');
        if(selectValue=="Y"){
            $('.goods-validity-detail').addClass('show-table-row');
        }
    });
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
    function initOptionGroup(){

        $('.option-group-1').removeClass('show-table-row');
        $('.option-group-2').removeClass('show-table-row');
        $('.option-group-3').removeClass('show-table-row');
    }

    $('.product_option_yn').on('change',function () {
        initOptionGroup()
        var selectValue = $(this).val();
        if(selectValue=="Y"){
            $('.option-group-1').addClass("show-table-row");
        }else{
            $('.option-group-1').removeClass("show-table-row");
            $('.option-group-1').addClass("hidden");
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
    })
    //에디터
    $(document).ready(function (){
    $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 320,
        lang: 'ko-KR' // default: 'en-US'
    });
    $('#summernote2').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 320,
        lang: 'ko-KR' // default: 'en-US'
    });
    $('#editor3').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        lang: 'ko-KR' // default: 'en-US'
    });
    $('#editor4').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        lang: 'ko-KR' // default: 'en-US'
    });
    $('#editor5').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        lang: 'ko-KR' // default: 'en-US'
    });
    $('#editor6').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        lang: 'ko-KR' // default: 'en-US'
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
                "<input type='hidden' name='selectCtCodeList[]' id='selectCtCodeList' class='selectCtCodeList' value='"+selectCtCode+"'>" +
            "</td>" +
            "<td>" +
                // "<label for='pa1'> <input type='checkbox' name='defaultPa' id='pa1'>일반상품 영역</label><br>" +
                "<label for='pa2'> <input type='checkbox' name='newPa[]' id='pa2' checked class='newPa'>신상품 영역</label><br>" +
                "<label for='pa3'> <input type='checkbox' name='mdPa[]' id='pa3' class='mdPa'>추천상품 영역</label><br>" +
                "<label for='pa4'> <input type='checkbox' name='spPa[]' id='pa4' class='spPa'>특가상품 영역</label>" +
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
    $('.selectCategory').on("click",function(){
        //소분류 초기화
        $('#category2t').empty();
        $('#category3t').empty();
        $('#subCategory').empty();
        $('#tirdCategory').empty();
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
    //상품상세보기
    function defaultModal (product_cd){
            var file_link='';
            $(".modal").attr("style", "display:block");
            jQuery.ajax({
                type: 'POST',
                url: '/Manager/viewDetail',
                data: {"product_cd":product_cd},
                success: function (data) {
                    console.log(data.list)
                    $.each(data.list, function (index, item) {
                        $('input[name^="'+index+'"]').val(item);
                        $('#'+index).val(item);
                        if(index=="product_html"){
                            $('#summernote').summernote('code', item);

                        }
                        if(index=="product_mobile_html"){
                            $('#summernote2').summernote('code', item);
                        }
                        if(index=="product_payment_info"){
                            $('#editor3').summernote('code', item);
                        }
                        if(index=="product_delivery_info"){
                            $('#editor4').summernote('code', item);
                        }
                        if(index=="product_change_info"){
                            $('#editor5').summernote('code', item);
                        }
                        if(index=="product_service_info"){
                            $('#editor6').summernote('code', item);
                        }
                    });
                    var ele1 =$('input[name^="file_1"]').val();
                    var ele2 =$('input[name^="file_2"]').val();
                    var ele3 =$('input[name^="file_3"]').val();
                    var ele4 =$('input[name^="file_4"]').val();
                    var ele5 =$('input[name^="file_5"]').val();

                    $('.product_detail_image').attr('src',ele1.replace(/(<([^>]+)>)/ig,""));
                    $('.product_list_image').attr('src',ele2.replace(/(<([^>]+)>)/ig,""));
                    $('.product_list_image_sm').attr('src',ele3.replace(/(<([^>]+)>)/ig,""));
                    $('.product_list_image_response').attr('src',ele4.replace(/(<([^>]+)>)/ig,""));
                    $('.product_add_image').attr('src',ele5.replace(/(<([^>]+)>)/ig,""));

                    $('input[name^="product_cd"]').val(product_cd)
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
            enctype: 'multipart/form-data',
            data: formData,
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
                            // showHideTransition: 'slide', //슬라이드
                            // showHideTransition: 'fade' //서서히나타남
                            // position: 'top-left',
                            // position: 'bottom-right',
                            // position: 'bottom-left',

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
    });

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
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    });
    function fn_formSubmit(){
        document.form1.submit();
    }

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
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    });
    $('#SearchDelivery').click(function () {
        var child;
        if(child != undefined){
            child.close()
        }

        child = window.open('/Popup/DeliverySearch','_blank','width=750, height=900');
    });