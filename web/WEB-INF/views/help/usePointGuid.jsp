<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-01
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main class="clearfix">
            <%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
            <div class="right-contain">
                <p class="sec1-h1">포인트 사용안내</p>
                <div class="qna-inner">
                    <div class="qna-wrap">
                        <p class="qna-tit">E-POINT의 사용</p>
                        <div class="qna-txt-box">
                            <p>
                                <span>·</span>
                                <span>E-POINT는 원조이 라이프가 공지한 경품 행사의 응모, 기타 서비스 (원조이 라이프 내의 이벤트 게임 아이템 구입)에 대해서만 사용 가능합니다.</span>
                            </p>
                            <p>
                                <span>·</span>
                                <span>E-POINT는 먼저 적립된 순서로 사용 되며 사용 시 자동 차감 됩니다. 사용 후 잔여 E-POINT는 현금으로 반환되지 않습니다</span>
                            </p>
                            <p>
                                <span>·</span>
                                <span>E-POINT는 <span class="under-line">결제 완료 후에 적립</span>되며, <span class="under-line">상품의 배송이 완료된 후 사용</span>할 수 있습니다.</span>
                            </p>
                        </div>

                    </div>
                    <div class="qna-wrap">
                        <p class="qna-tit">E-POINT의 적립 및 소멸</p>
                        <div class="qna-txt-box">
                            <p><span>·</span><span>E-POINT는 원조이 라이프에서 상품 구매 등을 통해 적립 받을 수 있습니다.</span></p>
                            <p><span>·</span><span>E-POINT로 경품에 응모하는 경우는 ‘응모’ 시점, 게임 등에 사용하는 경우는 ‘사용’ 시점에 자동 소멸됩니다. 포인트 특성 상 프로세스 진행 중인  ‘응모’, ’사용’ 이후에는 취소 할 수 없으므로 신중하게 사용하시기 바랍니다.</span></p>
                            <p><span>·</span><span>구매한 상품이나 서비스를 반품, 교환, 환불 하게 되는 경우 구매 당시 해당 상품에 의해 적립된 E-POINT는 소멸됩니다.</span></p>
                            <p><span>·</span><span>고객님께서 상품 구매로 인해 적립된 포인트 중 일부를 사용한 경우에도 해당 상품에 관한 반품, 교환, 환불의 의사를 포기한 것으로 간주합니다.</span></p>
                            <p><span>·</span><span>E-POINT는 카드 또는 현금, 기타의 수단으로 결제가 완료된 후 즉시 적립되며, 사용 유효기간은 최종 적립일로부터 12개월입니다. 12개월이 경과한 포인트는 자동 소멸됩니다.</span></p>
                            <p><span>·</span><span>단 E-POINT 부여 시 개별 고지된 유효기간이 있을 경우, 고지된 기간 내에 사용하여야 합니다. E-POINT를 사용하지 않을 경우 누적된 E-POINT는 먼저 적립된 순서대로 별도의 통보 없이 자동 소멸됩니다.</span></p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
