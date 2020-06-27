<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">FAQ 관리</h2>
                <div class="main-hd-btn-wrap">
<%--                    <a href="/Manager/boardForm?bgno=<c:out value="${searchVO.bgno}"/>" nam>글쓰기</a>--%>
                    <button type="button" name="detail">게시글 등록</button>
                </div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                    	<input type="hidden" name="bgno" value="16"/>
                        <input type="text" class="keyword-src" name="searchKeyword" value="${param.searchKeyword}">
                        <button type="submit" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="searchType" value="brdmemo" id="check2" checked>
                            <label for="check2">FAQ</label>
                        </div>
                    </div>
                    <table class="keyword-src-table">
                        <colgroup>
                            <col width="80px">
                            <col width="420px">
                            <col width="80px">
                            <col width="420px">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>등록일</th>
                            <td>
                                <div class="input-box2">
                                    <div class="cla">
                                        <input type="text" id="start_date" name="start_date" class="date_pick" value="${param.start_date}">
                                        <div class="cla-img1"></div>
                                    </div>
                                    <p class="cla-p1"> ~ </p>
                                    <div class="cla">
                                        <input type="text" id="end_date" name="end_date" class="date_pick" value="${param.end_date}">
                                        <div class="cla-img1"></div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="goods-list-wrap">
                <div class="list-sort-wrap">
                    <div class="left">
                        <button type="button" class="goods-list-btn" name="copy" id="listDelete">선택 삭제</button>
                    </div>
<%--                    <div class="right">--%>
<%--                        <select name="order" class="order-select">--%>
<%--                            <option value="32">10개씩 보기</option>--%>
<%--                            <option value="60">50개씩 보기</option>--%>
<%--                            <option value="92">100개씩 보기</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
                </div>
                <form name="defaultListForm" id="defaultListForm" method="post">
                    <input type="hidden" name="Pk" value="${Pk}">
                    <input type="hidden" name="table_name" value="${table_name}">
                <table>
                    <colgroup>
                        <col width="2%">
                        <col width="5%"> 
                        <col width="5%">
                        <col width="10%">
                        <col width="50%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>번호</td>
                            <td>작성자</td>
                            <td>분류</td>
                            <td>FAQ</td>
                            <td>등록일</td>
                            <td>관리</td>
                        </tr>
                    </thead>
                    <tbody>

                <c:forEach var="listview" items="${listview}" varStatus="status">
                    <c:url var="link" value="/Manager/boardRead">
                        <c:param name="brdno" value="${listview.brdno}" />
                    </c:url>

                       <tr>
                           <td><input type="checkbox" name="chk" value="${listview.brdno}"></td>
                           <td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></td>
                           <td><c:out value="${listview.brdwriter}"/></td>
                           <td>
                                   ${listview.question_type_name}
                           </td>
                            <td><c:out value="${listview.brdmemo}"/></td>
                           <td><c:out value="${listview.brddate}"/></td>
                            <td>
                                <button type="button" class="goods-list-btn" onclick="faqSelect('${bgInfo.bgno}','${listview.brdno}')">상세보기</button>
                            </td>
                        </tr>
                </c:forEach>

                    </tbody>
                </table>
                </form>
				<form id="form2" name="form2"  method="get">
                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                <input type="hidden" name="bgno" value="${bgInfo.bgno}">
                </form>
            </div>
        </div>
    </main>
    <!--모달팝업창-->
    <div class="modal">
        <div class="modal-content">
            <div class="modal-header">
               <h2>FAQ 작성</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form action="/Manager/boardSave" id="form1" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="bgno" value="<c:out value="${param.bgno}"/>">
                <input type="hidden" name="brdno">
                <input type="hidden" name="bgtype" value="<c:out value="${bgInfo.bgtype}"/>">
                <div class="modal-body clearfix">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>작성자</th>
                                <td>
                                    <input type="text" name="brdwriter" id="brdwriter" value="관리자">
                                    <input type="hidden" name="rewriter"  value="관리자">
                                </td>
                            </tr>
                            <tr>
                                <th>분류</th>
                                <td>
                                    <input type="radio" name="question_type" id="faq-q2" value="S" checked>
                                    <label for="faq-q2">E-포인트</label>
                                    <input type="radio" name="question_type" id="faq-q3" value="O">
                                    <label for="faq-q3">주문/결제</label>
                                    <input type="radio" name="question_type" id="faq-q4" value="C">
                                    <label for="faq-q4">교환/반품/환불</label>
                                    <input type="radio" name="question_type" id="faq-q5" value="G">
                                    <label for="faq-q5">기타</label>
                                    <input type="radio" name="question_type" id="faq-q6" value="F">
                                    <label for="faq-q6">자주하는질문</label>
                                    <input type="radio" name="question_type" id="faq-q7" value="P">
                                    <label for="faq-q7">상품문의</label>
                                    <input type="radio" name="question_type" id="faq-q1" value="A">
                                    <label for="faq-q1">배송/설치</label>
                                    <input type="radio" name="question_type" id="faq-q8" value="V">
                                    <label for="faq-q8">이벤트/경품</label>
                                </td>
                            </tr>
                            <tr>
                                <th>FAQ 질문</th>
                                <td>
                                    <input type="hidden" name="brdtitle" id="brdtitle" value="FAQ">
                                    <input type="text" name="brdmemo" id="brdmemo"></td>
                            </tr>
                            <tr class="hidden">
                                <td>첨부</td>
                                <td>
<%--                                    <c:forEach var="listview" items="${listview}" varStatus="status">--%>
<%--                                        <input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>">--%>
<%--                                        <a href="/Board/fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">--%>
<%--                                            <c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>--%>
<%--                                    </c:forEach>--%>

                                    <input type="file" name="uploadfile" multiple="" />
                                </td>
                            </tr>
                            <tr>
                                <th>FAQ 답변</th>
                                <td><textarea name="rememo" id="summernote"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" name="detail" class="btn-red" onclick="fn_formSubmit(true)">등록하기</button>
                </div>
            </form>
        </div>
    </div>
    <div class="modal1">
        <div class="modal-content">
            <div class="modal-header">
               <h2>FAQ 상세보기</h2>
                <button type="button" class="modal-close">×</button>
            </div>
            <form name="boardUpdateForm" id="boardUpdateForm" action="<c:url value="/Manager/boardSave"/>" method="POST">
            	<input type="hidden" name="bgno" value="<c:out value="${param.bgno}"/>">
                <input type="hidden" name="brdno" >
                <input type="hidden" name="reno" >
                <input type="hidden" name="bgtype" value="faq">
                <div class="modal-body clearfix">
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>작성자</th>
                                <td>
                                    <input type="text" name="brdwriter"  value="관리자">
                                    <input type="hidden" name="rewriter"  value="관리자">
                                </td>
                            </tr>
                            <tr>
                                <th>분류</th>
                                <td>
                                    <input type="radio" name="question_type" id="faq1-q2" value="S" checked>
                                    <label for="faq1-q2">E-포인트</label>
                                    <input type="radio" name="question_type" id="faq1-q3" value="O">
                                    <label for="faq1-q3">주문/결제</label>
                                    <input type="radio" name="question_type" id="faq1-q4" value="C">
                                    <label for="faq1-q4">교환/반품/환불</label>
                                    <input type="radio" name="question_type" id="faq1-q5" value="G">
                                    <label for="faq1-q5">기타</label>
                                    <input type="radio" name="question_type" id="faq1-q6" value="F">
                                    <label for="faq1-q6">자주하는질문</label>
                                    <input type="radio" name="question_type" id="faq1-q7" value="P">
                                    <label for="faq1-q7">상품문의</label>
                                    <input type="radio" name="question_type" id="faq1-q1" value="A">
                                    <label for="faq1-q1">배송/설치</label>
                                    <input type="radio" name="question_type" id="faq1-q8" value="V">
                                    <label for="faq1-q8">이벤트/경품</label>
                                </td>
                            </tr>
                            <tr>
                                <th>FAQ 질문</th>
                                <td>
                                <input type="hidden" name="brdtitle" value="FAQ">
                                <input type="text" name="brdmemo"></td>
                            </tr>
                            <tr>
                                <th>FAQ 답변</th>
                                <td><textarea name="rememo" id="summernoteBoard"></textarea></td>
                            </tr>
                            <tr class="hidden">
                                <td>첨부</td>
                                <td>
                                    <%--                                    <c:forEach var="listview" items="${listview}" varStatus="status">--%>
                                    <%--                                        <input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>">--%>
                                    <%--                                        <a href="/Board/fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">--%>
                                    <%--                                            <c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>--%>
                                    <%--                                    </c:forEach>--%>

                                    <input type="file" name="uploadfile"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-red" id="faqUpdateBtn">수정하기</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
    <script>
        //summernote
        $(document).ready(function (){
            $('#summernote').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
            $('#summernoteBoard').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
            $('#summernote2').summernote({
                tabsize: 2,
                height: 150,
                lang: 'ko-KR',
                callbacks: {
                    onImageUpload : function(files) {
                        uploadSummernoteImageFile(files[0],this);
                    }
                }
            });
        });
        /*function faqSelect(bgno,brdno) {
            $('.modal1').attr("style","display:block");
            var formData = {"bgno":bgno,"brdno":brdno};
            var dataList = commonAjaxListCall("POST","/Manager/BoardSelect",formData);
            console.log(formData);
            $.each(dataList.boardInfo,function (key,value) {
            console.log(dataList.boardInfo);
                if(key =="rememo"){
                    $('#summernoteBoard').summernote('code', value);
                }
                $('#boardUpdateForm input:hidden[name='+key+']').val(value);
                $('#boardUpdateForm input:text[name='+key+']').val(value);
                $('#boardUpdateForm input:radio[name='+key+'][value='+value+']').prop('checked',true);
            })
        }*/
        function faqSelect (bgno,brdno){
            $('.modal1').attr("style","display:block");
            var formData = {"bgno":bgno,"brdno":brdno};
            jQuery.ajax({
                type: 'POST',
                url: '/Manager/BoardSelect'+'?bgno='+bgno+'&brdno='+brdno,
                dataType: 'json',
                data: JSON.stringify(formData),
                success: function (data) {
                    console.log(data.boardInfo)
                    $.each(data.boardInfo, function (key, value) {
                        $('#boardUpdateForm input:hidden[name='+key+']').val(value);
                        $('#boardUpdateForm input:text[name='+key+']').val(value);
                        if(key == 'question_type'){
                        	$('#boardUpdateForm input:radio[name='+key+'][value='+value+']').prop('checked',true);
                        }
                        if(key =="rememo"){
                            $('#summernoteBoard').summernote('code', value);
                        }
                    });
                },
                error: function (xhr, status, error) {
                    alert(xhr + status + error);
                    console.log(xhr, status, error)
                }
            });
        }
    </script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>