<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>
	<form action="" method="POST" id="myDeliveryForm">
    <section class="subheader">
    <input type="hidden" name="product_delivery_International_type" value="C"/>
        <div class="subTitle">배송지 관리</div>
        
        <ul class="taps">
            <li><a href="/MyPage/DeliveryAddress" id="tap1">국내 배송주소</a></li>
            <li><a href="/MyPage/DeliveryAddressForeign" id="tap2" class="active">해외 배송주소</a></li>
        </ul>
    </section>
    <section class="wrap clearfix" id="write">
        
        <table>
            <colgroup>
                <col style="width: calc(100% - 60px);">
                <col style="width: 60px;">
            </colgroup>
            <thead class="lis-head">
                <tr>
                    <th colspan="2" class="c-btn">
                        <button type="submit" formaction="/MyPage/DeliveryAddressUpdateForeign" >선택주소지 수정</button>
                        <button type="button" id="deleteDeliveryInfo">선택주소지 삭제</button>
                    </th>
                </tr>
            </thead>
            <tbody class="lis-body">
            	<c:if test="${not empty list}">
				<c:forEach var="list" items="${list}" varStatus="status">
                <tr>
                    <td class="lis-td-con">
                        <p><span>${list.postcode}
                         		${list.roadAddress}
                         		${list.extraAddress}
                         		${list.jibunAddress}</span></p>
                        <p>
                        	<span>${list.delivery_user_name}</span>
                        	<c:if test="${list.default_delivery_info_yn == 'Y'}">
                     		<span class="basic-r">(기본)</span>
                      		</c:if>
                      	</p>
                        <p><span>${list.delivery_user_phone}</span></p>
                    </td>
                    <td class="lis-td-p">
                        <input type="radio" id="${list.order_no}" name="orderNo" value="${list.order_no}"><label for="${list.order_no}"></label>
                    </td>
                </tr>
                </c:forEach>
				</c:if>
            </tbody>
        </table>
        
        <div class="fot-btn">
            <button type="button" onclick="location.href='/MyPage/DeliveryAddressInsertForeign'">새 배송지 등록</button>
            <button type="button" id="updateDefaultDeliveryInfo">기존배송지로 등록</button>
        </div>
    </section>
    </form>

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
</script>
</html>

<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>