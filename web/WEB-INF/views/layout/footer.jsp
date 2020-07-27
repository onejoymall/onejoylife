<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:import url="/layout/modal"/>
<script type='text/javascript'> 

wcs_do();

</script>
<footer>
    <div class="footer-top-section">
        <ul class="clearfix">
            <li><a href="#link-info-main" rel="modal:open">이용약관</a></li>
            <li><a href="#modal-info-privacy" rel="modal:open">개인정보처리방침</a></li>
            <li class="company-app"><a href="#modal-store" rel="modal:open">쇼핑몰입점/제휴 문의</a></li>
<%--            <li class="company-app"><a href="javascript:void(0)" class="ready">제휴 문의</a></li>--%>
            <li><a href="/Help/csinfo">고객센터</a></li>
        </ul>
    </div>
    <div class="footer-bottom-section clearfix">
        <div class="footer-bottom-section-inner">
            <div class="footer-left-section">
                <h5 class="footer-h5 pointer" onclick="location.href='/Help/csinfo'">ONEJOY<br>고객지원센터</h5>
                <h6>${info.service_ment}</h6>
                <p class="footer-callnumber">${info.company_ph}</p>
                <div class="footer-time-wrap">
                    <p class="th">상담가능시간</p>
                    <p class="td"><span>${info.counsel_time}</span><span>${info.counsel_offday}</span><br><span>&#40;${info.counsel_time_sub}&#41;</span></p>
                </div>
            </div>
            <div class="footer-right-section ">
                <h5 class="footer-h5 pointer" onclick="location.href='/Help/csinfo'">COMPANY<br>INFORMATION</h5>
                <ul>
                    <li>상호 : ${info.company_name} / 대표 : ${info.company_ceo} / 전화 : ${info.company_ph} / 팩스 : ${info.company_fax}</li>
                    <li>사업자 등록번호 : [${info.corporate_num}]</li>
                    <li>통신판매업신고 ${info.cmnt_sales_busi_report} <a href="javascript:void(0)" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=4878801223','_blank','width=750, height=900');">[사업자정보확인]</a></li>
                    <li>주소 : ${info.postcode} ${info.roadAddress} ${info.jibunAddress} ${info.extraAddress}</li>
                    <li>개인정보관리책임자 : <a href="mailto:${info.personal_info_incharge_email}">${info.personal_info_incharge}(${info.personal_info_incharge_email})</a></li>
                    <li>Copyright ${info.copyright}. All rights reserved. / hosting by ${info.hosting_by}</li>
                </ul>
            </div>
            <div class="footer-bottom-bottom">
                <div class="authentication">
                    <div class="point" onclick="location.href='https://www.kisa.or.kr/main.jsp'"><img src="<c:url value="/assets/img/kisac.png" />" alt="kisa"/></div>
                    <div onclick="window.open('http://admin.kcp.co.kr/Modules/escrow/kcp_pop.jsp?site_cd=IP0GE','_blank','width=500, height=500')"><img src="<c:url value="/assets/img/kcp.png" />" alt="kcp"/></div>
                    <div onclick="location.href='http://www.kcp.co.kr'"><img src="<c:url value="/assets/img/kcp2.png" />" alt="kcp2"/></div>
                    <div onclick="location.href='http://www.ftc.go.kr'"><img src="<c:url value="/assets/img/ftc.png" />" alt="공정거래위원회"/></div>
                </div>
                <div class="sns-list">
                    <div><img src="<c:url value="/assets/img/instagram.png" />" alt="인스타그램"/></div>
                    <div><img src="<c:url value="/assets/img/kakao.png" />" alt="카카오톡"/></div>
                    <div><img src="<c:url value="/assets/img/facebook.png" />" alt="페이스북"/></div>
                    <div><img src="<c:url value="/assets/img/naverblog.png" />" alt="네이버블로그"/></div>
                    <div><img src="<c:url value="/assets/img/twitter.png" />" alt="트위터"/></div>
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