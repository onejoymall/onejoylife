<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-05-14
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal" id="modal-info-privacy">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoPrivacy.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="link-info-main">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoMain.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="link-info-main2">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoMain2.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="modal-info-privacy2">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoPrivacy2.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="modal-info-privacy3">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoPrivacy3.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 업체신청 모달 -->
<div class="modal index-md" id="modal-store">
    <div class="modal-bg"></div>
    <div class="modal-content">
        <form name="resetStoreForm" id="defaultForm" method="multipart/form-data">
        <div class="modal-header">
           <h2>입점업체 신청</h2>
            <button type="button" class="modal-close"></button>
        </div>
        <div class="modal-body clearfix">
            <h3 class="table-title mb-1">기본정보</h3>
            <hr class="mb-3">
<%--                <p class="text-md mb-05">업체명</p>--%>
<%--                <input type="text" class="width-100">--%>
            <p class="text-md mb-05 mt-2">입점사 ID</p>
            <input type="text" class="width-100" id="store_id" name="store_id">
            <button type="button" class="btn width-50 mt-05" id="modalstorIdDupCheck">중복확인</button>
            <p class="text-md mb-05 mt-2">비밀번호</p>
            <input type="password" name="store_password" class="width-100">
            <p class="info mt-05">
                <span class="ml-1 text-sm grey">- 6~20자의 영문,숫자를 조합하여 입력하여 주세요.</span>
                <%--<span class="ml-1 text-sm grey">- 영문 대소문자 또는 숫자, 특수문자 중 2가지 이상 종합으로 10-20자 미만</span><br>
                <span class="ml-1 text-sm grey">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</span>--%>
            </p>
            <p class="info mt-05 er" id="passwordValidation">
            </p>
            <p class="text-md mb-05 mt-2">비밀번호 확인</p>
            <input type="password" name="store_passwordCf" class="width-100">
            <p id="password_cfValidation" class="er">
            <h3 class="table-title mb-1 mt-5">판매자</h3>
            <hr class="mb-3">
            <p class="text-md mb-05">상호</p>
            <input type="text" class="width-100" id="store_name" name="store_name">
            <p class="text-md mb-05 mt-2">사업자등록번호</p>
            <input type="text" class="width-100" id="store_reg" name="store_reg">
            <button type="button" class="btn width-50 mt-05" id="modalstorRegDupCheck">중복확인</button>
            <p class="text-md mb-05 mt-2">대표자</p>
            <input type="text" class="width-100" id="store_ceo_name" name="store_ceo_name">
         <%--   <p class="text-md mb-05 mt-2">주민(법인)번호</p>
            <input type="radio" name="id-num" id="id-num1"><label for="id-num1">개인</label>
            <input type="radio" name="id-num" id="id-num2"><label for="id-num2">법인</label>
            <input type="text" class="width-100">--%>
            <p class="text-md mb-05 mt-2">업태/업종</p>
            <input type="text" class="width-half" id="store_type" name="store_type"><span class="in-text">/</span><input type="text" class="width-half" id="store_item" name="store_item">
            <p class="text-md mb-05 mt-2">사업자등록증 사본</p>
            <div class="fileBox">
                <input type="text" class="width-100 fileName" class="fileName" id="fileName" name="fileName" readonly="readonly">
<%--                <button class="btn width-50 mt-05" for="uploadBtn">파일찾기</button>--%>
                <label for="uploadBtn" class="btn_file width-50 mt-05">파일찾기</label>
                <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
            </div>
            <p class="text-md mb-05 mt-2">통신판매신고번호</p>
            <input type="text" class="width-100" id="store_online_reg" name="store_online_reg">
            <p class="text-md mb-05 mt-2">전화</p>
            <input type="text" class="width-100" id="store_tel" name="store_tel">
            <p class="text-md mb-05 mt-2">메일</p>
            <input type="text" class="width-100" id="store_mail" name="store_mail">
            <p class="text-md mb-05 mt-2">팩스</p>
            <input type="text" class="width-100" id="store_fax" name="store_fax">
            <p class="text-md mb-05 mt-2">사업장 주소</p>
            <input type="text" class="width-100" id="postcode" name="postcode">
            <button class="btn width-50 mt-05" id="daumMapCall">우편번호</button>
            <p class="mt-1">(도로명)</p><input type="text" class="width-100" id="roadAddress" name="roadAddress">
            <p class="mt-1">(지번)</p><input type="text" class="width-100" id="jibunAddress" name="jibunAddress">
            <p class="mt-1">(공통상세)</p><input type="text" class="width-100" id="extraAddress" name="extraAddress">
            <p class="text-md mb-05 mt-2">계산서 수신메일</p>
            <input type="text" class="width-100" id="tex_email" name="tex_email">
            <p class="text-md mb-05 mt-2">계좌번호</p>
            <input type="text" class="width-100" id="store_bank_account" name="store_bank_account">
            <p class="text-md mb-05 mt-2">예금주</p>
            <input type="text" class="width-100" id="store_bank_holder" name="store_bank_holder">
            <p class="text-md mb-05 mt-2">은행명</p>
            <input type="text" class="width-100" id="store_bank_name" name="store_bank_name">
            <!--담당자-->
<!--
            <h3 class="table-title mb-1 mt-5">담당자</h3>
            <hr class="mb-3">
            <p class="text-md mb-05 mt-3">물류 담당자(1)</p>
            <p class="mt-2">이름</p><input type="text" class="width-100">
            <p class="mt-1">연락처</p><input type="text" class="width-half" placeholder="전화번호"><span class="in-text">/</span><input type="text" class="width-half" placeholder="핸드폰번호">
            <p class="mt-1">이메일</p><input type="text" class="width-100">
            <p class="text-md mb-05 mt-3">물류 담당자(2)</p>
            <p class="mt-2">이름</p><input type="text" class="width-100">
             <p class="mt-1">연락처</p><input type="text" class="width-half" placeholder="전화번호"><span class="in-text">/</span><input type="text" class="width-half" placeholder="핸드폰번호">
            <p class="mt-1">이메일</p><input type="text" class="width-100">
            <p class="text-md mb-05 mt-3">CS 담당자</p>
            <p class="mt-2">이름</p><input type="text" class="width-100">
             <p class="mt-1">연락처</p><input type="text" class="width-half" placeholder="전화번호"><span class="in-text">/</span><input type="text" class="width-half" placeholder="핸드폰번호">
            <p class="mt-1">이메일</p><input type="text" class="width-100">
            <p class="text-md mb-05 mt-3">담당MD</p>
            <p class="mt-2">이름</p><input type="text" class="width-100">
             <p class="mt-1">연락처</p><input type="text" class="width-half" placeholder="전화번호"><span class="in-text">/</span><input type="text" class="width-half" placeholder="핸드폰번호">
            <p class="mt-1">이메일</p><input type="text" class="width-100">
            <p class="text-md mb-05 mt-3">정산 담당자</p>
            <p class="mt-2">이름</p><input type="text" class="width-100">
             <p class="mt-1">연락처</p><input type="text" class="width-half" placeholder="전화번호"><span class="in-text">/</span><input type="text" class="width-half" placeholder="핸드폰번호">
            <p class="mt-1">이메일</p><input type="text" class="width-100">
-->
            <%--<p class="info-last mt-3">입점 신청 후 10일 내에 입점 가능 여부를 입력하신 메일로 안내드립니다.<br>
            문의: 1811-9590, 평일 10:00-18:00(주말, 공휴일 휴무, 점심 12:00-13:00)</p>--%>
            <div class="btn-area clearfix">
                <button type="button" name="detail" id="modalStoreAddProc" class="btn btn-redcover">신청하기</button>
            </div>
        </div>
        </form>
    </div>
</div>
<script>
    $(function(){
        $("#mo-btn1").click(function(){
            event.preventDefault();
            $("#modal-info-privacy").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#modal-info-privacy").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#mo-btn2").click(function(){
            event.preventDefault();
            $("#link-info-main").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#link-info-main").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#mo-btn3").click(function(){
            event.preventDefault();
            $("#link-info-main2").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#link-info-main2").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#mo-btn4").click(function(){
            event.preventDefault();
            $("#modal-info-privacy2").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#modal-info-privacy2").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#mo-btn5").click(function(){
            event.preventDefault();
            $("#modal-info-privacy3").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#modal-info-privacy3").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#m-modal-store").click(function(){
            event.preventDefault();
            $("#modal-store").attr("style", "display:block");
            $('body').css("overflow", "hidden");
            $('#defaultForm')[0].reset();
            $('#store_id').attr("readonly",false);
            $('#modalstorIdDupCheck').attr('disabled', false);
            $('#modalstorIdDupCheck').html('중복확인');
            $('#store_reg').attr("readonly",false);
            $('#modalstorRegDupCheck').attr('disabled', false);
            $('#modalstorRegDupCheck').html('중복확인');
        });
        $(".md-btn-default").click(function(){
            $("#modal-store").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
</script>
