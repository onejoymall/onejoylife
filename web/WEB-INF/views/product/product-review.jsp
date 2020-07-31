<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="total-review">
    <h5>${afn:getMessage("EvaluateAndreview",sessionScope.locale)}</h5>
    <div class="total-review-box">
        <div class="total-star">
            <div class="total-star-left">
                <div class="star-box">
                    <c:forEach var="i" begin="1" end="${scoreAvg}">
                   	<i class="y-star-full"></i>
                    </c:forEach>
                </div>
                <p><span>${searchVO.totRow}</span>${afn:getMessage("msg.review.review_count_for",sessionScope.locale)}</p>
            </div>
            <div class="total-star-right">
                <div class="score-box">
                    <p class="score">${scoreAvg}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="review-list">
        <div class="review-data-container">
            <div class="review-data-option-box">
	            <ul class="review-data-list">
	            	<c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}">
	                <li class="review-data-item">
	                    <div class="main-title-box" tabindex="0">
	                        <div class="star-box">
	                            <c:forEach var="i" begin="1" end="${list.review_score}">
                               	<i class="y-star-full"></i>
                                </c:forEach>
	                        </div>
	                        <div class="review-title"><span>${list.review_title}</span><c:if test="${not empty list.file_1}"><i class="pic-ic"></i></c:if></div>
	                        <div class="review-author"><span>${list.email}</span></div>
	                        <div class="review-date"><span><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></span></div>
	                    </div>
	                    <div class="content-box">
	                        <div class="review-setting-box">
	                        	<c:if test="${list.email == sessionScope.email}">
		                            <button type="button"  data-id="${list.order_no}" class="review-update modify">${afn:getMessage("update",sessionScope.locale)}</button>
		                            <button type="button" data-id="${list.order_no}" class="review-delete delete">${afn:getMessage("delete",sessionScope.locale)}</button>
	                            </c:if>
	                        </div>
	                        <div class="review-content-body">
	                            ${list.review_content}
	                            <div class="review-content-body-media-box">
	                           
	                            <c:if test="${not empty list.file_1}">
	                 			     <img src="${list.file_1}" onerror="this.src='http://placehold.it/600x300'" alt="${afn:getMessage('reviewImg',sessionScope.locale)}" />
	                           </c:if>
	                            </div>
	                             
					            <c:if test="${not empty list.file_2}">
<%-- 				                    <img src='${list.file_2}' onerror="this.src='http://placehold.it/550'" > --%>
		               			   <video width="500" height="500" controls>
		               			     <source src="${list.file_2}" type=video/ogg>
						   			 <source src="${list.file_2}" type=video/mp4>
								   </video>
			                    </c:if>  
	                        </div>
	                    </div>
	                </li>
	                </c:forEach>
	                </c:if>
	            </ul>
	        </div>
	        <form id="form1" name="form1" method="get">
				<jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
		        <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
	        </form>
        </div>
    </div>
</div>