<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="joinform">
        <div class="path">
            <ul>
                <li class="path-color">ㆍ</li>
                <li><a href="#">HOME ＞</a></li>
                <li><a href="#"> 원조이몰 회원가입</a></li>
            </ul>
        </div>
        <div class="h2-box"><h2><span>원조이몰</span> 회원가입</h2></div>

        <div class="form-out1">
            <div class="form-out2">
                <form method="POST" name="defaultJoinform" id="defaultJoinform">
                    <table>
                        <colgroup>
                            <col style="width:600px;">
                        </colgroup>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">아이디(이메일)</p>
                                <div class="mem-id2">
                                    <input name="email" id="email" type="text" placeholder="이메일을 입력해주세요." required>
                                </div>
                            </td>
                        </tr>
                        <tr >
                            <td class="er" id="emailValidation">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">인증번호</p>
                                <div class="mem-id2 id2-w">
                                    <input name="email_auth_code" id="email_auth_code" type="text" class="num-txt" readonly>
                                    <button class="btn-auth" id="mailSender" type="button">인증번호 받기</button>
                                    <!-- <a href="" class="none"><span>인증완료</span></a>
                                    <a href="" class="none"><span>300s</span></a> -->
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er" id="email_auth_codeValidation">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">비밀번호</p>
                                <div class="mem-id2">
                                    <input name="password" id="password" type="password" placeholder="비밀번호를 입력해 주세요." >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er" id="passwordValidation">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">비밀번호 확인</p>
                                <div class="mem-id2">
                                    <input name="password_cf" id="password_cf" type="password" placeholder="비밀번호를 다시 입력해 주세요." >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er" id="password_cfValidation">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">휴대폰번호(선택)</p>
                                <div class="mem-id2">
                                    <input name="phone" type="text" placeholder="숫자만 입력해 주세요">

                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="form-ch">
                        <input type="checkbox" name="option" id="ch">
                        <label for="ch">
                            <div class="ch-p-box">
                                <p>본인은 <strong>만 14세 이상</strong>이며, <a href="#default-modal" rel="modal:open">원조이몰 이용약관,</a><a> 제3자동의 이용약관,</a><a> 개인정보 수집 및 이용,</a><a> 개인정보 제공,</a> 내용을 확인하였으며, 동의합니다.</p>
                            </div>
                        </label>
                    </div>
                    <div class="join-box">
                        <a href="javascript:void(0)" id="formSignUpSubmit">회원가입</a>
                        <a id="kakao-login-btn"></a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="loading-bar-wrap hidden">
    <div class="loading-bar"></div>
</div>
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.610.0.min.js"></script>
<script>

   $('#formSignUpSubmit').on("click",function () {
       var password = $('#password').val();
       var password_cf = $('#password_cf').val();
       var formData = $('#defaultJoinform').serialize();
        $('.er').html('');

       if($('#ch').is(":checked")) {
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
                       console.log(data)
                       if(data.validateError){
                           $.each(data.validateError, function (index, item) {
                               if(index != "Error"){//일반에러메세지
                                   $('#'+index+'Validation').html(item);
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
        $('.er').html('');
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
            $("#passwordValidation").text(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.")
            $("#passwordValidation").removeClass("text-success");
        }else{
            $("#passwordValidation").addClass("text-success");
        }
    })
   $(document).on('keyup','input[name=password_cf]',function () {
       if(!$(this).val().match($('input[name=password]').val())){
           $("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.")
           $("#password_cfValidation").removeClass("text-success");
       }else{
           $("#password_cfValidation").text(" * 비밀번호가 일치합니다.")
           $("#password_cfValidation").addClass("text-success");
       }
   })
    //인증하기
    $(document).on('click',"#mailauth",function () {
        $('.er').html('');
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

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
