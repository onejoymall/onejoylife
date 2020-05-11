<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>


    <section class="subheader">
        <div class="subTitle">1:1문의</div>
        <ul class="taps">
            <li><a href="<c:url value="/Help/csBoard?bgno=15"/>" id="tap1" class="active">1:1문의 작성</a></li>
            <li><a href="<c:url value="/Board/boardList?bgno=15"/>" id="tap2">문의내역</a></li>
        </ul>
    </section>
    
    
    <section class="wrap" id="write">
        <form id="form1" name="form1" action="/Board/boardSave" method="post" enctype="multipart/form-data">
        <ul class="flexstart pb-2">
            <li>이름</li>
            <li><c:out value="${boardInfo.brdwriter}"/></li>
        </ul>
        <p class="text-md mb-05">이메일 *</p>
        <input type="text" class="width-100" id="email" name="email">
        <input type="checkbox" id="reply" class="b8">
        <p class="text-md mt-2 mb-05">휴대폰 번호</p>
        <select class="width-25 mt-05 mb-05" name="phoneNum-1" id="phoneNum-1">
            <option value="010" selected>010</option>
            <option value="011">011</option>
            <option value="017">017</option>
            <option value="019">019</option>
        </select> -
        <input type="text" name="phoneNum-2" id="phoneNum-2" maxlength="4" class="width-30 mb-05"> -
        <input type="text" name="phoneNum-3" id="phoneNum-3" maxlength="4" class="width-30 mb-05">
        <input type="hidden" name="phone">
<%--        <label for="replysns">답변 여부를 SMS로 받으시겠습니까?</label>--%>
<%--        <input type="checkbox" id="replysns" class="b8 mt-1">--%>
        <p class="text-md mt-2 mb-05">문의 유형 * </p>
        <select class="width-100" name="sort" id="sort">
            <option value="선택" selected>선택</option>
            <option value="주문결제">주문/결제</option>
            <option value="교환반품환불">교환/반품/환불</option>
            <option value="이벤트">이벤트</option>
            <option value="배송">배송</option>
            <option value="기타">기타</option>
        </select>
        <%--<button class="btn btn-lg btn-black width-100 mt-3">주문 상품 조회</button>
        <input type="text" class="width-100 mt-05" placeholder="1354681383854">--%>
        <p class="text-md mt-2 mb-05">문의 제목 * </p>
        <div class="textarea mt-05">
           <span>(0/1000자)</span>
           <input type="text" class="width-100" id="brdtitle" name="brdtitle" size="70" maxlength="250" value="<c:out value="${boardInfo.brdtitle}"/>" />
        </div>
        <p class="text-md mt-2 mb-05">문의 내용 * </p>
        <div class="textarea mt-05">
           <span>(0/1000자)</span>
           <textarea name="brdmemo" id="brdmemo" style="resize:none;"></textarea>
        </div>
        <p class="text-md mt-2 mb-05">이미지 첨부</p>
        <div class="fileBox">
            <input type="text" class="width-100 mb-05 fileName" id="fileName" name="fileName" readonly="readonly">
            <button for="uploadBtn" class="btn btn-black width-50">파일찾기</button>
            <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
            <span class="ml-1 text-sm grey">1개 / 5MB 이하만 가능</span>
        </div>
        <ul class="information">
            <li>문의하신 내용에 대한 답변은 문의내역 탭에서 확인하실 수 있습니다.</li>
            <li>쇼핑몰 관련 1:1 문의하기 페이지입니다.
매장 이용 관련 불편사항은 고객지원센터(1811-9590)를 이용해주세요.</li>
        </ul>
        <button class="btn btn-lg btn-redcover width-100 mb-3" onclick="fn_formSubmit();">접수</button>
        <input type="hidden" name="bgno" value="<c:out value="${bgno}"/>">
        <input type="hidden" name="brdno" value="<c:out value="${boardInfo.brdno}"/>">
        </form>
    </section>
    
    
    <section class="wrap" id="list">
       <%--<select class="full text-center mb-1" align="center">
           <option value="0" selected>전체</option>
           <option value="1">취소신청전</option>
           <option value="2">취소신청중</option>
           <option value="3">취소완료</option>
       </select>--%>
       <hr>
       <ul class="qnaTitle">
           <li>번호</li>
           <li>제목</li>
       </ul>
        <c:if test="${empty listview}">
       <div class="qnaNothing">문의 내역이 없습니다.</div>
        </c:if>
        <c:if test="${not empty listview}">
        <c:forEach var="listview" items="${listview}" varStatus="status">
       <div class="qna active">
           <ul class="qnaHeader">
               <li><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></li>
               <li><c:out value="${listview.brdtitle}"/><br><p class="qnadate"><c:out value="${listview.brddate}"/></p></li>
           </ul>
           <div class="qnaBody">
               <p class="qnaBodyQ text-md mb-2"><c:out value="${listview.brdtitle}"/></p>
               <p class="qnaBodyA text-md"><c:out value="${listview.brdmemo}"/></p>
              <%-- <ul class="btns mt-1 mb-0">
                    <li><a href="#" class="active">재문의하기</a></li>
                    <li><a href="#">삭제</a></li>
               </ul>--%>
           </div>
       </div>
        </c:forEach>
        </c:if>


           <form id="form1" name="form1"  method="post">
               <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
           </form>
       
    </section>
<!--
    <div class="bottomBtns">
        <ul>
           <li><a href="#">선택 주문하기</a></li>
           <li><a href="#">전체 주문하기</a></li>
        </ul>
    </div>
-->


<script>
$(document).ready(function(){
    $('#write').show();
    $('#list').hide();
    $('.qna').on('click',function(){
        $(this).addClass('active');
        $('.qna').not($(this)).removeClass('active');
    })
    $('#date li a').on('click',function(){
        $(this).addClass('active');
        $('#date li a').not($(this)).removeClass('active');
    })
});
/**
 * 탭 function
 */
function show(num){
    if(num == 1){
        $('#write').show();
        $('#list').hide();
        $('#tap1').addClass('active');
        $('#tap2').removeClass('active');
    } else if (num == 2) {
        $('#write').hide();
        $('#list').show();
        $('#tap1').removeClass('active');
        $('#tap2').addClass('active');
    }
}

$('.phoneNum').on("keyup", function () {
       $('input[name=phone]').val($('#phoneNum-1').val()+"-"+$('#phoneNum-2').val()+"-"+$('#phoneNum-3').val());
   })
   $('#phoneNum-1').on("change", function () {
       $('input[name=phone]').val($('#phoneNum-1').val()+"-"+$('#phoneNum-2').val()+"-"+$('#phoneNum-3').val());
   })

</script>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>