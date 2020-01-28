<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>

        <form  name="defaultLoginForm" id="defaultLoginForm">
            <label for="id-input" class="id-la">아이디(이메일)</label><input type="text" name="email" id="id-input" placeholder="아이디를 입력하세요" class="form-con">
            <p id="validateErrorEmail" class="validateError">&nbsp;</p>
            <label for="pw-input" class="id-la">비밀번호</label><input type="password" name="password" id="pw-input" placeholder="비밀번호를 입력하시오" class="form-con">
            <p id="validateErrorPassword" class="validateError">&nbsp;</p>
            <button id="formSubmit" type="button">로그인</button>
        </form>
<script>
    $('#formSubmit').on("click",function () {
        var formData = $('#defaultLoginForm').serialize();
        jQuery.ajax({
            type:"GET",
            url:"/Manager/ManagerSign/ManagerLoginProc",
            data:formData,
            success : function(data) {
                if(data.validateError > 0) {
                    $('.validateError').empty();
                    $.each(data.validateError, function(index, item){

                        // $('#validateError'+index).removeClass('none');

                        $('#validateError'+index).html('* '+item);
                    });
                }else{
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error : function(xhr, status, error) {
                alert("error");
            }
        });
    })
</script>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
