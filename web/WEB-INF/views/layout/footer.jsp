<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--    <%@ include file="/WEB-INF/views/layout/modal.jsp" %>--%>
<footer>
    <div class="footer-top-section">
        <ul class="clearfix">
            <li><a href="#">이용약관</a></li>
            <li><a href="#">개인정보처리방침</a></li>
            <li><a href="#">쇼핑몰 입점/제휴 문의</a></li>
            <li><a href="/Help/csinfo">고객센터</a></li>
        </ul>
    </div>
    <div class="footer-bottom-section clearfix">
        <div class="footer-bottom-section-inner">
            <div class="footer-left-section">
                <h5 class="footer-h5">ONEJOY<br>고객지원센터</h5>
                <h6>무엇이든 물어보세요</h6>
                <p class="footer-callnumber">1811-9590</p>
                <div class="footer-time-wrap">
                    <p class="th">상담가능시간</p>
                    <p class="td"><span>오전 10시~오후 6시</span><span>주말, 공휴일 휴무</span><br><span>&#40;점심시간: 12:00~13:00&#41;</span></p>
                </div>
            </div>
            <div class="footer-right-section">
                <h5 class="footer-h5">COMPANY<br>INFORMATION</h5>
                <ul>
                    <li>상호 : 주식회사 원조이 / 대표 : 김수현 / 전화 : 1811-9590 / 팩스 : 02-3472-0888</li>
                    <li>사업자 등록번호 : [487-88-01223]</li>
                    <li>통신판매업신고 2019-서울서초-0844 <a href="#">[사업자정보확인]</a></li>
                    <li>주소 : 06643 서울특별시 서초구 서리풀길 4 (서초동) 영호빌딩 4층</li>
                    <li>개인정보관리책임자 : <a href="mailto:cs@onejoy.co.kr">김수현(cs@onejoy.co.kr)</a></li>
                    <li>Copyright ONEJOYlife. All rights reserved. / hosting by cafe24 심플렉스인터넷(주)</li>
                </ul>
            </div>
            <div class="footer-bottom-bottom">
                <div class="authentication">
                    <div><img src="<c:url value="/assets/img/kisac.png" />" alt="kisa"/></div>
                    <div><img src="<c:url value="/assets/img/kcp.png" />" alt="kcp"/></div>
                    <div><img src="<c:url value="/assets/img/kcp2.png" />" alt="kcp2"/></div>
                    <div><img src="<c:url value="/assets/img/ftc.png" />" alt="공정거래위원회"/></div>
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

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>--%>
</body>
</html>