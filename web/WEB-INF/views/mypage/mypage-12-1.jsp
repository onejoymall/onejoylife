<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/mall/cert_conf.jsp"%>
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
            $('#phoneBtn').text("인증완료");
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
        <div class="page-box">
            <main class="clearfix">
                <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
                <div class="right-contain">
                    <form name="defaultForm" id="defaultForm" method="POST">
                        <p class="sec1-h1">회원정보 수정</p>
                        <div class="r-sec1">
                            <p class="sec-h1">기본정보</p>
                            <table>
                                <colgroup>
                                    <col style="width: 180px;">
                                    <col style="width: 714px;">
                                </colgroup>
                                <tbody class="sec1-tbody">
                                    <tr class="sec1-td-bor1">
                                        <td class="txt-a">아이디(이메일)</td>
                                        <td class="td-mar padding-left">
                                            <div class="body-td1-1">
                                                <span>${sessionScope.email}</span>
                                            </div>
                                            <div class="body-td1-2 dis-none" style="margin-bottom: 12px;">
                                                <input type="text">
                                                <a href=""><span>인증메일 전송</span></a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="sec1-td-bor1">
                                        <td class="txt-a">휴대폰 번호</td>
                                        <td class="padding-left">
                                            <input type="text" name="phone" class="input-ty input-phone" id="phone" readonly="readonly" value="${userInfo.phone}">
                                            <input name="sex" id="sex" type="hidden" value="${userInfo.sex}" readonly>
		                                    <input name="birth" id="birth" type="hidden" value="${userInfo.birth}" readonly>
		                                    <input name="username" id="username" type="hidden" value="${userInfo.username}" readonly>
		                                    <button class="btn-auth" id="phoneBtn" onclick="return auth_type_check();" type="button">변경하기</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="7" class="txt-a">비밀번호 변경</td>
                                        <td class="padding-left pw-color1"><span>* 비밀번호는 6~20자의 영문, 숫자를 조합하여 입력하여 주세요. <br> * 입력하지않으면 기존비밀번호로 유지됩니다.</span></td>
                                    </tr>
                                    <!-- <tr>
                                        <td class="padding-left"><span class="span-w">현재 비밀번호</span><input type="password" name="password" class="input-ty"></td>
                                    </tr>
                                    <tr class="dis-none tr-height">
                                        <td class="padding-left"><span class="span-w"></span>비밀번호가 정확하지 않습니다.</td>
                                    </tr> -->
                                    <tr>
                                        <td class="padding-left"><span class="span-w">신규 비밀번호</span><input type="password" name="newpassword" class="input-ty"></td>
                                    </tr>
                                    <tr class="tr-height">
                                        <td class="padding-left" id="passwordValidation"></td>
                                    </tr>
                                    <tr>
                                        <td class="padding-left"><span class="span-w">비밀번호 다시 입력</span><input type="password" name="renewpassword" class="input-ty"></td>
                                    </tr>
                                    <tr class="tr-height">
                                        <td class="padding-left pad-bot" id="password_cfValidation"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="r-sec2">
                            <p class="sec-h1">정보 수신 동의</p>
                            <table>
                                <colgroup>
                                    <col style="width: 894px;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td class="sec2-td1">
                                            <input type="checkbox" id="ch1" <c:if test="${userInfo.user_privacy_policy == 'Y' &&
                                            											  userInfo.email_privacy_policy == 'Y'}">checked</c:if>>
                                            <label for="ch1"><span class="ch-display">전체동의</span></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ch2" value="Y" name="user_privacy_policy" <c:if test="${userInfo.user_privacy_policy == 'Y'}">checked</c:if>>
                                            <label for="ch2">
                                                <div class="ch-display">
                                                    <div class="cont1-box1">
                                                        <span class="c-color">(선택)</span><span>개인정보 수집 및 이용</span>
                                                    </div>
                                                    <div class="cont1-box2">
                                                        <div class="cont1-out1">
                                                            <span>목적</span>
                                                            <span>메인이벤트 등 마케팅 활용</span>
                                                        </div>
                                                        <div class="cont1-out2">
                                                            <span>항목</span>
                                                            <span>회원탈퇴 후 5일까지</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sec2-td1">
                                            <input type="checkbox" id="ch3" value="Y" name="email_privacy_policy" <c:if test="${userInfo.email_privacy_policy == 'Y'}">checked</c:if>>
                                            <label for="ch3">
                                                <div class="ch-display">
                                                    <span class="c-color">(선택)</span><span>이메일 수신</span>
                                                    <p class="mar-top">- 이메일 동의 여부 변경 시 24시간 이후부터 적용됩니다.<br>
                                                    - 이메일 수신 동의 시 원조이몰의 할인쿠폰,이벤트,인기경품 등의 마케팅 관련소식을 받을 수 있습니다.<br>
                                                    - 회원정보, 구매, 배송 정보 및 중요 공지사항은 수신 동의여부에 관계없이 발송됩니다.
                                                    </p>
                                                </div>
                                            </label>
                                            
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="box1">
                                <div class="box1-in">
                                    <p>탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.</p>
                                    <a href="mypage-12-1-1.html">회원탈퇴</a>
                                </div>
                            </div>
                        </div>
                        <div class="r-sec3">
                            <button type="button" id="formSubmitUserModi">수정</button>
                            <button>이전</button>
                        </div>
                    </form>
                </div>   
            </main>   
        </div>     
    </div>

<script type="text/javascript">
$("#formSubmitUserModi").click(function(){
	if(!pwCheck){
		$('#password_cfValidation').html('* 비밀번호를 확인 해주세요.');
		$("#password_cfValidation").removeClass("text-success");
		return;
	}
	var formData = $('#defaultForm').serialize();
    var alertType;
    var showText;

    jQuery.ajax({
        type: $('#defaultForm').attr('method'),
        url: postUrl,
        // enctype: 'multipart/form-data',
        data: formData,
        success: function (data) {
            // console.log(data.validateError)
            if (data.validateError) {
                $('.validateError').empty();
                console.log(data);
                $.each(data.validateError, function (index, item) {
                    // $('#validateError'+index).removeClass('none');
                    // $('#validateError'+index).html('* '+item);
                    if(index == "Error"){//일반에러메세지
                        alertType = "error";
                        showText = item;
                    }else{
                        alertType = "error";
                        showText = index + " (은) " + item;
                    }
                    // $.toast().reset('all');//토스트 초기화
                    $.toast({
                        text: showText,
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        heading: 'Error',
                        icon: 'error',
                    });
                });

            } else {
                // loginAuth(data.access_token);
                if (data.success) {
                    $.toast({
                        text: 'success',
                        showHideTransition: 'plain', //펴짐
                        position: 'bottom-right',
                        icon: 'success',
                        hideAfter: 2000,
                        afterHidden: function () {
                        	location.href=data.redirectUrl;
                        }
                    });
                } else{
                	if(data.redirectUrl){
                		location.href=data.redirectUrl;	
                	}else{
                		$.toast({
                            text: "ERROR",
                            showHideTransition: 'plain', //펴짐
                            position: 'bottom-right',
                            heading: 'Error',
                            icon: 'error',
                        });
                	}
                }
            }
        },
        error: function (xhr, status, error) {
            alert("error");
        }
    });
});
var pwCheck = true;

var regExp = /^[a-zA-Z0-9]{6,20}$/;
//패스워드 체크
$(document).on('input','input[name=newpassword],input[name=renewpassword]',function () {
	pwCheck = false;
	var pw = $('input[name=newpassword]').val();
	var pw_cf = $('input[name=renewpassword]').val();
    if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
        $("#passwordValidation").text(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.");
        $("#passwordValidation").removeClass("text-success");
        $("#password_cfValidation").text('');
    }else{
    	$("#passwordValidation").text('');
    	if(pw != pw_cf){
            $("#password_cfValidation").text(" * 비밀번호가 일치하지 않습니다.");
            $("#password_cfValidation").removeClass("text-success");
        }else{
        	pwCheck = true;
        	$("#password_cfValidation").text(" * 비밀번호가 일치합니다.");
            $("#password_cfValidation").addClass("text-success");
        }
    }
    if(!pw && !pw_cf) pwCheck = true;
})
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>