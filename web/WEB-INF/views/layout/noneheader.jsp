<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <meta property="og:url" content="http://onejoy-life.com/" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="원조이라이프" />
    <meta property="og:description" content="" />
    <meta property="og:image" content="http://onejoy-life.com/fileupload/banner/2020/202005180644214820.jpg" />
    <meta property="og:image:width" content="1100" />
    <meta property="og:image:height" content="265" />
    <link href="<c:url value="/assets/css/reset.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/common.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/jquery.bxslider.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/header.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/footer.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/${style}.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&display=swap&subset=korean" rel="stylesheet">

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

    <link rel='stylesheet' href='<c:url value="/assets/css/common/common.css"/>'/>
    <!-- Toastr -->
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
    <!--
    [if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]
-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>

    <script>
    //전역변수
    <c:if test="${not empty postUrl}">
        var postUrl = '<c:url value="${postUrl}"/> ';
    </c:if>
    </script>
    <script type='text/javascript' src='http://wcs.naver.net/wcslog.js'></script> 

	<script type='text/javascript'> 
	
	if(!wcs_add) var wcs_add = {};
	
	wcs_add['wa'] = 's_1e285b9b3844';
	
	wcs.inflow('onejoy-life.com');
	
	</script>
</head>
<body>

