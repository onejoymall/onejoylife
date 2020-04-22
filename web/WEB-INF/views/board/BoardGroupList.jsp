<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<script type="text/javascript"> 
var selectedNode = null;

$(function(){
	$("#tree").dynatree({
		children: <c:out value="${treeStr}" escapeXml="false"/>,
		onActivate: TreenodeActivate
	});
	fn_groupNew();
});
function TreenodeActivate(node) {
	selectedNode = node;
	
    if (selectedNode==null || selectedNode.data.key==0) return;
    $.ajax({
    	url: "/Manager/boardGroupRead",
    	cache: false,
    	data: { bgno : selectedNode.data.key }    	
    }).done(receiveData);
}

function receiveData(data){
	console.log(data)
    $("#bgno").val(data.bgno);
    $("#bgname").val(data.bgname);
    $('#showBgno').attr("href","<c:url value="/Board/boardList?bgno="/>"+data.bgno);
	$('#showBgno').html("<c:url value="/Board/boardList?bgno="/>"+data.bgno);
	$('#showMgBgno').attr("href","<c:url value="/Manager/boardList?bgno="/>"+data.bgno);
	$('#showMgBgno').html("<c:url value="/Manager/boardList?bgno="/>"+data.bgno);
	$('input:radio[name="bgused"][value="' + data.bgused + '"]').prop('checked', true);
	$('input:radio[name="bgreadonly"][value="' + data.bgreadonly + '"]').prop('checked', true);
	$('input:radio[name="bgreply"][value="' + data.bgreply + '"]').prop('checked', true);
	$('input:radio[name="bgtype"][value="' + data.bgtype + '"]').prop('checked', true);
}

function fn_groupNew(){
    $("#bgno").val("");
    $("#bgname").val("");
	$('input:radio[name="bgused"][value="Y"]').prop('checked', true);
	$('input:radio[name="bgreadonly"][value="N"]').prop('checked', true);
	$('input:radio[name="bgreply"][value="Y"]').prop('checked', true);

}

function fn_groupDelete(value){
    if (selectedNode==null){
    	alert("삭제할 게시판을 선택해 주세요!");
    	return;
    }
    if (selectedNode.childList){
    	alert("하위 게시판이 있는 게시판은 삭제 할 수 없습니다.");
    	return;
    }
    
    if(!confirm("삭제하시겠습니까?")) return;
    $.ajax({
    	url: "/Manager/boardGroupDelete",
    	cache: false,
    	data: { bgno : selectedNode.data.key }    	
    }).done(receiveData4Delete);
}

function receiveData4Delete(data){
	alert("삭제되었습니다!");
	selectedNode.remove();		
	selectedNode = null;
	fn_groupNew();
}

function fn_groupSave(){
	if($("#bgname").val() == ""){
		alert("게시판 이름을 입력해주세요.");
		return;
	}
	var pid=null;
    if (selectedNode!=null) pid=selectedNode.data.key;

    if (!confirm("저장하시겠습니까?")) return;

    $.ajax({
    	url: "/Manager/boardGroupSave",
    	cache: false,
    	type: "POST",
    	data: $('#defaultForm').serialize()
    }).done(receiveData4Save);
}

function receiveData4Save(data){
	if (selectedNode!==null && selectedNode.data.key===data.bgno) {
		selectedNode.data.title=data.bgname;
		selectedNode.render();
	} else {
		addNode(data.bgno, data.bgname);
	}
	
	alert("저장되었습니다.");
}

function addNode(nodeNo, nodeTitle){
	var node = $("#tree").dynatree("getActiveNode");
	if (!node) node = $("#tree").dynatree("getRoot");
	var childNode = node.addChild({key: nodeNo, title: nodeTitle});
	node.expand() ;
	node.data.isFolder=true;
	node.tree.redraw();
}
</script>

<main>
	<div class="main-content">
		<div class="main-title">
			<h2>게시판 관리</h2>
		</div>
		<div class="join-form-box">
			<div style="width:300px; height:400px; overflow:auto; display: inline-block;" >
				<div id="tree">
					<ul id="treeData" style="display: none;">

					</ul>
				</div>
			</div>
			<div style="width:1000px ; padding-left: 10px; display: inline-block;vertical-align:top;background: #fff;padding:15px;">
				<div class="left">
					<p>* 대분류 추가시 화면세로고침 후 그룹명 입력 > 저장</p>
					<p>* 하위 분류 추가시 상위 게시판 선택 후 "추가" 버튼 클릭 > 그룹명 입력 > 저장</p>

				</div>
				<div class="right"><button class="btn-default" onclick="fn_groupNew()" >추가</button></div>

				<p>&nbsp;</p>
				<form name="defalutForm" id="defaultForm" method="POST">
					<input name="bgno" id="bgno" type="hidden" value="">
					<table class="right-table rightTable">
						<colgroup>
							<col style="width: 160px;">
							<col style="width: 914px;">
						</colgroup>
						<tbody class="sec1-tbody">
						<tr>
							<td>그룹명</td>
							<td>
								<input name="bgname" id="bgname" style="width: 300px;" type="text" maxlength="100" value="">
							</td>
						</tr>
						<tr>
							<td>관리</td>
							<td>
								<a href="" id="showMgBgno" class="btn-default">* 관리할 게시판을 선택하세요</a>
							</td>
						</tr>
						<tr>
							<td>일반</td>
							<td>
								<a href="" id="showBgno" class="btn-default">* 관리할 게시판을 선택하세요</a>
							</td>
						</tr>
						<tr class="radio-td">
							<td>사용여부</td>
							<td class="radio-td">
								<input name="bgused" id="bgusedY" type="radio" checked="checked" value="Y" class="styleClass">
								<label for="bgusedY"><span>사용</span></label>
								<input name="bgused" id="bgusedN" type="radio" value="N" class="styleClass">
								<label for="bgusedN"><span>사용중지</span></label>
							</td>
						</tr>
						<tr class="radio-td">
							<td>등록가능</td>
							<td>
								<input name="bgreadonly" id="bgreadonlyN" type="radio" checked="checked" value="N" class="styleClass"><label for="bgreadonlyN"><span>사용</span></label>
								<input name="bgreadonly" id="bgreadonlyY" type="radio" value="Y" class="styleClass"><label for="bgreadonlyY"><span>사용중지</span></label>
							</td>
						</tr>
						<tr class="radio-td">
							<td>답변</td>
							<td>
								<input name="bgtype" id="board" type="radio" checked="checked" value="board" class="styleClass"><label for="board"><span>게시판</span></label>
								<input name="bgtype" id="faq" type="radio" value="faq" class="styleClass"><label for="faq"><span>FAQ</span></label>
								<input name="bgtype" id="1:1" type="radio" value="1:1" class="styleClass"><label for="1:1"><span>1:1 문의</span></label>
							</td>
						</tr>
						<tr class="radio-td">
							<td>게시판 종류</td>
							<td>
								<input name="bgreply" id="bgreplyY" type="radio" checked="checked" value="Y" class="styleClass"><label for="bgreplyY"><span>사용</span></label>
								<input name="bgreply" id="bgreplyN" type="radio" value="N" class="styleClass"><label for="bgreplyN"><span>사용중지</span></label>
							</td>
						</tr>
						</tbody>
					</table>
					<p>&nbsp;</p>
				</form>
				<div style="text-align: right;">
					<button class="btn-default" onclick="fn_groupSave()" href="#">저장</button>
					<button class="btn-default" onclick="fn_groupDelete()" href="#">삭제</button>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>