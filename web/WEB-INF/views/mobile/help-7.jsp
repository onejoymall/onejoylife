<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>


    <section class="subheader">
        <div class="subTitle"><c:out value="${bgInfo.bgname}"/></div>
    </section>
    <section class="wrap">

    
    <hr>
    <%--<div class="faq active">
       <div class="faqTitle main-title-box notice">
            <span>공지</span>
            <h4><span class="notice-span">긴급공지</span>2월 베스트 상품평 어워드 당첨자 발표</h4>
        </div>
       <div class="faqAnswer">
            <p>
                안녕하세요, 원조이몰 담당자입니다.
                2020년 3월 10일 토요일 오전 03:08:00부터 약 5시간 동안 시스템 점검이 있겠습니다.
                점검 시간 동안 서비스를 이용하지 못 하는 불편을 최소화 하기 위해, 최대한 빠른 시간 안에 마무리할 수 있도록 노력하겠습니다.
            </p>
           <div class="faqFile">
               <a href="#"><i class="ri-attachment-2"></i> 설치신청서.DOC</a>
           </div>
        </div>
    </div>--%>

<c:forEach var="listview" items="${listview}" varStatus="status">
    <div class="faq">
       <div class="faqTitle">
            <span><c:out value="${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index)}"/></span>
            <h4><c:out value="${listview.brdtitle}"/>
            </h4>

        </div>

       <div class="faqAnswer">
            <p><c:out value="${listview.brdmemo}"/> </p>
          <%-- <div class="faqFile">
               <a href="#"><i class="ri-attachment-2"></i> 설치신청서.DOC</a>
           </div>--%>
		<div class="faqFile">
          <c:if test="${not empty listview.filename}">
			    <img style="max-width: 100%; height: auto;" src="${listview.filelink}" onerror="this.src='http://placehold.it/300x300'" alt="${afn:getMessage('reviewImg',sessionScope.locale)}" />
          </c:if>
         </div>
          <!-- class="ri-attachment-2" -->
        </div>
    </div>
</c:forEach>

    

        <form id="form1" name="form1"  method="get">
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
            $('.faq').on('click',function(){
                $(this).addClass('active');
                $('.faq').not($(this)).removeClass('active');
            })
        });
    </script>
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>