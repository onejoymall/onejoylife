<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>
<form name="defaultForm" id="defaultForm" method="POST">
        <header class="header">
            <div class="top-inner">
                <button class="back-arr"><i class="back-ic"></i></button>
                <p class="header-tit">회원정보 수정</p>
            </div>
        </header>
        <div class="mo-main form-main clearfix">
            <div class="h3-tit">
                <h3>비밀번호 확인</h3>
                <p>회원님의 안전한 개인정보 보호를 위해 비밀번호를 다시 한번 확인 합니다.</p>
            </div>
            <div class="form-box">
                <form action="">
                    <div class="join-cell">
                        <h5>아이디(이메일)</h5>
                        <p class="id-p"><span>${sessionScope.email}</span></p>
                    </div>
                    <div class="join-cell">
                        <h5>비밀번호</h5>
                        <input type="password" name="password">
                    </div>
                    <button type="button" id="formSubmit" class="btn-join">확인</button>
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