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
                <form action="" method="POST">
                    <div class="r-sec1">
                        <p class="sec1-h1">1:1 문의하기</p>
                        <p class="sec1-p1"><span>·</span> 문의하신 내용에 대한 답변은 질문 시 등록하신 이메일에서 확인하실 수 있습니다.</p>
                        <div></div>
                    </div>
                    <div class="main-box">
                        <p>1:1 문의가 접수 되었습니다.</p>
                        <div class="button-box">
                            <button type="button">확인</button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

