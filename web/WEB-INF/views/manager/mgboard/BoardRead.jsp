<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>

<script>

function chkInputValue(id, msg){
	if ( $.trim($(id).val()) == "") {
		alert(msg+" 입력해주세요.");
		$(id).focus();
		return false;
	} 
	return true;
}
function fn_SafeFormSubmit(){
	if ( ! chkInputValue("#rewriter1", "작성자를")) return;
	if ( ! chkInputValue("#rememo1", "글 내용을")) return;
	
	var formData = $("#form1").serialize();
	$.ajax({
		url: "/Manager/boardReplySave",
		type:"post", 
		data : formData,
		success: function(result){ 
			if (result!=="") {
				$("#rewriter1").val("");
				$("#rememo1").val("");
				$("#replyList").append(result);
				alert("저장되었습니다.");
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})
}

$(document).on("click","#mailSender",function () {
	var formData = $("#form1").serialize();
	jQuery.ajax({
		type:"GET",
		url:"/Board/authemail",
		data:formData,

		success : function(data) {
			// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			// TODO
			console.log(data);
			if(data.validateError){
				$.each(data.validateError, function (index, item) {
					if(index != "Error"){//일반에러메세지
						$('#'+index+'Validation').html(item);
					}
				});
			}
		},

		complete : function(data) {
		},
		error : function(xhr, status, error) {
			console.log(xhr+status+error);
		}
	});
})

function fn_replyDelete(reno){
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.ajax({
		url: "/Manager/boardReplyDelete",
		type:"post", 
		data: {"reno": reno},
		success: function(result){
			if (result=="OK") {
				$("#replyItem"+reno).remove();
				alert("삭제되었습니다.");
			} else{
				alert("답변이 있어서 삭제할 수 없습니다.");
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
	if ( ! chkInputValue("#rememo2", "글 내용을")) return;
	
	var formData = $("#form2").serialize();
	$.ajax({
		url: "/Manager/boardReplySave",
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				$("#reply"+updateReno).text($("#rememo2").val());
				$("#replyDiv").hide();
				alert("저장되었습니다.");
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
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
	if ( ! chkInputValue("#rewriter3", "작성자를")) return;
	if ( ! chkInputValue("#rememo3", "글 내용을")) return;

	var formData = $("#form3").serialize();
	$.ajax({
		url: "/Manager/boardReplySave",
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
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})	
}
</script>

<div class="wrap">
	<div class="page-box">
		<main class="clearfix">
			<div class="right-contain">
				<div class="r-sec1">
					<p class="sec1-h1"><c:out value="${bgInfo.bgname}"/></p>
					<p class="sec1-p1"><span>·</span>&nbsp;</p>

					<table>
						<colgroup>
							<col style="width: 160px;">
							<col style="width: 914px;">
						</colgroup>
						<tbody class="sec1-tbody">

							<tr>
								<td>제목</td>
								<td><c:out value="${boardInfo.brdtitle}"/></td>
							</tr>
							<tr class="name-box">
								<td>문의 유형</td>
								<td><c:out value="${boardInfo.question_type_name}" escapeXml="false"/></td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><c:out value="${boardInfo.brdwriter}"/></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><c:out value="${boardInfo.phone}" escapeXml="false"/></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><c:out value="${boardInfo.email}" escapeXml="false"/></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><c:out value="${boardInfo.brdmemo}" escapeXml="false"/></td>
							</tr>

							<tr>
								<td>첨부</td>
								<td>
									<c:forEach var="listview" items="${listview}" varStatus="status">
										<a href="/Board/fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
										<c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>
					<p>&nbsp;</p>
					<a class="btn-default" href="/Manager/boardList?bgno=<c:out value="${boardInfo.bgno}"/>">돌아가기</a>
					<c:if test="${boardInfo.bgno == 9 && sessionScope.level == 10}">
					<a class="btn-default" href="/Manager/boardDelete?bgno=<c:out value="${boardInfo.bgno}"/>&brdno=<c:out value="${boardInfo.brdno}"/>">삭제</a>
					<a class="btn-default" href="/Manager/boardForm?brdno=<c:out value="${boardInfo.brdno}"/>">수정</a>
					</c:if>
					<c:if test="${boardInfo.bgno != 9}">
					<a class="btn-default" href="/Manager/boardDelete?bgno=<c:out value="${boardInfo.bgno}"/>&brdno=<c:out value="${boardInfo.brdno}"/>">삭제</a>
					<a class="btn-default" href="/Manager/boardForm?brdno=<c:out value="${boardInfo.brdno}"/>">수정</a>
					</c:if>
					<p>&nbsp;</p>

					<c:if test="${bgInfo.bgreply=='Y'}">
					
						<div style="border: 1px solid; width: 100%; padding: 5px">
							<form id="form1" name="form1">
								<input type="hidden" id="brdno1" name="brdno" value="<c:out value="${boardInfo.brdno}"/>">
								<input type="hidden" id="email" name="email" value="<c:out value='${boardInfo.email}'/>">
								작성자: <input type="text" id="rewriter1" name="rewriter" size="20" maxlength="20"> <br/>
								<textarea id="rememo1" name="rememo" rows="3" cols="60" maxlength="500" placeholder="답변을 달아주세요."></textarea>
								<button type="button" class="btn-default" id="mailSender" onclick="fn_SafeFormSubmit()">저장</button>
							</form>
						</div>
					</c:if>

					<div id="replyList">
						<c:forEach var="replylist" items="${replylist}" varStatus="status">
							<div id="replyItem<c:out value="${replylist.reno}"/>"
										style="border: 1px solid gray; width: 100%; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">
								<c:out value="${replylist.rewriter}"/> <c:out value="${replylist.redate}"/>
								<button type="button" class="btn-default" onclick="fn_replyDelete('<c:out value="${replylist.reno}"/>')">삭제</button>
								<button type="button" class="btn-default" onclick="fn_replyUpdate('<c:out value="${replylist.reno}"/>')">수정</button>
								<button type="button" class="btn-default" onclick="fn_replyReply('<c:out value="${replylist.reno}"/>')">답변</button>
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
							<button class="btn-default" type="button" onclick="fn_replyUpdateSave()">저장</button>
							<button class="btn-default" type="button" onclick="fn_replyUpdateCancel()">취소</button>
						</form>
					</div>

					<div id="replyDialog" style="width: 99%; display:none">
			<form id="form3" name="form3" action="board9ReplySave" method="post">
				<input type="hidden" id="brdno3" name="brdno" value="<c:out value="${boardInfo.brdno}"/>"> 
				<input type="hidden" id="reno3" name="reno"> 
				<input type="hidden" id="reparent3" name="reparent"> 
				작성자: <input type="text" id="rewriter3" name="rewriter" size="20" maxlength="20"> <br/>
				<textarea id="rememo3" name="rememo" rows="3" cols="60" maxlength="500"></textarea>
				<button type="button" class="button" href="#" onclick="fn_replyReplySave()">저장</button>
				<button type="button" class="button" href="#" onclick="fn_replyReplyCancel()">취소</button>
			</form>
		</div>
				</div>
			</div>
		</main>
	</div>
</div>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
