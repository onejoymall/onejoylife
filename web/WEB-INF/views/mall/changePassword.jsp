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
        <form name="passwordChangeForm" id="passwordChangeForm" method="POST">
            <div class="tab-box">
                <input type="radio" name="rd" id="rd1" class="rd-box" >
                <label for="rd1">아이디(이메일) 찾기</label>
                <input type="radio" name="rd" id="rd2" class="rd-box" checked>
                <label for="rd2">비밀번호 찾기</label>
                <div class="for-id">
                    <div class="id-box1">
                        <div class="box-in">
                            <p class="tit-id">아이디 찾기 방법</p>
                            <div class="la-box1">
                                <input type="radio" id="id-r">
                                <label for="id-r">
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
                                    <input type="text" placeholder="010-0000-0000">
                                    <div class="num">
                                        <a href="#">인증번호 전송</a>
                                    </div>
                                    <div class="num num-none">
                                        <a href="#">인증번호 재전송</a>
                                    </div>
                                    <p class="p-size">입력하신 휴대폰 번호로 계정정보를 찾을 수 업습니다.<br>확인 후 다시 이용하여 주세요.</p>
                                    <p class="p-size p-color">입력하신 번호로 인증번호가 발송되었습니다.</p>
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
                <div class="pw-box-out">
                    <div class="tit-box">신규 비밀번호 입력</div>
                    <div class="for-pw">
                        <div class="pw-box-in">
                            <p>회원님의 개인정보보호와 안전한 서비스 이용을 위해 새로운 비밀번호를 입력해 주시기 바랍니다.</p>
                            <div class="id-num1">
                                <p class="tit-id">비밀번호</p>
                                <div class="la-box2 la-input">
                                    <input name="password" id="password" type="password" placeholder="">
                                    <p class="none none-color">* 6~20자의 영문, 숫자를 조합하여 입력하여 주세요.</p>
                                    <p class="none" id="validateErrorPassword">* 6~20자의 영문, 숫자를 조합하여 입력하여 주세요.</p>
                                </div>
                            </div>
                            <div class="id-num1">
                                <p class="tit-id">비밀번호 확인</p>
                                <div class="la-box2 la-input">
                                    <input name="password_cf" id="password_cf" type="password" placeholder="">
                                    <p class="none" id ="validateErrorPasswordCf">* 입력하신 비밀번호와 일치하지 않습니다. 정확하게 입력하여 주세요.</p>
                                    <input type="hidden" name="email" value="${email}">
                                </div>
                            </div>
                            <div class="but-box">
                                <div class="but-type1">
                                    <a href="#" class="but-1">취소</a>
                                </div>
                                <div class="but-type2">
                                    <a href="#" class="but-1" id="formSubmit">확인</a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $('#formSubmit').on("click",function () {
        var formData = $('#passwordChangeForm').serialize();

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
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
