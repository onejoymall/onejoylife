<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
    <c:import url="/layout/modal"/>
<script type='text/javascript'> 

wcs_do();

</script>
<footer>
    <div class="footer-top-section">
        <ul class="clearfix">
            <li><a href="#link-info-main" rel="modal:open">${afn:getMessage('service_terms_of_use',sessionScope.locale)}</a></li>
            <li><a href="#modal-info-privacy" rel="modal:open">${afn:getMessage('privacy_policy',sessionScope.locale)}</a></li>
            <li class="company-app"><a href="#modal-store" rel="modal:open">${afn:getMessage('shoppingmall_entrance',sessionScope.locale)}/${afn:getMessage('affiliated_Inquiry',sessionScope.locale)}</a></li>
<%--            <li class="company-app"><a href="javascript:void(0)" class="ready">제휴 문의</a></li>--%>
            <li><a href="/Help/csinfo">${afn:getMessage('customer_service',sessionScope.locale)}</a></li>
        </ul>
    </div>
    <div class="footer-bottom-section clearfix">
        <div class="footer-bottom-section-inner">
            <div class="footer-left-section">
                <h5 class="footer-h5 pointer" onclick="location.href='/Help/csinfo'">ONEJOY<br>${afn:getMessage('CScenter',sessionScope.locale)}</h5>
                <h6>${info.service_ment}</h6>
                <p class="footer-callnumber">${info.company_ph}</p>
                <div class="footer-time-wrap">
                    <p class="th">${afn:getMessage('counselable_time',sessionScope.locale)}</p>
                    <p class="td"><span>${info.counsel_time}</span><span>${info.counsel_offday}</span><br><span>&#40;${info.counsel_time_sub}&#41;</span></p>
                </div>
            </div>
            <div class="footer-right-section ">
                <h5 class="footer-h5 pointer" onclick="location.href='/Help/csinfo'">COMPANY<br>INFORMATION</h5>
                <ul>
                    <li>${afn:getMessage('company_name',sessionScope.locale)} : ${info.company_name} / ${afn:getMessage('representative',sessionScope.locale)} : ${info.company_ceo} / ${afn:getMessage('tel',sessionScope.locale)} : ${info.company_ph} / ${afn:getMessage('fax',sessionScope.locale)} : ${info.company_fax}</li>
                    <li>${afn:getMessage('store_reg',sessionScope.locale)} : [${info.corporate_num}]</li>
                    <li>${afn:getMessage('communications_sales_report',sessionScope.locale)} ${info.cmnt_sales_busi_report} <a href="javascript:void(0)" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=4878801223','_blank','width=750, height=900');">[${afn:getMessage('store_info_check',sessionScope.locale)}]</a></li>
                    <li>${afn:getMessage('address',sessionScope.locale)} : ${info.postcode} ${info.roadAddress} ${info.jibunAddress} ${info.extraAddress}</li>
                    <li>${afn:getMessage('privacy_infor_manager',sessionScope.locale)} : <a href="mailto:${info.personal_info_incharge_email}">${info.personal_info_incharge}(${info.personal_info_incharge_email})</a></li>
                    <li>Copyright ${info.copyright}. All rights reserved. / hosting by ${info.hosting_by}</li>
                </ul>
            </div>
            <div class="footer-bottom-bottom">
                <div class="authentication">
                    <div class="point" onclick="location.href='https://www.kisa.or.kr/main.jsp'"><img src="<c:url value="/assets/img/kisac.png" />" alt="kisa"/></div>
                    <div onclick="window.open('http://admin.kcp.co.kr/Modules/escrow/kcp_pop.jsp?site_cd=IP0GE','_blank','width=500, height=500')"><img src="<c:url value="/assets/img/kcp.png" />" alt="kcp"/></div>
                    <div onclick="location.href='http://www.kcp.co.kr'"><img src="<c:url value="/assets/img/kcp2.png" />" alt="kcp2"/></div>
                    <div onclick="location.href='http://www.ftc.go.kr'"><img src="<c:url value="/assets/img/ftc.png" />" alt="${afn:getMessage('fair_trade_commission',sessionScope.locale)}"/></div>
                </div>
                <div class="sns-list">
                    <div><img src="<c:url value="/assets/img/instagram.png" />" alt="${afn:getMessage('instagram',sessionScope.locale)}"/></div>
                    <div><img src="<c:url value="/assets/img/kakao.png" />" alt="${afn:getMessage('kakaotalk',sessionScope.locale)}"/></div>
                    <div><img src="<c:url value="/assets/img/facebook.png" />" alt="${afn:getMessage('facebook',sessionScope.locale)}"/></div>
                    <div><img src="<c:url value="/assets/img/naverblog.png" />" alt="${afn:getMessage('naverblog',sessionScope.locale)}"/></div>
                    <div><img src="<c:url value="/assets/img/twitter.png" />" alt="${afn:getMessage('twitter',sessionScope.locale)}"/></div>
                </div>
            </div>
        </div>
    </div>
</footer>


    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>

    <script src='<c:url value="/assets/js/index.js"/>'></script>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
    <script src='<c:url value="/assets/js/toastr.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

</body>
</html>