<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="login-box">
        <form  name="defaultLoginForm" id="defaultLoginForm" onsubmit="return false;">
            <h2 class="h2-box">${afn:getMessage("login",sessionScope.locale)}</h2>
            <div class="login-out">
                <div class="login-in">
                    <div class="in-box1">
                        <label for="id-input" class="id-la">${afn:getMessage("idEmail",sessionScope.locale)}</label><input type="text" name="email" id="id-input" placeholder="${afn:getMessage('msg.login.idinputRequest',sessionScope.locale)}" class="form-con">
                    </div>
                    <div class="in-box2">
                        <label for="pw-input" class="id-la">${afn:getMessage("pwd",sessionScope.locale)}</label><input type="password" name="password" id="pw-input" placeholder="${afn:getMessage('msg.login.pwdinputRequest',sessionScope.locale)}" class="form-con">
                    </div>
                </div>
                <div class="login-but">
                    <button type="button" title="login" class="login-on"><span>${afn:getMessage("login",sessionScope.locale)}</span>
                    </button>
                </div>

            </div>
            <div class="er" id="loginCheckError"></div>
            <div class="option">
                <label for="saveid">
                    <input type="checkbox" id="saveid" class="id-ch ">
                    ${afn:getMessage("idSave",sessionScope.locale)}
                </label>
                <a href="<c:url value="/sign/findUserInfo"/>" class="id-pw">${afn:getMessage("idPwdFind",sessionScope.locale)}</a>
            </div>
            <div class="sns-login-wrap">
                <div class="sns-login-inner">
                    <div class="sns-login-ttl">
                        <div class="ttl-line"></div>
                        <span>${afn:getMessage("msg.login.orSocialLogin",sessionScope.locale)}</span>
                        <div class="ttl-line"></div>
                    </div>
                    <button type="button" class="kko-login-btn"><i class="kko-ic"></i>${afn:getMessage("msg.login.kakao",sessionScope.locale)}</button>
 						 <button type="button" class="nv-login-btn"><i class="nv-ic"></i>네이버 계정으로 회원가입</button>
                         <button type="button" class="fb-login-btn"><i class="fb-ic"></i>페이스북 계정으로 회원가입</button>
                         <button type="button" class="ln-login-btn"><i class="ln-ic"></i>LINE 계정으로 회원가입</button>
                   
                </div>
            </div>
       </div>
    </div>
    <header class="header">
        <div class="usermenu-section">
            <div class="usermenu-inner">
                <ul class="usermenu">
                </div>
            </div>
            <div class="link-box">
                <div class="link-join">
                    <ul class="txt-p1">
                        <li class="txt-w">ㆍ${afn:getMessage("msg.login.joinornot",sessionScope.locale)}</li>
                        <li>${afn:getMessage("msg.login.benefitmsg",sessionScope.locale)}</li>
                    </ul>
                    <a href="<c:url value="/sign/signup"/>" class="link-a">${afn:getMessage("join",sessionScope.locale)}</a>
                        <a href="#" class="link-a kko"><i class="kko-ic"></i>Kakao 계정으로 회원가입</a>
                </div>
                <div class="link-nonmem">
                    <p class="txt-p2 txt-w">ㆍ ${afn:getMessage("msg.login.NmemOrderAndDelivery",sessionScope.locale)}</p>
                    <a href="#" class="link-a nonmem-btn">${afn:getMessage("nmemOrder",sessionScope.locale)}</a>
                </div>
        </form>
                <!-- 비회원 주문조회 -->
                <div class="nonmem">
                    <form name="orderForm" id="orderForm" method="post">
                        <div class="nonmem-in">
                            <p>${afn:getMessage("ordernum",sessionScope.locale)}</p>
                            <input type="text" name="imp_uid" placeholder="${afn:getMessage('msg.login.impOrderNum',sessionScope.locale)}">
                            <p>${afn:getMessage("pwd",sessionScope.locale)}</p>
                            <input type="password" name="password" placeholder="${afn:getMessage('msg.login.paymentPwd',sessionScope.locale)}">
                        </div>
                        <button type="button" id="orderDetailGuestBtn">${afn:getMessage("lookup",sessionScope.locale)}</button>
                    </form>
                </div>
            </div>
    </div>
</div>

<script>
	$(".nonmem-btn").click(function() {
	    event.preventDefault();
	    $(".nonmem").toggle(); 
	});

    $('.kko-login-btn').click(function () {
        window.open('https://kauth.kakao.com/oauth/authorize?client_id=edae5e01f6d81723613c9cd06f550593&redirect_uri=<c:out value="${siteUrl}"/>/Popup/kakao&response_type=code','_blank','width=750, height=900');
    });

    $('.login-but').on("click",function () {
        var formData = $('#defaultLoginForm').serialize();
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

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
