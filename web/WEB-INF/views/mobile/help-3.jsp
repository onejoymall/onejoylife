<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>


    <section class="subheader">
        <div class="subTitle">FAQ</div>
    </section>
    <section class="wrap">
    <div class="input-group mb-1">
        <input type="text">
        <button>검색</button>
    </div>
       
    <ul class="faqsub clearfix">
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=F"><i class="icon faq"></i>자주하는질문</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=P"><i class="icon qna"></i>상품문의</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=O"><i class="icon pay"></i>주문/결제</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=C"><i class="icon refund"></i>교환/반품/환불</a>
        </li>
    </ul>
    <ul class="faqsub clearfix mb-2">
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=A" class="border-top-none"><i class="icon shipping"></i>배송/설치/AS</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=V" class="border-top-none"><i class="icon event"></i>이벤트/경품</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=S" class="border-top-none"><i class="icon epoint"></i>E-포인트</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=G" class="border-top-none"><i class="icon etc"></i>기타</a>
        </li>
    </ul>
    <hr>
<c:if test="${not empty listview}">
    <c:forEach var="listview" items="${listview}" varStatus="status">
    <div class="faq">
       <div class="faqTitle">
            <span>${listview.question_type_name}</span>
            <h4>${listview.brdmemo}</h4>
        </div>
       <div class="faqAnswer">
            <p>${listview.rememo} <span><a href="/Board/boardList?bgno=15" class="btn btn-sm">1:1 문의하기</a></span></p>
           <%--<div class="faqFile">
               <a href="#"><i class="ri-attachment-2"></i> 설치신청서.DOC</a>
           </div>--%>
        </div>
    </div>
    </c:forEach>
</c:if>

    
   <%-- <ul class="centerBtns mt-3">
        <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
        <li><a href="#" class="active">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
    </ul>--%>
</section>
<form id="form1" name="form1"  method="get">
 <c:if test="${not empty param.question_type}">
     <input type="hidden" name="question_type" value="${param.question_type}">
    </c:if>
 <c:if test="${not empty param.searchKeyword}">
     <input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
    </c:if>
    <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
</form>
<!--
    <div class="bottomBtns">
        <ul>
           <li><a href="#">선택 주문하기</a></li>
           <li><a href="#">전체 주문하기</a></li>
        </ul>
    </div>
-->

    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>