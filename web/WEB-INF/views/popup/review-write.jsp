<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
    <header>
        <h2>${afn:getMessage("writereview",sessionScope.locale)}</h2>
    </header>
    <div class="main-section">
    <form id="defaultForm">
    <input type="hidden" name="order_no" value="${productDetail.no}"/>
    <input type="hidden" name="product_cd" value="${productDetail.product_cd}"/>
        <p class="goods-name">${productDetail.product_name}</p>
        <div>
            <span><span class="red-star">*</span>${afn:getMessage("needinfo",sessionScope.locale)}</span>
            <span>※ ${afn:getMessage("msg_review_1-1",sessionScope.locale)}</span>
        </div>
        <table>
            <colgroup>
                <col style="width: 120px;">
                <col style="width: 714px;">
            </colgroup>
            <tbody class="sec1-tbody">
                <tr>
                    <td class="sec1-td-bor1">${afn:getMessage("estimateItem",sessionScope.locale)}<span class="red-star">*</span></td>
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
                    <td class="sec1-td-bor1">${afn:getMessage("title",sessionScope.locale)}<span class="red-star">*</span></td>
                    <td class="body-td2 padding-left">
                        <input type="text" name="review_title" placeholder="${afn:getMessage('msg_below50word',sessionScope.locale)}" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">${afn:getMessage("content",sessionScope.locale)}</td>
                    <td class="body-td2 padding-left">
                        <textarea name="review_content"  placeholder="${afn:getMessage('msg_below2000word',sessionScope.locale)}" style="resize:none;" maxlength="2000"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">${afn:getMessage("review_img",sessionScope.locale)}</td>
                    <td class="body-td2 padding-left">
                        <div class="fileBox">
                            <input type="text" class="fileName" name="fileName" readonly="readonly">
                            <label for="rvImg1" class="btn_file">${afn:getMessage("chooseFile",sessionScope.locale)}</label>
                            <input type="file" id="rvImg1" name="uploadfile" class="uploadBtn1">
                            <button type="button" class="xBox">x</button>
                            
                        </div>
                        <ul class="file-info">
                            <li>${afn:getMessage("msg_review_1-2",sessionScope.locale)}</li>
                            <li>${afn:getMessage("msg_review_1-3",sessionScope.locale)}</li>
                            <li>${afn:getMessage("msg_review_1-4",sessionScope.locale)}</li>
                            <li>${afn:getMessage("msg_review_1-5",sessionScope.locale)}</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="sec1-td-bor1">${afn:getMessage("review_mp4",sessionScope.locale)}</td>
                    <td class="body-td2 padding-left">
                        <div class="fileBox">
                            <input type="text" class="fileName" name="fileName" readonly="readonly" >
                            <label for="pdImg6" class="btn_file">${afn:getMessage("chooseFile",sessionScope.locale)}</label>
                            <input type="file" id="pdImg6" name="uploadfile6" class="uploadBtnVideo1">
                            <button type="button" class="xBox">x</button>
                        </div>
                        <ul class="file-info">
                            <li>${afn:getMessage("msg_review_1-8",sessionScope.locale)}</li>
                            <li>${afn:getMessage("msg_review_1-7",sessionScope.locale)}</li>
                            <li>${afn:getMessage("msg_review_1-4",sessionScope.locale)}</li>
                            <li>${afn:getMessage("msg_review_1-9",sessionScope.locale)}</li>
                        </ul>
                    </td>
                </tr>
                
                                
                
            </tbody>
        </table>
        <p>· ${afn:getMessage("msg_review_1-6",sessionScope.locale)}</p>
        <div class="button-box">
            <button type="button" id="insertReviewBtn">${afn:getMessage("registration",sessionScope.locale)}</button>
            <button type="button" class="grey-button" onclick="self.close();">${afn:getMessage("reviewCancel",sessionScope.locale)}</button>
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
    
    $('.uploadBtn1').on('change', function(object){
        var sel_file;
        var thisObject = $(this);
        var filename = thisObject.val().split('/').pop().split('\\').pop();
        var files = object.target.files;
        var filesArr =Array.prototype.slice.call(files);
        
        filesArr.forEach(function (f) {
            if(!f.type.match("image.*")){
            	alert("${afn:getMessage('msg_review_1-8-1',sessionScope.locale)}");
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
