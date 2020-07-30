<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

    <div class="wrap">
        <div class="page-box">
            <main class="clearfix">
                <c:import url="/layout/scrollRight"/>
                <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
                <div class="right-contain">
                    <form name="defaultForm" id="defaultForm" method="POST" onsubmit="return false;">
                        <p class="sec1-h1">${afn:getMessage('user_info',sessionScope.locale)} ${afn:getMessage('confirm',sessionScope.locale)}</p>
                        <div class="r-sec1">
                            <p class="sec-p">${afn:getMessage('msg.user.pw_confirm',sessionScope.locale)}</p>
                            <table>
                                <colgroup>
                                    <col style="width: 180px;">
                                    <col style="width: 714px;">
                                </colgroup>
                                <tbody class="sec1-tbody">
                                    <tr>
                                        <td class="sec1-td-bor1 txt-a">${afn:getMessage('id',sessionScope.locale)} (${afn:getMessage('email',sessionScope.locale)})</td>
                                        <td class="td-mar padding-left">
                                            <div class="body-td1-1">
                                                <span>${sessionScope.email}</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sec1-td-bor1 txt-a">${afn:getMessage('password',sessionScope.locale)}</td>
                                        <td class="body-td2 padding-left">
                                            <input type="password" name="password">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="r-sec2">
                            <button type="submit" id="formSubmit">${afn:getMessage('confirm',sessionScope.locale)}</button>
                        </div>
                    </form>
                </div>   
            </main>   
        </div>     
    </div>
<script>
</script>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>