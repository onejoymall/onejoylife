<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <link href="../../assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/common-mobile.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/commonSub.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&display=swap&subset=korean" rel="stylesheet">
<!--
    [if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]
-->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src="../../assets/js/common-mobile.js"></script>
</head>
<body class="pt-48 pb-5">
    <header class="header clearfix">
        <div class="top-inner">
            <button class="back-arr"><i class="back-ic"></i></button>
            <p class="header-tit">${afn:getMessage("idPwdFind",sessionScope.locale)}</p>
        </div>
    </header>

    <form name="passwordChangeForm" id="passwordChangeForm" method="POST">
        <section class="subheader">
            <ul class="taps">
                <li><a href="javascript:show(1)" id="tap1">${afn:getMessage("searchId",sessionScope.locale)}</a></li>
                <li><a href="javascript:show(2)" id="tap2" class="active">${afn:getMessage("searchPswd",sessionScope.locale)}</a></li>
            </ul>
        </section>
        <section class="wrap clearfix" id="write">
                <p class="text-md mt-2 mb-05">${afn:getMessage("searchIdWay",sessionScope.locale)}</p>
                <input type="radio" id="id-num-rd1" name="">
                <label for="id-num-rd1">${afn:getMessage("hp_register",sessionScope.locale)}</label>
                <!-- <hr class=" mt-2 mb-2"> -->
                <div class="id-num1">
                    <p class="text-md mt-3 mb-05">${afn:getMessage("hp_register2",sessionScope.locale)}</p>

                    <div class="input-group">
                        <input type="text" placeholder="010-1234-1234">
                        <button type="button">${afn:getMessage("certi",sessionScope.locale)}</button>
                    </div>
                    <p class="error-on mt-05">* ${afn:getMessage("error.finduserinfo.inpPhoneNotFind",sessionScope.locale)}</p>
                </div>
                <div class="id-num2" style="display: none;">
                    <p class="text-md mt-3 mb-05">${afn:getMessage("certi",sessionScope.locale)}</p>
                    <input type="text">
                    <p class="error-on mt-05">* ${afn:getMessage("error.changePwd.notMatchCerti",sessionScope.locale)}</p>
                </div>

                <button type="button" class="id-pw-btn">${afn:getMessage("QAok",sessionScope.locale)}</button>
        </section>
        <section class="wrap clearfix pw-num" id="list">
            <h2 class="pb-1 mt-3">${afn:getMessage("newPwdinput",sessionScope.locale)}</h2>
            <hr class="">
                <p class="text-md mt-2 mb-05">${afn:getMessage("pwd",sessionScope.locale)}</p>
                <input type="password" name="password" id="password">
                <p class="mt-05"></p>
                <p class="error-on mt-05" id="validateErrorPassword"></p>
                <p class="text-md mt-3 mb-05">${afn:getMessage("pswdCfm",sessionScope.locale)}</p>
                <input type="password" name="password_cf" id="password_cf">
                <p id ="validateErrorPasswordCf" class="error-on mt-05"></p>
                <input type="hidden" name="email" value="${email}">
                <button type="button" class="id-pw-btn" onclick="location.href='/'">${afn:getMessage("QAcancel",sessionScope.locale)}</button>
                <button type="button" class="id-pw-btn" id="formSubmit">${afn:getMessage("QAok",sessionScope.locale)}</button>
        </section>
    </form>
</body>

<script>
$(document).ready(function(){
    $('#write').hide();
    $('#list').show();
    $('.qna').on('click',function(){
        $(this).addClass('active');
        $('.qna').not($(this)).removeClass('active');
    })
    $('#date li a').on('click',function(){
        $(this).addClass('active');
        $('#date li a').not($(this)).removeClass('active');
    })
});
/**
 * 탭 function
 */
function show(num){
    if(num == 1){
        $('#write').show();
        $('#list').hide();
        $('#tap1').addClass('active');
        $('#tap2').removeClass('active');
    } else if (num == 2) {
        $('#write').hide();
        $('#list').show();
        $('#tap1').removeClass('active');
        $('#tap2').addClass('active');
    }
}
var pwCheck = false;
$('#formSubmit').on("click",function () {
        var formData = $('#passwordChangeForm').serialize();
        if(!pwCheck){
    		$("#validateErrorPasswordCf").text("* ${afn:getMessage("error.sign.pwdcfMsg",sessionScope.locale)}");
    		$("#validateErrorPasswordCf").removeClass("text-success");
    		return;
    	}
        jQuery.ajax({
            type:"GET",
            // contentType: 'application/json',
            url:"/sign/changePasswordProc",
            // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
            data:formData,
            success : function(data) {
                // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                // TODO
                $.each(data.validateError, function(index, item){
                  console.log(index,item);
                    $('#validateError'+index).removeClass('none');
                    $('#validateError'+index).empty();
                    $('#validateError'+index).html('* '+item);
                });
                if(data.url){
                    location.href=data.url;
                }
            },

            complete : function(data) {
                // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                // TODO
            },
            error : function(xhr, status, error) {
                alert("에러발생");
            }
        });
    })
    // var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
    var regExp = /^[a-zA-Z0-9]{6,20}$/;
    //패스워드 체크
    $(document).on('input','input[name=password],input[name=password_cf]',function () {
    	pwCheck = false;
    	var pw = $('input[name=password]').val();
    	var pw_cf = $('input[name=password_cf]').val();
        if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
            $("#validateErrorPassword").text(" * ${afn:getMessage("error.sign.pwdpattern",sessionScope.locale)}");
            $("#validateErrorPassword").removeClass("text-success");
            $("#validateErrorPasswordCf").text("");
        }else{
        	$("#validateErrorPassword").text('');
        	if(pw != pw_cf){
                $("#validateErrorPasswordCf").text(" * ${afn:getMessage("error.sign.pwdDis",sessionScope.locale)}");
                $("#validateErrorPasswordCf").removeClass("text-success");
            }else{
            	pwCheck = true;
            	$("#validateErrorPasswordCf").text(" * ${afn:getMessage("msg.sign.pwdSuccess",sessionScope.locale)}");
                $("#validateErrorPasswordCf").addClass("text-success");
            }
        }
    })

    function validationNumber(){
        //숫자만입력받게
        $(document).on("input",".onlyNumber",function(){
            $(this).val($(this).val().replace(/[^0-9]/g,""))
        });
        //숫자와|만입력받게
        $(document).on("input",".onlyNumberAndPipe",function(){
            $(this).val($(this).val().replace(/[^0-9|]/g,""))
        });
        //숫자와.만입력받게
        $(document).on("input",".onlyNumberAndDot",function(){
            $(this).val($(this).val().replace(/[^0-9.]/g,""))
        });
        }
        validationNumber();

        //문자열 숫자포함
        function isStrNumber(str){
        return str.search(/[0-9]/g) >= 0;
        }

        //문자열 알파뱃포함
        function isStrAlphabet(str){
        return str.search(/[a-zA-Z]/g) >= 0;
        }
</script>
</html>