<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>

    <section class="subheader">
        <div class="subTitle">${afn:getMessage("onejoymall",sessionScope.locale)}<</div>
    </section>
    <div class="intro-imgbox clearfix">
         <p class="intro-img-txt">${afn:getMessage("msg_forOneJoyMall",sessionScope.locale)}<</p>
     </div>
    <div class="wrap clearfix page-list help-1">
        <ul>
            <li><!--2020.05.21 경품안내 추가-->
                <a href="<c:url value="/Help/help-1-1"/>">${afn:getMessage("prize_guide_info",sessionScope.locale)}</a>
                <hr>
            </li>
            <li>
                <a href="<c:url value="/Help/usePointGuid"/>">${afn:getMessage("tousePoint",sessionScope.locale)}</a>
                <hr>
            </li>
            <li>
                <a href="<c:url value="/Help/faqCenter"/>">${afn:getMessage("FAQcenter",sessionScope.locale)}</a>
                <hr>
            </li>
            <li>
                ${afn:getMessage("brd_one_to_one",sessionScope.locale)}
                <hr>
                <ul class="in-ul">
                    <li><a href="<c:url value="/Board/boardList?bgno=15"/>">${afn:getMessage("brd_one_to_one",sessionScope.locale)}</a></li>
                    <li><a href="<c:url value="/Help/csBoard?bgno=15"/>">${afn:getMessage("one_to_oneWrite",sessionScope.locale)}</a></li>
                    <li><a href="<c:url value="/Help/csCenter"/>">${afn:getMessage("myQA",sessionScope.locale)}</a></li>
                </ul>
            </li>
            <li>
                <a href="<c:url value="/Board/boardList?bgno=8"/>">${afn:getMessage("notice",sessionScope.locale)}</a>
                <hr>
            </li>
        </ul>
    </div>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>