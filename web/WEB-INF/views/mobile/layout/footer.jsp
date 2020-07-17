<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-04-15
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:import url="/mobile/layout/m_modal"/>
<script type='text/javascript'> 

wcs_do();

</script>
<footer class="pb-5 bg_grey2">
    <ul class="ftmenu bg_red">
        <li><a href="<c:url value="/Help/csinfo"/>">고객센터</a></li>
        <li><a href="javascript:void(0)" class="ready">쇼핑몰 입점/제휴문의</a></li>
    </ul>
    <ul class="ftmenu">
        <li><a href="#" id="mo-btn1">개인정보처리방침</a></li>
        <li><a href="#" id="mo-btn2">이용약관</a></li>
    </ul>
    <ul class="wrap">
        <li>${info.company_name}</li>
        <li>대표 : ${info.company_ceo} </li>
        <li>전화 : ${info.company_ph} / 팩스 : ${info.company_fax}</li>
        <li>${info.postcode} ${info.roadAddress} ${info.jibunAddress} ${info.extraAddress}</li>
        <li>사업자 등록번호 : ${info.corporate_num}</li>
        <li>통신판매업신고  ${info.cmnt_sales_busi_report} <a href="javascript:void(0)" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=4878801223','_blank','width=750, height=900');">[사업자정보확인]</a></li>
        <li>개인정보관리책임자 : <a href="mailto:${info.personal_info_incharge_email}">${info.personal_info_incharge}(${info.personal_info_incharge_email})</a></li>
        <li>고객센터 : ${info.company_ph} / ${info.personal_info_incharge_email}</li>
        <li>Copyright ${info.copyright}. All rights reserved.</li>
    </ul>
</footer>


    <%@ include file="/WEB-INF/views/mobile/layout/fix-nav.jsp" %>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>

    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
	<script src='<c:url value="/assets/js/toastr.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>
    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>
</body>
</html>