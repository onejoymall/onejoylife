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
                                <label for="id-r" >
                                    <p class="id-p">등록된 휴대폰</p>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="id-box2">
                        <div class="box-in">
                            <div class="id-num1">
                                <p class="tit-id">등록한 휴대폰 번호</p>
                                <div class="la-box2">
                                    <!-- <input type="text" placeholder="- 없이 숫자만 입력하세요" name="phone"> -->
                                    <div class="num">
                                        <a href="javascript:auth_type_check();" id="senderSmsAuthCode" class="">인증하기</a>
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
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    })
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
