    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <div class="left-nav">
            <h2 class="left-tit"><a href="/Help/csinfo">고객센터</a></h2>
            <ul class="outer-ul">
                <li class="outer-li"><a href="/Help/csinfo" class="<c:if test="${leftNavOrder == 1}">active</c:if>">ONEJOYLIFE</a></li>
                <li class="outer-li"><a href="/Help/usePointGuid" class="<c:if test="${leftNavOrder == 2}">active</c:if>">포인트 사용안내</a></li>
                <li class="outer-li"><a href="/Help/faqCenter" class="<c:if test="${leftNavOrder == 3}">active</c:if>">FAQ 센터</a></li>
                <li class="outer-li"><a href="/Board/boardList?bgno=15" class="<c:if test="${leftNavOrder == 3}">active</c:if>">1:1 문의</a>
                    <ul class="inner-ul">
                        <li><a href="/Board/boardList?bgno=15" class="<c:if test="${leftNavOrder == 4}">active</c:if>">1:1 문의</a></li>
                        <li><a href="/Help/csCenter" class="<c:if test="${leftNavOrder == 5}">active</c:if>">고객센터 전화번호 안내</a></li>
                    </ul>
                </li>
                <li class="outer-li"><a href="http://pf.kakao.com/_xezzxoj" target="_blank" class="<c:if test="${leftNavOrder == 6}">active</c:if>">채팅 문의하기</a></li>
                <li class="outer-li"><a href="/Board/boardList?bgno=8" class="<c:if test="${leftNavOrder == 8}">active</c:if>">공지사항</a></li>
            </ul>
        </div>