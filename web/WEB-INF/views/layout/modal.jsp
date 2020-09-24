        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

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
       
      <div class="modal modalTop" id="termsmodal">
        <div class="modal-content">
            <div class="modal-header">
               <h2 class="modal-title">원조이몰 이용약관</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <div class="modal-body-wrap">
                    <p> ${infoJoin.market_config_value}</p>
                </div>
            </div>
        </div>
    </div>
    
        <div class="modal modalTop" id="termsmodal2">
        <div class="modal-content">
            <div class="modal-header">
               <h2 class="modal-title">제3자동의 이용약관</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <div class="modal-body-wrap">
                    <p>${infoMain2.market_config_value}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="modal modalTop" id="termsmodal3">
        <div class="modal-content">
            <div class="modal-header">
               <h2 class="modal-title">개인정보 수집 및 이용</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <div class="modal-body-wrap">
                    <p>${infoPrivacy2.market_config_value}</p>
                </div>
            </div>
        </div>
    </div>
     <div class="modal modalTop" id="termsmodal4">
        <div class="modal-content">
            <div class="modal-header">
               <h2 class="modal-title">개인정보 수집 및 이용</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <div class="modal-body-wrap">
                    <p>${infoPrivacy3.market_config_value}</p>
                </div>
            </div>
        </div>
    </div>
    
       
        
        
        <!-- 업체신청 모달 -->
        <div class="main_modal" id="modal-store">
            <div class="modal-content">
                <form name="resetStoreForm" id="defaultForm" method="multipart/form-data">
                    <div class="modal-header">
                        <h2>${afn:getMessage('store_request',sessionScope.locale)}</h2>
                        <button type="button" class="modal-close modal-close1">×</button>
                    </div>
                    <div class="modal-body clearfix">
                        <h3>${afn:getMessage('default_info',sessionScope.locale)}</h3>
                        <table class="goods-detail-table2">
                            <colgroup>
                                <col width="142px">
                                <col width="800px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>${afn:getMessage('store_id',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_id" name="store_id">
                                        <button type="button" class="btn_file" id="modalstorIdDupCheck">${afn:getMessage('duplication_check',sessionScope.locale)}</button>
                                        <input type="hidden" name="storIdDupCheck" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('password',sessionScope.locale)}</th>
                                    <td>
                                        <p><input type="password" name="store_password" placeholder="비밀번호"><span class="er" id="passwordValidation"></span></p>
                                        <p><input type="password" name="store_passwordCf" placeholder="비밀번호 확인"><span class="er" id="password_cfValidation"></span></p>
                                        <p class="s-font">-${afn:getMessage('error.sign.pwdpattern',sessionScope.locale)}</p>
                                        <%--<p class="s-font">- 영문 대소문자 또는 숫자, 특수문자 중 2가지 이상 좋바으로 10-20자 미만</p>
                                        <p class="s-font">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</p>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('store',sessionScope.locale)}/${afn:getMessage('creator',sessionScope.locale)}</th>
                                    <td>
                                        <input type="radio" name="store_creator_yn" id="store_creator_yn1" value="N" checked/>
                                        <label for="store_creator_yn1">${afn:getMessage('store',sessionScope.locale)}</label>
                                        <input type="radio" name="store_creator_yn" id="store_creator_yn2" value="Y"/>
                                        <label for="store_creator_yn2">${afn:getMessage('creator',sessionScope.locale)}</label>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <h3>${afn:getMessage('sellerInfo',sessionScope.locale)}</h3>
                        <table class="goods-detail-table2">
                            <colgroup>
                                <col width="142px">
                                <col width="800px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>${afn:getMessage('company_name',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_name" name="store_name">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('store_reg',sessionScope.locale)}</th>
                                    <td>
                                        <%--                                        <input type="radio" id="table-ra1" name="store_reg_type" value="D">--%>
                                        <%--                                        <label for="table-ra1">개인</label>--%>
                                        <%--                                        <input type="radio" id="table-ra2" name="store_reg_type" VALUE="C">--%>
                                        <%--                                        <label for="table-ra2">법인</label>--%>
                                        <input type="text" id="store_reg" name="store_reg">
                                        <button type="button" class="btn_file" id="modalstorRegDupCheck">${afn:getMessage('duplication_check',sessionScope.locale)}</button>
                                        <input type="hidden" name="storRegDupCheck" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('representative',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_ceo_name" name="store_ceo_name">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('business_condition',sessionScope.locale)}/${afn:getMessage('industry',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_type" name="store_type"> / <input type="text" id="store_item" name="store_item">
                                    </td>
                                </tr>
	    					 <tr> 
                               	  <th>매입/위탁</th>
                                <td class="radio-td">
                                    <input type="radio" id="right-ra1" name="store_pur_com" class="styleClass" value="A">
                                    <label for="right-ra1"><span>매입</span></label>
                                    <input type="radio" id="right-ra2" name="store_pur_com" class="styleClass" value="B">
                                    <label for="right-ra2"><span>위탁</span></label>
                                </td>
								</tr>

                                <tr>
                                    <th>${afn:getMessage('business_license_copy',sessionScope.locale)}</th>
                                    <td>
                                        <div class="fileBox">
                                            <input type="text" class="fileName" id="fileName" name="fileName" readonly="readonly">
                                            <label for="uploadBtn" class="btn_file">${afn:getMessage('find_files',sessionScope.locale)}</label>
                                            <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
                                            <div class="fileDownload">

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('communications_sales_reportnum',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_online_reg" name="store_online_reg">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('tel',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_tel" name="store_tel">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('email',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_mail" name="store_mail">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('fax',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_fax" name="store_fax">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('store_address',sessionScope.locale)}</th>
                                    <td class="address-td">
                                        <p><input type="text" id="postcode" name="postcode"><button type="button" class="ad-but" id="daumMapCall">${afn:getMessage('postcode',sessionScope.locale)}</button></p>
                                        <p><span>(${afn:getMessage('road_name_addr',sessionScope.locale)})</span><input type="text" id="roadAddress" name="roadAddress" class="ad-input"></p>
                                        <p><span>(${afn:getMessage('jibunAddress',sessionScope.locale)})</span><input type="text" id="jibunAddress" name="jibunAddress" class="ad-input"></p>
                                        <p><span>(${afn:getMessage('extraAddress',sessionScope.locale)})</span><input type="text" id="extraAddress" name="extraAddress" class="ad-input"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('bill_received_mail',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="tex_email" name="tex_email">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('account',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_bank_account" name="store_bank_account">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('account_name',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_bank_holder" name="store_bank_holder">
                                    </td>
                                </tr>
                                <tr>
                                    <th>${afn:getMessage('bank_name',sessionScope.locale)}</th>
                                    <td>
                                        <input type="text" id="store_bank_name" name="store_bank_name">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <button type="button" id="modalStoreAddProc" class="btn-red">${afn:getMessage('request',sessionScope.locale)}</button>
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
    $('#modalstorIdDupCheck').html('${afn:getMessage('duplication_check',sessionScope.locale)}');

    $('#store_reg').attr("readonly",false);
    $('#modalstorRegDupCheck').attr('disabled', false);
    $('#modalstorRegDupCheck').html('${afn:getMessage('duplication_check',sessionScope.locale)}');
});
</script>