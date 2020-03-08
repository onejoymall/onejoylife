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
            <div class="left-nav">
                <h2 class="left-tit"><a href="help-1.html">고객센터</a></h2>
                <ul class="outer-ul">
                    <li class="outer-li"><a href="help-1.html" class="active">ONEJOYLIFE</a></li>
                    <li class="outer-li"><a href="help-2.html">포인트 사용안내</a></li>
                    <li class="outer-li"><a href="help-3.html">FAQ 센터</a></li>
                    <li class="outer-li">1:1 문의하기
                        <ul class="inner-ul">
                            <li><a href="help-4.html">1:1 메일문의 작성</a></li>
                            <li><a href="help-5.html">고객센터 전화번호 안내</a></li>
                        </ul>
                    </li>
                    <li class="outer-li"><a href="help-6.html">채팅 문의하기</a></li>
                    <li class="outer-li"><a href="help-7.html">공지사항</a></li>
                </ul>
            </div>
            <div class="right-contain">
                <div class="r-sec1">
                    <p class="sec1-h1">원조이라이프 소개</p>
                    <div class="intro-imgbox">
                        <img src="../assets/img/onejoylife-img.png">
                        <p class="intro-img-txt">원조이라이프는 여러분의 행복을 책임집니다.</p>
                    </div>
                    <div class="line2"></div>
                    <div class="intro-text">
                        <p><span>원조이라이프는,</span><br> 언제나 여러분과 함께하는 정직하고 바른 자세로<br>늘 도전하고 나아가며 더 나은 내일을 만들어 나가기 위해 노력하는 기업입니다.<br><br>언제나 여러분과 함께하는 정직하고 바른 자세로 늘 도전하고 나아가며 더 나은<br>내일을 만들어 나가기 위해 노력하는 기업입니다. 언제나 여러분과 함께하는 정직하고 바른<br>자세로 늘 도전하고 나아가며<br>더 나은 내일을 만들어 나가기 위해 노력하는 기업입니다.</p>
                    </div>
                    <div class="intro-text">
                        <p><span>원조이라이프의 도전은 앞으로도 계속됩니다.</span><br> 언제나 여러분과 함께하는 정직하고 바른 자세로<br>늘 도전하고 나아가며 더 나은 내일을 만들어 나가기 위해 노력하는 기업입니다.<br><br>언제나 여러분과 함께하는 정직하고 바른 자세로 늘 도전하고 나아가며 더 나은<br>내일을 만들어 나가기 위해 노력하는 기업입니다. 언제나 여러분과 함께하는 정직하고 바른<br>자세로 늘 도전하고 나아가며<br>더 나은 내일을 만들어 나가기 위해 노력하는 기업입니다.<br><br>감사합니다.</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

