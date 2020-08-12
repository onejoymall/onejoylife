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
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

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
                    <button type="button" href="javascript:void(0)" class="md-btn-default">${afn:getMessage('confirm',sessionScope.locale)}</button>
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
                    <button type="button" href="javascript:void(0)" class="md-btn-default">${afn:getMessage('confirm',sessionScope.locale)}</button>
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
                    <button type="button" href="javascript:void(0)" class="md-btn-default">${afn:getMessage('confirm',sessionScope.locale)}</button>
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
                    <button type="button" href="javascript:void(0)" class="md-btn-default">${afn:getMessage('confirm',sessionScope.locale)}</button>
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
                    <button type="button" href="javascript:void(0)" class="md-btn-default">${afn:getMessage('confirm',sessionScope.locale)}</button>
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
           <h2>${afn:getMessage('store_request',sessionScope.locale)}</h2>
            <button type="button" class="modal-close"></button>
        </div>
        <div class="modal-body clearfix">
            <h3 class="table-title mb-1">${afn:getMessage('default_info',sessionScope.locale)}</h3>
            <hr class="mb-3">
<%--                <p class="text-md mb-05">업체명</p>--%>
<%--                <input type="text" class="width-100">--%>
            <p class="text-md mb-05 mt-2">${afn:getMessage('store_id',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_id" name="store_id">
            <button type="button" class="btn width-50 mt-05" id="modalstorIdDupCheck">${afn:getMessage('duplication_check',sessionScope.locale)}</button>
            <input type="hidden" name="storIdDupCheck" value="">
            <p class="text-md mb-05 mt-2">${afn:getMessage('password',sessionScope.locale)}</p>
            <input type="password" name="store_password" class="width-100">
            <p class="info mt-05">
                <span class="ml-1 text-sm grey">- ${afn:getMessage('error.sign.pwdpattern',sessionScope.locale)}</span>
                <%--<span class="ml-1 text-sm grey">- 영문 대소문자 또는 숫자, 특수문자 중 2가지 이상 종합으로 10-20자 미만</span><br>
                <span class="ml-1 text-sm grey">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</span>--%>
            </p>
            <p class="info mt-05 er" id="passwordValidation">
            </p>
            <p class="text-md mb-05 mt-2">${afn:getMessage('pswdCfm',sessionScope.locale)}</p>
            <input type="password" name="store_passwordCf" class="width-100">
            <p id="password_cfValidation" class="er">
            <p class="text-md mb-05 mt-2">${afn:getMessage('store',sessionScope.locale)}/${afn:getMessage('creator',sessionScope.locale)}</p>
            <input type="radio" name="store_creator_yn" id="store_creator_yn1" value="N" checked/>
            <label for="store_creator_yn1">${afn:getMessage('store',sessionScope.locale)}</label>
            <input type="radio" name="store_creator_yn" id="store_creator_yn2" value="Y"/>
            <label for="store_creator_yn2">${afn:getMessage('creator',sessionScope.locale)}</label>
            <h3 class="table-title mb-1 mt-5">${afn:getMessage('sellerInfo',sessionScope.locale)}</h3>
            <hr class="mb-3">
            <p class="text-md mb-05">${afn:getMessage('company_name',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_name" name="store_name">
            <p class="text-md mb-05 mt-2">${afn:getMessage('store_reg',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_reg" name="store_reg">
            <button type="button" class="btn width-50 mt-05" id="modalstorRegDupCheck">${afn:getMessage('duplication_check',sessionScope.locale)}</button>
            <input type="hidden" name="storRegDupCheck" value="">
            <p class="text-md mb-05 mt-2">${afn:getMessage('representative',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_ceo_name" name="store_ceo_name">
         <%--   <p class="text-md mb-05 mt-2">주민(법인)번호</p>
            <input type="radio" name="id-num" id="id-num1"><label for="id-num1">개인</label>
            <input type="radio" name="id-num" id="id-num2"><label for="id-num2">법인</label>
            <input type="text" class="width-100">--%>
            <p class="text-md mb-05 mt-2">${afn:getMessage('business_condition',sessionScope.locale)}/${afn:getMessage('industry',sessionScope.locale)}</p>
            <input type="text" class="width-half" id="store_type" name="store_type"><span class="in-text">/</span><input type="text" class="width-half" id="store_item" name="store_item">
            
             <p class="text-md mb-05 mt-2">${afn:getMessage('purchase',sessionScope.locale)}/${afn:getMessage('consign',sessionScope.locale)}</p>
            <input type="radio" name="store_pur_com" id="store_pur_com1" value="1" checked/>
            <label for="store_pur_com1">${afn:getMessage('purchase',sessionScope.locale)}</label>
            <input type="radio" name="store_pur_com" id="store_pur_com2" value="2"/>
            <label for="store_pur_com2">${afn:getMessage('consign',sessionScope.locale)}</label>
            
            <p class="text-md mb-05 mt-2">${afn:getMessage('business_license_copy',sessionScope.locale)}</p>
            
            <div class="fileBox">
                <input type="text" class="width-100 fileName" class="fileName" id="fileName" name="fileName" readonly="readonly">
<%--                <button class="btn width-50 mt-05" for="uploadBtn">파일찾기</button>--%>
                <label for="uploadBtn" class="btn_file width-50 mt-05">${afn:getMessage('find_files',sessionScope.locale)}</label>
                <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
            </div>
            <p class="text-md mb-05 mt-2">${afn:getMessage('communications_sales_reportnum',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_online_reg" name="store_online_reg">
            <p class="text-md mb-05 mt-2">${afn:getMessage('tel',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_tel" name="store_tel">
            <p class="text-md mb-05 mt-2">${afn:getMessage('email',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_mail" name="store_mail">
            <p class="text-md mb-05 mt-2">${afn:getMessage('fax',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_fax" name="store_fax">
            <p class="text-md mb-05 mt-2">${afn:getMessage('store_address',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="postcode" name="postcode">
            <button class="btn width-50 mt-05" id="daumMapCall">${afn:getMessage('postcode',sessionScope.locale)}</button>
            <p class="mt-1">(${afn:getMessage('road_name_addr',sessionScope.locale)})</p><input type="text" class="width-100" id="roadAddress" name="roadAddress">
            <p class="mt-1">(${afn:getMessage('jibunAddress',sessionScope.locale)})</p><input type="text" class="width-100" id="jibunAddress" name="jibunAddress">
            <p class="mt-1">(${afn:getMessage('extraAddress',sessionScope.locale)})</p><input type="text" class="width-100" id="extraAddress" name="extraAddress">
            <p class="text-md mb-05 mt-2">${afn:getMessage('bill_received_mail',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="tex_email" name="tex_email">
            <p class="text-md mb-05 mt-2">${afn:getMessage('account',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_bank_account" name="store_bank_account">
            <p class="text-md mb-05 mt-2">${afn:getMessage('account_name',sessionScope.locale)}</p>
            <input type="text" class="width-100" id="store_bank_holder" name="store_bank_holder">
            <p class="text-md mb-05 mt-2">${afn:getMessage('bank_name',sessionScope.locale)}</p>
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
                <button type="button" id="modalStoreAddProc" class="btn btn-redcover">${afn:getMessage('request',sessionScope.locale)}</button>
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
            $('#modalstorIdDupCheck').html('${afn:getMessage('duplication_check',sessionScope.locale)}');
            $('#store_reg').attr("readonly",false);
            $('#modalstorRegDupCheck').attr('disabled', false);
            $('#modalstorRegDupCheck').html('${afn:getMessage('duplication_check',sessionScope.locale)}');
        });
        $(".md-btn-default").click(function(){
            $("#modal-store").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
</script>
