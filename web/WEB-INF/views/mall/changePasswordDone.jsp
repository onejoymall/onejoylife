<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="login-box">
        <div class="path">
            <ul>
                <li class="path-color">ㆍ</li>
                <li><a href="#">HOME ＞</a></li>
                <li><a href="#"> 아이디/비밀번호 찾기</a></li>
            </ul>
        </div>
        <div class="h2-box">
            <h2>아이디/비밀번호 찾기</h2>
            <p>회원가입 시 입력하신 정보로 아이디와 비밀번호를 확인하실 수 있습니다.</p>
        </div>
        <form action="" method="POST">
            <div class="tab-box">
                <input type="radio" name="rd" id="rd1" class="rd-box" <c:if test="${not empty id}">checked</c:if>>
                <label for="rd">아이디(이메일) 찾기</label>
                <input type="radio" name="rd" id="rd2" class="rd-box" <c:if test="${empty id}">checked</c:if>>
                <label for="rd">비밀번호 찾기</label>
                <div class="for-id">
                    <div class="box-in">
                        <p class="tit-id">회원님께서 등록하신 ID는 <span>${id}</span>입니다.</p>
                        <div class="but-type2">
                            <a href="<c:url value="/sign/login"/>" class="but-1" id="redirectLogin">로그인</a>
                        </div>
                    </div>
                </div>
                <div class="for-pw">
                    <div class="box-in">
                        <p class="tit-id">신규로 입력하신 비밀번호로 변경이 완료되었습니다.</p>
                        <div class="but-type2">
                            <a href="<c:url value="/sign/login"/>" class="but-1" id="redirectLogin">로그인</a>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
