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
                <div class="r-sec1">
                    <p class="sec1-h1">${afn:getMessage("faq",sessionScope.locale)}</p>
                    <div class="faq-search-box">
                        <span>${afn:getMessage("findFAQ",sessionScope.locale)}</span>
                        <form id="faq-search-form" name="faq-search-form" method="get" >
                            <input type="hidden" name="searchType" value="brdmemo">
                            <input type="text" id="faq-search" class="input-text" name="searchKeyword" value="${param.searchKeyword}">
                            <button id="faq-search-btn" type="submit" class="search-btn">${afn:getMessage("searchFAQ",sessionScope.locale)}</button>
                        </form>
                    </div>
                    <div class="faq-sort-list">
                        <div class="faq-sort-item" id="faq-faq">
                            <a href="/Help/faqCenter?bgno=16&question_type=F">
                                <div class="imgbox"><i></i></div>
                                <p>${afn:getMessage("FQ",sessionScope.locale)}</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-qna">
                            <a href="/Help/faqCenter?bgno=16&question_type=P">
                                <div class="imgbox"><i></i></div>
                                <p>${afn:getMessage("question",sessionScope.locale)}</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-pay">
                            <a href="/Help/faqCenter?bgno=16&question_type=O">
                                <div class="imgbox"><i></i></div>
                                <p>${afn:getMessage("orders_payments",sessionScope.locale)}</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-refund">
                            <a href="/Help/faqCenter?bgno=16&question_type=C">
                                <div class="imgbox"><i></i></div>
                                <p>${afn:getMessage("change_return_refund",sessionScope.locale)}</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-shipping">
                            <a href="/Help/faqCenter?bgno=16&question_type=A">
                                <div class="imgbox"><i></i></div>
                                <p>${afn:getMessage("del_set_as",sessionScope.locale)}</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-event">
                            <a href="/Help/faqCenter?bgno=16&question_type=V">
                                <div class="imgbox"><i></i></div>
                                <p>${afn:getMessage("event_prize",sessionScope.locale)}</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-epoint">
                            <a href="/Help/faqCenter?bgno=16&question_type=S">
                                <div class="imgbox"><i></i></div>
                                <p>${afn:getMessage("e-point",sessionScope.locale)}</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-etc">
                            <a href="/Help/faqCenter?bgno=16&question_type=G">
                                <div class="imgbox"><i></i></div>
                                <p>${afn:getMessage("others_",sessionScope.locale)}</p>
                            </a>
                        </div>
                    </div>
                    <c:if test="${not empty param.searchKeyword}">
                    <div class="faq-search-result active">
                        <p><b class="text-red">"<span id="search1">${param.searchKeyword}</span>"</b> ${afn:getMessage("search_result1-1",sessionScope.locale)}<b class="text-red"><span id="search2">${searchVO.totRow}</span></b>${afn:getMessage("search_result1-2",sessionScope.locale)}</p>
                    </div>
                    </c:if>
                    <ul class="faq-data-list">
                        <li class="faq-data-title">
                            <div class="faq-sort">${afn:getMessage("search_type",sessionScope.locale)}</div>
                            <div class="faq-title">${afn:getMessage("Qtitle",sessionScope.locale)}</div>
                        </li>

                        <c:if test="${not empty listview}">
                            <c:forEach var="listview" items="${listview}" varStatus="status">
                            <li class="faq-data-item">
                                <div class="main-title-box" tabindex="0">
                                    <div class="faq-sort">
                                        ${listview.question_type_name}
                                    </div>
                                    <div class="faq-title"><span>${listview.brdmemo}</span></div>
                                </div>
                                <div class="content-box">
                                   <%-- <div class="faq-setting-box">
                                        <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                    </div>--%>
                                    <div class="faq-content-body">
                                        <div class="faq-content-body-a">
                                            <p>
                                                ${listview.rememo}
                                            </p>
                                        </div>
                                        <div class="faq-content-body-c">
                                            <p>${afn:getMessage("msg_FAQresults",sessionScope.locale)}<span><a href="/Board/boardList?bgno=15">${afn:getMessage("FAQone_to_one",sessionScope.locale)}</a></span></p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                        </c:if>
                        <li class="faq-data-item-none">
                            <p>${afn:getMessage("msg_no_results",sessionScope.locale)}</p>
                        </li>
                    </ul>
                    <form id="form1" name="form1"  method="get">
	                    <c:if test="${not empty param.question_type}">
	                        <input type="hidden" name="question_type" value="${param.question_type}">
                        </c:if>
	                    <c:if test="${not empty param.searchKeyword}">
	                        <input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
                        </c:if>
                        <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
                    </form>
                </div>
            </div>

        </main>
    </div>
</div>


<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>

