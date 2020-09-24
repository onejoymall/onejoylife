<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>


    <section class="subheader">
        <div class="subTitle">${afn:getMessage("1:1question",sessionScope.locale)}</div>
        <ul class="taps">
            <li><a href="<c:url value="/Help/csBoard?bgno=15"/>" id="tap1" class="active">${afn:getMessage("writeqeustion",sessionScope.locale)}</a></li>
            <li><a href="<c:url value="/Board/boardList?bgno=15"/>" id="tap2">${afn:getMessage("myQuestions",sessionScope.locale)}</a></li>
        </ul>
    </section>
    
    
    <section class="wrap" id="write">
        <form id="form1" name="form1" action="/Board/boardSave" method="post" enctype="multipart/form-data">

        <p class="text-md mb-05 mt-05">${afn:getMessage("QA_name",sessionScope.locale)} *</p>
        <input type="text" class="width-100 mt-05" id="brdwriter" name="brdwriter">
        <p class="text-md mb-05 mt-05">${afn:getMessage("password",sessionScope.locale)} *</p>
        <input type="password" class="width-100 mt-05" id="password" name="password">
        <p class="text-md mb-05 mt-05">${afn:getMessage("email",sessionScope.locale)} *</p>
        <input type="text" class="width-100 mt-05" id="email" name="email">
        <input type="checkbox" id="reply" class="b8">
        <p class="text-md mt-2 mb-05 mt-05">${afn:getMessage("QA_ph",sessionScope.locale)}</p>
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
        <p class="text-md mt-2 mb-05">${afn:getMessage("QA_type",sessionScope.locale)} * </p>
        <select class="width-100" name="question_type" id="question_type">
            <option value="">${afn:getMessage("QA_choose",sessionScope.locale)}</option>
           <option value="S" <c:if test="${bgQuestionType eq \"LO\"}">selected</c:if>>${afn:getMessage("QA_largeorder",sessionScope.locale)}</option>
            <option value="O">${afn:getMessage("QA_order_payment",sessionScope.locale)}</option>
            <option value="C">${afn:getMessage("QA_change_return_refund",sessionScope.locale)}</option>
            <option value="E">${afn:getMessage("QA_event",sessionScope.locale)}</option>
            <option value="D">${afn:getMessage("QA_delivery",sessionScope.locale)}</option>
            <option value="G">${afn:getMessage("QA_others",sessionScope.locale)}</option>
            <option value="B">${afn:getMessage("QA_inconvenience",sessionScope.locale)}</option>
            <option value="M">${afn:getMessage("QA_store",sessionScope.locale)}</option>
        </select>
        <%--<button class="btn btn-lg btn-black width-100 mt-3">주문 상품 조회</button>
        <input type="text" class="width-100 mt-05" placeholder="1354681383854">--%>
        <p class="text-md mt-2 mb-05">${afn:getMessage("QA_title",sessionScope.locale)} * </p>
        <div class="textarea mt-05">
           <span>${afn:getMessage("limitWords",sessionScope.locale)}</span>
           <input type="text" class="width-100" id="brdtitle" name="brdtitle" size="70" maxlength="250" value="<c:out value="${boardInfo.brdtitle}"/>" />
        </div>
        <p class="text-md mt-2 mb-05">${afn:getMessage("QA_content",sessionScope.locale)} * </p>
        <div class="textarea mt-05">
           <span>${afn:getMessage("limitWords",sessionScope.locale)}</span>
           <textarea name="brdmemo" id="brdmemo" style="resize:none;"></textarea>
        </div>
        <p class="text-md mt-2 mb-05">${afn:getMessage("QA_img",sessionScope.locale)}</p>
        <div class="fileBox">
            <input type="text" class="width-100 mb-05 fileName" id="fileName" name="fileName" readonly="readonly">
            <button for="uploadBtn" type="button" class="btn btn-black width-50" onclick="$('.uploadBtn').click()">${afn:getMessage("QA_findfile",sessionScope.locale)}</button>
            <input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
            <span class="ml-1 text-sm grey">${afn:getMessage("msg_faqFile",sessionScope.locale)}</span>
        </div>
        <ul class="information">
            <li>${afn:getMessage("msg_faq1-1",sessionScope.locale)}</li>
            <li>${afn:getMessage("msg_faq1-2",sessionScope.locale)}</li>
        </ul>
        <button class="btn btn-lg btn-redcover width-100 mb-3" type="button" onclick="fn_formSubmit();">${afn:getMessage("QAinsert",sessionScope.locale)}</button>
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
           <li>${afn:getMessage("cs_num",sessionScope.locale)}</li>
           <li>${afn:getMessage("title",sessionScope.locale)}</li>
       </ul>
 <%--       <c:if test="${empty listview}">
       <div class="qnaNothing">문의 내역이 없습니다.</div>
        </c:if>--%>
<%--        <c:if test="${not empty listview}">--%>
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
<%--        </c:if>--%>
       
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
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>