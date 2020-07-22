<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">쇼핑몰 정보 등록</h2>
            <div class="main-hd-btn-wrap">
<%--                <button type="button" name="goods-add-copy" class="btn-red">복사 등록</button>--%>
<%--                <button type="button" name="goods-add-bulk" class="btn-red"><i class="exel-ic"></i>대량 등록</button>--%>
            </div>
      <!--       <div class="main-hd-btn-wrap left">
                <button type="button" name="back" class="btn-default" onclick="location.href='/Manager/Product'"><i class="arrow-left-ic"></i>리스트로 돌아가기</button>
            </div> -->
        </div>
        <div class="goods-detail-wrap">
            <div class="right">
<%--                <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>상품 정보 다운로드</button>--%>
            </div>
            <form name="defaultForm" id="defaultForm" method="post" enctype="multipart/form-data" action="<c:url value="/Manager/companyInfoModi"/>">
            	
                <h3>쇼핑몰 정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="142px">
                        <col width="800px">
                    </colgroup>
                    <tbody>
                  <!--   <li>개인정보관리책임자 : <a href="mailto:cs@onejoy.co.kr">김수현(cs@onejoy.co.kr)</a></li> -->
                    <tr>
                        <th>상호명</th>
                        <td>
                            <!-- <p class="cc2"><span class="cc">* 최대 250byte 까지만 등록됩니다.</span></p> -->
                            <input type="text" value="${info.company_name}" id="goods-stockout" name="company_name">
                        </td>
                    </tr>
                        
                    <tr>
                        <th>대표자</th>
                        <td>
                           <!--  <p class="cc2"><span class="cc">* 최대 250byte 까지만 등록됩니다.</span></p> -->
                            <input type="text" id="product_name_en" value="${info.company_ceo}" name="company_ceo">
                        </td>
                    </tr>                   
                     <tr>
                        <th>전화번호</th>
                        <td>
                             <p class="cc2"><span class="cc">*입력한 텍스트로 표시됩니다.</span></p>
                            <input type="text" id="product_name_en" value="${info.company_ph}" name="company_ph" placeholder="ex) 1811-9590">
                        </td>
                    </tr>                   
                     <tr>
                        <th>팩스</th>
                        <td>
                            <input type="text" id="product_name_en" value="${info.company_fax}" name="company_fax" placeholder="ex) 02-3472-0888">
                        </td>
                    </tr>                    
                    <tr>
                        <th>사업자 등록번호</th>
                        <td>
                            <input type="text" id="product_name_en" value="${info.corporate_num}" name="corporate_num" placeholder="ex) 011-22-01223">
                        </td>
                    </tr>                   
                     <tr>
                        <th>통신판매업신고</th>
                        <td>
                            <input type="text" id="goods-stockout" value="${info.cmnt_sales_busi_report}" name="cmnt_sales_busi_report">
                        </td>
                    </tr>
                    <tr>
                        <th>고객 멘트</th>
                        <td>
                            <input type="text" id="goods-stockout" value="${info.service_ment}" name="service_ment" placeholder="ex) 무엇이든 물어보세요.">
                        </td>
                    </tr>  
                    <tr>
                        <th>상담가능시간</th>
                        <td>
                            <p class="cc2"><span class="cc">*입력한 텍스트로 표시됩니다.</span></p>
                            <input type="text" id="product_name_en" value="${info.counsel_time}" name="counsel_time" placeholder="ex) 오전 10시~오후 6시">
                        </td>
                    </tr>  

                    <tr>
                    <th>상담가능시간 추가사항</th>
                        <td>
                            <input type="text" id="goods-stockout" value="${info.counsel_time_sub}" name="counsel_time_sub" placeholder="ex) 점심시간 12:00 ~ 13:00">
                        </td>
                    </tr>
                    <tr>
                        <th>상담 불가능한 요일</th>
                        <td>
                            <p class="cc2"><span class="cc">*입력한 텍스트로 표시됩니다.</span></p>
                            <input type="text" id="product_name_en" value="${info.counsel_offday}" name="counsel_offday" placeholder="ex) 주말, 공휴일 휴무 ">
                        </td>
                    </tr>    
                    
                    
                    
                   <tr>
                      <th>주소</th>
                                <td class="address-td">
                                    <p><input type="text" id="postcode" name="postcode"  value ="${info.postcode}" ><button type="button" class="ad-but" id="daumMapCall" >우편번호</button></p>
                                    <p><span>(도로명)</span><input type="text" id="roadAddress" name="roadAddress" class="ad-input" value ="${info.roadAddress}" ></p>
                                    <p><span>(지번)</span><input type="text" id="jibunAddress" name="jibunAddress" class="ad-input" value ="${info.jibunAddress}"></p>
                                    <p><span>(공통상세)</span><input type="text" id="extraAddress" name="extraAddress" class="ad-input" value ="${info.extraAddress}"></p>
                                </td>
                            </tr>
                     <tr>
                        <th>개인정보관리책임자</th>
                        <td>
                        <p class="cc2"><span class="cc">*입력한 이메일로 메일 보낼수있도록 연결됩니다.</span></p>
                            <input type="text" id="product_name_en" name="personal_info_incharge" value ="${info.personal_info_incharge}" placeholder="ex) 김수현">
                             <input type="text" id="goods-stockout" name="personal_info_incharge_email"  value ="${info.personal_info_incharge_email}" placeholder="ex) cs@onejoy.co.kr">
                        </td>
                    </tr>
                    <tr>
                        <th>copyright</th>
                        <td>
                            <input type="text" id="product_name_en" name="copyright" value ="${info.copyright}">
                        </td>
                    </tr>  
                          <tr>
                        <th>hosting_by</th>
                        <td>
                            <input type="text" id="product_name_en" name="hosting_by" value ="${info.hosting_by}" >
                        </td>
                    </tr>  
              
                    
        		   </tbody>
         	  </table>
                <button type="button" id="formCompanyInfoSubmit" class="btn-red">저장하기</button>
           
            </form>

</main>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
<script type="text/javascript" src="/assets/js/goods-add.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
<script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
<script type="text/javascript" src="/assets/js/index.js"></script>
<script>
$(function(){
	var html = '<p class="product_definition">' +
				    '<input type="text" name="product_definition_key" placeholder="ex) 에너지소비효율등급">' +
				    '<input type="text" name="product_definition_value" placeholder="ex) 3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음">' +
				    '<button type="button" class="goods-list-btn product_definition_add_btn">+</button>' +
				    '<button type="button" class="goods-list-btn redBtn product_definition_del_btn">x</button>' +
				'</p>';
	$(".product_definition_td").append(html);
	$("input[name=product_live_type]").on("input click",function(){
		var type=$(this).val();
		if(type){
			if(type=='U'){
				$("#typeU").removeClass("hidden");
				$("#typeM").addClass("hidden");
			}else{
				$("#typeM").removeClass("hidden");
				$("#typeU").addClass("hidden");
			}
		}else{
			$("#typeU").addClass("hidden");
			$("#typeM").addClass("hidden");
		}
	})
})


 $(document).on("click","#formCompanyInfoSubmit",function () {
    
        var formData = new FormData($('#defaultForm')[0]);
        jQuery.ajax({
            type: 'POST',
            enctype: 'multipart/form-data',
            data: formData,
            processData: false, // 필수
            contentType: false, // 필수
            url:'/Manager/companyInfoModi',
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
</script>
