<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>

    <section class="subheader">
        <div class="subTitle">원조이라이프 소개</div>
    </section>
    <div class="intro-imgbox clearfix">
         <p class="intro-img-txt">원조이라이프는 여러분의 행복을 책임집니다.</p>
     </div>
    <div class="wrap clearfix page-list help-1">
        <ul>
            <li>
                <a href="<c:url value="/Help/usePointGuid"/>">포인트 사용안내</a>
                <hr>
            </li>
            <li>
                <a href="<c:url value="/Help/faqCenter"/>">FAQ 센터</a>
                <hr>
            </li>
            <li>
                1:1 문의하기
                <hr>
                <ul class="in-ul">
                    <li><a href="<c:url value="/Help/csBoard?bgno=15"/>">1:1 문의 작성</a></li>
                    <li><a href="<c:url value="/Help/csCenter"/>">고객센터 전화번호 안내</a></li>
                </ul>
            </li>
            <li>
                <a href="<c:url value="/Board/boardList?bgno=8"/>">공지사항</a>
                <hr>
            </li>
        </ul>
    </div>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>