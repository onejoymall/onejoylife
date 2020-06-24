<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/mall/cert_conf.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link href="/assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/mobile/common-mobile.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/mobile/commonSub.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
</head>
<body>
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
            $('#phoneBtn').text("인증완료");
            $('#phoneBtn').attr("id","");
            $('input[name=phone]').val(obj.phone_no);
            $('input[name=username]').val(obj.user_name);
            $('input[name=sex]').val(obj.sex_code);
            $('input[name=birth]').val(obj.birth_day);
		}else{
			alert("인증실패");
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
            alert("up_hash 변조 위험있음");
            
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
            alert( "요청번호는 필수 입니다." );

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
            auth_form.action = "/sign/kcpcert_proc_req"; // 인증창 호출 및 결과값 리턴 페이지 주소
            
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
        <header class="header">
            <div class="top-inner">
                <button class="back-arr" onclick="history.back();"><i class="back-ic"></i></button>
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
                            <button type="button" class="btn-auth" id="mailSender"><span>인증번호 요청</span></button>
<%--                            <button type="button" class="btn-color"><span>60초</span></button>--%>
<%--                            <button type="button" class="btn-color"><span>인증완료</span></button>--%>
                        </div>
                        <p class="error" id="email_auth_codeValidation"></p>
                    </div>
                    <div class="join-cell">
                        <div class="join-cell-in">
                            <input type="text" name="phone" id="phone" class="num-txt" placeholder="핸드폰번호" readonly>
                            <input name="sex" id="sex" type="hidden" readonly>
                            <input name="birth" id="birth" type="hidden" readonly>
                            <input name="username" id="username" type="hidden" readonly>
                            <button class="btn-auth" id="phoneBtn" onclick="return auth_type_check();" type="button"><span>인증하기</span></button>
                        </div>
                        <p class="error" id="phoneValidation"></p>
                    </div>
                    <div class="join-cell">
                        <input type="password" name="password" id="password" placeholder="비밀번호(영문,숫자 6~20자 이내)">
                        <p class="error" id="passwordValidation"></p>
                    </div>
                    <div class="join-cell">
                        <input type="password" name="password_cf" id="password_cf" placeholder="비밀번호 확인">
                        <p class="error" id="password_cfValidation"></p>
                    </div>
                    <div class="join-ck-box clearfix">
                        <input type="checkbox" id="join-ck" name="join-ck" class="save-ck">
                        <label for="join-ck"><p class="ck-txt">본인은 만 14세 이상이며, <a href="#" id="mo-btn2">원조이몰 이용약관</a>, <a href="#" id="mo-btn3">제3자동의 이용약관</a>, <a href="#" id="mo-btn4">개인정보 수집 및 이용</a> 개인정보 제공 내용을 확인하였으며, 이에 동의합니다.</p></label>
                    </div>
                    <button type="button" id="formSignUpSubmit" class="btn-join">회원가입</button>
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
       /* var mathPassword = "^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{6,20}$";
        */
        var regExp = /^[a-zA-Z0-9]{6,20}$/;
        //패스워드 체크
        $(document).on('input','input[name=password],input[name=password_cf]',function () {
            var pw = $('input[name=password]').val();
            var pw_cf = $('input[name=password_cf]').val();
            if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
                $("#passwordValidation").text(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.");
                $('#passwordValidation').addClass("error-on");
                $("#passwordValidation").removeClass("text-success");
            }else{
                $("#passwordValidation").text('');
                if(pw != pw_cf){
                    $("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.");
                    $('#password_cfValidation').addClass("error-on");
                    $("#password_cfValidation").removeClass("text-success");
                }else{
                    $("#password_cfValidation").text(" * 비밀번호가 일치합니다.");
                    $("#password_cfValidation").addClass("text-success");
                }
            }
        })
        function validationNumber(){
            //숫자만입력받게
            $(document).on("input",".onlyNumber",function(){
                $(this).val($(this).val().replace(/[^0-9]/g,""))
            });
            //숫자와|만입력받게
            $(document).on("input",".onlyNumberAndPipe",function(){
                $(this).val($(this).val().replace(/[^0-9|]/g,""))
            });
            //숫자와.만입력받게
            $(document).on("input",".onlyNumberAndDot",function(){
                $(this).val($(this).val().replace(/[^0-9.]/g,""))
            });
            }
            validationNumber();

            //문자열 숫자포함
            function isStrNumber(str){
            return str.search(/[0-9]/g) >= 0;
            }

            //문자열 알파뱃포함
            function isStrAlphabet(str){
            return str.search(/[a-zA-Z]/g) >= 0;
        }
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