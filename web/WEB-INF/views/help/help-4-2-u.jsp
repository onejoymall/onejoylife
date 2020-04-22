<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <div class="wrap">
        <div class="page-box">
            <main class="clearfix">
                <%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
                <div class="right-contain">
                    <form action="" method="POST">
                        <div class="r-sec1">
                            <p class="sec1-h1">1:1 문의하기</p>
                            <p class="sec1-p1"><span>·</span> 문의하신 내용에 대한 답변을 확인하실 수 있습니다.</p>
                            <div class="qna-data-option-box">
                                <div class="qna-data-option-box-right">
<%--                                    <select name="question_type" id="question_type" class="order-select">--%>
<%--                                        <option value="선택">선택</option>--%>
<%--                                        <option value="대량주문">대량주문</option>--%>
<%--                                        <option value="주문결제">주문/결제</option>--%>
<%--                                        <option value="교환반품환불">교환/반품/환불</option>--%>
<%--                                        <option value="이벤트">이벤트</option>--%>
<%--                                        <option value="배송">배송</option>--%>
<%--                                        <option value="기타">기타</option>--%>
<%--                                    </select>--%>
                                    <button type="button" class="write-review" onclick="location.href='/Help/csBoard?bgno=15'">작성하기</button>
                                </div>
                            </div>
                            <ul class="qna-data-list">
                        <c:forEach var="listview" items="${listview}" varStatus="status">

                                <li class="qna-data-item">
                                    <div class="main-title-box" tabindex="0">
                                        <div class="qna-sort">
                                                ${listview.question_type_name}
                                        </div>
                                        <div class="qna-title"><span>${listview.brdtitle}</span></div>
                                        <div class="qna-answer">
                                            <c:if test="${empty listview.redate}">
                                            <span class="waiting">
                                                답변대기
                                            </span>
                                            </c:if>
                                            <c:if test="${not empty listview.redate}">
                                            <span class="complete">
                                                답변완료
                                            </span>
                                            </c:if>
                                        </div>
                                        <div class="qna-date"><span>${listview.brddate}</span></div>
                                    </div>
                                    <div class="content-box">
<%--                                        <div class="qna-setting-box">--%>
<%--                                            <button type="button" class="modify">재문의하기</button>--%>
<%--                                            <button type="button" class="delete">삭제</button>--%>
<%--                                        </div>--%>
                                        <div class="qna-content-body">
                                           <div class="qna-content-body-q">
                                                <p class="q-sort">Q</p>
                                                <p>
                                                        ${listview.brdmemo}
                                                </p>
                                           </div>
                                           <div class="qna-content-body-a">
                                                <p class="a-sort" >A</p>
                                                <p id="boardReMemoPrint">
                                                        ${listview.rememo}
                                                </p>
                                           </div>
                                            <p class="answer-date">
                                                <span class="answer-author">상담원 : <span id="rewriter">${listview.rewriter}</span>
                                                <span class="answer-time">답변시간 : <span id="redate">${listview.redate}</span></span>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                        </c:forEach>
                        <c:if  test="${empty listview}">
                               <li class="qna-data-none" style="display:none">
                                   <p>문의하신 내역이 없습니다.</p>
                                </li>
                        </c:if>
                            </ul>
                            <p class="ex">
                                <span>쇼핑몰 관련 1:1 문의하기 입니다.<br>매장 이용관련 불편사항은<a href="">[원조이몰 고객지원센터]</a>를 이용하여 글을 남겨주세요.</span>
                            </p>
                            <form id="form1" name="form1"  method="post">
                                <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
                            </form>
                            </ul>
                        </div>
                    </form>
                </div> 
            </main>
        </div>
    </div>

    <script>
        $(document).ready(function(){
            $('.gnb>li:first-child').mouseover(function(){
               $('.gnb-submenu').show(); 
            });
            $('.gnb>li:first-child').mouseleave(function(){
               $('.gnb-submenu').hide(); 
            });
            $('.gnb-submenu>li').mouseover(function(){
               $(this).children('.gnb-submenu-2dp').show(); 
            });
            $('.gnb-submenu>li').mouseleave(function(){
               $(this).children('.gnb-submenu-2dp').hide(); 
            });
            $('.gnb-submenu-2dp>li').mouseover(function(){
               $(this).children('.gnb-submenu-3dp').show().animate({
                   width: '200px'
               },100); 
            });
            $('.gnb-submenu-2dp>li').mouseleave(function(){
               $(this).children('.gnb-submenu-3dp').hide().animate({
                   width: '0px'
               },100); 
            });

            //헤더 sticky
            $(function(){
            var windowB = $(window),
                headerOffsetTop = $(".gnb-section").offset().top;
                windowB.on("scroll",function(){
                    if(windowB.scrollTop()>headerOffsetTop) {
                    $(".gnb-section").addClass("sticky");
                        $('.header-logo').addClass('mgbt60')
                    }else{
                    $(".gnb-section").removeClass("sticky");
                        $('.header-logo').removeClass('mgbt60')
                    }
                    
                });//scroll
                // 윈도우의 스크롤 이벤트를 발생시키는
                // (헤더의 초기 위치를 조정하기 위해)
                windowB.trigger('scroll');
            });//end
        });

        
        $(document).ready(function(){
        $("#email-3").change(function(){
            var email3 = $(this).val(); 
            if(email3 == "etc") { //직접입력일때
                $("input[name='email-2']").val('');  //이메일 도메인입력박스 초기화.
                $("input[name='email-2']").attr('readonly', false); //직접입력 가능하도록 readonly막기
            }
           else {
               $("input[name='email-2']").val(email3); //이메일 도메인 입력박스에 선택된 호스트등록.
               $("input[name='email-2']").attr('readonly', true); //readonly로 직접입력 막기.
           }
       });
            $('.main-title-box').click(function(){
                $(this).parent($('.notice-data-item')).toggleClass('active');
            });
   });




        // $('.notice-sort-item a').click(function(){
        //     event.preventDefault();
        //     $(this).parents($('.notice-sort-list')).find($('a')).removeClass('active');
        //     $(this).addClass('active');
        // })
        // var uploadFile = $('.fileBox .uploadBtn');
        // uploadFile.on('change', function(){
        //     if(window.FileReader){
        //         var filename = $(this)[0].files[0].name;
        //     } else {
        //         var filename = $(this).val().split('/').pop().split('\\').pop();
        //     }
        //     $(this).siblings('.fileName').val(filename);
        // });
    </script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>