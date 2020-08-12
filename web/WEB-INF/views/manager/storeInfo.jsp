<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
            <form name="defaultForm" id="defaultForm" method="multipart/form-data"  action="<c:url value="/Manager/storeInfoModi"/>">
                <div class="modal-body clearfix">
                    <h3>입점 업체 기본정보</h3>
                    <table class="goods-detail-table">
                            <colgroup>
                                <col width="142px">
                                <col width="800px">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>상호</th>
                                    <td>
                                        <input type="text" id="store_name" name="store_name" value="${info.store_name}" >
                                    </td>
                                </tr>
                                <tr>
                                    <th>입점업체/크리에이터</th>
                                    <td>
                                        <input type="radio" name="store_creator_yn" id="store_creator_yn1" value="N" <c:if test="${info.store_creator_yn eq 'N'}">checked</c:if>/>
                                        <label for="store_creator_yn1">입점업체</label>
                                        <input type="radio" name="store_creator_yn" id="store_creator_yn2" value="Y" <c:if test="${info.store_creator_yn eq 'Y'}">checked</c:if>/>
                                        <label for="store_creator_yn2">크리에이터</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>사업자등록번호</th>
                                    <td>
<%--                                        <input type="radio" id="table-ra1" name="store_reg_type" value="D">--%>
<%--                                        <label for="table-ra1">개인</label>--%>
<%--                                        <input type="radio" id="table-ra2" name="store_reg_type" VALUE="C">--%>
<%--                                        <label for="table-ra2">법인</label>--%>
                                        <input type="text" id="store_reg" name="store_reg" value="${info.store_reg}">
                                        <button type="button" class="btn_file" id="storRegDupCheck" >중복확인</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>대표자</th>
                                    <td>
                                        <input type="text" id="store_ceo_name" name="store_ceo_name" value="${info.store_ceo_name}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>업태/업종</th>
                                    <td>
                                        <input type="text" id="store_type" name="store_type" value="${info.store_type}"> / <input type="text" id="store_item" name="store_item" value="${info.store_item}">
                                    </td>
                                </tr>
								 <tr> 
                               	  <th>매입/위탁</th>
                                <td class="radio-td">
                                    <input type="radio" id="right-ra1" name="store_pur_com" class="styleClass" value="A"
                                    <c:if test="${info.store_pur_com eq  'A'}">checked</c:if>>
                                   
                                    <label for="right-ra1"><span>매입</span></label>
                                    <input type="radio" id="right-ra2" name="store_pur_com" class="styleClass" value="B"
                                	 <c:if test="${info.store_pur_com eq 'B'}">checked</c:if>>
                                    <label for="right-ra2"><span>위탁</span></label>
                                </td>
								</tr>
                                <tr>
                                    <th>사업자등록증 사본</th>
                                    <td>
                                        <div class="fileBox">
                                            <input type="text" class="fileName" id="fileName" name="fileName"   readonly="readonly">
                                            <label for="uploadBtn" class="btn_file">파일찾기</label>
                                            <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
                                             
                                            
                                            <div class="fileDownload">
                                              <a href="${info.file_1}" target="_blank" value="${info.file_1}">${info.file_name}</a>
                                            

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>통신판매신고번호</th>
                                    <td>
                                        <input type="text" id="store_online_reg" name="store_online_reg" value="${info.store_online_reg}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>전화</th>
                                    <td>
                                        <input type="text" id="store_tel" name="store_tel" value="${info.store_tel}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>메일</th>
                                    <td>
                                        <input type="text" id="store_mail" name="store_mail" value="${info.store_mail}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>팩스</th>
                                    <td>
                                        <input type="text" id="store_fax" name="store_fax" value="${info.store_fax}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>사업장 주소</th>
                                    <td class="address-td">
                                        <p><input type="text" id="postcode" name="postcode" value="${info.postcode}"><button type="button" class="ad-but" id="daumMapCall"  >우편번호</button></p>
                                        <p><span>(도로명)</span><input type="text" id="roadAddress" name="roadAddress" class="ad-input" value="${info.roadAddress}"></p>
                                        <p><span>(지번)</span><input type="text" id="jibunAddress" name="jibunAddress" class="ad-input" value="${info.jibunAddress}"></p>
                                        <p><span>(공통상세)</span><input type="text" id="extraAddress" name="extraAddress" class="ad-input" value="${info.extraAddress}"></p>
                                    </td>
                                </tr>
                                <tr>
                                    <th>계산서 수신메일</th>
                                    <td>
                                        <input type="text" id="tex_email" name="tex_email" value="${info.tex_email}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>계좌번호</th>
                                    <td>
                                        <input type="text" id="store_bank_account" name="store_bank_account" value="${info.store_bank_account}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>예금주</th>
                                    <td>
                                        <input type="text" id="store_bank_holder" name="store_bank_holder" value="${info.store_bank_holder}">
                                    </td>
                                </tr>
                                <tr>
                                    <th>은행명</th>
                                    <td>
                                        <input type="text" id="store_bank_name" name="store_bank_name" value="${info.store_bank_name}">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    
                    <button type="button" id="formStoreUpdate" class="btn-red">수정하기</button>
                    <div class="updateBtn hidden">
                        <button type="button" id="storeApproval" class="btn-red">승인</button>
                        <button type="button" id="storeUpdateSubmit" class="btn-red">수정</button>
                    </div>
                </div>
            </form>
</main>

<script type="text/javascript" src="/assets/js/goods-add.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
<script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
<script type="text/javascript" src="/assets/js/index.js"></script>
<script>



 $(document).on("click","#formStoreUpdate",function () {
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/storeInfoModi',
            success: function (data) {
                console.log(data.validateError)
                if (data.validateError) {
                    $('.validateError').empty();
                    $.each(data.validateError, function (index, item) {
                    	
                        // $('#validateError'+index).removeClass('none');
                        // $('#validateError'+index).html('* '+item);
                        if(index == "Error"){//일반에러메세지
                            alertType = "error";
                            showText = item;
                        }else{
                            alertType = "error";
                            showText = index + " 는(은) " + item;
                        }
                        // $.toast().reset('all');//토스트 초기화
                        $.toast({
                            text: showText,
                            showHideTransition: 'plain', //펴짐
                            position: 'bottom-right',
                            heading: 'Error',
                            icon: 'error'
                        });
                    });

                } else {
                    // loginAuth(data.access_token);
                    location.href=data.redirectUrl;
                }
            },
            error: function (xhr, status, error) {
                console.log(xhr, status, error);
            }
        });
    })
   /*      function defaultModalStore ("KS"){
        var file_link='';
        // $('input:radio[name=store_reg_type]').eq(0).click();
        jQuery.ajax({
            type: 'POST',
            url: '/Manager/storeInfo',
            data: {"store_id":"KS"},
            success: function (data) {
                $.each(data.list, function (index, item) {
                    $('input[name^="' + index + '"]').val(item);
                    if(index=='file_1'){
                        $('.fileDownload').html('<a href="'+item+'" target="_blank">'+data.list.file_name+'</a>');
                    }
                    // if(index=='store_reg_type' && item ==''){
                    //     $('input:radio[name=store_reg_type]').eq(0).click();
                    // }else{
                    //     $('input:radio[name=store_reg_type]').eq(1).click();
                    // }
                });
                 $('#store_reg').attr("readonly",true);
                $('#store_id').attr("readonly",true);
                $('#storIdDupCheck').attr('disabled', true);
                $('#storIdDupCheck').html('OK');
                $('#storRegDupCheck').attr('disabled', true);
                $('#storRegDupCheck').html('OK');
                $('#formStoreSubmit').addClass('hidden');
                $('.updateBtn').removeClass('hidden'); 
            },
            error: function (xhr, status, error) {
                alert(error);
            },
        });
    } */
 

</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>