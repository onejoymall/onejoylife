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
<div class="wrap">
    <div class="page-box">
        <main class="clearfix">
            <%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
            <div class="right-contain">
                <div class="r-sec1">
                    <p class="sec1-h1">FAQ</p>
                    <div class="faq-search-box">
                        <span>FAQ 검색</span>
                        <form id="faq-search-form" name="faq-search-form" method="get" >
                            <input type="hidden" name="searchType" value="brdmemo">
                            <input type="text" id="faq-search" class="input-text" name="searchKeyword" value="${param.searchKeyword}">
                            <button id="faq-search-btn" type="submit" class="search-btn">검색</button>
                        </form>
                    </div>
                    <div class="faq-sort-list">
                        <div class="faq-sort-item" id="faq-faq">
                            <a href="/Help/faqCenter?bgno=16&question_type=F">
                                <div class="imgbox"><i></i></div>
                                <p>자주하는질문</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-qna">
                            <a href="/Help/faqCenter?bgno=16&question_type=P">
                                <div class="imgbox"><i></i></div>
                                <p>상품문의</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-pay">
                            <a href="/Help/faqCenter?bgno=16&question_type=O">
                                <div class="imgbox"><i></i></div>
                                <p>주문/결제</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-refund">
                            <a href="/Help/faqCenter?bgno=16&question_type=C">
                                <div class="imgbox"><i></i></div>
                                <p>교환/반품/환불</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-shipping">
                            <a href="/Help/faqCenter?bgno=16&question_type=A">
                                <div class="imgbox"><i></i></div>
                                <p>배송/설치/AS</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-event">
                            <a href="/Help/faqCenter?bgno=16&question_type=V">
                                <div class="imgbox"><i></i></div>
                                <p>이벤트/경품</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-epoint">
                            <a href="/Help/faqCenter?bgno=16&question_type=S">
                                <div class="imgbox"><i></i></div>
                                <p>E-포인트</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-etc">
                            <a href="/Help/faqCenter?bgno=16&question_type=G">
                                <div class="imgbox"><i></i></div>
                                <p>기타</p>
                            </a>
                        </div>
                    </div>
                    <c:if test="${not empty param.searchKeyword}">
                    <div class="faq-search-result active">
                        <p><b class="text-red">"<span id="search1">${param.searchKeyword}</span>"</b>관련 검색결과 총 <b class="text-red"><span id="search2">${searchVO.totRow}</span></b> 개가 검색되었습니다.</p>
                    </div>
                    </c:if>
                    <ul class="faq-data-list">
                        <li class="faq-data-title">
                            <div class="faq-sort">타입</div>
                            <div class="faq-title">질문 제목</div>
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
                                            <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            </c:forEach>
                        </c:if>
                        <li class="faq-data-item-none">
                            <p>검색된 결과가 없습니다.</p>
                        </li>
                    </ul>
                    <form id="form1" name="form1"  method="get">
                        <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
                    </form>
                </div>
            </div>

        </main>
    </div>
</div>


<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

