<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-07-27
  Time: 오후 8:40
  To change this template use File | Settings | File Templates.
--%>
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

 <%--<h2 class="pb-1">공유현황</h2>
       <ul class="btns">
            <li><a href="#" class="active">오늘</a></li>
            <li><a href="#">1주일</a></li>
            <li><a href="#">1개월</a></li>
            <li><a href="#">3개월</a></li>
            <li><a href="#">기간설정</a></li>
        </ul>
        <div class="date-box">
            <div class="input-box2">
                <div class="cla">
                    <input type="text" id="from_date" name="from_date" class="date_pick">
                    <!-- <div class="cla-img1"></div> -->
                </div>
                <p class="cla-p1"> ~ </p>
                <div class="cla">
                    <input type="text" id="to_date" name="to_date" class="date_pick">
                    <!-- <div class="cla-img1"></div> -->
                </div>
            </div>
            <button type="button" class="date-btn">조회</button>
        </div>--%>
        <h2 class="py-1">${afn:getMessage('shared_product',sessionScope.locale)}</h2>
        <hr>

        <c:if test="${not empty list}">
        <c:forEach var="list" items="${list}">
        <ul class="product pb-0">
            <h5><fmt:formatDate value="${list.reg_date}" pattern="yyyy.MM.dd"/></h5>
            <ul class="pb-0">
                <li><img src="${list.file_1}" alt=""></li>
                <li>
                    <c:if test="${not empty list.giveaway_id}">
                        <h5>
                        <a href="<c:url value="/giveaway/giveawaydetail?giveaway_id="/>${list.giveaway_id}" style="text-decoration: none; color:black;">
                        ${list.product_name}
                        </a></h5>
                    </c:if>
                    <c:if test="${not empty list.product_cd}">
                        <h5>
                        <a href="<c:url value="/product/productDetail?product_cd="/>${list.product_cd}" style="text-decoration: none; color:black;">
                        ${list.product_name}
                        </a></h5>
                    </c:if>
                </li>
            </ul>
            <ul class="options mt-1 bg_grey p-1">
                <li>${afn:getMessage('shared_method',sessionScope.locale)}</li>
                <li class="fs-15">${afn:getMessage('cacaotake',sessionScope.locale)}</li>
            </ul>

        </ul>
        <hr>
        </c:forEach>
        </c:if>

    <c:if test="${empty list}">
        	${afn:getMessage('msg.none_content',sessionScope.locale)}
        	<hr>
        </c:if>
        <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
    </section>
    </form>
     <c:import url="/layout/footer"/>