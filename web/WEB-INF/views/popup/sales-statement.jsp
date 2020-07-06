<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/noneheader.jsp" %>

    <main class="clearfix">
        <div class="header-top">
            <p>현금영수증</p>
        </div>
        <div class="body-mar">
            <p class="body-tit">현금영수증 신청</p>
            <p class="body-txt1">2007년 3월 1일부터 '현금영수증 자진 발급제'가 시행됨에 따라 현금 결제 후 별도로 신청을 하지 않으셔도 현금영수증이 자동 발급됩니다. 별도로 신청하지 않고 자동 발급된 현금영수증을 본인의 것으로 전환하고 싶으신 경우 이후에 국세청 사이트에서 신청하시면 됩니다. '현금영수증 자진발급제'에 관한 자세한 내용은 국세청사이트에서 확인하시기 바랍니다.</p>
            <a href="">국세청 현금영수증 사이트 바로가기</a>
            <p class="body-txt2">현금영수증을 신청하시거나 다른 분의 명의로 신청하시려면 주민등록번호나 휴대폰 번호를 입력해 주시기 바랍니다.</p>
            
                <form action="" name="cashReceiptsForm" id="cashReceiptsForm">
                <input type="hidden" name="imp_uid" value="${detail.imp_uid}"/>
                    <div class="form-out">
                        <div class="form-box1">
                            <input type="radio" id="rd1" name="type" value="person" checked="checked">
                            <label for="rd1"><span class="ra-txt">소득공제용(일반개인용)</span></label>
                            <input type="radio" id="rd2" name="type" value="company">
                            <label for="rd2"><span class="ra-txt">지출증빙용(사업자용)</span></label>
                        </div>
                        <div class="form-box2">
                            <select name="identifier_type" id="identifier_type">
                                <option value="phone">휴대폰번호</option>
                                <option value="person">주민등록번호</option>
                                <option value="business">사업자등록번호</option>
                            </select>
                            <input type="text" name="identifier">
                            <p class="cc">- 없이 입력하세요</p>
                        </div>
                    </div>
                    <div class="but-box">
                        <button class="but1" type="button" id="cashReceiptsBtn">확인</button>
                        <button class="but2" type="button" onclick="self.close();">취소</button>
                    </div>
                </form>
            <p class="f-tit">현금영수증 제도란?</p>
            <p>2005년 1월 1일부터 현금영수증 가맹점에서 물건을 구입할 때 소비자가 현금과 함께 카드<br> (적립식카드,신용카드 등), 핸드폰번호 등을 제시하면, 가맹점은 현금영수증 발급장치를<br> 통해 현금영수증을 발급하고 현금결제 건별 내역은 국세청에 통보되는 제도입니다.</p>
            <p class="f-tit">세금계산서 신청</p>
            <p>마이페이지 > 영수증 신청 > 발급</p>
        </div>
        <div class="mar-f">
            <div class="mar-txt">
                <div class="logo-icon"><a href="../index.html"></a></div>
                <div class="left-bar"></div>
                <div class="txt-box">
                    <p>서울시 서초구 서리풀길4, 4층 (서초동 영호빌딩)<br>
                        대표이사 : 김수현<br>
                        사업자등록번호 : 478-88-01223<br>
                        문의전화 : 1811-9500
                    </p>
                </div>
            </div>
         </div>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>

    <script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
    <!-- Toastr -->
    <script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScript.js"/>'></script>

    <script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>