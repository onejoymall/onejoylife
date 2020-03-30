<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <div class="modal" id="link-info-main" >
        <div class="modal-content">
            <div class="modal-header">
                <h2></h2>
                <button type="button" class="modal-close" rel="modal:close">×</button>
            </div>
            ${infoMain.market_config_value}
        </div>
    </div>
    <div class="modal" id="modal-info-privacy" >
        <div class="modal-content">
            <div class="modal-header">
                <h2></h2>
                <button type="button" class="modal-close" rel="modal:close">×</button>
            </div>
            ${infoPrivacy.market_config_value}
        </div>
    </div>
    <div class="modal" id="default-modal" >
        <div class="modal-content">
            <div class="modal-header">
                <h2></h2>
                <button type="button" class="modal-close" rel="modal:close">×</button>
            </div>
            ${infoPrivacy.market_config_value}
        </div>
    </div>
    <!-- 업체신청 모달 -->
    <div class="modal" id="modal-store">
    <div class="modal-content">
    <form name="defaultForm" id="defaultForm" method="multipart/form-data">
    <div class="modal-header">
    <h2>공급사 등록</h2>
    <button type="button" class="modal-close">×</button>
    </div>
    <div class="modal-body clearfix">
    <h3>기본정보</h3>
    <table class="goods-detail-table">
    <colgroup>
    <col width="142px">
    <col width="800px">
    </colgroup>
    <tbody>
    <tr>
    <th>공급사 ID</th>
    <td>
    <input type="text" id="store_id" name="store_id">
    <button type="button" class="btn_file" id="storIdDupCheck">중복확인</button>
    </td>
    </tr>
    <tr>
    <th>비밀번호 설정</th>
    <td>
    <p><input type="password" name="store_password" placeholder="비밀번호"></p>
    <p><input type="password" name="store_passwordCf" placeholder="비밀번호 확인"></p>
    <p class="s-font">- 영문 대소문자 또는 숫자, 특수문자 중 2가지 이상 좋바으로 10-20자 미만</p>
    <p class="s-font">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</p>
    </td>
    </tr>

    </tbody>
    </table>
    <h3>공급사</h3>
    <table class="goods-detail-table">
    <colgroup>
    <col width="142px">
    <col width="800px">
    </colgroup>
    <tbody>
    <tr>
    <th>상호</th>
    <td>
    <input type="text" id="store_name" name="store_name">
    </td>
    </tr>
    <tr>
    <th>사업자등록번호</th>
    <td>
    <%--                                        <input type="radio" id="table-ra1" name="store_reg_type" value="D">--%>
    <%--                                        <label for="table-ra1">개인</label>--%>
    <%--                                        <input type="radio" id="table-ra2" name="store_reg_type" VALUE="C">--%>
    <%--                                        <label for="table-ra2">법인</label>--%>
    <input type="text" id="store_reg" name="store_reg">
    <button type="button" class="btn_file" id="storRegDupCheck">중복확인</button>
    </td>
    </tr>
    <tr>
    <th>대표자</th>
    <td>
    <input type="text" id="store_ceo_name" name="store_ceo_name">
    </td>
    </tr>
    <tr>
    <th>업태/업종</th>
    <td>
    <input type="text" id="store_type" name="store_type"> / <input type="text" id="store_item" name="store_item">
    </td>
    </tr>

    <tr>
    <th>사업자등록증 사본</th>
    <td>
    <div class="fileBox">
    <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">
    <label for="uploadBtn" class="btn_file">파일찾기</label>
    <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
    <div class="fileDownload">

    </div>
    </div>
    </td>
    </tr>
    <tr>
    <th>통신판매신고번호</th>
    <td>
    <input type="text" id="store_online_reg" name="store_online_reg">
    </td>
    </tr>
    <tr>
    <th>전화</th>
    <td>
    <input type="text" id="store_tel" name="store_tel">
    </td>
    </tr>
    <tr>
    <th>메일</th>
    <td>
    <input type="text" id="store_mail" name="store_mail">
    </td>
    </tr>
    <tr>
    <th>팩스</th>
    <td>
    <input type="text" id="store_fax" name="store_fax">
    </td>
    </tr>
    <tr>
    <th>사업장 주소</th>
    <td class="address-td">
    <p><input type="text" id="postcode" name="postcode"><button type="button" class="ad-but" id="daumMapCall">우편번호</button></p>
    <p><span>(도로명)</span><input type="text" id="roadAddress" name="roadAddress" class="ad-input"></p>
    <p><span>(지번)</span><input type="text" id="jibunAddress" name="jibunAddress" class="ad-input"></p>
    <p><span>(공통상세)</span><input type="text" id="extraAddress" name="extraAddress" class="ad-input"></p>
    </td>
    </tr>
    </tbody>
    </table>
    <button type="button" id="formStoreSubmit" class="btn-red">등록하기</button>
    <div class="updateBtn hidden">
    <button type="button" id="storeApproval" class="btn-red">승인</button>
    <button type="button" id="storeUpdateSubmit" class="btn-red">수정</button>
    </div>
    </div>
    </form>

    </div>
    </div>


