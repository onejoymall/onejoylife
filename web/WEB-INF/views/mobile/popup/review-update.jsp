<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<head>
    <title>onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link href="<c:url value="/assets/css/reset.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/mobile/common-mobile.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/mobile/commonSub.css" />"rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <!--
        [if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
        <![endif]
    -->
    <link href="<c:url value="/assets/css/jquery.bxslider.css" />"rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="<c:url value="/assets/js/jquery.bxslider.min.js" />"></script>
    <script src="<c:url value="/assets/js/common-mobile.js" />"></script>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.3.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

    <!-- Toastr -->
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
</head>
	<div class="underPop on" id="review">
	    <div class="content">
	        <header>
	           <h3>${afn:getMessage("modiReview",sessionScope.locale)}</h3>
	            <button class="popClose">
	                <i class="ri-close-line"></i>
	            </button>
	        </header>
	        <form id="defaultForm">
		    <input type="hidden" name="order_no" value="${review.order_no}"/>
		    <input type="hidden" name="review_id" value="${review.review_id}"/>
		    <input type="hidden" name="product_cd" value="${review.product_cd}"/>
	        <content>
	        	<p class="text-md mt-2 mb-05">${afn:getMessage("estimateItem",sessionScope.locale)}</p>
	            <div class="star-wrap">
                            <input <c:if test="${review.review_score == '5'}">checked="checked"</c:if> type="radio" name="review_score" id="radio1" value="5"/>
                            <label for="radio1" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input <c:if test="${review.review_score == '4'}">checked="checked"</c:if> type="radio" name="review_score" id="radio2" value="4"/>
                            <label for="radio2" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input <c:if test="${review.review_score == '3'}">checked="checked"</c:if> type="radio" name="review_score" id="radio3" value="3"/>
                            <label for="radio3" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input <c:if test="${review.review_score == '2'}">checked="checked"</c:if> type="radio" name="review_score" id="radio4" value="2"/>
                            <label for="radio4" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input <c:if test="${review.review_score == '1'}">checked="checked"</c:if> type="radio" name="review_score" id="radio5" value="1"/>
                            <label for="radio5" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                            </div>
                        </div>
	            <p class="text-md mt-2 mb-05">${afn:getMessage("title",sessionScope.locale)}</p>
	            <input type="text" value="${review.review_title}" name="review_title" class="width-100 mb-05" placeholder="${afn:getMessage('msg_below50word',sessionScope.locale)}" maxlength="50">
	            <p class="text-md mt-1 mb-05">${afn:getMessage("content",sessionScope.locale)}</p>
	            <div class="textarea mt-05">
	               <textarea class="width-100" name="review_content"  placeholder="${afn:getMessage('msg_below2000word',sessionScope.locale)}" style="resize:none;" maxlength="2000">${review.review_content}</textarea>
	            </div>
	            <p class="text-md mt-1 mb-05">${afn:getMessage("title",sessionScope.locale)}</p>
	            <div class="mb-2">
	                <input type="text" class="fileName width-100 mb-1" name="fileName" readonly="readonly" value="${review.file_name}">
	                <label for="rvImg1" class="btn_file">${afn:getMessage("chooseFile",sessionScope.locale)}</label>
                    <input type="file" id="rvImg1" name="uploadfile" class="uploadBtn2"   style="display:none;">
                    <button type="button" data-id="${review.file_name}"  data-rid="${review.review_id}" class="xBox">x</button>
	            </div>
	             <p class="text-md mt-1 mb-05">${afn:getMessage("review_mp4",sessionScope.locale)}</p>
	              <div class="mb-2">
	                <input type="text" class="fileName width-100 mb-1" name="fileName" readonly="readonly" value="${review.file_name2}">
	                <label for="pdImg6" class="btn_file">${afn:getMessage("chooseFile",sessionScope.locale)}</label>
                   <input type="file" id="pdImg6" name="uploadfile6" class="uploadBtnVideo2"  style="display:none;">
                    <button type="button"  data-id="${review.file_name2}"  data-rid="${review.review_id}"  class="xBox">x</button>
	            </div>
	            
	            <ul class="btns mt-3 mb-0">
	                <li><a href="javascript:self.close();">${afn:getMessage("reviewCancel",sessionScope.locale)}</a></li>
	                <li><a href="#" class="on" id="updateReviewBtn">${afn:getMessage("update",sessionScope.locale)}</a></li>
	           </ul>
	        </content>
	        </form>
	    </div>
	</div>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>
    <script src='<c:url value="/assets/js/commonMgScript.js"/>'></script>
    <script>
    $(function(){
        // opener.location.reload(); 
        //self.close();
        $(".xBox").click(function(){
        	$(this).siblings("input").val("");
            var file_name = $(this).attr("data-id");
            var review_id = $(this).attr("data-rid");
              
            jQuery.ajax({
                type: 'POST',
                data: {"file_name":file_name,"review_id":review_id},
                url:'/MyPage/deleteOneFile',
                success: function (data) {

                },
                error: function (xhr, status, error) {
                    alert("error");
                }
            });
        });
        
        $("#updateReviewBtn").click(function(){
        	var formData = new FormData($('#defaultForm')[0]);
            jQuery.ajax({
                type: 'POST',
                enctype: 'multipart/form-data',
                data: formData,
                processData: false, // 필수
                contentType: false, // 필수
                url:'/MyPage/updateReview',
                success: function (data) {
               	 if (data.success) {
                  	alert("${afn:getMessage('msg_review_1-10',sessionScope.locale)}");
                  	self.close();
                  	opener.location.reload();
                  } else{
              		$.toast({
                          text: "ERROR",
                          showHideTransition: 'plain', //펴짐
                          position: 'bottom-right',
                          heading: 'Error',
                          icon: 'error',
                      });
                  }
              }
             
            });
        });
    });
    $('.uploadBtn2').on('change', function(object){
        var sel_file;
        var thisObject = $(this);
        var filename = thisObject.val().split('/').pop().split('\\').pop();
        var files = object.target.files;
        var filesArr =Array.prototype.slice.call(files);
        
        filesArr.forEach(function (f) {
            if(!f.type.match("image.*")){
                alert("${afn:getMessage('msg_review_1-8-1',sessionScope.locale)}");
                $(this).siblings("input").val("");
                return false;
            }
            sel_file = f;
            var reader = new FileReader();
            reader.onload = function (e) {
                var imgDisplayType ='copy';
                // if(imgDisplayType =="copy"){
                //     $('.uploadBtn').parent().siblings('img').attr("src",e.target.result);
                //     $('.uploadBtn').siblings('.fileName').val(filename);
                // }else{
                    thisObject.parent().siblings('img').attr("src",e.target.result);
                    //console.log(filename)
                    thisObject.siblings('.fileName').eq(0).val(filename);
                   // $('.fileName').eq(0).val(filename);
                // }

            }
            reader.readAsDataURL(f);
        })
    });
    
    
    $('.uploadBtnVideo2').on('change', function(object){
        var sel_file;
        var thisObject = $(this);
        var filename = thisObject.val().split('/').pop().split('\\').pop();
        console.log(object.target);
        var files = object.target.files;
        var filesArr =Array.prototype.slice.call(files);
        var maxSize = 100 * 1024 * 1024;
        filesArr.forEach(function (f) {
        	if(files[0].size > maxSize){ 
        		alert("${afn:getMessage('msg_review_1-9-1',sessionScope.locale)}");
                return false;
        	}
            if(!f.type.match("video.*")){
                alert("${afn:getMessage('msg_review_1-9-2',sessionScope.locale)}");
                
                return false;
            }
            sel_file = f;
            var reader = new FileReader();
            reader.onload = function (e) {
                var imgDisplayType ='copy';
                // if(imgDisplayType =="copy"){
                //     $('.uploadBtn').parent().siblings('img').attr("src",e.target.result);
                //     $('.uploadBtn').siblings('.fileName').val(filename);
                // }else{
                    thisObject.parent().siblings('img').attr("src",e.target.result);
                    thisObject.siblings('.fileName').val(filename);
                // }

            }
            reader.readAsDataURL(f);
        })
    });
    </script>