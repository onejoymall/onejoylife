<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/mall/cert_conf.jsp"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
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
			$('#phoneBtn').addClass("bg-success");
            $('#phoneBtn').text("${afn:getMessage('certiOk',sessionScope.locale)}");
            $('#phoneBtn').attr("id","");
            $('input[name=phone]').val(obj.phone_no);
            $('input[name=username]').val(obj.user_name);
            $('input[name=sex]').val(obj.sex_code);
            $('input[name=birth]').val(obj.birth_day);
		}else{
			alert("${afn:getMessage('certiFail',sessionScope.locale)}");
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
            alert("${afn:getMessage('error.sign.uphashRiskTamp',sessionScope.locale)}");
            
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
            alert( "${afn:getMessage('error.sign.reNum_Required',sessionScope.locale)}" );

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
            window.name='window';
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
<div class="wrap">
    <div class="joinform">
        <div class="path">
            <ul>
                <li class="path-color">ㆍ</li>
                <li><a href="#">HOME ＞ </a></li>
                <li><a href="#"> ${afn:getMessage("onejoyJoin",sessionScope.locale)}</a></li>
            </ul>
        </div>
        <div class="h2-box"><h2><span>${afn:getMessage("onejoymall",sessionScope.locale)}</span> ${afn:getMessage("join",sessionScope.locale)}</h2></div>

        <div class="form-out1">
            <div class="form-out2">
                <form method="GET" name="defaultJoinform" id="defaultJoinform">
                    <table>
                        <colgroup>
                            <col style="width:600px;">
                        </colgroup>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">${afn:getMessage("idEmail",sessionScope.locale)}</p>
                                <div class="mem-id2 id2-w" >
                                    <input name="email" id="email" type="text"  required>
                                     <button class="btn-auth" id="emailChk" type="button">중복체크</button>
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
                                <p class="mem-id1">${afn:getMessage("phone",sessionScope.locale)}</p>
                                <div class="mem-id2 id2-w" onclick="return auth_type_check();" type="button">
                                    <input name="phone" id="phone" type="text" class="num-txt" readonly>
                                    <input name="sex" id="sex" type="hidden" readonly>
                                    <input name="birth" id="birth" type="hidden" readonly>
                                    <input name="username" id="username" type="hidden" readonly>
                                    <button class="btn-auth" id="phoneBtn" onclick="return auth_type_check();" type="button">${afn:getMessage("certi",sessionScope.locale)}</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er" id="phoneValidation">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="mem-td">
                                <p class="mem-id1">${afn:getMessage("pwd",sessionScope.locale)}</p>
                                <div class="mem-id2">
                                    <input name="password" id="password" type="password" placeholder="${afn:getMessage('msg.signPwdMsg',sessionScope.locale)}" >
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
                                <p class="mem-id1">${afn:getMessage("pswdCfm",sessionScope.locale)}</p>
                                <div class="mem-id2">
                                    <input name="password_cf" id="password_cf" type="password" placeholder="${afn:getMessage('msg.signPwdcfMsg',sessionScope.locale)}" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="er" id="password_cfValidation">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <div class="form-ch">
                        <input type="checkbox" name="option" id="ch">
                        <label for="ch">
                            <div class="ch-p-box">
                                <p>
                                    ${afn:getMessage("Iam",sessionScope.locale)} <strong>${afn:getMessage("14years",sessionScope.locale)}</strong>
                                    ${afn:getMessage("or",sessionScope.locale)}
                                    <a href="#default-modal" rel="modal:open">${afn:getMessage("terms",sessionScope.locale)},</a>
                                    <a href="#default-modal2" rel="modal:open"> ${afn:getMessage("3terms",sessionScope.locale)},</a>
                                    <a href="#default-modal3" rel="modal:open"> ${afn:getMessage("privacy",sessionScope.locale)}</a>
                                    ${afn:getMessage("msg.sign.agreeMsg",sessionScope.locale)}
                                </p>
                            </div>
                        </label>
                    </div>
                    <div class="join-box">
                        <a href="javascript:void(0)" id="formSignUpSubmit">${afn:getMessage("join",sessionScope.locale)}</a>
                     <!--    <a id="kakao-login-btn"></a> -->
                    </div>
                    
		             <div class="sns-login-wrap">
		            			<div class="sns-login-inner">
		                    		<div class="sns-login-ttl">
		                        	<div class="ttl-line"></div>
		                        		<span>${afn:getMessage("msg.login.orSocialLogin",sessionScope.locale)}</span>
		                        	<div class="ttl-line"></div>
		                    	</div>
		                    <button type="button" class="kko-login-btn"><i class="kko-ic"></i>카카오 계정으로 회원가입</button>
		                    		 <button type="button" class="nv-login-btn"><i class="nv-ic"></i>네이버 계정으로 회원가입</button>
                         <button type="button" class="fb-login-btn"><i class="fb-ic"></i>페이스북 계정으로 회원가입</button>
                         <button type="button" class="ln-login-btn"><i class="ln-ic"></i>LINE 계정으로 회원가입</button>
		                </div>
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

$('.kko-login-btn').click(function () {
    window.open('https://kauth.kakao.com/oauth/authorize?client_id=edae5e01f6d81723613c9cd06f550593&redirect_uri=<c:out value="${siteUrl}"/>/Popup/kakao&response_type=code','_blank','width=750, height=900');
});

	var pwCheck = false;
   $('#formSignUpSubmit').on("click",function () {
       var password = $('#password').val();
       var password_cf = $('#password_cf').val();
       var formData = $('#defaultJoinform').serialize();
        $('.er').html('');

       if(!pwCheck){
    	   $('#password_cfValidation').html('* ${afn:getMessage("error.sign.pwdcfMsg",sessionScope.locale)}');
       }else if($('#ch').is(":checked")) {
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
          alert('${afn:getMessage("error.sign.termsRequest",sessionScope.locale)}');
       }
   })

//이메일인증
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
                    $('#mailSender').text("${afn:getMessage('certi',sessionScope.locale)}");
                    $('#email_auth_code').attr("placeholder","${afn:getMessage('msg.sign.certi_4input',sessionScope.locale)}");
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
    //이메일 다시 입력시
    $(document).on("propertychange change keyup paste input",".mem-id2 > input[name=email]",function () {

        $('#emailChk').removeClass('btn-success')
        $('#emailChk').text('${afn:getMessage("duplication_check",sessionScope.locale)}');
    });
    //이메일중복체크
   $(document).on("click","#emailChk",function () {
        $('.er').html('');
        var formData = $('#defaultJoinform').serialize();
        $('.loading-bar-wrap').removeClass("hidden");

        jQuery.ajax({
            type:"GET",
            // contentType: 'application/json',
            url:"/sign/emailChk",
            // dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
            data:formData,

            success : function(data) {
                // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
                // TODO

                if(data.validateError){
                    $.each(data.validateError, function (index, item) {
                        if(index != "Error"){//일반에러메세지
                            $('#'+index+'Validation').html(item);
                        }
                    });
                }else{
                    $('#emailChk').addClass('btn-success')
                    $('#emailChk').text('${afn:getMessage("Usable",sessionScope.locale)}')
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
    // var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
   var regExp = /^[a-zA-Z0-9]{6,20}$/;
    //패스워드 체크
    $(document).on('input','input[name=password],input[name=password_cf]',function () {
    	pwCheck = false;
    	var pw = $('input[name=password]').val();
    	var pw_cf = $('input[name=password_cf]').val();
        if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
            $("#passwordValidation").text("* ${afn:getMessage('error.sign.pwdpattern',sessionScope.locale)}");
            $("#passwordValidation").removeClass("text-success");
            $("#password_cfValidation").text('');
        }else{
            $("#passwordValidation").addClass("text-success");
        	$("#passwordValidation").text("* ${afn:getMessage('msg.pw_use',sessionScope.locale)}");

        	if(pw != pw_cf){
                $("#password_cfValidation").removeClass("text-success");
                $("#password_cfValidation").text("* ${afn:getMessage('error.sign.pwdDis',sessionScope.locale)}");

            }else{
            	pwCheck = true;
                $("#password_cfValidation").addClass("text-success");
            	$("#password_cfValidation").text("* ${afn:getMessage('msg.sign.pwdSuccess',sessionScope.locale)}");
            }
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
                    $('#mailauth').text("${afn:getMessage('certiOk',sessionScope.locale)}");
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

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
