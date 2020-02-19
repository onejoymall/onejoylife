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
    <div class="login-box">
        <div class="path">
            <ul>
                <li class="path-color">ㆍ</li>
                <li><a href="#">HOME ＞</a></li>
                <li><a href="#"> 아이디/비밀번호 찾기</a></li>
            </ul>
        </div>
        <div class="h2-box">
            <h2>아이디/비밀번호 찾기</h2>
            <p>회원가입 시 입력하신 정보로 아이디와 비밀번호를 확인하실 수 있습니다.</p>
        </div>
        <form id="defaultUserInfoFind" method="POST">
            <div class="tab-box">
                <input type="radio" name="rd" id="rd1" class="rd-box" checked>
                <label for="rd1">아이디(이메일) 찾기</label>
                <input type="radio" name="rd" id="rd2" class="rd-box">
                <label for="rd2">비밀번호 찾기</label>
                <div class="for-id">
                    <div class="id-box1">
                        <div class="box-in">
                            <p class="tit-id">아이디 찾기 방법</p>
                            <div class="la-box1">
                                <input type="radio" id="id-r" name="find_id_type" value="phone" checked>
                                <label for="id-r" class="ready">
                                    <p class="id-p">등록된 휴대폰 (가입 시 선택사항)</p>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="id-box2">
                        <div class="box-in">
                            <div class="id-num1">
                                <p class="tit-id">등록한 휴대폰 번호</p>
                                <div class="la-box2">
                                    <input type="text" placeholder="010-0000-0000" name="phone">
                                    <div class="num">
                                        <a href="#" id="senderSmsAuthCode" class="">인증번호 전송</a>
                                    </div>
                                    <div class="num num-none none">
                                        <a href="#">*인증번호 재전송</a>
                                    </div>
                                    <p class="p-size none">*입력하신 휴대폰 번호로 계정정보를 찾을 수 업습니다.<br>확인 후 다시 이용하여 주세요.</p>
                                    <p class="p-size p-color none">*입력하신 번호로 인증번호가 발송되었습니다.</p>
                                </div>
                            </div>
                            <div class="id-num2">
                                <p class="tit-id">인증번호</p>
                                <div class="la-box2">
                                    <input type="text" placeholder="">
                                    <p class="p-size">입력하신 인증번호가 정확하지 않습니다. 다시 시도해 주세요.</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="for-pw">
                    <div class="id-box1">
                        <div class="box-in">
                            <p class="tit-id">비밀번호 찾기 방법</p>
                            <div class="la-box1">
                                <input type="radio" id="pw-r">
                                <label for="pw-r">
                                    <p class="id-p">E-mail주소</p>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="id-box2">
                        <div class="box-in">
                            <div class="id-num1">
                                <p class="tit-id">아이디(이메일)</p>
                                <div class="la-box2">
                                    <input name="email" type="text" placeholder="gildonghong@onejoy.co.kr">
                                    <div class="num">
                                        <a href="#" id="senderFindPassword">이메일 전송</a>
                                    </div>
                                    <p class="none none-color">* 가입된 계정 이메일을 정확히 기입해주시길 바랍니다.</p>
                                    <p class="none" id="emailValidation">* 입력하신 이메일로 계정정보를 찾을 수 없습니다. 확인 후 다시 이용하여 주세요.</p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<%--                <div class="but-type">--%>
<%--                    <a href="#" class="but-go">확인</a>--%>
<%--                </div>--%>
            </div>
        </form>
    </div>
</div>
<script>
    $('#senderSmsAuthCode').on("click",function () {
        var formData = $('#defaultUserInfoFind').serialize();

        jQuery.ajax({
            type: "GET",
            url: "/sign/findId",
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
                        text: "휴대폰인증은 준비중입니다.",
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Error',
                        icon: 'error'
                    });
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
    $('#senderFindPassword').on("click",function () {
        var formData = $('#defaultUserInfoFind').serialize();

        jQuery.ajax({
            type: "GET",
            url: "/sign/findPassword",
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
                        text: data.success,
                        showHideTransition: 'plain', //펴짐
                        position: 'top-right',
                        heading: 'Success',
                        hideAfter : false,
                        icon: 'success'
                    });
                    // location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
