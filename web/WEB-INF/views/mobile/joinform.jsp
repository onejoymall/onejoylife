<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link href="../../assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/common-mobile.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/commonSub.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
    <div class="wrap">
        <header class="header">
            <div class="top-inner">
                <button class="back-arr"><i class="back-ic"></i></button>
                <p class="header-tit">회원가입</p>
            </div>
        </header>
        <div class="mo-main form-main clearfix">
            <div class="mo-logo clearfix"><a href="">onejoy life</a></div>
            <div class="form-box">
                <form method="POST" name="defaultJoinform" id="defaultJoinform">
                    <div class="join-cell">
                        <input type="text" name="email" id="email" placeholder="아이디(이메일)" required>
                        <p class="error" id="emailValidation"></p>
                    </div>
                    <div class="join-cell">
                        <div class="join-cell-in">
                            <input type="text" name="email_auth_code" id="email_auth_code" placeholder="이메일 인증번호(4자리)" class="num-txt" readonly>
                            <button type="button" class="btn-auth" id="mailSender"><span>인증번호</span></button>
<%--                            <button type="button" class="btn-color"><span>60초</span></button>--%>
<%--                            <button type="button" class="btn-color"><span>인증완료</span></button>--%>
                        </div>
                        <p class="error" id="email_auth_codeValidation"></p>
                    </div>
                    <div class="join-cell">
                        <input type="password" name="password" id="password" placeholder="비밀번호(영문,숫자 6~20자 이내)">
                        <p class="error" id="passwordValidation"></p>
                    </div>
                    <div class="join-cell">
                        <input type="password" name="password_cf" id="password_cf" placeholder="비밀번호 확인">
                        <p class="error" id="password_cfValidation"></p>
                    </div>
                    <div class="join-cell">
                        <input type="text" name="phone" type="text" placeholder="휴대폰 번호(선택)">
                    </div>
                    <div class="join-ck-box clearfix">
                        <input type="checkbox" id="join-ck" name="join-ck" class="save-ck">
                        <label for="join-ck"><p class="ck-txt">본인은 만 14세 이상이며, <a href="#" id="mo-btn2">원조이몰 이용약관</a>, <a href="#" id="mo-btn3">제3자동의 이용약관</a>, <a href="#" id="mo-btn4">개인정보 수집 및 이용</a>, <a href="#" id="mo-btn5">개인정보 제공</a> 내용을 확인하였으며, 동의합니다.</p></label>
                    </div>
                    <button type="submit" id="formSignUpSubmit" class="btn-join">회원가입</button>
                </form>
            </div>
        </div>
        <div class="mo-footer">

        </div>
    </div>

    <div class="loading-bar-wrap hidden">
        <div class="loading-bar"></div>
    </div>

<c:import url="/mobile/layout/m_modal"/>
    <script src="https://sdk.amazonaws.com/js/aws-sdk-2.610.0.min.js"></script>

    <script>

        // $(document).ready(function(){
        //     $(".back-arr").click(function(){
        //         history.back();
        //     });
        // });

        $('#formSignUpSubmit').on("click",function () {
            var password = $('#password').val();
            var password_cf = $('#password_cf').val();
            var formData = $('#defaultJoinform').serialize();
            $('.error').html('');

            if($('#join-ck').is(":checked")) {
                $('.loading-bar-wrap').removeClass("hidden");
                jQuery.ajax({
                    type:"GET",
                    // contentType: 'application/json',
                    url:"/sign/signupProc",
                    // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
                    data:formData,
                    success : function(data) {
                        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                        // TODO

                        if(data.validateError){
                            $.each(data.validateError, function (index, item) {
                                if(index != "Error"){//일반에러메세지
                                    console.log(index, item);
                                    $('#'+index+'Validation').html(item);
                                    $('#'+index+'Validation').addClass("error-on");
                                }
                            });
                        }else{
                            location.href=data.redirectUrl;
                        }

                    },
                    complete : function(data) {
                        // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                        // TODO
                        $('.loading-bar-wrap').addClass("hidden");
                    },
                    error : function(xhr, status, error) {
                        console.log(xhr+status+error);
                    }
                });

            }else{
                alert('이용약관 동의 후 회원가입이 가능합니다.')
            }
        })

        //    //이메일인증
        $(document).on("click","#mailSender",function () {
            $('.error').html('');
            var formData = $('#defaultJoinform').serialize();
            $('.loading-bar-wrap').removeClass("hidden");

            jQuery.ajax({
                type:"GET",
                // contentType: 'application/json',
                url:"/sign/authemail",
                // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
                data:formData,

                success : function(data) {
                    // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                    // TODO
                    console.log(data);
                    if(data.validateError){
                        $.each(data.validateError, function (index, item) {
                            if(index != "Error"){//일반에러메세지
                                $('#'+index+'Validation').html(item);
                                $('#'+index+'Validation').addClass("error-on");
                            }
                        });
                    }else{
                        $('#mailSender').addClass("bg-secondary");
                        $('#mailSender').text("인증하기");
                        $('#email_auth_code').attr("placeholder","인증번호 4자리 입력");
                        $('#email_auth_code').attr("readonly",false);
                        //인증버튼으로 변경
                        $('#mailSender').attr("id","mailauth");
                    }
                },

                complete : function(data) {
                    // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                    // TODO
                    $('.loading-bar-wrap').addClass("hidden");
                },
                error : function(xhr, status, error) {
                    console.log(xhr+status+error);
                }
            });
        })
        var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
        //패스워드 체크
        $(document).on('keyup','input[name=password]',function () {
            if(!$(this).val().match(mathPassword)){
                $("#passwordValidation").text(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.");
                $('#passwordValidation').addClass("error-on");
                $("#passwordValidation").removeClass("text-success");
            }else{
                $("#passwordValidation").addClass("text-success");
            }
        })
        $(document).on('keyup','input[name=password_cf]',function () {
            if(!$(this).val().match($('input[name=password]').val())){
                $("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.")
                $('#password_cfValidation').addClass("error-on");
                $("#password_cfValidation").removeClass("text-success");
            }else{
                $("#password_cfValidation").addClass("text-success");
            }
        })
        //인증하기
        $(document).on('click',"#mailauth",function () {
            $('.error').html('');
            var formData = $('#defaultJoinform').serialize();
            $('.loading-bar-wrap').removeClass("hidden");
            jQuery.ajax({
                type:"GET",
                // contentType: 'application/json',
                url:"/sign/authEmailProc",
                // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
                data:formData,

                success : function(data) {
                    // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                    // TODO
                    console.log(data);
                    if(data.validateError){
                        $.each(data.validateError, function (index, item) {
                            if(index != "Error"){//일반에러메세지
                                $('#'+index+'Validation').html(item);
                                $('#'+index+'Validation').addClass("error-on");
                            }
                        });
                    }else{
                        $('#mailauth').removeClass("bg-secondary");
                        $('#mailauth').addClass("bg-success");
                        $('#mailauth').text("인증완료");
                        $('#email_auth_code').attr("readonly",true);
                        $('#email').attr("readonly",true);
                        //인증버튼으로 변경
                        $('#mailauth').attr("id","");
                    }
                },

                complete : function(data) {
                    // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                    // TODO
                    $('.loading-bar-wrap').addClass("hidden");
                },
                error : function(xhr, status, error) {
                    alert(xhr+status+error);
                }
            });
            // $('#mailauth').removeClass("bg-secondary");
            // $('#mailauth').addClass("bg-success");
            // $('#mailauth').text("인증완료");
        })
    </script>
</body>
</html>