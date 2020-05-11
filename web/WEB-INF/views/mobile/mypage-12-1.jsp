<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>
<form name="defaultForm" id="defaultForm" method="POST">
    <section class="wrap" id="write">
        <h2 class="pb-1">기본정보</h2>
        <hr class="mb-2">
        <p class="text-md mb-05 ">이메일</p>
        <div class="group mb-05">
            <p><span>${sessionScope.email}</span></p>
            <!-- <button type="button">이메일 변경</button> -->
        </div>
        <div class="group mb-05 mail-dis">
            <input type="text">
            <button type="button">인증메일 전송</button>
        </div>
        <p class="text-md mb-05 mt-2">휴대폰 번호</p>
        <div class="group group-sel">
            <select class="width-25 mt-05 mb-05">
            <option value="" selected>010</option>
            <option value="">011</option>
        </select> -
        <input type="text" class="width-30 mb-05"> -
        <input type="text" class="width-30 mb-05">
        </div>
        <h2 class="pb-1 mt-4">비밀번호 변경</h2>
        <hr class="mb-2">
        <div class="pass-div">
            <p>* 비밀번호는 6~20자의 영문, 숫자를 조합하여 입력하여 주세요.</p>
            <p class="text-md mb-05 mt-2">현재 비밀번호</p>
            <input type="password" name="password" class="input-ty">
            <p class="pass-error mt-1">비밀번호가 정확하지 않습니다.</p>

            <p class="text-md mb-05 mt-2">신규 비밀번호</p>
            <input type="password" name="newpassword" class="input-ty">
            <p class="pass-error mt-1">비밀번호는 6~20자의 영문, 숫자를 조합하여 입력하여 주세요.</p>

            <p class="text-md mb-05 mt-2">비밀번호 다시 입력</p>
            <input type="password" name="renewpassword" class="input-ty">
            <p class="pass-error mt-1">신규 비밀번호가 일치하지 않습니다.</p>
            
        </div>

        <h2 class="pb-1 mt-4">정보 수신 동의</h2>
        <hr class="mb-2">
        <input type="checkbox" id="ch1" class="b8">
        <label for="all">전체동의</label>
        <input type="checkbox" id="ch2" value="Y" name="user_privacy_policy" class="b8 mt-1">
        <label for="receive">
            <span class="gray">(선택)</span>개인정보 수집 및 이용
        </label>
        <label for="receive" class="ck-lis">
            <p>목적 : 메인이벤트 등 마케팅 활용<br>항목 : 회원탈퇴 후 5일까지</p>
        </label>
        <input type="checkbox" id="ch3" value="Y" name="email_privacy_policy" >
        <label for="receive2"><span class="gray">(선택)</span>이메일 수신</label>
        <label for="receive2" class="ck-lis">
            <p>
                - 이메일 동의 여부 변경 시 24시간 이후부터 적용됩니다.<br>
                - 이메일 수신 동의 시 원조이몰의 할인쿠폰,이벤트,인기경품 등의 마케팅 관련소식을 받을 수 있습니다.<br>
                - 회원정보, 구매, 배송 정보 및 중요 공지사항은 수신 동의여부에 관계없이 발송됩니다.
            </p>
        </label>

        <div class="mem-withdrawal mt-4">
            <p>* 탈퇴를 원하시면 회원탈퇴 버튼을 눌러주세요.</p>
            <a href="mypage-12-1-1.html" class=" mt-1">회원탈퇴</a>
        </div>
        
        <button type="button" id="formSubmit" class="btn btn-lg btn-redcover width-100 mb-3 mt-4">수정</button>
    </section>
    </form>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>