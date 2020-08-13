<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">업체별 세금계산서 신청내역</h2>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
               
                    <div class="keyword-src-wrap">
<!--                         <input type="text" class="keyword-src" name="keyword-src"> -->
                    <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <button type="submit" class="keyword-src-button">검색</button>
                        
                        <div class="src-filter-wrap">
<!--                             <input type="checkbox" id="src-name"> -->
                                <input type="checkbox" name="searchType" value="product_store_id" id="src-name" 
                                 <c:if test="${empty params.searchTypeArr[0] || afn:containsA(params.searchTypeArr,'product_store_id')}">checked</c:if>>
                            <label for="src-name">업체명</label>
                                  
                            
                        </div>
                    </div>
                    <table class="keyword-src-table">
                        <colgroup>
                            <col width="80px">
                            <col width="420px">
                            <col width="80px">
                            <col width="420px">
                        </colgroup>
   						<%--    <tbody>
                            <tr>
                                <th>할인쿠폰 </th>
                                <td>
                                <c:set var="coupon_cd_arr" value="${fn:split(searchVO.coupon_cd,',')}"/>
                                <input type="checkbox" name="coupon_cd" value="not null" id="src-before"
                                  <c:if test="${coupon_cd_arr[0] eq 'not null' || coupon_cd_arr[1] eq 'not null'}">checked</c:if>>
                                   <label for="src-before" >사용</label>
                                   <input type="checkbox" name="coupon_cd" value="null" id="src-after" 
                                  <c:if test="${coupon_cd_arr[0] eq 'null' || coupon_cd_arr[1] eq 'null'}">checked</c:if>>
                                   <label for="src-after">사용안함</label>
                                </td>
                                
                         <c:set var="store_pur_com_arr" value="${fn:split(searchVO.store_pur_com,',')}"/>
                                <th>매입/위탁</th>
                                <td>
                                <input type="checkbox" name="store_pur_com" value="A" id="src-q1"
                                <c:if test="${store_pur_com_arr[0]eq'A'||store_pur_com_arr[1]eq'A' }">checked</c:if>>
                                   <label for="src-q1" >매입</label>
                                   <input type="checkbox" name="store_pur_com" value="B" id="src-q2" 
                                 <c:if test="${store_pur_com_arr[0]eq'B'||store_pur_com_arr[1]eq'B'}">checked</c:if>>
                                   <label for="src-q2">위탁</label>
                                </td>
                            </tr>
                        </tbody>	 --%>	
                    </table>
                </form>

            </div>
            <div class="goods-list-wrap">
                <div class="list-sort-wrap">
                    <div class="left">
                        
                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>선택 다운로드</button>
                        <button type="button" class="btn-default" name="copy"><i class="exel-ic"></i>전체 다운로드</button>
                    </div>
                    <div class="right">
                        <select name="order" class="order-select">
                            <option value="10"<c:if test="${searchVO.displayRowCount ==10}">selected</c:if>>10개씩 보기</option>
                            <option value="50"<c:if test="${searchVO.displayRowCount ==50}">selected</c:if>>50개씩 보기</option>
                            <option value="100"<c:if test="${searchVO.displayRowCount ==100}">selected</c:if>>100개씩 보기</option>
                            
                            
                        </select>
                    </div>
                </div>
                <form name="defaultListForm" id="defaultListForm" method="POST">
                    <input type="hidden" name="Pk" value="${Pk}">
                    <input type="hidden" name="table_name" value="${table_name}">
                <table>
                    <colgroup>
                        
                        <col width="3%">
                        <col width="5%">
                        <col width="30%">
                        <col width="6%">
                        <col width="8%">
                        <col width="8%">
                        <col width="7%">
                        <col width="6%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                        <col width="25%">
                        <col width="7%">
                    </colgroup>
                    <thead>
                        <tr>
                         
                            <td>상품코드</td>
                            <td>업체명</td>
                            <td>상품명</td>
                            <td>할인쿠폰</td>
                            <td>매입/위탁</td>
                            <td>과세/면세상품</td>
                            <td>무형상품</td>
                            <td>PG사 수수료</td>
                            <td>PG사 포인트 적립/사용</td>
                            <td>정산내역</td>
                            <td>세금계산서 요청 상태</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${list}">
                       <tr>
                            <%-- <td><input type="checkbox" id="chk10" name="chk10"  value="${list.payment_cd}"></td> --%>
                          
                            
                            <td>${list.payment_cd}</td>
                            <td>${list.product_store_id}</td>
                            <td>${list.product_name}</td>
                            <td>${list.coupon_use}</td>
                            <td>${list.store_pur_com}</td> 
						
                     	<c:choose>
							<c:when test="${list.product_tex_class eq 'A' }">
								<td>과세상품</td>
							</c:when>
								<c:when test="${list.product_tex_class eq 'ㅠ' }">
								<td>면세상품</td>
							</c:when>
							<c:otherwise> 
								<td>-</td>
							</c:otherwise>
						</c:choose>
						
				  		
						
				    	<c:choose>
							<c:when test="${list.product_type eq 'r' }">
								<td>여행</td>
							</c:when>
							<c:when test="${list.product_type eq 'p' }">
								<td>일반상품</td>
							</c:when>
							<c:when test="${list.product_type eq 't' }">
								<td>티켓</td>
							</c:when>		
							<c:otherwise> 
							<td>일반상품</td>
							</c:otherwise>
						</c:choose>
						
                            <td>-</td>
                            <td>+ 000</td>
                            <td>${list.product_company_payment}</td>
                            <td>${list.taxinvoice_status_name}</td>
                            <td>
                                <button type="button" data-id="${list.tax_type}" class="goods-list-btn" name="detail" onclick="defaultModalStore22('${list.order_no}')" >상세보기</button>
                            </td>
                        </tr>
                        </c:forEach>
       
                    </tbody>
                   
                </table>
                 </form>
                  <form id="form1" name="form1"  method="get">
                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                    <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                  	<input type="hidden" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                    <input type="hidden" name="displayRowCount" value="${searchVO.displayRowCount}">
                     <c:forEach items="${params.searchTypeArr}" var="list">
                    	<input type="hidden" name="searchType" value="${list}">	
                    </c:forEach>
              <%--        <c:forEach items="${params.searchChkArr}" var="list">
                    	<input type="hidden" name="chkType" value="${list}">	
                    </c:forEach> --%>
                    
                    <%--  <input type="hidden" name="src-before" value="${list.coupon_cd}">  --%>
                    <input type="hidden" name="src-after" value="${param.src-after}">
           </form>
           
             <!--    <ul class="pagination"
                    <li class="page-item"><a class="page-link" href="#">≪</a></li>
                    <li class="page-item"><a class="page-link" href="#">＜</a></li>
                    <li class="page-item"><a class="page-link active" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item"><a class="page-link" href="#">7</a></li>
                    <li class="page-item"><a class="page-link" href="#">8</a></li>
                    <li class="page-item"><a class="page-link" href="#">9</a></li>
                    <li class="page-item"><a class="page-link" href="#">10</a></li>
                    <li class="page-item"><a class="page-link" href="#">＞</a></li>
                    <li class="page-item"><a class="page-link" href="#">≫</a></li>
                </ul> -->
            </div>
        </div>
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>정산내역</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <div class="modal-body clearfix">
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody class="body-tr" id="payment_list">
                         <tr>
                            <th>상품코드</th>
                            <td class="payment_cd"></td>
                        </tr>
                        <tr>
                            <th>업체명</th>
                            <td class="product_store_id"></td>
                        </tr>
                        
                        <tr>
                            <th>과세유형</th>  
                            
                            <td class="product_tex_class">0</td>
                            <!-- <span class="">과세상품 A|과세율 / 면세상품 B</span>  --> 
                    	 </tr>
                    	 
                    	 
                           <tr>
                            <th>무형상품</th>
                            <td class="product_type">일반상품</td> 
                        </tr>

                        <tr>
                            <th>할인쿠폰 사용여부</th>
                            <td class="coupon_use">사용</td>
                        </tr>
                        <tr>
                            <th>매입/위탁</th>
                            <td class="store_pur_com">매입</td>
                        </tr>
                        
                          <%-- <c:choose>
								<c:when test="store_pur_com eq 'B' ">
									<td>매입</td>
								</c:when>
							<c:otherwise> 
								<td>위탁</td>
							</c:otherwise>
						</c:choose> --%>
                        
                      
                        <tr>
                            <th>PG사 수수료</th>
                            <td class="">0</td>
                        </tr>
                        <tr>
                            <th>PG사 포인트 적립/사용</th>
                            <td class="">+ 000</td>
                        </tr>
                        <tr>
                            <th>정산내역</th>
                            <td class="product_company_payment"> - </td>
                        </tr>
                        <tr>
                            <th>세금계산서 요청 상태</th>
                            <td class="taxinvoice_status_name"> - </td>
                        </tr>  
                    </tbody>
                </table>
              <div id="setButton">

                    </div>
                    <div id="setDefaultButton" class="f-left">

                    </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../assets/js/index.js"></script>
    <script>
    
    function defaultModalStore22(order_no){
    	   
	        $(".modal").attr("style", "display:block");
	        jQuery.ajax({
            type: 'GET',
            url: '/Manager/calculate-companyDetail',
            data: {"order_no":order_no},
            success: function (data) {
            	console.log(data.level)
			$.each(data.detail,function(key,val){
				$('td.'+key).html(val);
			});
			var leftHtml = '';
	    	leftHtml += '';
	    	  if(data.impPayment && data.impPayment.status == 'paid' && data.level =='10' &&  data.detail.taxinvoice_status =='S' ){  
	    		leftHtml += '<button type="button" class="btn-gray" onclick="taxStoreInvoiceApproval(\'' + data.detail.order_no + '\');">세금계산서</button>' ;
	    	 }else if(data.impPayment && data.impPayment.status == 'paid' && data.level =='10' &&  data.detail.taxinvoice_status =='F'  ){
	    		 leftHtml += '<button type="button" class="btn-gray" onclick="taxStoreInvoiceApproval(\'' + data.detail.order_no + '\');">세금계산서</button>' ;
	    		 
	    	 }
	    	  else {
	    		 leftHtml += '<button type="button" class="btn-gray" onclick="taxStoreInvoiceApprovalChk(\'' + data.detail.order_no + '\');">세금계산서 확인</button>' ;
	    		 
	    	 }
    			$("#setDefaultButton").html(leftHtml);
	 		 },
            error: function (xhr, status, error) {
                alert(error);
            },
        });
    }
    
   
    $(".modal-close").click(function(){
        $(".modal").removeClass('on');
        $('html,body').css("overflow", "auto");
    });
  
    $('.order-select').on("change",function () {
    	$('input[name=displayRowCount]').val($(this).val())
        $('#form1').submit();
        
        
        
    })

</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>