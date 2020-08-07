<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-28
  Time: 오전 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="default-modal">
  <div class="modal-content">
    <div class="modal-header">
      <h2>test</h2>
      <button type="button" class="style-modal-close" onclick="$('.modal_change_pw').attr('style','display:none')">×</button>
    </div>
    <div class="modal-body">
      test
    </div>
  </div>
</div>
<form name="managerChangePassword" id="managerChangePassword" method="POST">
   <div class="modal_change_pw"><!--20.07.17 모달추가-->
        <div class="modal-content">
            <div class="modal-header">
               <h2>비밀번호 변경하기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <h3>기본정보</h3>
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="15%">
                        <col width="85%">
                    </colgroup>
                    <tbody class="modal2-pw">
                        <tr>
                            <th>아이디</th>
                            <td>
                                <span>${sessionScope.email}</span>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호 변경</th>
                            <td class="pw-p-td"  id="change_pw">
                                   <p>
                                       <span>기존비밀번호</span>
                                      <input type="password" name="password" id="password" value="">
                                   <span class="cc on" ></span>
                                   </p>
                                   <p>
                                       <span>신규 비밀번호</span>
                                         <input type="password" name="newpassword" id="newpassword">
                                      <span class="cc on" ></span>
                                   </p>
                                   <p>
                                      <span>비밀번호 다시 입력</span>
                                      <input type="password" name="renewpassword" id="renewpassword">
                                      <span class="cc on"></span>
                                  </p>
                                <p class="s-font">-  6~20자의 영문,숫자를 조합하여 입력하여 주세요</p>
                             <!--    <p class="s-font">- 사용가능 특수문자 # $ % &amp; ( ) * + - / : &#60; = &#62; ? @ [ \ ] ^ _ { | } ~</p> -->
                            </td>
                        </tr>


                    </tbody>
                </table>
                <button type="button" id="changepw" class="btn-red">변경하기</button>
            </div>
        </div>
    </div>
    </form>
</body>
<!-- Toastr -->
<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
<script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
<script type="text/javascript" src="/assets/js/index.js"></script>
<script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
<script src='<c:url value="/assets/js/toastr.js"/>'></script>
<script src='<c:url value="/assets/js/commonScript.js"/>'></script>
<script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>
<script src='<c:url value="/assets/js/commonMgScript.js"/>'></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>



$(".pass-btn a").click(function(e){
    e.preventDefault();
    $(".modal_change_pw").attr("style", "display:block");
    $('body').css("overflow", "hidden");

});


$(document).on("click","#changepw",function(){ 

   var formData = $('#managerChangePassword').serialize();

   $('span.cc').eq(0).html('');
   $('span.cc').eq(1).html('');
   $('span.cc').eq(2).html('');

   var pw = $('input[name=newpassword]').val();
   var renpw = $('input[name=renewpassword]').val();
   var regExp = /^[a-zA-Z0-9]{6,20}$/;
      if(!regExp.test(pw) || !isStrNumber(pw) || !isStrAlphabet(pw)){
   		$('span.cc').eq(1).html(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.");
    	return;
     // $("#passwordValidation").removeClass("text-success");
  }


     if(!regExp.test(renpw) || !isStrNumber(renpw) || !isStrAlphabet(renpw)){
  		$('span.cc').eq(2).html(" * 6~20자의 영문,숫자를 조합하여 입력하여 주세요.");
  		return;
  		// $("#passwordValidation").removeClass("text-success");
  	}

   jQuery.ajax({
        type: 'POST',
        url: '/Manager/managerPasswordChange',
        data: formData,
        success: function (data) {
           if(data.validateError){

              if(data.validateError.password){
                  $('span.cc').eq(0).html(data.validateError.password);
               }
             if(data.validateError.newpassword){
                $('span.cc').eq(1).html(data.validateError.newpassword);
              }
             if(data.validateError.renewpassword){
                $('span.cc').eq(2).html(data.validateError.renewpassword);
             }

           }else{

               $.toast({
                     text: 'success',
                     showHideTransition: 'plain', //펴짐
                     position: 'bottom-right',
                     icon: 'success',
                     hideAfter: 2000,
                     afterHidden: function () {
                         $(".modal_change_pw").attr("style", "display:none");
                           $('body').css("overflow", "auto");
                     }
                 });

           }


        },
        error: function (xhr, status, error) {
            console.log(error,xhr,status );

            
        },
    });
});




$(".modal-close").click(function(){
    $(".modal_change_pw").attr("style", "display:none");
    $('body').css("overflow", "auto");
});
</script>

</html>
