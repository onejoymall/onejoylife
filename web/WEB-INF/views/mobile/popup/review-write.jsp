<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	           <h3>상품평 작성</h3>
	            <button class="popClose">
	                <i class="ri-close-line"></i>
	            </button>
	        </header>
	        <form id="defaultForm">
		    <input type="hidden" name="order_no" value="${productDetail.order_no}"/>
    <input type="hidden" name="product_cd" value="${productDetail.product_cd}"/>
	        <content>
	        	<p class="text-md mt-2 mb-05">상품평가</p>
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
	            <p class="text-md mt-2 mb-05">제목</p>
	            <input type="text" value="${review.review_title}" name="review_title" class="width-100 mb-05" placeholder="50자 이내로 입력해주세요" maxlength="50">
	            <p class="text-md mt-1 mb-05">내용</p>
	            <div class="textarea mt-05">
	               <textarea class="width-100" name="review_content"  placeholder="2,000자 이내로 입력해주세요" style="resize:none;" maxlength="2000">${review.review_content}</textarea>
	            </div>
	            <p class="text-md mt-1 mb-05">이미지 첨부</p>
	            <div class="mb-2">
	                <input type="text" class="fileName width-100 mb-1" name="fileName" readonly="readonly" value="${review.file_name}">
	                <label for="rvImg1" class="btn_file">파일선택</label>
                    <input type="file" id="rvImg1" name="uploadfile" class="uploadBtn">
                    <button type="button" class="xBox">x</button>
	            </div>
	            <ul class="btns mt-3 mb-0">
	                <li><a href="javascript:self.close();">취소</a></li>
	                <li><a href="#" class="on" id="insertReviewBtn">등록</a></li>
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
        });
        
        $("#insertReviewBtn").click(function(){
        	var formData = new FormData($('#defaultForm')[0]);
            jQuery.ajax({
                type: 'POST',
                enctype: 'multipart/form-data',
                data: formData,
                processData: false, // 필수
                contentType: false, // 필수
                url:'/MyPage/insertReview',
                success: function (data) {
                	if (data.success) {//toast 오류처리
                   		$.toast({
                            text: 'success',
                            showHideTransition: 'plain', //펴짐
                            position: 'top-right',
                            icon: 'success',
                            hideAfter: 2000
                        });
                		setTimeout(function(){
                			opener.location.reload();
                       	    self.close();
                		},1000);
                    }else{
                    	alert("error");
                    }
                },
                error: function (xhr, status, error) {
                    alert("error");
                }
            });
        });
    });
    </script>