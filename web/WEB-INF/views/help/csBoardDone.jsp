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
                <form action="" method="POST">
                    <div class="r-sec1">
                        <p class="sec1-h1">${afn:getMessage("FAQone_to_one",sessionScope.locale)}</p>
                        <p class="sec1-p1"><span>·</span>${afn:getMessage("msg_QAbyEmail",sessionScope.locale)}</p>
                        <div></div>
                    </div>
                    <div class="main-box">
                        <p>${afn:getMessage("msg_QAinsert",sessionScope.locale)}</p>
                        <div class="button-box">
                            <button type="button">${afn:getMessage("QAok",sessionScope.locale)}</button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>