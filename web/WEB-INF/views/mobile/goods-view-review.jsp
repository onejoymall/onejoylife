<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
		<div class="mt-4 mb-2" id="content03">
           <ul class="flexbetween mb-1">
               <li><h3>${afn:getMessage("EvaluateAndreview",sessionScope.locale)}<span class="red text-md ml-1">${searchVO.totRow}</span></h3></li>
               <!-- <li><button class="btn btn-black" id="btn_review">작성하기</button></li> -->
           </ul>
            <hr>
            <div class="bg_grey p-2 text-center">
                <h2>
                	<c:forEach var="i" begin="1" end="${scoreAvg}">
                   	<i class="y-star-full"></i>
                    </c:forEach>
				</h2>
                <h2 class="text-bold pb-1">${scoreAvg}</h2>
                <p>${searchVO.totRow}${afn:getMessage("msg.review.review_count_for",sessionScope.locale)}</p>
            </div>
            <hr>
            <c:if test="${not empty list}">
            <c:forEach var="list" items="${list}">
            <ul class="product pb-0">
               <ul class="options pb-0">
                    <li><h5><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/> <br>${list.email}</h5></li>
                    <li>
                    	<c:forEach var="i" begin="1" end="${list.review_score}">
                       	<i class="ri-star-fill red"></i>
                        </c:forEach>
                    ${list.review_score}.0</li>
                </ul>
                <ul>
                
                 <c:if test="${not empty list.file_1}">
                    <li><img src="${list.file_1}" onerror="this.src='http://placehold.it/300x300'" alt="${afn:getMessage('reviewImg',sessionScope.locale)}"></li>
                   </c:if>
                    <c:if test="${not empty list.file_2}">
<%-- 				  <img src='${list.file_2}' onerror="this.src='http://placehold.it/550'" > --%>
            			 <video width="300" height="300" controls>
              			     <source src="${list.file_2}" type=video/ogg>
			   			 <source src="${list.file_2}" type=video/mp4>
					   </video>
			      </c:if>   
                   
                   
                    <li>
                    	<p>${list.review_title}</p>
                       	<p>${list.review_content}</p>
                    </li>
                   
                    
                    
                </ul>
            </ul>
            </c:forEach>
            </c:if>
            <!-- <ul class="centerBtns mt-3">
                <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
                <li><a href="#" class="active">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
            </ul> -->
        </div>