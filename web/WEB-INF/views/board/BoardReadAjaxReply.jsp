<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<div id="replyItem<c:out value="${replyInfo.reno}"/>" 
	 style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*replyInfo.redepth}"/>px; display: inline-block">	
	<c:out value="${replyInfo.rewriter}"/> <c:out value="${replyInfo.redate}"/>
	<a href="#" onclick="fn_replyDelete('<c:out value="${replyInfo.reno}"/>')">${afn:getMessage("brd_delete",sessionScope.locale)}</a>
	<a href="#" onclick="fn_replyUpdate('<c:out value="${replyInfo.reno}"/>')">${afn:getMessage("brd_modify",sessionScope.locale)}</a>
	<a href="#" onclick="fn_replyReply('<c:out value="${replyInfo.reno}"/>')">${afn:getMessage("brd_A",sessionScope.locale)}</a>
	<br/>
	<div id="reply<c:out value="${replyInfo.reno}"/>"><c:out value="${replyInfo.rememo}"/></div>
</div><br/>