<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">상품평관리</h2>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" class="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
	                     <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
	                     <button type="submit" class="keyword-src-button">검색</button>
	                     <input type="checkbox"  name="searchType" value="product_name" id="chk1" checked>
	                     <label for="chk1">상품명</label>
	                     <input type="checkbox"  name="searchType" value="email" id="chk1" checked>
	                     <label for="chk1">이메일</label>
	                     <input type="checkbox"  name="searchType" value="review_title" id="chk1" checked>
	                     <label for="chk1">제목</label>
                    </div>
                    <table class="keyword-src-table">
                        <colgroup>
                            <col width="80px">
                            <col width="420px">
                            <col width="80px">
                            <col width="420px">
                        </colgroup>
                        <tbody>
                            <!-- <tr>
                                <th>노출/미노출</th>
                                <td>
                                   <input type="checkbox" name="review_visible_yn" value="Y" id="src-q1" checked>
                                   <label for="src-q1">노출</label>
                                   <input type="checkbox" name="review_visible_yn" value="N" id="src-q2" checked>
                                   <label for="src-q2">미노출</label>
                                </td>
                                <th>답변 상태</th>
                                <td>
                                   <input type="checkbox" name="review_answer" value="Y" id="src-before" checked>
                                   <label for="src-before">답변전</label>
                                   <input type="checkbox" name="review_answer" value="N" id="src-after" checked>
                                   <label for="src-after">답변완료</label>
                                </td>
                            </tr> -->
                            <tr>
                                <th>작성일</th>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="start_date" name="start_date" class="date_pick" value="${param.start_date}">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="end_date" name="end_date" class="date_pick" value="${param.end_date}">
                                            <div class="cla-img1"></div>
                                        </div>
                                    </div>
                                </td>   
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="goods-list-wrap">
                <!-- <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="goods-list-btn" name="copy">선택 삭제</button>
                        <button type="button" class="goods-list-btn" name="copy">선택 상품평 이동</button>
                    </div>
                </div> -->
                <table>
                    <colgroup>
                        <col width="8%">
                        <col width="15%">
                        <col width="20%">
                        <col width="3%">
                        <col width="5%">
                        <col width="5%">
                        <col width="5%">
                        <col width="5%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td>작성자 아이디</td>
                            <td>상품명</td>
                            <td>제목</td>
                            <td>평점</td>
                            <td>작성일</td>
                            <td>노출/미노출</td>
                            <td>상태</td>
                            <td>답변일</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
	                    <c:if test="${not empty list}">
	                    <c:forEach var="list" items="${list}">
                       <tr>
                            <td>${list.email}</td>
                            <td>${list.product_name}</td>
                            <td>${list.review_title}</td>
                            <td>${list.review_score}</td>
                            <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
                            <td>
                            	<c:if test="${list.review_visible_yn == 'Y'}">
                            		노출
                            	</c:if>
                            	<c:if test="${list.review_visible_yn == 'N'}">
                            		미노출
                            	</c:if>
                           	</td>
                            <td <c:if test="${list.review_answer == null}">class="ok-color"</c:if>>
                            	<c:if test="${list.review_answer != null}">
                            		답변완료
                            	</c:if>
                            	<c:if test="${list.review_answer == null}">
                            		답변전
                            	</c:if>
                            
                            <td>
                            	<c:if test="${list.answer_date == null}">
                            		-
                            	</c:if>
                            	<c:if test="${list.answer_date != null}">
                            		<fmt:formatDate value="${list.answer_date}" pattern="yyyy.MM.dd"/>
                            	</c:if>
							</td>
                            <td>
                            	<c:if test="${list.review_answer == null}">
                                <button type="button" class="goods-list-btn answer-btn" data-id="${list.review_id}" name="detail">답변하기</button>
                                </c:if>
                                <c:if test="${list.review_answer != null}">
                                <button type="button" class="goods-list-btn update-btn" data-id="${list.review_id}" name="detail1">수정</button>
                                </c:if>                            
                            </td>
                        </tr>
                        </c:forEach>
                        </c:if>
                    </tbody>
                </table>
                <form id="form1" name="form1"  method="get">
                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                    <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                </form>
            </div>
        </div>
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>상품평 답변</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form id="form2" method="POST">
                <div class="modal-body clearfix">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>상품명</th>
                                <td><span class="product_name" id="product_name"></span></td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><span class="email" id="email">onejoylife12</span></td>
                            </tr>
                            <tr>
                                <th>노출/미노출</th>
                                <td><span class="review_visible_yn" id="review_visible_yn">노출</span></td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td><span class="reg_date" id="reg_date">2020-03-04</span></td>
                            </tr>
                            <tr>
                                <th>상품평점</th>
                                <td><span class="review_score" id="review_score">5</span></td>
                            </tr>
                            <tr>
                                <th>상품평제목</th>
                                <td><span class="review_title" id="review_title">상품평 제목입니다.</span></td>
                            </tr>
                            <tr>
                                <th>상품평 내용</th>
                                <td><span class="review_content" id="review_content">상품평 내용입니다.</span></td>
                            </tr>
                            <tr>
                                <th>답변내용</th>
                                <td><textarea name="review_answer" class="review_answer"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red answer-btn-proc">답변하기</button>
                </div>
                <input name="review_id" type="hidden" class="review_id" id="review_id">
            </form>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>상품평 수정</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form id="form3" method="POST">
                <div class="modal-body clearfix">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>상품명</th>
                                <td><span class="product_name" id="product_name"></span></td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><span class="email" id="email">onejoylife12</span></td>
                            </tr>
                            <tr>
                                <th>노출/미노출</th>
                                <td><span class="review_visible_yn" id="review_visible_yn">노출</span></td>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td><span class="reg_date" id="reg_date">2020-03-04</span></td>
                            </tr>
                            <tr>
                                <th>상품평점</th>
                                <td><span class="review_score" id="review_score">5</span></td>
                            </tr>
                            <tr>
                                <th>상품평제목</th>
                                <td><span class="review_title" id="review_title">상품평 제목입니다.</span></td>
                            </tr>
                            <tr>
                                <th>상품평 내용</th>
                                <td><span class="review_content" id="review_content">상품평 내용입니다.</span></td>
                            </tr>
                            <tr>
                                <th>답변내용</th>
                                <td><textarea name="review_answer" class="review_answer"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red update-btn-proc">수정하기</button>
                </div>
                <input name="review_id" type="hidden" class="review_id" id="review_id">
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
    <script>
        //summernote
        $(document).ready(function (){
        	$(".answer-btn").click(function(){
        		var review_id = $(this).attr("data-id");
        		jQuery.ajax({
        	        type: 'POST',
        	        data: "review_id="+review_id,
        	        url:'/Manager/reviewDetail',
        	        success: function (data) {
        	        	$.each(data.review,function(index, item){
        	        		$("."+index).text(item);
        	        		if(index == 'review_visible_yn'){
        	        			$("."+index).text(item == 'Y' ? '노출' : '미노출');
        	        		}
        	        		if(index == 'review_id'){
        	        			$("."+index).val(item);
        	        		}
        	        	});
        	        },
        	        error: function (xhr, status, error) {
        	            alert("error");
        	        }
        	    });
        	});
        	$(".update-btn").click(function(){
        		var review_id = $(this).attr("data-id");
        		jQuery.ajax({
        	        type: 'POST',
        	        data: "review_id="+review_id,
        	        url:'/Manager/reviewDetail',
        	        success: function (data) {
        	        	$.each(data.review,function(index, item){
        	        		$("."+index).text(item);
        	        		if(index == 'review_visible_yn'){
        	        			$("."+index).text(item == 'Y' ? '노출' : '미노출');
        	        		}
        	        		if(index == 'review_id'){
        	        			$("."+index).val(item);
        	        		}
        	        		if(index == 'review_answer'){
        	        			$("."+index).val(item);
        	        		}
        	        	});
        	        },
        	        error: function (xhr, status, error) {
        	            alert("error");
        	        }
        	    });
        	});
        	//답변하기
        	$(".answer-btn-proc").click(function(){
        		var formData = $('#form2').serialize();
        		jQuery.ajax({
        	        type: 'POST',
        	        data: formData,
        	        url:'/Manager/reviewAnswer',
        	        success: function (data) {
        	        	if(data.success){
        	        		$.toast({
        	                    text: 'success',
        	                    showHideTransition: 'plain', //펴짐
        	                    position: 'bottom-right',
        	                    icon: 'success',
        	                    hideAfter: 2000,
        	                    afterHidden: function () {
        	                        location.reload();
        	                    }
        	                });
        	        	}
        	        },
        	        error: function (xhr, status, error) {
        	            alert("error");
        	        }
        	    });
        	})
        	//수정하기
        	$(".update-btn-proc").click(function(){
        		var formData = $('#form3').serialize();
        		jQuery.ajax({
        	        type: 'POST',
        	        data: formData,
        	        url:'/Manager/reviewAnswer',
        	        success: function (data) {
        	        	if(data.success){
        	        		$.toast({
        	                    text: 'success',
        	                    showHideTransition: 'plain', //펴짐
        	                    position: 'bottom-right',
        	                    icon: 'success',
        	                    hideAfter: 2000,
        	                    afterHidden: function () {
        	                        location.reload();
        	                    }
        	                });
        	        	}
        	        },
        	        error: function (xhr, status, error) {
        	            alert("error");
        	        }
        	    });
        	})
            $('#summernote').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
            $('#summernote2').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
        });
    </script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>