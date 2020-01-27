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
                        <tr class="p-none" id="emailValidation">
                            <td class="er">
                                * 이미 등록된 이메일입니다. 다른 이메일을 입력하여 주세요.
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">인증번호</p>
                                <div class="mem-id2 id2-w">
                                    <input name="email_auth_code" id="email_auth_code" type="text" class="num-txt" value="">
                                    <a href="#" id="mailSender"><span>인증번호받기</span></a>
                                    <!-- <a href="" class="none"><span>인증완료</span></a>
                                    <a href="" class="none"><span>300s</span></a> -->
                                </div>
                            </td>
                        </tr>
                        <tr class="p-none" id="emailAuthValidation">
                            <td class="er">
                                * 인증번호가 일치하지 않습니다. 다시 입력해주세요.
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">비밀번호</p>
                                <div class="mem-id2">
                                    <input name="password" id="password" type="password" placeholder="비밀번호를 입력해 주세요.">
                                </div>
                            </td>
                        </tr>
                        <tr class="p-none p-block">
                            <td class="er er-color">
                                * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">비밀번호 확인</p>
                                <div class="mem-id2">
                                    <input name="password_cf" id="password_cf" type="password" placeholder="비밀번호를 다시 입력해 주세요.">
                                </div>
                            </td>
                        </tr>
                        <tr class="p-none" id="passwordlValidation">
                            <td class="er">
                                * 비밀번호가 일치하지 않습니다. 다시 확인해주세요.
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
                                <p>본인은 <strong>만 14세 이상</strong>이며, <a href="#">원조이몰 이용약관,</a><a href="#"> 제3자동의 이용약관,</a><a href="#"> 개인정보 수집 및 이용,</a><a href="#"> 개인정보 제공,</a> 내용을 확인하였으며, 동의합니다.</p>
                            </div>
                        </label>
                    </div>
                    <div class="join-box">
                        <a href="#" id="formSubmit">회원가입</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.610.0.min.js"></script>
<script>
    $('#formSubmit').on("click",function () {
        var password = $('#password').val();
        var password_cf = $('#password_cf').val();
        var formData = $('#defaultJoinform').serialize();
        $('#passwordlValidation').addClass('p-none');
        $('#emailAuthValidation').addClass('p-none');
        if($('#ch').is(":checked")) {
            if(password == password_cf){
                jQuery.ajax({
                    type:"GET",
                    // contentType: 'application/json',
                    url:"/sign/signupProc",
                    // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
                    data:formData,
                    success : function(data) {
                        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                        // TODO
                        console.log(data.message);
                        if(data.message){
                            $('#emailAuthValidation').removeClass('p-none');
                            $('#emailAuthValidation td').empty();
                            $('#emailAuthValidation td').html('* '+data.message);
                        }else{
                            location.href=data.redirectUrl;
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
            }else{
                $('#passwordlValidation').removeClass('p-none');
                $('#passwordlValidation td').empty();
                $('#passwordlValidation td').html('* 비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
            }
        }else{
           alert('이용약관 동의 후 회원가입이 가능합니다.')
        }
    })

    //이메일인증
    $('#mailSender').on("click",function () {
        var formData = $('#defaultJoinform').serialize();

        jQuery.ajax({
            type:"GET",
            // contentType: 'application/json',
            url:"/sign/authemail",
            // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
            data:formData,
            success : function(data) {
                // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                // TODO

                if(data.message){
                    $('#emailValidation').removeClass('p-none');
                    $('#emailValidation td').empty();
                    $('#emailValidation td').html('* '+data.message);
                }else{
                    $('#emailAuthValidation').addClass('p-none');
                    $('#emailValidation').addClass('p-none');
                    alert("이메일 인증 완료")
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


</script>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
