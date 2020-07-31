<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>



    <section class="subheader">
        <div class="subTitle">${afn:getMessage("faq",sessionScope.locale)}</div>
    </section>
    <section class="wrap">
    <div class="input-group mb-1">
        <input type="text">
        <button>${afn:getMessage("search",sessionScope.locale)}</button>
    </div>
       
    <ul class="faqsub clearfix">
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=F"><i class="icon faq"></i>${afn:getMessage("FQ",sessionScope.locale)}</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=P"><i class="icon qna"></i>${afn:getMessage("question",sessionScope.locale)}</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=O"><i class="icon pay"></i>${afn:getMessage("orders_payment",sessionScope.locale)}</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=C"><i class="icon refund"></i>${afn:getMessage("change_return_refund",sessionScope.locale)}</a>
        </li>
    </ul>
    <ul class="faqsub clearfix mb-2">
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=A" class="border-top-none"><i class="icon shipping"></i>${afn:getMessage("del_set_as",sessionScope.locale)}</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=V" class="border-top-none"><i class="icon event"></i>${afn:getMessage("event_prize",sessionScope.locale)}</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=S" class="border-top-none"><i class="icon epoint"></i>${afn:getMessage("e-point",sessionScope.locale)}</a>
        </li>
        <li>
            <a href="/Help/faqCenter?bgno=16&question_type=G" class="border-top-none"><i class="icon etc"></i>${afn:getMessage("others_",sessionScope.locale)}</a>
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
            <p>${listview.rememo} <span><a href="/Board/boardList?bgno=15" class="btn btn-sm">${afn:getMessage("FAQone_to_one",sessionScope.locale)}</a></span></p>
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