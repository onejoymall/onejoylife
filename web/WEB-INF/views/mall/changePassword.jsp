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
        <div class="path">
            <ul>
                <li class="path-color">ㆍ</li>
                <li><a href="#">HOME ＞</a></li>
                <li><a href="#"> ${afn:getMessage("idPwdFind",sessionScope.locale)}</a></li>
            </ul>
        </div>
        <div class="h2-box">
            <h2>${afn:getMessage("idPwdFind",sessionScope.locale)}</h2>
            <p>${afn:getMessage("msg.finduserinfo.findTxt",sessionScope.locale)}</p>
        </div>
        <form name="passwordChangeForm" id="passwordChangeForm" method="POST">
            <div class="tab-box">
                <input type="radio" name="rd" id="rd1" class="rd-box" >
                <label for="rd1">${afn:getMessage("searchIdEmail",sessionScope.locale)}</label>
                <input type="radio" name="rd" id="rd2" class="rd-box" checked>
                <label for="rd2">${afn:getMessage("searchPswd",sessionScope.locale)}</label>
                <div class="for-id">
                    <div class="id-box1">
                        <div class="box-in">
                            <p class="tit-id">${afn:getMessage("searchIdWay",sessionScope.locale)}</p>
                            <div class="la-box1">
                                <input type="radio" id="id-r">
                                <label for="id-r">
                                    <p class="id-p">${afn:getMessage("hp_register",sessionScope.locale)}</p>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="id-box2">
                        <div class="box-in">
                            <div class="id-num1">
                                <p class="tit-id">${afn:getMessage("hp_register2",sessionScope.locale)}</p>
                                <div class="la-box2">
                                    <input type="text" placeholder="010-0000-0000">
                                    <div class="num">
                                        <a href="#">${afn:getMessage("certi",sessionScope.locale)}</a>
                                    </div>
                                    <div class="num num-none">
                                        <a href="#">${afn:getMessage("certi_reSend",sessionScope.locale)}</a>
                                    </div>
                                    <p class="p-size none">* ${afn:getMessage("error.finduserinfo.inpPhoneNotFind",sessionScope.locale)}<br>${afn:getMessage("error.finduserinfo.reCheckMent",sessionScope.locale)}</p>
                                    <p class="p-size p-color none">${afn:getMessage("msg.finduserinfo.reCertiNum",sessionScope.locale)}</p>
                                </div>
                            </div>
                            <div class="id-num2">
                                <p class="tit-id">${afn:getMessage("certiNum",sessionScope.locale)}</p>
                                <div class="la-box2">
                                    <input type="text" placeholder="">
                                    <p class="p-size">${afn:getMessage("error.finduserinfo.NotCertiNum_retry",sessionScope.locale)}</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="pw-box-out">
                    <div class="tit-box">${afn:getMessage("newPwdinput",sessionScope.locale)}</div>
                    <div class="for-pw">
                        <div class="pw-box-in">
                            <p>${afn:getMessage("msg.changePwd.newPwdinputMent",sessionScope.locale)}</p>
                            <div class="id-num1">
                                <p class="tit-id">${afn:getMessage("pwd",sessionScope.locale)}</p>
                                <div class="la-box2 la-input">
                                    <input name="password" id="password" type="password" placeholder="">
                                    <p class="none none-color"></p>
                                    <p id="validateErrorPassword"></p>
                                </div>
                            </div>
                            <div class="id-num1">
                                <p class="tit-id">${afn:getMessage("pswdCfm",sessionScope.locale)}</p>
                                <div class="la-box2 la-input">
                                    <input name="password_cf" id="password_cf" type="password" placeholder="">
                                    <p id ="validateErrorPasswordCf"></p>
                                    <input type="hidden" name="email" value="${email}">
                                </div>
                            </div>
                            <div class="but-box">
                                <button class="but-type1" type="button" onclick="location.href='/'">
                                  ${afn:getMessage("QAcancel",sessionScope.locale)}
                                </button>
                                <button class="but-type2" type="button" id="formSubmit">
                                   ${afn:getMessage("QAok",sessionScope.locale)}
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
var pwCheck = false;
    $('#formSubmit').on("click",function () {
    	if(!pwCheck){
    		$("#validateErrorPasswordCf").text("* ${afn:getMessage("error.sign.pwdcfMsg",sessionScope.locale)}");
    		$("#validateErrorPasswordCf").removeClass("text-success");
    		return;
    	}
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
                alert("error");
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
            $("#validateErrorPassword").text("* ${afn:getMessage("error.sign.pwdpattern",sessionScope.locale)}");
            $("#validateErrorPassword").removeClass("text-success");
            $("#validateErrorPasswordCf").text("");
        }else{
        	$("#validateErrorPassword").text('');
        	if(pw != pw_cf){
                $("#validateErrorPasswordCf").text("* ${afn:getMessage("error.sign.pwdDis",sessionScope.locale)}");
                $("#validateErrorPasswordCf").removeClass("text-success");
            }else{
            	pwCheck = true;
            	$("#validateErrorPasswordCf").text("* ${afn:getMessage("msg.sign.pwdSuccess",sessionScope.locale)}");
                $("#validateErrorPasswordCf").addClass("text-success");
            }
        }
    })
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
