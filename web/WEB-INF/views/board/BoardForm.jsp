<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>


<div class="wrap">
    <div class="page-box">
        <main class="clearfix">
            <%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
            <div class="right-contain">
                <form id="form1" name="form1" action="/Board/boardSave" method="post" enctype="multipart/form-data">
                    <div class="r-sec1">
                        <p class="sec1-h1"><c:out value="${bgInfo.bgname}"/></p>
                        <p class="sec1-p1"><span>·</span>&nbsp;</p>
                        <table>
                            <colgroup>
                                <col style="width: 160px;">
                                <col style="width: 914px;">
                            </colgroup>
                            <tbody class="sec1-tbody">
                            <tr class="name-box">
                                <td>${afn:getMessage("brd_writer",sessionScope.locale)}</td>
                                <td><input type="text" id="brdwriter" name="brdwriter" size="20" maxlength="20" value="<c:out value="${boardInfo.brdwriter}"/>"></td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("brd_title",sessionScope.locale)}</td>
                                <td><input type="text" id="brdtitle" name="brdtitle" size="70" maxlength="250" value="<c:out value="${boardInfo.brdtitle}"/>"></td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("brd_content",sessionScope.locale)}</td>
                                <td><textarea id="brdmemo" name="brdmemo" rows="5" cols="60"><c:out value="${boardInfo.brdmemo}"/></textarea></td>
                            </tr>
                            <tr>
                                <td>${afn:getMessage("brd_addfile",sessionScope.locale)}</td>
                                <td>
                                    <c:forEach var="listview" items="${listview}" varStatus="status">
                                        <input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>">
                                        <a href="/Board/fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
                                            <c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
                                    </c:forEach>

                                    <input type="file" name="uploadfile" multiple="" />
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p class="ex"><span class="bullet-point">·</span><span>&nbsp;</span></p>
                        <input type="hidden" name="bgno" value="<c:out value="${bgno}"/>">
                        <input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>">
                    </div>
                    <div class="button-box">
                        <button type="button" onclick="fn_formSubmit()">${afn:getMessage("brd_save",sessionScope.locale)}</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</div>
<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>