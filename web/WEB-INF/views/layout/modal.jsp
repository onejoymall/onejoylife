        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <div class="main_modal" id="link-info-main" >
            <div class="modal-content">
                <div class="modal-header">
                    <h2></h2>
                    <button type="button" class="modal-close" rel="modal:close">×</button>
                </div>
                <div class="modal-body">
                    <c:out value="${infoMain.market_config_value}" escapeXml="false"/>
                </div>

            </div>
        </div>
        <div class="main_modal" id="modal-info-privacy" >
            <div class="modal-content">
                <div class="modal-header">
                    <h2></h2>
                    <button type="button" class="modal-close" rel="modal:close">×</button>
                </div>
                <div class="modal-body">
                    <c:out value="${infoPrivacy.market_config_value}" escapeXml="false"/>
                </div>
<%--                ${infoPrivacy.market_config_value}--%>
            </div>
        </div>
        <div class="main_modal" id="default-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2></h2>
                    <button type="button" class="modal-close" rel="modal:close">×</button>
                </div>
                <div class="modal-body">
                    ${infoJoin.market_config_value}
                </div>
            </div>
        </div>
        <div class="main_modal" id="default-modal2">
            <div class="modal-content">
                <div class="modal-header">
                    <h2></h2>
                    <button type="button" class="modal-close" rel="modal:close">×</button>
                </div>
                <div class="modal-body">
                    ${infoMain2.market_config_value}
                </div>
            </div>
        </div>
        <div class="main_modal" id="default-modal3">
            <div class="modal-content">
                <div class="modal-header">
                    <h2></h2>
                    <button type="button" class="modal-close" rel="modal:close">×</button>
                </div>
                <div class="modal-body">
                    ${infoPrivacy2.market_config_value}
                </div>
            </div>
        </div>
        <div class="main_modal" id="default-modal4">
            <div class="modal-content">
                <div class="modal-header">
                    <h2></h2>
                    <button type="button" class="modal-close" rel="modal:close">×</button>
                </div>
                <div class="modal-body">
                    ${infoPrivacy3.market_config_value}
                </div>
            </div>
        </div>
        <!-- 업체신청 모달 -->
        <div class="main_modal" id="modal-store">
            <div class="modal-content">
                <form name="resetStoreForm" id="defaultForm" method="multipart/form-data">
                    <div class="modal-header">
                        <h2>입점업체 신청</h2>
                        <button type="button" class="modal-close modal-close1">×</button>
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
                                    <th>입점사 ID</th>
                                    <td>
                                        <input type="text" id="store_id" name="store_id">
                                        <button type="button" class="btn_file" id="modalstorIdDupCheck">중복확인</button>

                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀번호 설정</th>
                                    <td>
                                        <p><input type="password" name="store_password" placeholder="비밀번호"><span class="er" id="passwordValidation"></span></p>
                                        <p><input type="password" name="store_passwordCf" placeholder="비밀번호 확인"><span class="er" id="password_cfValidation"></span></p>
                                        <p class="s-font">- 6~20자의 영문,숫자를 조합하여 입력하여 주세요.</p>
                                        <%--<p class="s-font">- 영문 대소문자 또는 숫자, 특수문자 중 2가지 이상 좋바으로 10-20자 미만</p>
                                        <p class="s-font">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</p>--%>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <h3>판매자</h3>
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
                                        <button type="button" class="btn_file" id="modalstorRegDupCheck">중복확인</button>
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
                                <tr>
                                    <th>계산서 수신메일</th>
                                    <td>
                                        <input type="text" id="tex_email" name="tex_email">
                                    </td>
                                </tr>
                                <tr>
                                    <th>계좌번호</th>
                                    <td>
                                        <input type="text" id="store_bank_account" name="store_bank_account">
                                    </td>
                                </tr>
                                <tr>
                                    <th>예금주</th>
                                    <td>
                                        <input type="text" id="store_bank_holder" name="store_bank_holder">
                                    </td>
                                </tr>
                                <tr>
                                    <th>은행명</th>
                                    <td>
                                        <input type="text" id="store_bank_name" name="store_bank_name">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <button type="button" id="modalStoreAddProc" class="btn-red">신청하기</button>
                    </div>
                </form>
            </div>
        </div>

<script>
$(".modal-close1").click(function(){
    $(".modal").attr("style", "display:none");
    $('#defaultForm')[0].reset();

    $('#store_id').attr("readonly",false);
    $('#modalstorIdDupCheck').attr('disabled', false);
    $('#modalstorIdDupCheck').html('중복확인');

    $('#store_reg').attr("readonly",false);
    $('#modalstorRegDupCheck').attr('disabled', false);
    $('#modalstorRegDupCheck').html('중복확인');
});
</script>