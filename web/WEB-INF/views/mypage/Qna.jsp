<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box clearfix">
        <main>
            <c:import url="/layout/scrollRight"/>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <%--                <%@ include file="/WEB-INF/views/layout/MyPageRightHeader.jsp" %>--%>
                <c:import url="/MyPage/RightHeader"/>
                    <div class="r-input-box">
                        <p class="r-input-tit" style="width:100%">${afn:getMessage('my_qna',sessionScope.locale)}</p>
                        <div class="r-in-box">
	                         <div class="input-box1">
                            	<p class="ra-num on" data-id="con1">${afn:getMessage('today',sessionScope.locale)}</p>
                            	<p class="ra-num" data-id="con2">1${afn:getMessage('week',sessionScope.locale)}</p>
                            	<p class="ra-num" data-id="con3">1${afn:getMessage('month',sessionScope.locale)}</p>
                            	<p class="ra-num" data-id="con4">3${afn:getMessage('month',sessionScope.locale)}</p>
                       		 </div>
	                        <div class="input-box2">
	                        <form id="form2">
	                            <div class="cla">
	                                <input type="text" id="from_date" name="start_date" class="date_pick" value="<c:out value="${param.start_date}"/> ">
	                                <div class="cla-img1"></div>
	                            </div>
	                            <p class="cla-p1"> ~ </p>
	                            <div class="cla">
	                                <input type="text" id="to_date" name="end_date" class="date_pick" value="<c:out value="${param.end_date}"/> ">
	                                <div class="cla-img1"></div>
	                            </div>
	                            <p class="cla-p2"><a href="#" onclick="$('#form2').submit();">${afn:getMessage('lookup',sessionScope.locale)}</a></p>
                            </form>
	                        </div>
	                    </div>
                    </div>
                    <div class="con on" id="con1">
                        <div class="r-sec4">
                            <table class="sec4-lis">
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col style="width: 600px;">
                                    <col style="width: 150px;">
                                </colgroup>
                                <thead class="lis-head">
                                <tr>
                                    <th>${afn:getMessage('rgstDt',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('product_information',sessionScope.locale)}</th>
                                    <th>${afn:getMessage('State',sessionScope.locale)}</th>
                                </tr>
                                </thead>
                                <tbody class="lis-body">
                                <c:if test="${not empty list}">
                                <c:forEach var="list" items="${list}">
                                <tr>
                                    <td class="my-lis-1">
                                       
                                      <p><fmt:parseDate value="${list.reg_date1}" var ='regDate' pattern="yyyy.MM.dd HH:mm"/>
                                        <p><fmt:formatDate value="${regDate}" pattern="yyyy.MM.dd"/><br>
                                        <fmt:formatDate value="${regDate}" pattern="HH:mm"/></p>   
                                    </td>
                                    <td class="my-lis-2">
                                        <a href="/product/productDetail?product_cd=${list.product_cd}">
                                            <div style="width: 22%;height: 90px;background: url(${list.file_1}) no-repeat center / cover;"></div>
                                            <div class="my-lis-txt">
                                                <p>${list.product_made_company_name}</p>
                                                <p class="lis-font-w">${list.product_name}</p>
                                         <%--        <p>${list.product_model}</p> --%>
                                         <p></p>
                                            </div>
                                        </a>
                                        <div class="review-box clearfix">
                                            <div class="star-box">
                                            	   <p class="review-tit">${afn:getMessage('my_question',sessionScope.locale)}</p>
                                            	   <p class="review-arti">${afn:getMessage('brd_A',sessionScope.locale)}
                                                </p>
                                            </div>
                                            <div class="review-txt">
                                                <p class="review-tit">${list.qna_title}</p>
                                                <p class="review-arti">
                                                    ${list.qna_rewrite_memo}
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                          
                                    <td>
                                        <c:if test="${list.qna_rewrite_memo eq NULL}">
	                                        <div class="lis-txt-box lis-txt-box1-3">
	                                            <a href="#" class="qna-update" data-id="${list.qna_id}">${afn:getMessage('update',sessionScope.locale)}</a>
	                                        </div>
                                        </c:if>
                                        <div class="lis-txt-box lis-txt-box1-1">
                                            <a href="#" class="qna-delete" data-id="${list.qna_id}">${afn:getMessage('delete',sessionScope.locale)}</a>
                                        </div> 
                                    </td>

                                </tr>
                                </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                            <form id="form1" name="form1"  method="get">
	                            <jsp:include page="/WEB-INF/views/common/pagingforSubmitList.jsp" />
	                            <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
                            </form>
                            
                        </div>
                    </div>
            </div>
        </main>

    </div>
</div>

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>