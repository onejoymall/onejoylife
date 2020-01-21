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
        <form action="" method="post" name="">
            <h2 class="h2-box">로그인</h2>
            <div class="login-out">
                <div class="login-in">
                    <div class="in-box1">
                        <label for="id-input" class="id-la">아이디(이메일)</label><input type="text" id="id-input" placeholder="아이디를 입력하세요" class="form-con">
                    </div>
                    <div class="in-box2">
                        <label for="pw-input" class="id-la">비밀번호</label><input type="password" id="pw-input" placeholder="비밀번호를 입력하시오" class="form-con">
                    </div>
                </div>
                <div class="login-but">
                    <button type="submit" title="login" class="login-on"><span>로그인</span>
                    </button>
                </div>
            </div>
            <div class="er">회원 아이디 또는 비밀번호가 일치하지 않습니다.</div>
            <div class="option">
                <label for="saveid">
                    <input type="checkbox" id="saveid" checked="checked" class="id-ch ">
                    아이디 저장하기
                </label>
                <a href="for-id-pw.html" class="id-pw">아이디/비밀번호 찾기</a>
            </div>
            <div class="link-box">
                <div class="link-join">
                    <ul class="txt-p1">
                        <li class="txt-w">ㆍ아직 원조이몰 회원이 아니신가요?</li>
                        <li>원조이몰에 가입하시면 다양한 혜택을 누리실 수 있습니다.</li>
                    </ul>
                    <a href="#" class="link-a">회원가입</a>
                </div>
                <div class="link-nonmem">
                    <p class="txt-p2 txt-w">ㆍ비회원 주문/배송 조회가 필요하신가요?</p>
                    <a href="#" class="link-a">비회원 주문조회</a>
                </div>
            </div>
        </form>
    </div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
