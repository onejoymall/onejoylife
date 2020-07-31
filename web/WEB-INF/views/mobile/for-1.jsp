<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/mall/cert_conf.jsp"%>
<%
	String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS").format(new Date())); // 요청번호 생성 예제
%>
<script type="text/javascript">
	/* 리턴시 콜백함수 */
	function phoneCallback(frm){
		var obj = {}
		for ( i = 0 ; i < frm.length ; i++ ) {
			obj[frm.elements[i].name] = frm.elements[i].value;
        }
		
		if(obj.cert_enc_use == 'Y' && obj.res_cd == '0000'){
            jQuery.ajax({
                type: "GET",
                url: "/sign/findId",
                data: "phone="+obj.phone_no,
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
                    	location.href = "/sign/changePasswordDone?email=" + data.email;
                    }
                },
                error: function (xhr, status, error) {
                    alert("error");
                }
            });
		}else{
			alert("${afn:getMessage("certifail",sessionScope.locale)}");
		}
	}
    // 인증창 종료 후 인증데이터 리턴 함수
    function auth_data( frm )
    {
        var auth_form     = document.form_auth;
        var nField        = frm.elements.length;
        var response_data = "";

        // up_hash 검증 
        if( frm.up_hash.value != auth_form.veri_up_hash.value )
        {
            alert("${afn:getMessage("error.sign.uphashRiskTamp",sessionScope.locale)}");
            
        }              
        
       /* 리턴 값 모두 찍어보기 (테스트 시에만 사용) */
       /*  var form_value = "";

        for ( i = 0 ; i < frm.length ; i++ )
        {
            form_value += "["+frm.elements[i].name + "] = [" + frm.elements[i].value + "]\n";
        }
        console.log(frm); */
        phoneCallback(frm)
    }
    
    // 인증창 호출 함수
    function auth_type_check()
    {
        var auth_form = document.form_auth;

        if( auth_form.ordr_idxx.value == "" )
        {
            alert( "${afn:getMessage("error.sign.reNum_Required",sessionScope.locale)}" );

            return false;
        }
        else
        {
            if( ( navigator.userAgent.indexOf("Android") > - 1 || navigator.userAgent.indexOf("iPhone") > - 1 ) == false ) // 스마트폰이 아닌경우
            {
             var return_gubun;
             var width  = 410;
             var height = 500;

             var leftpos = screen.width  / 2 - ( width  / 2 );
             var toppos  = screen.height / 2 - ( height / 2 );

             var winopts  = "width=" + width   + ", height=" + height + ", toolbar=no,status=no,statusbar=no,menubar=no,scrollbars=no,resizable=no";
             var position = ",left=" + leftpos + ", top="    + toppos;
             var AUTH_POP = window.open('','auth_popup', winopts + position);
            }
            
            auth_form.target = "auth_popup"; // !!주의 고정값 ( 리턴받을때 사용되는 타겟명입니다.)
            auth_form.action = "./kcpcert_proc_req"; // 인증창 호출 및 결과값 리턴 페이지 주소
            
            auth_form.submit();
            return true;
        }
    }
</script>
<form name="form_auth">
	<!-- 요청번호 -->
	<input type="hidden" name="ordr_idxx" value="<%= ordr_idxx %>"/>
	<!-- 요청종류 -->
    <input type="hidden" name="req_tx"       value="cert"/>
    <!-- 요청구분 -->
    <input type="hidden" name="cert_method"  value="01"/>
    <!-- 웹사이트아이디 : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
    <input type="hidden" name="web_siteid"   value="<%= g_conf_web_siteid %>"/> 
    <!-- 노출 통신사 default 처리시 아래의 주석을 해제하고 사용하십시요 
         SKT : SKT , KT : KTF , LGU+ : LGT
    <input type="hidden" name="fix_commid"      value="KTF"/>
    -->
    <!-- 사이트코드 : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
    <input type="hidden" name="site_cd"      value="<%= g_conf_site_cd %>" />               
    <!-- Ret_URL : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
    <input type="hidden" name="Ret_URL"      value="<%= g_conf_Ret_URL %>" />
    <!-- cert_otp_use 필수 ( 메뉴얼 참고)
         Y : 실명 확인 + OTP 점유 확인 , N : 실명 확인 only
    -->
    <input type="hidden" name="cert_otp_use" value="Y"/>
    <!-- cert_enc_use 필수 (고정값 : 메뉴얼 참고) -->
    <input type="hidden" name="cert_enc_use" value="Y"/>
    <!-- 리턴 암호화 고도화 -->
    <input type="hidden" name="cert_enc_use_ext" value="Y"/>

    <input type="hidden" name="res_cd"       value=""/>
    <input type="hidden" name="res_msg"      value=""/>

    <!-- up_hash 검증 을 위한 필드 -->
    <input type="hidden" name="veri_up_hash" value=""/>

    <!-- 본인확인 input 비활성화 -->
    <input type="hidden" name="cert_able_yn" value="Y"/>

    <!-- web_siteid 검증 을 위한 필드 -->
    <input type="hidden" name="web_siteid_hashYN" value=""/>

    <!-- 가맹점 사용 필드 (인증완료시 리턴)-->
    <input type="hidden" name="param_opt_1"  value="opt1"/> 
    <input type="hidden" name="param_opt_2"  value="opt2"/> 
    <input type="hidden" name="param_opt_3"  value="opt3"/> 
</form>
<c:import url="/mobile/layout/sub-header"/>

    <header class="header clearfix">
        <div class="top-inner">
            <button class="back-arr"><i class="back-ic"></i></button>
            <p class="header-tit">${afn:getMessage("idPwdFind",sessionScope.locale)}</p>
        </div>
    </header>
    <section class="subheader">
        <ul class="taps">
            <li><a href="javascript:show(1)" id="tap1" >${afn:getMessage("searchId",sessionScope.locale)}</a></li>
            <li><a href="javascript:show(2)" id="tap2" class="active">${afn:getMessage("searchPswd",sessionScope.locale)}</a></li>
        </ul>
    </section>
    <section class="wrap clearfix" id="write">
        <form action="">
            <p class="text-md mt-2 mb-05">${afn:getMessage("searchIdWay",sessionScope.locale)}</p>
            <input type="radio" id="id-num-rd1" name="" checked class="">
            <label for="id-num-rd1">${afn:getMessage("hp_register",sessionScope.locale)}</label>
            <!-- <hr class=" mt-2 mb-2"> -->
            <div class="id-num1">
            	<p class="text-md mt-3 mb-05"></p>
                <!-- <p class="text-md mt-3 mb-05">등록한 휴대폰 번호</p> -->
                
                <div class="input-group">
                    <!-- <input type="text" placeholder="010-1234-1234">  -->
                    <button type="button" onclick="auth_type_check();">${afn:getMessage("certi",sessionScope.locale)}</button>
                </div>
                <p class="error mt-05">* ${afn:getMessage("error.finduserinfo.inputHpNotFind",sessionScope.locale)}</p>
            </div>
            <div class="id-num2" style="display: none;">
                <p class="text-md mt-3 mb-05">${afn:getMessage("certiNum",sessionScope.locale)}</p>
                <input type="text">
                <p class="error mt-05">* ${afn:getMessage("error.finduserinfo.NotCertiNum_retry",sessionScope.locale)}</p>
            </div>
            
            <button type="button" class="id-pw-btn">${afn:getMessage("QAok",sessionScope.locale)}</button>
        </form>
    </section>
    <section class="wrap clearfix" id="list">
        <form id="defaultUserInfoFind" name="defaultUserInfoFind" method="post">
            <p class="text-md mt-2 mb-05">${afn:getMessage("searchPwdWay",sessionScope.locale)}</p>
            <input type="radio" id="id-num-rd2" name="" checked>
            <label for="id-num-rd2">${afn:getMessage("emailAdd",sessionScope.locale)}</label>
            <p class="text-md mt-3 mb-05">${afn:getMessage("idEmail",sessionScope.locale)}</p>
            <input type="text" name="email" placeholder="gildonghong@onejoy.co.kr">
            <p class="mt-05">* ${afn:getMessage("error.finduserinfo.emailCheckinput",sessionScope.locale)}</p>
            <p class="error mt-05">* ${afn:getMessage("error.finduserinfo.NotEmailinfo",sessionScope.locale)}</p>
            <p class="error mt-05">* ${afn:getMessage("msg.findUserInfo.mailNewPwdsend",sessionScope.locale)}</p>
            <button type="button" class="id-pw-btn" id="senderFindPassword">${afn:getMessage("QAok",sessionScope.locale)}</button>

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