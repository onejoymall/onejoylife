<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-01
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div class="wrap">
    <div class="page-box">
        <main class="clearfix">
            <%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
            <div class="right-contain">
                <p class="sec1-h1">${afn:getMessage("CS_PH",sessionScope.locale)}</p>
                <div class="qna-inner">
                    <div class="qna-wrap">
                        <div class="qna-button">
                            <a href="#">
                                <i class="chat-ic"></i>
                                <p class="qna-title">1811-9590</p>
                                <p class="qna-subtitle">${afn:getMessage("myQA2",sessionScope.locale)}</p>
                            </a>
                        </div>
                        <p class="qna-info">${afn:getMessage("msg_CS_operationTime",sessionScope.locale)}<br><span>&#40; ${afn:getMessage("CS_lunchT",sessionScope.locale)}: 12:00 ~ 13:00 &#41;</span></p>
                        <p>&#40; ${afn:getMessage("msg_CS_info1",sessionScope.locale)} &#41;</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
