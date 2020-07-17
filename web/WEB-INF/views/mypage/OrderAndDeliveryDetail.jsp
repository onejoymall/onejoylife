<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <div class="r-sec1">
                    <p class="sec1-h1">주문 상세내역</p>
                    <p class="sec1-p1">상점주문번호 : <span>${paymentDetail.order_no}</span><span> │ </span>주문번호 : <span>${paymentDetail.imp_uid}</span><span> │ </span>주문일 : <span><fmt:formatDate value="${paymentDetail.reg_date}" pattern="yyyy.MM.dd"/></span></p></p>
                    <table>
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 260px;">
                            <col style="width: 125px;">
                            <col style="width: 110px;">
                            <col style="width: 100px;">
                            <col style="width: 150px;">
                        </colgroup>
                        <thead class="sec1-thead">
                        <tr>
                            <th></th>
                            <th>상품정보</th>
                            <th>상품금액</th>
                            <th>수량</th>
                            <th>진행상태</th>
                            <th>관리</th>
                        </tr>
                        </thead>
                        <tbody class="sec1-tbody">
                        <c:if test="${fn:length(paymentBundleList) <= 1}">
                        <tr>
                            <c:if test="${not empty paymentDetail.file_6}">
                                <td><a href="/product/productDetail?product_cd=${paymentDetail.product_cd}"><img src="${paymentDetail.file_6}" style="width: 80px;"/></a></td>
                            </c:if>
                            <c:if test="${not empty paymentDetail.file_1}">
                                <td><a href="/product/productDetail?product_cd=${paymentDetail.product_cd}"><img src="${paymentDetail.file_1}" style="width: 80px;"/></a></td>
                            </c:if>
                            <td class="sec1-tbody-p1">
                            	<a href="/product/productDetail?product_cd=${paymentDetail.product_cd}">
                                <p>
                                    <c:if test="${not empty paymentDetail.product_name}">${paymentDetail.product_name}</c:if>
                                    <c:if test="${not empty paymentDetail.giveaway_name}">${paymentDetail.giveaway_name}</c:if>
                                </p>
                                </a>
                            </td>
                            <td><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>원</td>
                            <td><span>${paymentDetail.payment_order_quantity}</span></td>
                            <td><span>${paymentDetail.payment_status_name}</span></td>
                            <td class="sec1-tbody-p2">

                                <div class="p2-box1">
                                <%--<c:if test="${paymentDetail.payment_status eq 'W'}">
                                    <p class="p2-ck"><a href="">배송지 변경</a></p>
                                </c:if>--%>
                                <c:if test="${paymentDetail.payment_status eq 'W' || paymentDetail.payment_status eq 'D' || paymentDetail.payment_status eq 'I'}">
                                    <p><a href="/MyPage/OrderCancel?order_no=${paymentDetail.order_no}">주문취소</a></p>

                                </c:if>
                                <c:if test="${paymentDetail.payment_status eq 'R' || paymentDetail.payment_status eq 'S'}">
                                    <p class="lis-txt-box text-danger"><a id="SearchDelivery" class="click-span" data-id="${paymentDetail.order_no}">배송조회</a></p>
                                    <p class="lis-txt-box text-danger"><a href="/MyPage/OrderChange?order_no=${paymentDetail.order_no}">교환신청 하기</a></p>
                                    <p class="lis-txt-box text-danger"><a href="/MyPage/OrderRollback?order_no=${paymentDetail.order_no}">반품신청 하기</a></p>
                                </c:if>
                                <c:if test="${paymentDetail.payment_status eq 'O'}">
                                	<p class="lis-txt-box text-danger"><a href="/MyPage/OrderChange?order_no=${paymentDetail.order_no}">교환신청 하기</a></p>
                                    <p class="lis-txt-box text-danger"><a href="/MyPage/OrderRollback?order_no=${paymentDetail.order_no}">반품신청 하기</a></p>
                                </c:if>
<%--                                    <p><a href="">판매자 문의</a></p>--%>
                                </div>

                            </td>
                        </tr>
                        </c:if>
                        <c:if test="${fn:length(paymentBundleList) > 1}">
	                        <c:forEach var="list" items="${paymentBundleList}" varStatus="status">
	                        <tr>
	                            <td><img src="${list.file_1}" style="width: 80px;"/></td>
	                            <td class="sec1-tbody-p1">
	                                <p>${list.product_name}</p>
	                            </td>
	                            <td><span><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /></span>원</td>
	                            <td><span>${list.payment_order_quantity}</span></td>
	                            <c:if test="${status.index == 0 }">
		                            <td rowspan="${fn:length(paymentBundleList)}"><span>${paymentDetail.payment_status_name}</span></td>
		                            <td rowspan="${fn:length(paymentBundleList)}" class="sec1-tbody-p2">
		
		                                <div class="p2-box1">
		<%--                                    <p class="p2-ck"><a href="">배송지 변경</a></p>--%>
		                                <c:if test="${paymentDetail.payment_status eq 'W' || paymentDetail.payment_status eq 'D'}">
		                                    <p><a href="/MyPage/OrderCancel?order_no=${paymentDetail.order_no}">주문취소</a></p>
		
		                                </c:if>
		                                <c:if test="${paymentDetail.payment_status eq 'R'}">
		                                    <p class="lis-txt-box text-danger"><a id="SearchDelivery" class="click-span" data-id="${paymentDetail.order_no}">배송조회</a></p>
		                                    <p class="lis-txt-box text-danger"><a href="/MyPage/OrderChange?order_no=${paymentDetail.order_no}">교환신청 하기</a></p>
		                                    <p class="lis-txt-box text-danger"><a href="/MyPage/OrderRollback?order_no=${paymentDetail.order_no}">반품신청 하기</a></p>
		                                </c:if>
		<%--                                    <p><a href="">판매자 문의</a></p>--%>
		                                </div>
		
		                            </td>
	                            </c:if>
	                        </tr>
	                        </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                </div>
                <div class="r-sec2">
                    <p class="sec-h1">배송지 정보</p>
                    <table>
                        <colgroup>
                            <col style="width: 180px;">
                            <col style="width: 715px;;">
                        </colgroup>
                        <tbody class="sec2-body body-tr-s">
                        <tr>
                            <td class="body-td-tit1">수취인</td>
                            <td class="body-td-txt"><span>${delivery.delivery_user_name}</span></td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">휴대폰 번호</td>
                            <td class="body-td-txt">${delivery.delivery_user_phone}</td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">주소</td>
                            <td class="body-td-txt"><span>${delivery.postcode} ${delivery.roadAddress} ${delivery.extraAddress}</span></td>
                        </tr>
                        <tr>
                            <td class="body-td-tit1">배송시 요청사항</td>
                            <td class="body-td-txt"><span>${delivery.delivery_message}</span></td>
                        </tr>
                        <c:if test="${not empty paymentDetail.delivery_hope_date}">
                        <tr>
                            <td class="body-td-tit1">희망 배송일시</td>
                            <td class="body-td-txt"><span>${paymentDetail.delivery_hope_date} ${paymentDetail.delivery_hope_time}</span></td>
                        </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
<%--                <div class="r-sec3">--%>
<%--                    <p class="sec-h1">주문자 정보</p>--%>
<%--                    <table>--%>
<%--                        <colgroup>--%>
<%--                            <col style="width: 180px;">--%>
<%--                            <col style="width: 720px;">--%>
<%--                        </colgroup>--%>
<%--                        <tbody class="sec3-body body-tr-s">--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">주문하시는분</td>--%>
<%--                            <td class="body-td-txt"><span>홍길동</span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">이메일주소</td>--%>
<%--                            <td class="body-td-txt"><span>gildonghong@onejoy.co.kr</span></td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td class="body-td-tit1">휴대폰 번호</td>--%>
<%--                            <td class="body-td-txt"><span>010</span><span class="td-txt-un"> - </span><span>1234</span><span class="td-txt-un"> - </span><span>1234</span></td>--%>
<%--                        </tr>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
                <div class="r-sec4">
                    <p class="sec-h1">결제 정보</p>
                    <table>
                        <colgroup>
                            <col style="width: 180px;">
                            <col style="width: 267px">
                            <col style="width: 180px;">
                            <col style="width: 267px">
                        </colgroup>
                        <tbody class="sec3-body body-tr-s">
                        <tr>
                            <td class="body-td-tit2">주문금액</td>
                            <td class="body-td-txt"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                            <td class="body-td-tit2">상품금액</td>
                            <td class="body-td-txt"><span><fmt:formatNumber value="${paymentDetail.product_payment}" groupingUsed="true" /></span>원 <c:if test="${fn:length(paymentBundleList) > 1}"> 외 ${fn:length(paymentBundleList) - 1}건</c:if></td>
                        </tr>
                        <tr>
                            <td class="body-td-tit2">결제금액</td>
                            <td class="body-td-txt txt-color"><span><fmt:formatNumber value="${paymentDetail.payment}" groupingUsed="true" /></span>원</td>
                            <td class="body-td-tit2">결제수단</td>
                            <td class="body-td-txt"><span>${paymentDetail.pay_method_name} ${paymentDetail.vbank_name} ${paymentDetail.vbank_num}</span></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="sec4-ca">
	                    <c:if test="${impPayment.status == 'paid'}">
	                    	<a href="javascript:taxInvoice('${paymentDetail.order_no}');" class="sec4-but">세금계산서 전송</a>
	                        <a href="javascript:normalReceipt('${paymentDetail.order_no}');" class="sec4-but">영수증 출력하기</a>
                        </c:if>
                        <c:if test="${impPayment.status == 'paid' && impPayment.payMethod != 'card'}">
                        	<a href="javascript:cashReceipt('${paymentDetail.order_no}');" class="sec4-but">현금 영수증 신청하기</a>
                        </c:if>
                        <c:if test="${impPayment.status == 'paid'}">
                        	<a href="javascript:transactionStatement('${paymentDetail.order_no}');" class="sec4-but">거래명세서 출력하기</a>
                        </c:if>
                        <c:if test="${impPayment.status == 'paid' && impPayment.payMethod == 'card'}">
                        	<a href="javascript:salesStatement('${paymentDetail.order_no}');" class="sec4-but">매출전표 출력하기</a>
                        </c:if>
                    </div>
<%--                    <div class="sec4-ca"><a href="">신용카드 전표</a></div>--%>
                </div>
                <div class="r-sec5">
                    <a href="/MyPage/OrderAndDelivery">목록보기</a>
                </div>
            </div>
        </main>
    </div>
</div>
<!-- 팝업창 -->
<div class="modal">
    <div class="modal-content">
        <div class="modal-close-address">
            <p>우편번호 찾기</p>
            <div class="close"></div>
        </div>
        <div class="content-in">
           <table>
                <colgroup>
                    <col style="width: 20%;">
                   <col style="width: 80%;">
                </colgroup>

                <thead>
                <tr class="head-tr">
                    <td class="body-td1">
                        주소
                    </td>
                </tr>
                </thead>
                <tbody>
                <tr class="body-tr">
                    <td class="body-td2 td-m">
                        <div class="input-group">
                            <input placeholder="우편번호" type="text" name="postcode" id="postcode_modi" class="sec2-in1" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.postcode}</c:if>">
                            <button type="button" class="grey" id="daumMapCall2">우편번호 찾기</button>
                        </div>
                        <p class="mar-p2"><input placeholder="도로명주소" type="text" class="sec2-in2" name="roadAddress" id="roadAddress_modi" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.roadAddress}</c:if>"></p>
                         <p class="mar-p2"><input placeholder="상세주소" type="text" class="sec2-in2" name="extraAddress" id="extraAddress_modi" value="<c:if test="${not empty sessionScope.email}">${latestDelivery.extraAddress}</c:if>"></p>
                         <p>* 위 칸에 상세주소를 추가로 입력하세요</p>
                         <p class="hidden"><input type="hidden" name="jibunAddress" id="jibunAddress_modi"></p>

                    </td>
                </tr>
                </tbody>
           </table>
            <div class="btn-box">
                <button type="button" class="btn-redcover" id="updateDeliveryBtn">수정</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){


        $('.click-box p').click(function(){
            var tab_id = $(this).attr('data-1');

            $('.click-box p').removeClass('on');
            $('.ck').removeClass('on');

            $(this).addClass('on');
            $("#"+tab_id).addClass('on');
        })
        $(".p2-box1 .p2-ck").click(function(){
            event.preventDefault();
            $(".modal").attr("style", "display:block");
        });

        $(".close").click(function(){
            $(".modal").attr("style", "display:none");
        });
    });



</script><c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>