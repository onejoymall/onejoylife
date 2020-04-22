<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="total-review">
    <h5>평가 및 리뷰</h5>
    <div class="total-review-box">
        <div class="total-star">
            <div class="total-star-left">
                <div class="star-box">
                    <c:forEach var="i" begin="1" end="${scoreAvg}">
                   	<i class="y-star-full"></i>
                    </c:forEach>
                </div>
                <p><span>${searchVO.totRow}</span>개의 상품평이 있습니다.</p>
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
	                        <div class="review-date"><span>${list.reg_date}</span></div>
	                    </div>
	                    <div class="content-box">
	                        <div class="review-setting-box">
	                        	<c:if test="${list.email == sessionScope.email}">
		                            <button type="button"  data-id="${list.order_no}" class="review-update modify">수정</button>
		                            <button type="button" data-id="${list.order_no}" class="review-delete delete">삭제</button>
	                            </c:if>
	                        </div>
	                        <div class="review-content-body">
	                            ${list.review_content}
	                            <div class="review-content-body-media-box">
	                                <img src="${list.file_1}" onerror="this.src='http://placehold.it/600x300'" alt="후기이미지" />
	                            </div>
	                        </div>
	                    </div>
	                </li>
	                </c:forEach>
	                </c:if>
	            </ul>
	        </div>
	        <form id="form1" name="form1" method="post">
				<jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
		        <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">
	        </form>
        </div>
    </div>
</div>