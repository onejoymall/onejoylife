<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>


<div class="wrap">
    <div class="page-box">
        <main class="clearfix">

            <div class="right-contain">
                <form id="form1" name="form1" action="/Manager/boardSave" method="post" enctype="multipart/form-data">
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
                                <td>작성자</td>
                                <td><input type="text" id="brdwriter" name="brdwriter" size="20" maxlength="20" value="<c:out value="${boardInfo.brdwriter}"/>"></td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" id="brdtitle" name="brdtitle" size="70" maxlength="250" value="<c:out value="${boardInfo.brdtitle}"/>"></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea id="brdmemo" name="brdmemo" rows="5" cols="60"><c:out value="${boardInfo.brdmemo}"/></textarea></td>
                            </tr>
                            <tr>
                                <td>첨부</td>
                                <td>
                                    <c:forEach var="listview" items="${listview}" varStatus="status">
                                        <input type="checkbox" name="fileno" value="<c:out value="${listview.fileno}"/>">
                                        <a href="/Board/fileDownload?filename=<c:out value="${listview.filename}"/>&downname=<c:out value="${listview.realname }"/>">
                                            <c:out value="${listview.filename}"/></a> <c:out value="${listview.size2String()}"/><br/>
                                    </c:forEach>

                                    <input type="file" name="uploadfile" multiple="" />
                                </td>
                            </tr>
                            <c:if test="${bgno eq 9}">
                                <tr>
                                    <td>입점업체 선택</td>
                                    <td>
                                        <a href="#" class="codeSrc" data-id ="S">&#91;입점업체 조회&#93;</a>
                                        <input type="text" id="goods-s" name="product_supplier" placeholder="ex) S00000000" value="${boardInfo.supplier_cd}">
                                        <input type="hidden" name="product_store_id" value="${boardInfo.store_id}"/>
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <p class="ex"><span class="bullet-point">·</span><span>&nbsp;</span></p>
                        <input type="hidden" name="bgno" value="<c:out value="${bgno}"/>">
                        <input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>">
                    </div>
                    <div class="button-box">
                        <button type="button" onclick="fn_formSubmit(true)">저장</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</div>
<div class="modal codeSrcModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>분류코드 정보조회</h2>
            <button type="button" class="modal-close-code">×</button>
        </div>
        <div class="modal-body">
            <div class="wrap">
                <table class="codeSrcTable">
                    <colgroup>
                        <col width="5%">
                        <col width="10%">
                        <col width="50%">
                        <col width="13%">
                        <col width="12%">
                    </colgroup>
                    <thead>
                    <td></td>
                    <td>분류코드</td>
                    <td>분류코드명</td>
                    <td>종류</td>
                    <td>관리</td>
                    </thead>
                    <tbody class="dataListView">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#brdmemo').summernote({
            // tabsize: 2,
            height: 350,
            lang: 'ko-KR',
            callbacks: {
                onImageUpload : function(files) {
                    uploadSummernoteImageFile(files[0],this);
                }
            }
        });
    })

</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>