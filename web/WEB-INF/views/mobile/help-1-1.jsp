<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>

<section class="subheader">
    <div class="subTitle">경품안내</div>
</section>
<section class="wrap">
    <h2 class="pb-1 red">경품응모 방법</h2>
    <hr class="">
    <div class="qna-txt-box mb-2 clearfix">
        <p>
            <span>고객이 원조이 몰의 경품에 참여하기 위해서는 고객이 보유한 E-POINT를 통해서만 가능합니다.</span>
        </p>
        <p>
            <span>E-POINT는 고객이 원조이몰 내에서 상품을 구매할 때마다 적립됩니다.</span>
        </p>
        <p>
            <span>E-POINT의 적립액은 상품별, 가격별로 상이할 수 있으며 개별 상품의 E-POINT 적립액은 구매 화면에서 확인할 수 있습니다.</span>
        </p>
        <p>
            <span>고객이 보유하고 있는 E-POINT는 경품에 응모 시 응모 금액만큼 자동 차감되며, 일단 응모에 참여하게 되면 응모철회 또는 응모철회로 인한 E-POINT의 환급은 불가합니다.</span>
        </p>
        <p>
            <span>고객이 경품 응모에 사용한 E-POINT는 경품추첨 완료 시 자동 소멸됩니다.</span>
        </p>
    </div>
    <h2 class="pb-1 red">경품추첨</h2>
    <hr class="">
    <div class="qna-txt-box mb-2 clearfix">
        <p><span>각 경품의 가격은 홈페이지에 사전 고지되며, 고객은 고지된 가격으로 즉시 구매도 가능합니다.</span></p>
        <p><span>경품 응모 고객의 E-POINT의 합계가 경품 추첨 총 E-POINT에 도달하면 원조이 몰의 시스템은 EOS PUBIC CHAIN의 랜덤 수 발생 방식에 기초하여 즉시 당첨자를 선정, 발표하게 됩니다.</span></p>
    </div>
    <h2 class="pb-1 red">당첨자의 고지</h2>
    <hr class="">
    <div class="qna-txt-box mb-2 clearfix">
        <p><span>당첨되신 고객은 추첨이 완료된 해당 경품창에 고지되며, 발송되는 안내문에 따라 당첨자 발표 후 7일 이내 경품 당첨자 페이지를 통해 경품 당첨 확인과 경품 수령 절차를 완료하여야 합니다.</span></p>
        <p><span>당첨되신 고객이 7일 이내에 경품 당첨 확인 및 경품 수령 절차를 완료하지 않거나 7일 이내 연락이 안 될 경우 당첨이 최종 취소됩니다.</span></p>
        <p><span>경품은 현금 또는 다른 제품으로 교환되지 않습니다. 단, 고객의 요청이 있을 경우 원조이 몰이 해당 경품을 고객으로부터 매입할 수 있으며, 이때의 매입액은 당첨 고객과의 협의를 통해 결정할 수 있으나, 최초에 고지된 경품 가격의 50%를 초과할 수 없습니다.</span></p>
        <p><span>자세한 사항은 당사 사정에 의해 변경될 수 있습니다.</span></p>
    </div>
    <h2 class="pb-1 red">당첨 확인과 수령 절차</h2>
    <hr class="">
    <div class="qna-txt-box mb-2 clearfix">
        <p><span>경품 당첨 개별 고객은 경품 당첨 확인창의 확인 버튼을 통해 경품 수령 의사를 확정해야 하며 이후 매장에서의 안내에 따라 경품 수령 절차를 완료하여야 합니다.</span></p>
        <p><span>경품 당첨 고객은 경품 배송과 제세공과금 납부를 위해 받을 사람의 인적사항, 배송지 주소, 연락처, 신분증 사본 등을 제출해야 합니다.</span></p>
        <p><span>당첨 고객은 5만원 초과 경품에 대해서는 원조이 몰에 제세공과금 22%와 부가가치세 10%를 납부하셔야 합니다.</span><br>
            <span class="grey">(현물이 아닌 상품권이나 현금의 경우 부가세는 발생하지 않습니다. 5만원 미만 상품은 부가가치세만 납부하시면 됩니다. )</span><br>
            <span>-제세공과금, 부가가치세 납부는 현금 또는 기타 원조이 몰에서 제공하는 결제 방식으로 하여야 하며, 현금 이외의 방법으로 결제 시 수수료를 추가하여 납부하여야 합니다. 제세공과금 납부 후 원천징수 영수증을 출력 받을 수 있습니다.</span></p>
        <p><span>개별 경품의 배송비는 원조이 몰에서 부담합니다.</span><br>
            <span>-일반상품 : 경품 당첨고객에게 연락 후 고객이 경품 수령 절차 시 입력한 배송지로 경품을 배송합니다.</span><br>
            <span class="grey">(원조이 몰 -> 배송업체 -> 고객)</span><br>
            <span>-상품권 등 유가증권 : 경품 당첨고객에게 연락 후 고객이 경품 수령 절차 시 입력한 배송지로 경품을 등기배송합니다.</span><br>
            <span class="grey">(원조이 몰 -> 등기발송 -> 고객)</span><br>
            <span>-모바일 할인권 : 경품 당첨고객에게 연락 후 고객이 경품 수령 절차 시 입력한 핸드폰 번호로 경품을 발송합니다.</span><br>
            <span class="grey">(원조이 몰 -> 기프티콘 업체 -> 고객)</span><br></p>
        <p><span>경품 수령 후, 경품의 종류에 따라 아래의 자료로 증빙합니다.</span><br>
            <span>-일반상품 : 상품수령증 또는 택배발송확인증</span><br>
            <span>-상품권 등 유가증권 : 유가증권 등기, 우편 발송 후</span></p>
    </div>
    <h2 class="pb-1 red">당첨자 제세공과금 안내</h2>
    <hr class="">
    <div class="qna-txt-box mb-2 clearfix">
        <p><span>고객이 경품권 또는 추첨권에 당첨되어 받는 금품은 소득세법상 기타소득으로 구분되며 이러한 기타소득을 지급받는 자는 소득세법상 납세의무가 발생하여 기타소득세(20%)와 주민세(기타소득세의 10%), 부가가치세(10%)를 부담하여야 합니다.</span></p>
        <p><span>다만, 납세편의를 위하여 고객님께서 납부하셔야 할 세금을 원조이몰에서 원천징수하여 세무서에 납부합니다.</span></p>
        <p><span>제세공과금은 당첨 고지 후 경품 수령 절차인 7일 이내에 납부해주셔야 하며, 기간 내 제세공과금 미납부시 당첨이 자동 취소됩니다.</span></p>
        <p><span>제세공과금 입금은 당첨자 본인 명의로, 정확한 금액을 입금해주셔야 처리됩니다.</span></p>
    </div>
</section>

    <c:import url="/layout/footer"/>
<%--<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %> --%>