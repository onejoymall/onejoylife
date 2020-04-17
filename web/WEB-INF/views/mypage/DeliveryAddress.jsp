<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main>
            <%@ include file="/WEB-INF/views/layout/leftNav.jsp" %>
            <div class="right-contain">
                <form action="" method="POST" id="myDeliveryForm">
                    <p class="sec1-h1">배송지 관리</p>
                    <div class="r-sec1">
                        <div class="sec1-ck">
                            <p class="ck-p on" data-p="sec-ck1">국내 배송주소</p>
                            <p class="ck-p" data-p="sec-ck2">해외 배송주소</p>
                        </div>
                        <p class="sec1-p">상품 구매 시 사용하실 배송지 정보를 관리하실 수 있습니다.</p>
                        <table class="tab on" id="sec-ck1">
                            <colgroup>
                            	<col style="width: 115px;">
                                <col style=" width: 175px;">
                                <col style="width: 419px;">
                                <col style=" width: 195px;">
                            </colgroup>
                            <thead>
                            <tr class="sec1-tr">
                                <td>선택</td>
                                <!-- <td>배송지명</td> -->
                                <td>받는사람</td>
                                <td>주소</td>
                                <td>연락처</td>
                            </tr>
                            </thead>
                            <tbody class="sec1-tbody">
                            <c:if test="${not empty list}">
            					<c:forEach var="list" items="${list}" varStatus="status">
            					<tr>
	                                <td>
	                                    <input type="radio" id="${list.order_no}" name="orderNo" value="${list.order_no}">
	                                    <label for="${list.order_no}" class="ra-icon"></label>
	                                </td>
	                                <td>
	                                	${list.delivery_user_name}
	                                	<c:if test="${list.default_delivery_info_yn == 'Y'}">
                                		<span class="td-clolr">(기본)</span>
	                                	</c:if>
	                                </td>
	                                <td>
	                                	<span>
	                                		${list.postcode}
	                                		${list.roadAddress}
	                                		${list.extraAddress}
	                                		${list.jibunAddress}
		                                </span>
	                                </td>
	                                <td>
	                                	<span>${list.delivery_user_phone}</span>
	                                	<br>
	                                	<span>${list.delivery_user_tel}</span>
                                	</td>
	                            </tr>
            					</c:forEach>
           					</c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="r-sec2">
                        <p style="cursor: pointer;" id="updateDeliveryInfo">선택주소지 수정</p>
                        <p style="cursor: pointer;" id="deleteDeliveryInfo">선택주소지 삭제</p>
                    </div>
                    <div class="r-sec3">
                        <button type="button">새 배송지 등록</button>
                        <button type="button">기존배송지로 설정</button>
                    </div>
                </form>
            </div>

        </main>

    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>