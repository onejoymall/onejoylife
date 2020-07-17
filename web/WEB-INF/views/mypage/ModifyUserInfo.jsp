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
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <form action="/MyPage/ModifyUserInfoForm" method="POST">
                    <p class="sec1-h1">회원정보 확인</p>
                    <div class="r-sec1">
                        <p class="sec-p">회원님의 안전한 개인정보 보호를 위해 비밀번호를 다시 한번 확인 합니다.</p>
                        <table>
                            <colgroup>
                                <col style="width: 180px;">
                                <col style="width: 714px;">
                            </colgroup>
                            <tbody class="sec1-tbody">
                            <tr>
                                <td class="sec1-td-bor1 txt-a">아이디 (이메일)</td>
                                <td class="td-mar padding-left">
                                    <div class="body-td1-1">
                                        <span>gildonghong@onejoy.co.kr</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="sec1-td-bor1 txt-a">비밀번호</td>
                                <td class="body-td2 padding-left">
                                    <input type="password">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <button type="submit">확인</button>
                    </div>
                </form>
            </div>
        </main>

    </div>
</div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>