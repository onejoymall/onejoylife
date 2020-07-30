<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
    <header>
        <h2>상품평 작성</h2>
    </header>
    <div class="main-section">
    <form id="defaultForm">
    <input type="hidden" name="order_no" value="${productDetail.no}"/>
    <input type="hidden" name="product_cd" value="${productDetail.product_cd}"/>
        <p class="goods-name">${productDetail.product_name}</p>
        <div>
            <span><span class="red-star">*</span>필수 입력 사항</span>
            <span>※상품평 내용 작성 없이 상품평 등록 가능합니다.</span>
        </div>
        <table>
            <colgroup>
                <col style="width: 120px;">
                <col style="width: 714px;">
            </colgroup>
            <tbody class="sec1-tbody">
                <tr>
                    <td class="sec1-td-bor1">상품평가<span class="red-star">*</span></td>
                    <td class="body-td2 padding-left">
                        <div class="star-wrap">
                            <input checked="checked" type="radio" name="review_score" id="radio1" value="5"/>
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
                            <input type="radio" name="review_score" id="radio2" value="4"/>
                            <label for="radio2" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input type="radio" name="review_score" id="radio3" value="3"/>
                            <label for="radio3" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input type="radio" name="review_score" id="radio4" value="2"/>
                            <label for="radio4" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                        <div class="star-wrap">
                            <input type="radio" name="review_score" id="radio5" value="1"/>
                            <label for="radio5" class="ra-icon"></label>
                            <div class="star-box">
                                <i class="y-star-full"></i>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">제목<span class="red-star">*</span></td>
                    <td class="body-td2 padding-left">
                        <input type="text" name="review_title" placeholder="50자 이내로 입력해주세요" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">내용</td>
                    <td class="body-td2 padding-left">
                        <textarea name="review_content"  placeholder="2,000자 이내로 입력해주세요" style="resize:none;" maxlength="2000"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">이미지 첨부</td>
                    <td class="body-td2 padding-left">
                        <div class="fileBox">
                            <input type="text" class="fileName" name="fileName" readonly="readonly">
                            <label for="rvImg1" class="btn_file">파일선택</label>
                            <input type="file" id="rvImg1" name="uploadfile" class="uploadBtn1">
                            <button type="button" class="xBox">x</button>
                            
                        </div>
                        <ul class="file-info">
                            <li>사진 첨부 가능 갯수 : 1개</li>
                            <li>첨부 가능 파일 형식 : JPG, PNG, GIF</li>
                            <li>파일명 : 영문, 숫자 가능</li>
                            <li>이미지 별 용량 제한 : 2MB 이하</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">동영상 등록</td>
                    <td class="body-td2 padding-left">
                        <div class="fileBox">
                            <input type="text" class="fileName" name="fileName" readonly="readonly" >
                            <label for="pdImg6" class="btn_file">파일선택</label>
                            <input type="file" id="pdImg6" name="uploadfile6" class="uploadBtnVideo1">
                            <button type="button" class="xBox">x</button>
                        </div>
                        <ul class="file-info">
                            <li>영상 첨부 가능 갯수 : 1개</li>
                            <li>첨부 가능 파일 형식 : mp4</li>
                            <li>파일명 : 영문, 숫자 가능</li>
                            <li>이미지 별 용량 제한 : 2MB 이하</li>
                        </ul>
                    </td>
                </tr>
                
                                
                
            </tbody>
        </table>
        <p>· 상품과 직접적으로 관계가 없는 내용이나, 약관 및 법률 등에 위배되는 글은 고객님께 사전 동의 없이 삭제 될 수 있습니다.</p>
        <div class="button-box">
            <button type="button" id="insertReviewBtn">등록</button>
            <button type="button" class="grey-button" onclick="self.close();">취소</button>
        </div>
        
    </form>
    </div>
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
                	 if (data.success) {
                       	alert("상품평이 등록되었습니다.");
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
    
    $('.uploadBtn1').on('change', function(object){
        var sel_file;
        var thisObject = $(this);
        var filename = thisObject.val().split('/').pop().split('\\').pop();
        var files = object.target.files;
        var filesArr =Array.prototype.slice.call(files);
        
        filesArr.forEach(function (f) {
            if(!f.type.match("image.*")){
                alert("이미지파일만 등록 가능합니다.");
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
    
    $('.uploadBtnVideo1').on('change', function(object){
        var sel_file;
        var thisObject = $(this);
        var filename = thisObject.val().split('/').pop().split('\\').pop();
        console.log(object.target);
        var files = object.target.files;
        var filesArr =Array.prototype.slice.call(files);
        var maxSize = 100 * 1024 * 1024;
        filesArr.forEach(function (f) {
        	if(files[0].size > maxSize){
        		alert("크기 100MB 미만의 파일만 등록 가능합니다.");
                return false;
        	}
            if(!f.type.match("video.*")){
                alert("동영상파일만 등록 가능합니다.");
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
