<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
<form name="defaultForm" id="defaultForm" method="POST">
        <header class="header">
            <div class="top-inner">
                <button class="back-arr"><i class="back-ic"></i></button>
                <p class="header-tit">${afn:getMessage('user_info',sessionScope.locale)} ${afn:getMessage('confirm',sessionScope.locale)}</p>
            </div>
        </header>
        <div class="mo-main form-main clearfix">
            <div class="h3-tit">
                <h3>${afn:getMessage('password',sessionScope.locale)} ${afn:getMessage('confirm',sessionScope.locale)}</h3>
                <p>${afn:getMessage('msg.user.pw_confirm',sessionScope.locale)}</p>
            </div>
            <div class="form-box">
                <form action="">
                    <div class="join-cell">
                        <h5>${afn:getMessage('id',sessionScope.locale)} (${afn:getMessage('email',sessionScope.locale)})</h5>
                        <p class="id-p"><span>${sessionScope.email}</span></p>
                    </div>
                    <div class="join-cell">
                        <h5>${afn:getMessage('password',sessionScope.locale)}</h5>
                        <input type="password" name="password">
                    </div>
                    <button type="button" id="formSubmit" class="btn-join">${afn:getMessage('confirm',sessionScope.locale)}</button>
                </form>
            </div>
        </div>
        <div class="mo-footer">
        </div>
    </div>
    </form>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>