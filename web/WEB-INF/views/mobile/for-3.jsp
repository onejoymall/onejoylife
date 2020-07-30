<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <link href="../../assets/css/reset.css" rel="stylesheet" type="text/css">      
    <link href="../../assets/css/mobile/common-mobile.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&display=swap&subset=korean" rel="stylesheet">
<!--
    [if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]
-->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src="../../assets/js/common-mobile.js"></script>
</head>
<body class="pt-48 pb-5">
    <header class="header clearfix">
        <div class="top-inner">
            <button class="back-arr"><i class="back-ic"></i></button>
            <p class="header-tit">${afn:getMessage("idPwdFind",sessionScope.locale)}</p>
        </div>
    </header>
    <section class="subheader">
        <ul class="taps">
            <li><a href="javascript:void(1)" id="tap1" class="">${afn:getMessage("searchIdEmail",sessionScope.locale)}</a></li>
            <li><a href="javascript:void(2)" id="tap2" class="">${afn:getMessage("searchPswd",sessionScope.locale)}</a></li>
        </ul>
    </section>
    <section class="wrap clearfix" id="write">
        <p class="id-pw-tit">${afn:getMessage("msg.changePwdDone.resultId",sessionScope.locale)}<br> <span>${id}</span> ${afn:getMessage("msg.changePwdDone.is",sessionScope.locale)}</p>
        <button type="button" onclick="location.href='<c:url value="/sign/login"/>'" class="id-pw-btn">${afn:getMessage("login",sessionScope.locale)}</button>
    </section>
    <section class="wrap clearfix" id="list">
        <p class="id-pw-tit">${afn:getMessage("msg.changePwdDone.successMent",sessionScope.locale)}</p>
        <button type="button" onclick="location.href='<c:url value="/sign/login"/>'" class="id-pw-btn">${afn:getMessage("login",sessionScope.locale)}</button>
    </section>
</body>
<%@ include file="/WEB-INF/views/mobile/layout/fix-nav.jsp" %>
<script>
$(document).ready(function(){
	var no = <c:if test="${not empty id}">1</c:if>
	<c:if test="${empty id}">2</c:if>;
	show(no);
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