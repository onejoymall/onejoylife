<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<script>
$(function() {
    $('#ch1').on('change', function () {
        $(this).parents('.r-sec2').find('input:checkbox').prop('checked', $(this).prop('checked'));
        if($(this).is(":checked")){
            $('#ch2').val('Y');
            $('#ch3').val('Y');
        } else {
            $('#ch2').val('N');
            $('#ch3').val('N');
        }
    })

    $('#ch2').click(function () {
        if($(this).is(":checked")){
            $(this).val('Y');
        } else {
            $(this).val('N');
        }
    })

    $('#ch3').click(function () {
        if($(this).is(":checked")){
            $(this).val('Y');
        } else {
            $(this).val('N');
        }
    })
})
</script>
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
                                        <td class="body-td2 padding-left">
                                            <select name="" id="">
                                                <option value="">010</option>
                                                <option value="">010</option>
                                                <option value="">010</option>
                                                <option value="">010</option>
                                            </select>
                                            <span>-</span>
                                            <input type="text">
                                            <span>-</span>
                                            <input type="text">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="7" class="txt-a">비밀번호 변경</td>
                                        <td class="padding-left pw-color1"><span>* 비밀번호는 6~20자의 영문, 숫자를 조합하여 입력하여 주세요.</span></td>
                                    </tr>
                                    <tr>
                                        <td class="padding-left"><span class="span-w">현재 비밀번호</span><input type="password" name="password" class="input-ty"></td>
                                    </tr>
                                    <tr class="dis-none tr-height">
                                        <td class="padding-left"><span class="span-w"></span>비밀번호가 정확하지 않습니다.</td>
                                    </tr>
                                    <tr>
                                        <td class="padding-left"><span class="span-w">신규 비밀번호</span><input type="password" name="newpassword" class="input-ty"></td>
                                    </tr>
                                    <tr class="dis-none tr-height">
                                        <td class="padding-left"><span class="span-w"></span>비밀번호는 6~20자의 영문, 숫자를 조합하여 입력하여 주세요. </td>
                                    </tr>
                                    <tr>
                                        <td class="padding-left"><span class="span-w">비밀번호 다시 입력</span><input type="password" name="renewpassword" class="input-ty"></td>
                                    </tr>
                                    <tr class="dis-none tr-height">
                                        <td class="padding-left pad-bot"><span class="span-w"></span>신규 비밀번호가 일치하지 않습니다.</td>
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
                                            <input type="checkbox" id="ch1">
                                            <label for="ch1"><span class="ch-display">전체동의</span></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ch2" value="N" name="user_privacy_policy" >
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
                                            <input type="checkbox" id="ch3" value="N" name="email_privacy_policy" >
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
                            <button type="button" id="formSubmit">수정</button>
                            <button>이전</button>
                        </div>
                    </form>
                </div>   
            </main>   
        </div>     
    </div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>