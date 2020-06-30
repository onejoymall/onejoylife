<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">분류별 매출현황</h2>
            </div>
            <table class="goods-list-tab">
                <colgroup></colgroup>
                <tbody>
                    <tr>
                        <th data-id="/Manager/class-sales" class="list-tab">카테고리</th>
                        <th data-id="/Manager/class-sales-user" class="list-tab">고객별</th>
                        <!-- <th data-id="/Manager/class-sales-company" class="list-tab">협력사별</th> -->
                        <th data-id="/Manager/class-sales-company" class="ready">협력사별</th>
                        <th data-id="/Manager/class-sales-paymethod" class="list-tab on">결제수단별</th>
                        <!-- <th data-id="/Manager/class-sales-tax" class="list-tab">과면세별</th>
                        <th data-id="/Manager/class-sales-age" class="list-tab">연령대별</th>
                        <th data-id="/Manager/class-sales-gender" class="list-tab">성별매출</th> -->
                        <th data-id="/Manager/class-sales-tax" class="ready">과면세별</th>
                        <th data-id="/Manager/class-sales-age" class="ready">연령대별</th>
                        <th data-id="/Manager/class-sales-gender" class="ready">성별매출</th>
                    </tr>
                </tbody>
            </table>
            <div>
                <div class="in-list-tab on" id="tab-on1">
                    <div class="search-form">
                        <form name="" id="" class="listSrcForm" method="get">
                            <div class="keyword-src-wrap">
                                <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                                <button type="submit" class="keyword-src-button">검색</button>
                                <div class="src-filter-wrap">
		                            <input type="checkbox"  name="searchType" value="code_name" id="chk1" checked>
		                            <label for="chk1">결제수단</label>
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
		                                <th>매출현황기준</th>
                                        <td>
                                            <select name="sales_criteria">
                                            	<option value="date" <c:if test="${params.sales_criteria == 'date'}">selected</c:if>>일</option>
                                            	<option value="week" <c:if test="${params.sales_criteria == 'week'}">selected</c:if>>주</option>
                                            	<option value="month" <c:if test="${params.sales_criteria == 'month'}">selected</c:if>>월</option>
                                            	<option value="quater" <c:if test="${params.sales_criteria == 'quater'}">selected</c:if>>분기</option>
                                            	<option value="half" <c:if test="${params.sales_criteria == 'half'}">selected</c:if>>반기</option>
                                            	<option value="year" <c:if test="${params.sales_criteria == 'year'}">selected</c:if>>연</option>
                                            </select>
                                        </td>
                                        <th>주문일</th>
	                                    <td>
		                                    <div class="input-box1">
		                                        <button type="button" class="ra-num" data-id="con1">오늘</p>
		                                        <button type="button" class="ra-num" data-id="con2">1주일</p>
		                                        <button type="button" class="ra-num" data-id="con3">1개월</p>
		                                        <button type="button" class="ra-num" data-id="con4">3개월</p>
		                                        <button type="button" class="ra-num" data-id="con5">6개월</p>
		                                    </div>
		                                </td>
		                                <%-- <td>
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
		                                </td> --%>
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
                        <div class="list-box clearfix">
                            <table class="sort-wrap-table1">
                                <colgroup>
                                    <col width="7%">
                                    <col width="7%">
                                    <col width="7%">
                                    <col width="7%">
                                    <col width="10%">
                                    <col width="7%">
                                    <col width="7%">
                                    <col width="7%">
                                    <col width="10%">
                                    <col width="10%">
                                    <col width="11%">
                                    <col width="10">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <td rowspan="2">일자</td>
                                        <td rowspan="2">결제수단</td>
                                        <td colspan="4">결제완료 주문</td>
                                        <td rowspan="2">결제합계</td>
                                        <td rowspan="2">환불합계</td>
                                        <td rowspan="2">순매출</td>
                                    </tr>
                                    <tr>
                                        <td>주문수</td>
                                        <td>품목수</td>
                                        <td>상품구매 금액</td>
                                        <td>할인</td>
                                    </tr>
                                </thead>
                                <tbody>
                            <c:set var = "total1" value = "0" />
                            <c:set var = "total2" value = "0" />
                            <c:set var = "total3" value = "0" />
                            <c:set var = "total4" value = "0" />
                            <c:set var = "total5" value = "0" />
                            <c:set var = "total6" value = "0" />
                            <c:set var = "total7" value = "0" />
                            <c:if test="${not empty list}">
		                        <c:forEach var="list" items="${list}">
			                        <c:set var = "total1" value = "${total1 + list.payment_order_quantity}" />
		                            <c:set var = "total2" value = "${total2 + list.product_count}" />
		                            <c:set var = "total3" value = "${total3 + list.product_user_payment}" />
		                            <c:set var = "total4" value = "${total4 + list.product_discount}" />
		                            <c:set var = "total5" value = "${total5 + (list.product_user_payment - list.product_discount + list.product_delivery_payment)}" />
		                            <c:set var = "total6" value = "${total6 + list.cancel_request_amount}" />
		                            <c:set var = "total7" value = "${total7 + (list.product_user_payment - list.product_discount + list.product_delivery_payment - list.cancel_request_amount)}" />
		                           <tr>
		                                <td>${list.reg_date}</td>
		                                <td>${list.code_name}</td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.payment_order_quantity}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_count}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_user_payment}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_discount}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_user_payment - list.product_discount + list.product_delivery_payment}" /></td>		                                
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cancel_request_amount}" /></td>
		                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.product_user_payment - list.product_discount + list.product_delivery_payment - list.cancel_request_amount}" /></td>
		                            </tr>
		                        </c:forEach>
		                    </c:if>
                                </tbody>
                                <tfoot>
									<tr>
										<td colspan="2">합계</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total1}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total2}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total3}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total4}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total5}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total6}" /></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total7}" /></td>
									</tr>
                                </tfoot>
                            </table>
                        </div>
                        <form id="form1" name="form1"  method="get">
		                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
		                    <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
		                </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        $(function(){//로드
            $(".list-tab").click(function(){
        		window.location.href = $(this).attr("data-id");
            });
            
        	jQuery.ajax({
                type: 'POST',
                url: '/Manager/productCategoryList',
                data: {"pd_category_upper_code":0},
                success: function (data) {
                    console.log(data.list);
                    var html="<option value='-1'>--</option>"
                    data.list.forEach(function(el){
                    	html += "<option class='subCategoryList' value='"+el.pd_category_id+"'>"+el.pd_category_name+"</option>";
                    });
                    $(".keyword-src-table tbody #categorySearch select:nth-child(1)").html(html);
                },
                error: function (xhr, status, error) {
                    alert(error);
                }
            });
        	$('.keyword-src-table tbody #categorySearch select:nth-child(1)').on("change",function(){
       	        //소분류 초기화
       	        $('.keyword-src-table tbody #categorySearch select:nth-child(2)').empty();
       	        $('.keyword-src-table tbody #categorySearch select:nth-child(3)').empty();
       	        var uppper_code =$(this).val();
       	        
       	        jQuery.ajax({
       	            type: 'POST',
       	            url: '/Manager/productCategoryList',
       	            data: {"pd_category_upper_code":uppper_code},
       	            success: function (data) {
      	        			console.log(data.list);
      	                    var html="<option value='-1'>--</option>"
      	                    data.list.forEach(function(el){
      	                    	html += "<option class='subCategoryList' value='"+el.pd_category_id+"'>"+el.pd_category_name+"</option>";
      	                    });
      	                    $(".keyword-src-table tbody #categorySearch select:nth-child(2)").html(html);
       	            },
       	            error: function (xhr, status, error) {
       	                alert(error);
       	            }
       	        });
       	    });
        	$('.keyword-src-table tbody #categorySearch select:nth-child(2)').on("change",function(){
           	        //소분류 초기화
           	        $('.keyword-src-table tbody #categorySearch select:nth-child(3)').empty();
           	        var uppper_code =$(this).val();
           	        console.log(uppper_code)
           	        jQuery.ajax({
           	            type: 'POST',
           	            url: '/Manager/productCategoryList',
           	            data: {"pd_category_upper_code":uppper_code},
           	            success: function (data) {
          	                    var html="<option value='-1'>--</option>"
          	                    data.list.forEach(function(el){
          	                    	html += "<option class='subCategoryList' value='"+el.pd_category_id+"'>"+el.pd_category_name+"</option>";
          	                    });
          	                    $(".keyword-src-table tbody #categorySearch select:nth-child(3)").html(html);
           	            },
           	            error: function (xhr, status, error) {
           	                alert(error);
           	            }
           	        });
           	    });
        	
        })//로드끝
        </script>
    </main>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>