<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">상품 Q&amp;A</h2>
            </div>
            <div class="dashboard-wrap">
                <div class="open-arrow"></div>
            </div>
            <div class="search-form">
                <form name="listSrcForm" id="listSrcForm" method="get">
                    <div class="keyword-src-wrap">
                        <input type="text" class="keyword-src" name="keyword-src">
                        <button type="button" class="keyword-src-button">검색</button>
                        <div class="src-filter-wrap">
                            <input type="checkbox" name="src-name" id="src-name">
                            <label for="src-name">상품명</label>
                            <input type="checkbox" name="src-code" id="src-code">
                            <label for="src-code">상품코드</label>
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
                                <th>질문 유형</th>
                                <td>
                                   <input type="checkbox" name="src-q1" id="src-q1" checked>
                                   <label for="src-q1">상품문의</label>
                                   <input type="checkbox" name="src-q2" id="src-q2" checked>
                                   <label for="src-q2">배송문의</label>
                                   <input type="checkbox" name="src-q3" id="src-q3" checked>
                                   <label for="src-q3">배송문의</label>
                                </td>
                                <th>답변 상태</th>
                                <td>
                                   <input type="checkbox" name="src-before" id="src-before" checked>
                                   <label for="src-before">답변전</label>
                                   <input type="checkbox" name="src-after" id="src-after" checked>
                                   <label for="src-after">답변완료</label>
                                </td>
                            </tr>
                            <tr>
                                <th>질문일</th>
                                <td>
                                    <div class="input-box2">
                                        <div class="cla">
                                            <input type="text" id="from_date" name="from_date" class="date_pick">
                                            <div class="cla-img1"></div>
                                        </div>
                                        <p class="cla-p1"> ~ </p>
                                        <div class="cla">
                                            <input type="text" id="to_date" name="to_date" class="date_pick">
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
                        <button type="button" class="btn-default" id="listDelete">선택 삭제</button>
                        <button type="button" class="btn-default excelBtn" name="copy" data-id="qna"><i class="exel-ic"></i>다운로드</button>
                    </div>
                </div>
                <form id="defaultListForm" method="POST">
                <input type="hidden" name="Pk" value="${Pk}">
                <input type="hidden" name="table_name" value="${table_name}">
                <table>
                    <colgroup>
                        <col width="4%">
                        <col width="6%">
                        <col width="10%">
                        <col width="10%">
                        <col width="30%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <td><input type="checkbox" id="all-chk" name="all-chk"></td>
                            <td>글번호</td>
                            <td>질문일</td>
                            <td>질문자</td>
                            <td>상품명/옵션</td>
                            <td>답변여부</td>
                            <td>답변일</td>
                            <td>상태</td>
                        </tr>
                    </thead>
                    <tbody>
                <c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}" varStatus="status">
                       <tr>
                            <td><input type="checkbox" name="chk" value="${list.qna_id}"></td>
                            <td><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></td>
                            <td>${list.reg_date}</td>
                            <td>${list.email}</td>
                            <td>${list.qna_title}</td>
                            <td>
                                <c:if test="${not empty list.rewriter_name}">
                                    답변완료
                                </c:if>
                                <c:if test="${empty list.rewriter_name}">
                                    답변 전
                                </c:if>
                            </td>
                            <td>${list.qna_rewrite_reg_date}</td>

                            <td>
                                <button type="button" class="goods-list-btn on qnaGetDetail" name="detail" data-id="${list.qna_id}">상세보기</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                    </tbody>
                </table>
                </form>
                <form id="form1" name="form1"  method="get">
                    <jsp:include page="/WEB-INF/views/common/pagingforManagerList.jsp" />
                </form>
            </div>
        </div>
    </main>
    <!--모달팝업창-->
<div class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Q&A 답변</h2>
            <button type="button" class="modal-close">×</button>
        </div>
        <form id="defaultForm" method="POST">

            <div class="modal-body clearfix">
                <table class="goods-detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>상품명</th>
                        <td><span class="product_name" id="product_name"></span></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><span class="email" id="email">onejoylife12</span></td>
                    </tr>
                    <tr>
                        <th>공개 / 비공개</th>
                        <td><span class="qna_open_type" id="qna_open_type">노출</span></td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><span class="reg_date" id="reg_date">2020-03-04</span></td>
                    </tr>
                    <tr>
                        <th>상품평제목</th>
                        <td><span class="qna_title" id="qna_title">상품평 제목입니다.</span></td>
                    </tr>
                    <tr>
                        <th>상품평 내용</th>
                        <td><span class="qna_memo" id="qna_memo">상품평 내용입니다.</span></td>
                    </tr>
                    <tr>
                        <th>답변내용</th>
                        <td><textarea name="qna_rewrite_memo" class="qna_rewrite_memo"></textarea></td>
                    </tr>
                    </tbody>
                </table>
                <button type="button" name="detail" class="btn-red answer-btn-proc">답변하기</button>
            </div>
            <input name="qna_id" type="hidden" class="qna_id" id="qna_id">
        </form>
    </div>
</div>
<script>
    $(".qnaGetDetail").click(function(){
        var pk = $(this).attr("data-id");
        var formData = {"qna_id":pk};
        jQuery.ajax({
            type: 'POST',
            data:formData,
            url:'/Manager/qnaDetail',
            success: function (data) {
                $.each(data.detail,function(index, item){
                    $("."+index).text(item);

                    if(index == 'qna_id'){
                        $("."+index).val(item);
                    }
                    if(index == ' qna_rewrite_memo'){
                        $("."+index).val(item);
                    }

                });
            },
            error: function (xhr, status, error) {
                alert("error");
            }
        });
    });
    $(".answer-btn-proc").click(function(){
        var formData = $('#defaultForm').serialize();
        commonAjaxCall("POST","/Manager/qnaRewrite",formData)
    });

</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
