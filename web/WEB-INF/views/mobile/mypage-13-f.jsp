<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<c:import url="/mobile/layout/sub-header"/>
	<form action="" method="POST" id="myDeliveryForm">
    <section class="subheader">
    <input type="hidden" name="product_delivery_International_type" value="C"/>
        <div class="subTitle">${afn:getMessage('delivery_manage',sessionScope.locale)}</div>
        
        <ul class="taps">
            <li><a href="/MyPage/DeliveryAddress" id="tap1">${afn:getMessage('domestic_delivery_addr',sessionScope.locale)}</a></li>
            <li><a href="/MyPage/DeliveryAddressForeign" id="tap2" class="active">${afn:getMessage('foreign_delivery_addr',sessionScope.locale)}</a></li>
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
                        <button type="submit" formaction="/MyPage/DeliveryAddressUpdateForeign" >${afn:getMessage('check_addr',sessionScope.locale)} ${afn:getMessage('update',sessionScope.locale)}</button>
                        <button type="button" id="deleteDeliveryInfo">${afn:getMessage('check_addr',sessionScope.locale)} ${afn:getMessage('delete',sessionScope.locale)}</button>
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
                        	<br>${list.delivery_alias}
                        	<c:if test="${list.default_delivery_info_yn == 'Y'}">
                     		<span class="basic-r">(${afn:getMessage('default',sessionScope.locale)})</span>
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
            <button type="button" onclick="location.href='/MyPage/DeliveryAddressInsertForeign'">${afn:getMessage('new_addr',sessionScope.locale)}</button>
            <button type="button" id="updateDefaultDeliveryInfo">${afn:getMessage('set_default_addr',sessionScope.locale)}</button>
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
    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>