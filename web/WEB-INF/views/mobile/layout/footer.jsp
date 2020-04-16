<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-04-15
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="pb-5 bg_grey2">
    <ul class="ftmenu bg_red">
        <li><a href="#">고객센터</a></li>
        <li><a href="#">쇼핑몰 입점/제휴문의</a></li>
    </ul>
    <ul class="ftmenu">
        <li><a href="#">개인정보처리방침</a></li>
        <li><a href="#">이용약관</a></li>
    </ul>
    <ul class="wrap">
        <li>주식회사 원조이</li>
        <li>대표 : 김수현</li>
        <li>전화 : 1811-9590 / 팩스 : 02-3472-0888</li>
        <li>06643 서울특별시 서초구 서리풀길 4 (서초동) 영호빌딩 4층</li>
        <li>사업자 등록번호 : 487-88-01223</li>
        <li>통신판매업신고 2019-서울서초-0844 <a href="#">[사업자정보확인]</a></li>
        <li>개인정보관리책임자 : <a href="mailto:cs@onejoy.co.kr">김수현(cs@onejoy.co.kr)</a></li>
        <li>고객센터 : 1811-9590 / onejoy@onejoy.co.kr</li>
        <li>Copyright ONEJOYlife. All rights reserved.</li>
    </ul>
</footer>


    <%@ include file="/WEB-INF/views/mobile/layout/fix-nav.jsp" %>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <script src='<c:url value="/assets/js/index.js"/>'></script>

    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>


    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>
</body>
</html>