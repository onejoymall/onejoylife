<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>


    <section class="subheader">
        <div class="subTitle">고객센터 전화번호 안내</div>
    </section>
    <section class="wrap qna-wrap">
        <div class="qna-button">
            <a href="tel:1811-9590">
                <i class="chat-ic"></i>
                <p class="qna-title">1811-9590</p>
                <p class="qna-subtitle">문의하기</p>
            </a>
        </div>
        <p class="qna-info">오전 10시 ~ 오후 6시<br> 주말, 공휴일 휴무<br><span>&#40; 점심시간: 12:00 ~ 13:00 &#41;</span></p>
        <p>&#40; 업무 외 시간에는 1:1 문의하기를 이용해 주세요. &#41;</p>
    </section>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>