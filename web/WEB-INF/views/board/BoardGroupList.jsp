<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
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
    	alert("${afn:getMessage('brd_alert7',sessionScope.locale)}");
    	return;
    }
    if (selectedNode.childList){
    	alert("${afn:getMessage('brd_alert1',sessionScope.locale)}");
    	return;
    }
    
    if(!confirm("${afn:getMessage('brd_alert2',sessionScope.locale)}")) return;
    $.ajax({
    	url: "/Manager/boardGroupDelete",
    	cache: false,
    	data: { bgno : selectedNode.data.key }    	
    }).done(receiveData4Delete);
}

function receiveData4Delete(data){
	alert("${afn:getMessage('brd_alert3',sessionScope.locale)}");
	selectedNode.remove();		
	selectedNode = null;
	fn_groupNew();
}

function fn_groupSave(){
	if($("#bgname").val() == ""){
		alert("${afn:getMessage('brd_alert4',sessionScope.locale)}");
		return;
	}
	var pid=null;
    if (selectedNode!=null) pid=selectedNode.data.key;

    if (!confirm("${afn:getMessage('brd_alert5',sessionScope.locale)}")) return;

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
	
	alert("${afn:getMessage('brd_alert6',sessionScope.locale)}");
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
			<h2>${afn:getMessage("brd_mng",sessionScope.locale)}</h2>
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
					<p>* ${afn:getMessage("msg_infoToSave1-1",sessionScope.locale)}</p>
					<p>* ${afn:getMessage("msg_infoToSave1-2",sessionScope.locale)}</p>

				</div>
				<div class="right"><button class="btn-default" onclick="fn_groupNew()" >${afn:getMessage("brd_add",sessionScope.locale)}</button></div>

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
							<td>${afn:getMessage("groupN",sessionScope.locale)}</td>
							<td>
								<input name="bgname" id="bgname" style="width: 300px;" type="text" maxlength="100" value="">
							</td>
						</tr>
						<tr>
							<td>${afn:getMessage("brdmanage",sessionScope.locale)}</td>
							<td>
								<a href="" id="showMgBgno" class="btn-default">* ${afn:getMessage("msg_chooseBrdTypeMng",sessionScope.locale)}</a>
							</td>
						</tr>
						<tr>
							<td>${afn:getMessage("brd_usual",sessionScope.locale)}</td>
							<td>
								<a href="" id="showBgno" class="btn-default">* ${afn:getMessage("msg_chooseBrdTypeMng",sessionScope.locale)}</a>
							</td>
						</tr>
						<tr class="radio-td">
							<td>${afn:getMessage("brd_usechk",sessionScope.locale)}</td>
							<td class="radio-td">
								<input name="bgused" id="bgusedY" type="radio" checked="checked" value="Y" class="styleClass">
								<label for="bgusedY"><span>${afn:getMessage("brd_use",sessionScope.locale)}</span></label>
								<input name="bgused" id="bgusedN" type="radio" value="N" class="styleClass">
								<label for="bgusedN"><span>${afn:getMessage("brd_nonuse",sessionScope.locale)}</span></label>
							</td>
						</tr>
						<tr class="radio-td">
							<td>${afn:getMessage("brd_insertallow",sessionScope.locale)}</td>
							<td>
								<input name="bgreadonly" id="bgreadonlyN" type="radio" checked="checked" value="N" class="styleClass"><label for="bgreadonlyN"><span>${afn:getMessage("brd_use",sessionScope.locale)}</span></label>
								<input name="bgreadonly" id="bgreadonlyY" type="radio" value="Y" class="styleClass"><label for="bgreadonlyY"><span>${afn:getMessage("brd_nonuse",sessionScope.locale)}</span></label>
							</td>
						</tr>
						<tr class="radio-td">
							<td>${afn:getMessage("brd_A",sessionScope.locale)}</td>
							<td>
								<input name="bgtype" id="board" type="radio" checked="checked" value="board" class="styleClass"><label for="board"><span>${afn:getMessage("brd_brd",sessionScope.locale)}</span></label>
								<input name="bgtype" id="faq" type="radio" value="faq" class="styleClass"><label for="faq"><span>${afn:getMessage("brd_FAQ",sessionScope.locale)}</span></label>
								<input name="bgtype" id="1:1" type="radio" value="1:1" class="styleClass"><label for="1:1"><span>${afn:getMessage("brd_one_to_one",sessionScope.locale)}</span></label>
							</td>
						</tr>
						<tr class="radio-td">
							<td>${afn:getMessage("brd_type",sessionScope.locale)}</td>
							<td>
								<input name="bgreply" id="bgreplyY" type="radio" checked="checked" value="Y" class="styleClass"><label for="bgreplyY"><span>${afn:getMessage("brd_use",sessionScope.locale)}</span></label>
								<input name="bgreply" id="bgreplyN" type="radio" value="N" class="styleClass"><label for="bgreplyN"><span>${afn:getMessage("brd_nonuse",sessionScope.locale)}</span></label>
							</td>
						</tr>
						</tbody>
					</table>
					<p>&nbsp;</p>
				</form>
				<div style="text-align: right;">
					<button class="btn-default" onclick="fn_groupSave()" href="#">${afn:getMessage("brd_save",sessionScope.locale)}</button>
					<button class="btn-default" onclick="fn_groupDelete()" href="#">${afn:getMessage("brd_delete",sessionScope.locale)}</button>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>