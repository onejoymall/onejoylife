<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>


    <section class="subheader">
        <div class="subTitle">${afn:getMessage("csPnInfo",sessionScope.locale)}</div>
    </section>
    <section class="wrap qna-wrap">
        <div class="qna-button">
            <a href="tel:1811-9590">
                <i class="chat-ic"></i>
                <p class="qna-title">1811-9590</p>
                <p class="qna-subtitle">${afn:getMessage("FAQone_to_one",sessionScope.locale)}</p>
            </a>
        </div>
        <p class="qna-info">${afn:getMessage("msg_help5-1",sessionScope.locale)}<br> ${afn:getMessage("msg_help5-2",sessionScope.locale)}<br><span>&#40; ${afn:getMessage("msg_help5-3",sessionScope.locale)} &#41;</span></p>
        <p>&#40; ${afn:getMessage("msg_help5-4",sessionScope.locale)} &#41;</p>
    </section>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>