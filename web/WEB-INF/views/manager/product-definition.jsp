<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">상품정보고시 설정</h2>
                <div class="main-hd-btn-wrap">
<%--                    <button type="button" name="detail">제조사 등록</button>--%>
<%--                    <button type="button" name="detail">공급사 등록</button>--%>
                    <button type="button" name="detail" class="definitionModalBtn">상품정보고시 등록</button>
<%--                    <button type="button" name="detail">트랜드 등록</button>--%>
<%--                    <button type="button" name="detail">자체분류 등록</button>--%>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <button type="submit" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox"  name="searchType" value="product_definition_key" id="chk1" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'product_definition_key')}">checked</c:if>>
                            <label for="chk1">상품정보고시 키</label>
                            <input type="checkbox" name="searchType" value="product_definition_value" id="chk2" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'product_definition_value')}">checked</c:if>>
                            <label for="chk2">상품정보고시 값</label>
                            <input type="checkbox" name="searchType" value="pd_category_name" id="chk3" <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'pd_category_name')}">checked</c:if>>
                            <label for="chk3">카테고리</label>
                        </div>
                    </div>
                    <table class="keyword-src-table">
                        <colgroup>
                            <col width="80px">
                            <col width="420px">
                            <col width="80px">
                            <col width="420px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>카테고리</th>
                                <td id="categorySearch">
	                                    <select class="category1" name="category1">
	                                    <option value=''>--</option>
	                                    </select>
	                                    <select class="category2" name="category2">
	                                    <option value=''>--</option>
	                                    </select>
	                                    <select class="category3" name="category3">
	                                    <option value=''>--</option>
	                                    </select>
	                                </td>
	                                <th>등록일</th>
	                             <td>
		                             <div class="input-box1">
			                             <button type="button" class="ra-num" data-id="con1">오늘</p>
			                             <button type="button" class="ra-num" data-id="con2">1주일</p>
			                             <button type="button" class="ra-num" data-id="con3">1개월</p>
			                             <button type="button" class="ra-num" data-id="con4">3개월</p>
			                             <button type="button" class="ra-num" data-id="con5">6개월</p>
		                             </div>
	                          	 </td>
                         	 </tr>
	                          <tr>
		                          <th></th>
		                          <td></td>
		                          <th></th>
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
                <form name="defaultListForm" id="defaultListForm" method="POST">
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="btn-default" name="copy" id="listDelete">선택 삭제</button>
                    </div>
                </div>

                <input type="hidden" name="Pk" value="${Pk}">
                <input type="hidden" name="table_name" value="${table_name}">
                    <table>
                        <colgroup>
                            <col width="5%">
                            <col width="10%">
                            <col width="50%">
                            <col width="15%">                            
                            <col width="20%">
                        </colgroup>
                        <thead>
                            <tr>
                                <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                                <td>번호</td>
                                <td>카테고리</td>
                                <td>등록일</td>                               
                                <td>관리</td>
                            </tr>
                        </thead>
                        <tbody>
                    <c:if test="${not empty list}">
                        <c:forEach var="list" items="${list}">
                           <tr>
                                <td><input type="checkbox" id="chk" name="chk" value="${list.product_definition_id}"></td>
                                <td>${list.product_definition_id}</td>
                                <td>
                                	<c:if test="${not empty list.up_up_code_name}">
                                		${list.up_up_code_name} > ${list.up_code_name} > ${list.cur_code_name}
                                	</c:if>
                                	<c:if test="${empty list.up_up_code_name && not empty list.up_code_name}">
                                		${list.up_code_name} > ${list.cur_code_name}
                                	</c:if>
                                	<c:if test="${empty list.up_up_code_name && empty list.up_code_name}">
                                		${list.cur_code_name}
                                	</c:if>
                                </td>
                                <td><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></td>
                                <td>
                                    <button type="button" name="detail" class="goods-list-btn definitionModalBtn" data-id="${list.product_definition_id}">상세보기</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                        </tbody>
                    </table>
                </form>
                <form id="form1" name="form1"  method="get">
                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
<%--                    <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">--%>
                </form>
            </div>
        </div>
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>상품정보고시 <span id="definitionModalTitle">등록</span></h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form name="mgDefinitionForm" id="mgDefinitionForm" method="post">
                <div class="modal-body clearfix">
                    <h3>상품정보고시 정보</h3>
                    <input type="hidden" name="product_definition_id"/>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>카테고리<span class="cc-red">&#40;필수&#41;</span></th>
                                <td>
                                	<select class="category category1" name="category1">
                                    <option value=''>--</option>
                                    </select>
                                    <select class="category category2" name="category2">
                                    <option value=''>--</option>
                                    </select>
                                    <select class="category category3" name="category3">
                                    <option value=''>--</option>
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <th>상품정보고시</th>
                                <td class="product_definition_td">
									
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red definitionInsertUpdateBtn" data-id="insert"><span id="definitionModalBtnSpan"></span>하기</button>
                </div>
            </form>
        </div>
    </div>
<script type="text/javascript">
	$(function(){
		jQuery.ajax({
            type: 'POST',
            url: '/Manager/productCategoryList',
            data: {"pd_category_upper_code":0},
            success: function (data) {
                console.log(data.list);
                var html="<option value=''>--</option>"
                data.list.forEach(function(el){
                	html += "<option class='subCategoryList' value='"+el.pd_category_id+"'>"+el.pd_category_name+"</option>";
                });
                $(".category1").html(html);
            },
            error: function (xhr, status, error) {
                alert(error);
            }
        });
    	$('.category1').on("change",function(){
   	        //소분류 초기화
   	        $('.category2').empty();
   	        $('.category3').empty();
   	     	var uppper_code = -1;
   	     	if($(this).val()){
   	        	uppper_code =$(this).val();
   	     	}

   	        jQuery.ajax({
   	            type: 'POST',
   	            url: '/Manager/productCategoryList',
   	            data: {"pd_category_upper_code":uppper_code},
   	            success: function (data) {
  	        			console.log(data.list);
  	                    var html="<option value=''>--</option>"
  	                    data.list.forEach(function(el){
  	                    	html += "<option class='subCategoryList' value='"+el.pd_category_id+"'>"+el.pd_category_name+"</option>";
  	                    });
  	                    $(".category2").html(html);
   	            },
   	            error: function (xhr, status, error) {
   	                alert(error);
   	            }
   	        });
   	    });
    	$('.category2').on("change",function(){
   	        //소분류 초기화
   	        $('.category3').empty();
   	     	var uppper_code = -1;
	     	if($(this).val()){
	        	uppper_code =$(this).val();
	     	}
	     	
   	        jQuery.ajax({
   	            type: 'POST',
   	            url: '/Manager/productCategoryList',
   	            data: {"pd_category_upper_code":uppper_code},
   	            success: function (data) {
  	                    var html="<option value=''>--</option>"
  	                    data.list.forEach(function(el){
  	                    	html += "<option class='subCategoryList' value='"+el.pd_category_id+"'>"+el.pd_category_name+"</option>";
  	                    });
  	                    $(".category3").html(html);
   	            },
   	            error: function (xhr, status, error) {
   	                alert(error);
   	            }
   	        });
   	    });
	})
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>