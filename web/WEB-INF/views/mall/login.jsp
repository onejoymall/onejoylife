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
        <form  name="defaultLoginForm" id="defaultLoginForm">
            <h2 class="h2-box">로그인</h2>
            <div class="login-out">
                <div class="login-in">
                    <div class="in-box1">
                        <label for="id-input" class="id-la">아이디(이메일)</label><input type="text" name="email" id="id-input" placeholder="아이디를 입력하세요" class="form-con">
                    </div>
                    <div class="in-box2">
                        <label for="pw-input" class="id-la">비밀번호</label><input type="password" name="password" id="pw-input" placeholder="비밀번호를 입력하시오" class="form-con">
                    </div>
                </div>
                <div class="login-but">
                    <button type="button" title="login" class="login-on"><span>로그인</span>
                    </button>
                </div>

            </div>
            <div class="er" id="loginCheckError">회원 아이디 또는 비밀번호가 일치하지 않습니다.</div>
            <div class="option">
                <label for="saveid">
                    <input type="checkbox" id="saveid" checked="checked" class="id-ch ">
                    아이디 저장하기
                </label>
                <a href="<c:url value="/sign/findUserInfo"/>" class="id-pw">아이디/비밀번호 찾기</a>
            </div>
            <div class="sns-login-wrap">
                <div class="sns-login-inner">
                    <div class="sns-login-ttl">
                        <div class="ttl-line"></div>
                        <span>또는 소셜 아이디로 로그인</span>
                        <div class="ttl-line"></div>
                    </div>
                    <button type="button" class="kko-login-btn"><i class="kko-ic"></i>Kakao 계정으로 로그인</button>
                </div>
            </div>
            <div class="link-box">
                <div class="link-join">
                    <ul class="txt-p1">
                        <li class="txt-w">ㆍ아직 원조이몰 회원이 아니신가요?</li>
                        <li>원조이몰에 가입하시면 다양한 혜택을 누리실 수 있습니다.</li>
                    </ul>
                    <a href="<c:url value="/sign/signup"/>" class="link-a">회원가입</a>
                </div>
                <div class="link-nonmem">
                    <p class="txt-p2 txt-w">ㆍ비회원 주문/배송 조회가 필요하신가요?</p>
                    <a href="#" class="link-a">비회원 주문조회</a>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    $('.kko-login-btn').click(function () {
        window.open('https://kauth.kakao.com/oauth/authorize?client_id=edae5e01f6d81723613c9cd06f550593&redirect_uri=<c:out value="${siteUrl}"/>/Popup/kakao&response_type=code','_blank','width=750, height=900');
    });

    $('.login-but').on("click",function () {
        var formData = $('#defaultLoginForm').serialize();
        var email = $('#email').val();
        var password = $('#password').val();

        jQuery.ajax({
            type:"GET",
            // contentType: 'application/json',
            url:"/sign/loginProc",
            // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
            data:formData,
            success : function(data) {
                // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                // TODO

                if(data.message) {
                    // $('#loginCheckError').removeClass('er');
                    $('#loginCheckError').addClass('er-on');
                    $('#loginCheckError').empty();
                    $('#loginCheckError').html('* ' + data.message);
                }else{
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },

            complete : function(data) {
                // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
                // TODO
            },
            error : function(xhr, status, error) {
                alert("error");
            }
        });
    })
    // function loginAuth(access_token){
    //     jQuery.ajax({
    //         type:"GET",
    //         contentType: 'application/json',
    //         url:"/sign/loginProcAuth",
    //         headers: {
    //             'Authorization': `Bearer `+access_token,
    //         },
    //
    //         // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
    //         // data:formData,
    //         success : function(data) {
    //             // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
    //             // TODO
    //             location.href=data.redirectUrl;
    //         },
    //
    //         complete : function(data) {
    //             // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
    //             // TODO
    //         },
    //         error : function(xhr, status, error) {
    //             alert("에러발생");
    //         }
    //     });
    // }

</script>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
