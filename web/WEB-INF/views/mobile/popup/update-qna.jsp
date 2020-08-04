<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<head>
    <title>onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link href="<c:url value="/assets/css/reset.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/mobile/common-mobile.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/mobile/commonSub.css" />"rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <!--
        [if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
        <![endif]
    -->
    <link href="<c:url value="/assets/css/jquery.bxslider.css" />"rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="<c:url value="/assets/js/jquery.bxslider.min.js" />"></script>
    <script src="<c:url value="/assets/js/common-mobile.js" />"></script>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

    <!-- Toastr -->
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
</head>
	<div class="underPop on" id="qna">
	    <div class="content">
	        <header>
	           <h3>${afn:getMessage("writeItemQA",sessionScope.locale)}</h3>
	            <button class="popClose">
	                <i class="ri-close-line"></i>
	            </button>
	        </header>
	        <form id="defaultForm" name="defaultForm" method="POST">
    		<input type="hidden" name="qna_id" value="${detail.qna_id}"/>
	        <content>
	        	<p class="text-md mt-2 mb-05">${afn:getMessage("brd_title",sessionScope.locale)} *</p>
                <input type="text" name="qna_title" class="width-100 mb-05" placeholder="${afn:getMessage('msg_below50word',sessionScope.locale)}" maxlength="50" value="${detail.qna_title}">
                <c:if test="${detail.qna_open_type eq 'T'}">
                    <input name="secret" id="secret" type="checkbox" class="b8 mt-1" checked>
                </c:if>
                <c:if test="${detail.qna_open_type eq 'F'}">
                    <input name="secret" id="secret" type="checkbox" class="b8 mt-1">
                </c:if>
                <label for="secret">${afn:getMessage("private",sessionScope.locale)}</label>
                <input type="hidden" name="qna_open_type" value="${detail.qna_open_type}">
                <p class="text-md mt-2 mb-05">${afn:getMessage("QA_type",sessionScope.locale)} *</p>
                <select class="width-100" name="qna_type" id="qna_type">
                    <option value="O" <c:if test="${detail.qna_type eq \"O\"}">selected</c:if>>${afn:getMessage('orders_payments',sessionScope.locale)}</option>
                    <option value="C" <c:if test="${detail.qna_type eq \"C\"}">selected</c:if>>${afn:getMessage('change_return_refund',sessionScope.locale)}</option>
                    <option value="D" <c:if test="${detail.qna_type eq \"D\"}">selected</c:if>>${afn:getMessage('deliv',sessionScope.locale)}</option>
                    <option value="G" <c:if test="${detail.qna_type eq \"G\"}">selected</c:if>>${afn:getMessage('QA_others',sessionScope.locale)}</option>
                </select>
                <p class="text-md mt-1 mb-05">${afn:getMessage("brd_content",sessionScope.locale)} *</p>
                <div class="textarea mt-05 mb-2">
                   <span>&#40;0/500&#41;</span>
                   <textarea name="qna_memo" class="width-100" maxlength="500">${detail.qna_memo}</textarea>
                </div>
                <ul class="btns mt-2 mb-0">
                    <li><a href="javascript:self.close();">${afn:getMessage("QAcancel",sessionScope.locale)}</a></li>
                    <li><a href="#" class="active" id="qnaModifySubmit">${afn:getMessage("update",sessionScope.locale)}</a></li>
               </ul>
	        </content>
	        </form>
	    </div>
	</div>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>
    <script src='<c:url value="/assets/js/commonMgScript.js"/>'></script>
    <script>
    $('.popClose').on('click',function(){
        self.close();
    })
    </script>