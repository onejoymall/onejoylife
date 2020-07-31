    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
        <div class="left-nav">
            <h2 class="left-tit"><a href="/Help/csinfo">${afn:getMessage('customer_service',sessionScope.locale)}</a></h2>
            <ul class="outer-ul">
                <li class="outer-li"><a href="/Help/csinfo" class="<c:if test="${leftNavOrder == 1}">active</c:if>">${afn:getMessage('prize_guide_info',sessionScope.locale)}</a></li>
                <li class="outer-li"><a href="/Help/usePointGuid" class="<c:if test="${leftNavOrder == 2}">active</c:if>">${afn:getMessage('tousePoint',sessionScope.locale)}</a></li>
                <li class="outer-li"><a href="/Help/faqCenter?bgno=16" class="<c:if test="${leftNavOrder == 7}">active</c:if>">${afn:getMessage('FAQcenter',sessionScope.locale)}</a></li>
                <li class="outer-li"><a href="/Board/boardList?bgno=15" class="<c:if test="${leftNavOrder == 3}">active</c:if>">${afn:getMessage('1:1question',sessionScope.locale)}</a>
                    <ul class="inner-ul">
                        <li><a href="/Board/boardList?bgno=15" class="<c:if test="${leftNavOrder == 4}">active</c:if>">${afn:getMessage('1:1question',sessionScope.locale)}</a></li>
                        <li><a href="/Help/csCenter" class="<c:if test="${leftNavOrder == 5}">active</c:if>">${afn:getMessage('csPH',sessionScope.locale)}</a></li>
                    </ul>
                </li>
                <li class="outer-li"><a href="http://pf.kakao.com/_xezzxoj" target="_blank" class="<c:if test="${leftNavOrder == 6}">active</c:if>">${afn:getMessage('chat_inquiry',sessionScope.locale)}</a></li>
                <li class="outer-li"><a href="/Board/boardList?bgno=8" class="<c:if test="${leftNavOrder == 8}">active</c:if>">${afn:getMessage('notice',sessionScope.locale)}</a></li>
            </ul>
        </div>