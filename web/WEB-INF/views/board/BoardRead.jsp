<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<script>

function chkInputValue(id, msg){
	if ( $.trim($(id).val()) == "") {
		alert(msg+"${afn:getMessage('msg_toWrite',sessionScope.locale)}");
		$(id).focus();
		return false;
	} 
	return true;
}
function fn_SafeFormSubmit(){
	if ( ! chkInputValue("#rewriter1", "${afn:getMessage('rewriter1',sessionScope.locale)}")) return;
	if ( ! chkInputValue("#rememo1", "${afn:getMessage('rememo1',sessionScope.locale)}")) return;
	
	var formData = $("#form1").serialize();
	$.ajax({
		url: "/Board/boardReplySave",
		type:"post", 
		data : formData,
		success: function(result){ 
			if (result!=="") {
				$("#rewriter1").val("");
				$("#rememo1").val("");
				$("#replyList").append(result);
				alert("${afn:getMessage('msg_saved',sessionScope.locale)}");
			} else{
				alert("${afn:getMessage('brd_brd',sessionScope.locale)}");
			}
		}
	})		
}

function fn_replyDelete(reno){
	if (!confirm("${afn:getMessage('msg_deleteask',sessionScope.locale)}")) {
		return;
	}
	$.ajax({
		url: "/Board/boardReplyDelete",
		type:"post", 
		data: {"reno": reno},
		success: function(result){
			if (result=="OK") {
				$("#replyItem"+reno).remove();
				alert("${afn:getMessage('msg_delete',sessionScope.locale)}");
			} else{
				alert("${afn:getMessage('msg_errorbyReply',sessionScope.locale)}");
			}
		}
	})
}

var updateReno = updateRememo = null;
function fn_replyUpdate(reno){
	hideDiv("replyDialog");
	
	$("#replyDiv").show();
	
	if (updateReno) {
		$("#replyDiv").appendTo(document.body);
		$("#reply"+updateReno).text(updateRememo);
	} 
	
	$("#reno2").val(reno);
	$("#rememo2").val($("#reply"+reno).text());
	$("#reply"+reno).text("");
	$("#replyDiv").appendTo($("#reply"+reno));
	$("#rememo2").focus();
	updateReno   = reno;
	updateRememo = $("#rememo2").val();
} 

function fn_replyUpdateSave(){
	if ( ! chkInputValue("#rememo2", "${afn:getMessage('rememo1',sessionScope.locale)}")) return;
	
	var formData = $("#form2").serialize();
	$.ajax({
		url: "/Board/boardReplySave",
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				$("#reply"+updateReno).text($("#rememo2").val());
				$("#replyDiv").hide();
				alert("${afn:getMessage('msg_saved',sessionScope.locale)}");
			} else{
				alert("${afn:getMessage('brd_brd',sessionScope.locale)}");
			}
		}
	})
} 

function fn_replyUpdateCancel(){
	hideDiv("#replyDiv");
	
	$("#reply"+updateReno).text(updateRememo);
	updateReno = updateRememo = null;
} 

function hideDiv(id){
	$(id).hide();
	$(id).appendTo(document.body);
}

function fn_replyReply(reno){
	$("#replyDialog").show();
	
	if (updateReno) {
		fn_replyUpdateCancel();
	} 
	
	$("#reparent3").val(reno);
	$("#rememo3").val("");
	$("#replyDialog").appendTo($("#reply"+reno));
	$("#rewriter3").focus();
} 
function fn_replyReplyCancel(){
	hideDiv("#replyDialog");
} 

function fn_replyReplySave(){
	if ( ! chkInputValue("#rewriter3", "${afn:getMessage('rewriter1',sessionScope.locale)}")) return;
	if ( ! chkInputValue("#rememo3", "${afn:getMessage('rememo1',sessionScope.locale)}")) return;

	var formData = $("#form3").serialize();
	$.ajax({
		url: "/Board/boardReplySave",
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				var parent = $("#reparent3").val();
				$("#replyItem"+parent).after(result);
				hideDiv("#replyDialog");
				alert("저장되었습니다.");
				$("#rewriter3").val("");
				$("#rememo3").val("");
			} else{
				alert("${afn:getMessage('brd_brd',sessionScope.locale)}");
			}
		}
	})	
}
</script>

</head>
<body>
	<h1><c:out value="${bgInfo.bgname}"/></h1>				

		<table border="1" style="width:600px">
			<caption>${afn:getMessage("brd_brd",sessionScope.locale)}</caption>
			<colgroup>
				<col width='15%' />
				<col width='*%' />
			</colgroup>
			<tbody>
				<tr>
					<td>${afn:getMessage("brd_writer",sessionScope.locale)}</td> 
					<td><c:out value="${boardInfo.brdwriter}"/></td> 
				</tr>
				<tr>
					<td>${afn:getMessage("brd_title",sessionScope.locale)}</td> 
					<td><c:out value="${boardInfo.brdtitle}"/></td>  
				</tr>
				<tr>
					<td>${afn:getMessage("brd_content",sessionScope.locale)}</td> 
					<td><c:out value="${boardInfo.brdmemo}" escapeXml="false"/></td> 
				</tr>
				<tr>
					<td>${afn:getMessage("brd_addfile",sessionScope.locale)}</td> 
					<td>
						<c:forEach var="listview" items="${listview}" varStatus="status">	
            				<a href="/Board/fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
							<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
						</c:forEach>					
					</td> 
				</tr>
			</tbody>
		</table>    
		<a href="/Board/boardList?bgno=<c:out value="${boardInfo.bgno}"/>">${afn:getMessage("brd_back",sessionScope.locale)}</a>
		<a href="/Board/boardDelete?bgno=<c:out value="${boardInfo.bgno}"/>&brdno=<c:out value="${boardInfo.brdno}"/>">${afn:getMessage("brd_delete",sessionScope.locale)}</a>
		<a href="/Board/boardForm?brdno=<c:out value="${boardInfo.brdno}"/>">${afn:getMessage("brd_modify",sessionScope.locale)}</a>
		<p>&nbsp;</p>
		
		<c:if test="${bgInfo.bgreply=='Y'}">
			<div style="border: 1px solid; width: 600px; padding: 5px">
				<form id="form1" name="form1">
					<input type="hidden" id="brdno1" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
					${afn:getMessage("brd_writer",sessionScope.locale)}: <input type="text" id="rewriter1" name="rewriter" size="20" maxlength="20"> <br/>
					<textarea id="rememo1" name="rememo" rows="3" cols="60" maxlength="500" placeholder="+${afn:getMessage('msg_answer_PH',sessionScope.locale)}+"></textarea>
					<a href="#" onclick="fn_formSubmit()">${afn:getMessage("brd_save",sessionScope.locale)}</a>
				</form>
			</div>
		</c:if>
				
		<div id="replyList"> 
			<c:forEach var="replylist" items="${replylist}" varStatus="status">
				<div id="replyItem<c:out value="${replylist.reno}"/>"
							style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">	
					<c:out value="${replylist.rewriter}"/> <c:out value="${replylist.redate}"/>
					<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.reno}"/>')">${afn:getMessage("brd_delete",sessionScope.locale)}</a>
					<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.reno}"/>')">${afn:getMessage("brd_modify",sessionScope.locale)}</a>
					<a href="#" onclick="fn_replyReply('<c:out value="${replylist.reno}"/>')">${afn:getMessage("brd_A",sessionScope.locale)}</a>
					<br/>
					<div id="reply<c:out value="${replylist.reno}"/>"><c:out value="${replylist.rememo}"/></div>
				</div><br/>
			</c:forEach>
		</div>

		<div id="replyDiv" style="width: 99%; display:none">
			<form id="form2" name="form2" action="board9ReplySave" method="post">
				<input type="hidden" id="brdno2" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<input type="hidden" id="reno2" name="reno"> 
				<textarea id="rememo2" name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyUpdateSave()">${afn:getMessage("brd_save",sessionScope.locale)}</a>
				<a href="#" onclick="fn_replyUpdateCancel()">${afn:getMessage("QAcancel",sessionScope.locale)}</a>
			</form>
		</div>
		
		<div id="replyDialog" style="width: 99%; display:none">
			<form id="form3" name="form3" action="board9ReplySave" method="post">
				<input type="hidden" id="brdno3" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<input type="hidden" id="reno3" name="reno"> 
				<input type="hidden" id="reparent3" name="reparent"> 
				${afn:getMessage("brd_writer",sessionScope.locale)}: <input type="text" id="rewriter3" name="rewriter" size="20" maxlength="20"> <br/>
				<textarea id="rememo3" name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<a href="#" onclick="fn_replyReplySave()">${afn:getMessage("brd_save",sessionScope.locale)}</a>
				<a href="#" onclick="fn_replyReplyCancel()">${afn:getMessage("QAcancel",sessionScope.locale)}</a>
			</form>
		</div>							

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
