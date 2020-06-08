<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>

    <header class="header clearfix">
        <div class="top-inner">
            <button class="back-arr"><i class="back-ic"></i></button>
            <p class="header-tit">아이디/비밀번호 찾기</p>
        </div>
    </header>
    <section class="subheader">
        <ul class="taps">
            <li><a href="javascript:show(1)" id="tap1" >아이디 찾기</a></li>
            <li><a href="javascript:show(2)" id="tap2" class="active">비밀번호 찾기</a></li>
        </ul>
    </section>
    <section class="wrap clearfix" id="write">
        <form action="">
            <p class="text-md mt-2 mb-05">아이디 찾기 방법</p>
            <input type="radio" id="id-num-rd1" name="" checked class="reaady">
            <label for="id-num-rd1">등록된 휴대폰(가입 시 선택사항)</label>
            <!-- <hr class=" mt-2 mb-2"> -->
            <div class="id-num1">
                <p class="text-md mt-3 mb-05">등록한 휴대폰 번호</p>
                
                <div class="input-group">
                    <input type="text" placeholder="010-1234-1234"> 
                    <button type="button" class="ready">인증번호 전송</button>
                </div>
                <p class="error mt-05">* 입력하신 번호로 계정을 찾을수 없습니다.</p>
            </div>
            <div class="id-num2" style="display: none;">
                <p class="text-md mt-3 mb-05">인증번호</p>
                <input type="text">
                <p class="error mt-05">* 입력하신 인증번호가 일치하지 않습니다.</p>
            </div>
            
            <button type="button" class="id-pw-btn">확인</button>
        </form>
    </section>
    <section class="wrap clearfix" id="list">
        <form id="defaultUserInfoFind" name="defaultUserInfoFind" method="post">
            <p class="text-md mt-2 mb-05">비밀번호 찾기 방법</p>
            <input type="radio" id="id-num-rd2" name="" checked>
            <label for="id-num-rd2">E-mail주소</label>
            <p class="text-md mt-3 mb-05">아이디(이메일)</p>
            <input type="text" name="email" placeholder="gildonghong@onejoy.co.kr">
            <p class="mt-05">* 가입된 계정 이메일을 입력해주세요.</p>
            <p class="error mt-05">* 입력하신 이메일로 계정을 찾을수 없습니다.</p>
            <p class="error mt-05">* 입력하신 이메일로 신규비밀번호를 전송했습니다.</p>
            <button type="button" class="id-pw-btn" id="senderFindPassword">확인</button>

        </form>
    </section>

<div class="loading-bar-wrap hidden">
    <div class="loading-bar"></div>
</div>
<!-- Toastr -->
<script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
<script>
    $('#senderFindPassword').on("click",function () {
        var formData = $('#defaultUserInfoFind').serialize();
        $('.loading-bar-wrap').removeClass("hidden");
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
                            position: 'bottom-right',
                            heading: 'Error',
                            icon: 'error'
                        });
                    });
                } else {
                    // loginAuth(data.access_token);
                    $.toast({
                        text: data.success,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Success',
                        hideAfter : false,
                        icon: 'success'
                    });
                    // location.href=data.redirectUrl;
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
    $('.ready').on("click",function () {
        $.toast().reset('all');//토스트 초기화
        $.toast({
            text: "준비중입니다.",
            showHideTransition: 'plain', //펴짐
            position: 'bottom-right',
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
</script>
</html>