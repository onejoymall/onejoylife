<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
	<section class="subheader">
		<c:import url="/MyPage/RightHeaderSub"/>
	</section>
    <section class="wrap">
       <h1 class="mb-2">${afn:getMessage('my_qna',sessionScope.locale)}</h1>
       <ul class="btns">
            <li><a href="javascript:void(0)" class="ra-num" data-id="con1">${afn:getMessage('today',sessionScope.locale)}</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con2">1${afn:getMessage('week',sessionScope.locale)}</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con3">1${afn:getMessage('month',sessionScope.locale)}</a></li>
            <li><a href="javascript:void(0)" class="ra-num" data-id="con4">3${afn:getMessage('month',sessionScope.locale)}</a></li>
        </ul>
        <form id="form2">
        <div class="date-box">
            <div class="input-box2">
                <div class="cla">
                    <input type="text" id="from_date" name="start_date" class="date_pick" value="<c:out value="${param.start_date}"/>">
                    <!-- <div class="cla-img1"></div> -->
                </div>
                <p class="cla-p1"> ~ </p>
                <div class="cla">
                    <input type="text" id="to_date" name="end_date" class="date_pick" value="<c:out value="${param.end_date}"/>">
                    <!-- <div class="cla-img1"></div> -->
                </div>
            </div>
            <button type="submit" class="date-btn">${afn:getMessage('lookup',sessionScope.locale)}</button>
        </div>
        </form>
        <hr>
        <c:if test="${not empty list}">
        <c:forEach var="list" items="${list}">
        <ul class="product pb-0">
            <ul class="options">
                <li class="width-40"><fmt:parseDate value="${list.reg_date1}" var ='regDate' pattern="yyyy.MM.dd HH:mm"/>
                                        <p><fmt:formatDate value="${regDate}" pattern="yyyy.MM.dd"/><br>
                                        <fmt:formatDate value="${regDate}" pattern="HH:mm"/></li>
                <li><a href="/product/productDetail?product_cd=${list.product_cd}">${list.product_cd}</a></li>
            </ul>
            <ul class="pb-1">
                <li><img src="${list.file_1}" alt=""></li>
                <li>
                    <p>${list.product_made_company_name}</p>
                    <h5>${list.product_name}</h5>
                <%--     <p class="grey">${list.product_model}</p> --%>
                </li>
            </ul>
            <div class="bg_grey p-2">
                <h4>
          
                </h4>
                <h4 class="text-bold my-1">${list.qna_title}</h4>
                <p>${list.qna_rewrite_memo}</p>
            </div>
            <div class="my-1">
                <c:if test="${list.qna_rewrite_memo eq NULL}">
                	<button class="btn btn-blue qna-update"  data-id="${list.qna_id}">${afn:getMessage('update',sessionScope.locale)}</button>
                </c:if>
                <button class="btn btn-red qna-delete" data-id="${list.qna_id}">${afn:getMessage('delete',sessionScope.locale)}</button>
            </div>
        </ul>
        <hr>
        </c:forEach>
        </c:if>
        <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
    </section>

     <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>
