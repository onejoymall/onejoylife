<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/mobile/layout/sub-header.jsp" %>

<!--
<div class="underPurchase">
    <div class="content">
        <div class="closeBox">
            <button class="closeBtn"></button>  
        </div>
        <div class="scroll">
            <select class="width-100">
                <option value="" selected>상품선택</option>
            </select>
            <select class="width-100 my-1">
                <option value="" selected>옵션선택</option>
            </select>
            <div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button class="button number-minus"></button>
                           <input type="number" name="number" value="1">
                           <button class="button number-plus"></button>
                        </div>
                    </li>
                    <li><h3>1,500<span class="text-sm">원</span></h3></li>
                </ul>
            </div>
            <div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button class="button number-minus"></button>
                           <input type="number" value="1">
                           <button class="button number-plus"></button>
                        </div>
                    </li>
                    <li><h3>1,500<span class="text-sm">원</span></h3></li>
                </ul>
            </div>
            <ul class="flexbetween mt-2 mb-5">
                <li>
                    <h3>총 합계금액</h3>
                </li>
                <li>
                    <h2 class="red">4,500<span class="text-sm">원</span></h2>
                </li>
            </ul>
        </div>
        <ul class="footerBtns">
            <li><a href="#">장바구니</a></li>
            <li><a href="#">바로구매</a></li>
        </ul>
    </div>
    
</div>
-->

<div class="underPop" id="review">
    <div class="content">
        <header>
           <h3>상품평 작성하기</h3>
            <button class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <p class="text-md mt-2 mb-05">제목 *</p>
            <input type="text" class="width-100 mb-05" placeholder="50자 이내로 입력해주세요">
            <p class="text-md mt-1 mb-05">내용</p>
            <div class="textarea mt-05">
               <span>(0/1000자)</span>
               <textarea class="width-100"></textarea>
            </div>
            <p class="text-md mt-1 mb-05">이미지 첨부</p>
            <div class="mb-2">
                <input type="text" class="width-100 mb-1">
                <button class="btn btn-black width-50">파일찾기</button> <span class="ml-1 text-sm grey">1개 / 5MB 이하만 가능</span>
            </div>
            <ul class="btns mt-3 mb-0">
                <li><a href="#">취소</a></li>
                <li><a href="#" class="active">등록</a></li>
           </ul>
        </content>
    </div>
</div>
<div class="underPop" id="qna">
    <div class="content">
        <header>
           <h3>상품Q&A 작성하기</h3>
            <button class="popClose">
                <i class="ri-close-line"></i>
            </button>
        </header>
        <content>
            <p class="text-md mt-2 mb-05">제목 *</p>
            <input type="text" class="width-100 mb-05" placeholder="50자 이내로 입력해주세요">
            <input type="checkbox" id="replysns" class="b8 mt-1">
            <label for="replysns">비공개</label>
            <p class="text-md mt-2 mb-05">문의 유형 * </p>
            <select class="width-100">
                <option value="" selected>주문/결제</option>
            </select>
            <p class="text-md mt-1 mb-05">내용</p>
            <div class="textarea mt-05 mb-2">
               <span>(0/1000자)</span>
               <textarea class="width-100"></textarea>
            </div>
            <ul class="btns mt-2 mb-0">
                <li><a href="#">취소</a></li>
                <li><a href="#" class="active">등록</a></li>
           </ul>
        </content>
    </div>
</div>

    <section class="subheader">
        <div class="goods-slider-wrap">
            <ul class="goods-slider">
                <li><img src='${detail.file_1}' onerror="this.src='http://placehold.it/550'" ></li>
                <li><img src='${detail.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
            </ul>
            <div class="share-list">
                <a href="#none"><i class="facebook-ic"></i></a>
                <a href="#none"><i class="twitter-ic"></i></a>
                <a href="#none"><i class="kakao-ic"></i></a>
            </div>
        </div>
    </section>
    <section class="wrap">
       <h2 class="my-2">${detail.get("giveaway_name")}</h2>
       <hr class="grey">
       <div class="progress-wrap view">
            <p class="progress-now">참여율 <b class="red">${detail.parti_rate}%</b> (<span><fmt:formatNumber value="${detail.player_count}" groupingUsed="true" /></span>명 참여 중)</p>
            <div class="progress-bar">
                <div class="progress-bar-active" style="width:${detail.parti_rate}%"></div>
            </div>
            <p class="parti"><b class="red"><fmt:formatNumber value="${detail.sum_play_point}" groupingUsed="true" /></b> / <fmt:formatNumber value="${detail.giveaway_play_winner_point}" groupingUsed="true" /> E-point</p>
        </div>
        <ul class="flexbetween py-05 mt-2">
           <li>베송비</li>
           <li>${delivery.get("delivery_payment")}</li>
       </ul>
       <ul class="flexbetween py-05 mt-1">
            <c:if test="${sessionScope.login}">
               <li>보유 포인트</li>
               <li class="text-lg"><fmt:formatNumber value="${point_amount}" groupingUsed="true" /> point</li>
            </c:if>
            <c:if test="${!sessionScope.login}">
                <a href="<c:url value="/sign/login"/>"> 로그인 후 포인트학인</a>
            </c:if>
        </ul>
       <ul class="flexbetween py-05">
           <li>응모 포인트</li>
           <li class="">
               <form name="defaultForm" id="defaultForm" method="post">
                   <input type="number" class="epoint" id="point" name="point" value="${detail.giveaway_payment}">
                   <input type="hidden" id="point_amount" name="point_amount" value='${point_amount}'><span></span>
                   <input type="hidden" id="giveaway_id" name="giveaway_id" value='${requestScope.giveaway_id}'>
                   <input type="hidden" id="giveaway_cd" name="giveaway_cd" value='${detail.giveaway_cd}'>
                </form>
<!--               로그인 후 확인-->
           </li>
       </ul>
       <ul class="flexbetween py-05">
           <li>응모 E-point</li>
           <li class="text-lg text-bold red"><fmt:formatNumber value="${detail.giveaway_payment}" groupingUsed="true" /><span class="text-sm"> point</span></li>
       </ul>
        <ul class="winner-wrap flexbetween py-05">
            <li><h3><i class="win-icon"></i></h3></li>
            <li><p class="winner">${detail.email}</p></li>
        </ul>
    </section>
    <section class="subheader">
        <ul class="shareBtns">
            <li><a href="javascript:wish()" class="wish favorite ready" >위시리스트</a></li>
            <li><a href="#" class="share">공유하기</a></li>
        </ul>
        <img src="../../assets/img/goods-view/bnr1.jpg" alt="" class="width-100">
        <ul class="taps" id="tap">
           <li><a href="javascript:move(1)" class="active">상품설명</a></li>
           <li><a href="javascript:move(2)">상품정보</a></li>
           <li><a href="javascript:move(3)">경품안내</a></li>
       </ul>        
        <div class="my-1" id="content01">
           ${detail.giveaway_html}
        </div>
    </section>
    <section class="wrap">
        <div class="my-1" id="content02">
            <h3 class="mb-1">상품 필수정보</h3>
            <hr class="mb-1">
            <h2 class="mb-05">SM-G05-ZR/SS</h2>
            <p>일반세탁기 WA15M6551KS [15KG / 워블세탁기 / 회오리세탁 / 다이아몬드필터 / 인버터모터 / 무세제통세척]</p>
        </div>
        <div class="my-1 bg_grey p-2">
            <p class="grey pb-05">정격전압 (v)</p>
            <h3>220</h3>
            <p class="grey pt-2 pb-05">소비전력 (W)</p>
            <h3>420</h3>
            <p class="grey pt-2 pb-05">에너지소비효율등급</p>
            <h3>3 *에너지소비효율등급은 출하시점에 따라 변동될 수 있음</h3>
            <p class="grey pt-2 pb-05">동일모델 출시년월</p>
            <h3>2017년 10월</h3>
            <p class="grey pt-2 pb-05">품질보증기준</p>
            <h3>관련법 및 소비자 분쟁해결 기준에 따름</h3>
            <p class="grey pt-2 pb-05">크기 (mm)</p>
            <h3>가로 : 630, 세로 : 690, 높이 : 1050</h3>
            <p class="grey pt-2 pb-05">무게 (kg)</p>
            <h3>47</h3>
            <p class="grey pt-2 pb-05">색상</p>
            <h3>실버</h3>
            <p class="grey pt-2 pb-05">제조사</p>
            <h3>삼성전자</h3>
            <p class="grey pt-2 pb-05">제조국가</p>
            <h3>태국</h3>
            <p class="grey pt-2 pb-05">수입자</p>
            <h3>삼성전자</h3>
            <p class="grey pt-2 pb-05">A / S 책임자 (전화번호)</p>
            <h3>삼성전자 (1588-3366)</h3>
            <p class="grey pt-2 pb-05">사양</p>
            <h3>태국</h3>
            <p class="grey pt-2 pb-05">KC 전파적합성 인증</p>
            <h3>kc마크MSIP-REI-WAF700SD</h3>
            <p class="grey pt-2 pb-05">KC 전기용품 안전인증</p>
            <h3>kc마크HU07310-17049C</h3>
        </div>
        <div class="mt-4 mb-2" id="content03">
            <h3 class="mb-1">경품응모/당첨방식/세금</h3>
            <hr>
            <div class="grey bg_grey p-2">
                <h3 class="mb-1">경품 응모</h3>
                <hr class="grey mb-1">
                <p class="pb-05">배송지역</p>
                <h4>전국(일부 도서지역 제외)</h4>
                <p class=" pt-2 pb-05">배송비</p>
                <ol>
                    <li>전국 무료배송 (일부 도서지역 제외)이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.</li> 
                    <li>동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료</li>
                    <li>동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과</li>
                    <li>기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex)제주 : 5,500원, 섬지역 7,000원)</li>
                    <li>교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.
                    (단, 일부 지역 추가 요금 발생 ex) 제주 : 11,000원, 섬지역 14,000원)</li>
                </ol>
                <p class="pt-2 pb-05">업체상품</p>
                <h4 class="pb-2">업체 배송 정책에 따라 업체 배송 기사가 직접 배송하거나 택배로 발송될 수 있습니다.</h4>
                <h5 class="pb-1">직접 배송 상품</h5>
                <ol class="pb-1">
                    <li>익일 배송이 원칙이며, 주문 시 희망 배송일을 신청하실 수 있습니다.</li>
                    <li>업체 사정에 의해 상품수량이 부족하여 배송이 지연되거나 안 될 수 있습니다.</li>
                    <li>도서산간 지역의 경우 반드시 자격을 갖춘 가스 사업소에서 설치해야 하므로 직접 설치에서 제외됩니다.</li>
                    <li>설치 시 추가 설치 비용이 발생할 수 있습니다.</li>
                </ol>
                <h5 class="pb-1">택배 배송 상품</h5>
                <ol class="mb-2">
                    <li>택배 상품은 결제 후 2~3일의 배송 기간이 소요됩니다.</li>
                    <li>도서산간 지역의 경우 배송 기간이 지연될 수 있습니다.</li>
                </ol>
                
                <h3 class="mb-1">당첨 방식</h3>
                <hr class="grey mb-1">
                <p class="pb-05">배송지역</p>
                <h4>전국(일부 도서지역 제외)</h4>
                <p class=" pt-2 pb-05">배송비</p>
                <ol class="mb-2">
                    <li>전국 무료배송 (일부 도서지역 제외)이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.</li> 
                    <li>동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료</li>
                    <li>동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과</li>
                    <li>기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex)제주 : 5,500원, 섬지역 7,000원)</li>
                    <li>교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.
                    (단, 일부 지역 추가 요금 발생 ex) 제주 : 11,000원, 섬지역 14,000원)</li>
                </ol>
                <h3 class="mb-1">경품 세금 안내</h3>
                <hr class="grey mb-1">
                <p class="pb-05">배송지역</p>
                <h4>전국(일부 도서지역 제외)</h4>
                <p class=" pt-2 pb-05">배송비</p>
                <ol class="mb-2">
                    <li>전국 무료배송 (일부 도서지역 제외)이 원칙이나 결제 금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.</li> 
                    <li>동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료</li>
                    <li>동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과</li>
                    <li>기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ▷ex)제주 : 5,500원, 섬지역 7,000원)</li>
                    <li>교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환 / 반품 시 왕복 배송비 5,000원 고객 부담.
                    (단, 일부 지역 추가 요금 발생 ex) 제주 : 11,000원, 섬지역 14,000원)</li>
                </ol>
            </div>
        </div>
    </section>
    <button class="btn btn_bottom btn-redcover buynow" id="formSubmit">바로 응모하기</button>
</body>
<script>
$(document).ready(function(){
     $('.goods-slider').bxSlider({
        auto:false,
        autoHover:true,
        speed:500,
        mode:'horizontal',
        autoControls:false,
        pager:true,
        touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
    });
//     $('#shareProducts, #shareProducts2').bxSlider({
//        auto:false,
//        autoHover:true,
//        minSlides: 1,
//        maxSlides: 3,
//        moveSlides : 1,
//        speed:500,
//        slideMargin: 10,
//        slideWidth : 110,
//        mode:'horizontal',
//        autoControls:false,
//        pager:false,
//        touchEnabled : (navigator.maxTouchPoints > 0),randomStart: false,
//    });
    $('.goodsQna').on('click',function(){
        $(this).addClass('active');
        $('.goodsQna').not($(this)).removeClass('active');
    })
    $('#btn_review').on('click',function(){
        $('#review').addClass('on');
    })
    $('#btn_qna').on('click',function(){
        $('#qna').addClass('on');
    })
//    $('#formSubmit').on('click',function(){
//        $('.underPurchase').addClass('on');
//    })
    $('.popClose').on('click',function(){
        $('.underPop').removeClass('on');
    })
//    $('.closeBtn').on('click',function(){
//        $('.underPurchase').removeClass('on');
//    })
    $('.button').on('click',function(){
        if($(this).hasClass('number-minus')){
            var value = $(this).next().val();
            if(Number(value) > 1) $(this).next().val(Number(value) - 1);
        } else {
            var value = $(this).prev().val();
            $(this).prev().val(Number(value) + 1);
        }
    })
    fix();
});
$(window).scroll(function(){ 
    taps();
});
function wish(){
    if($('.wish').hasClass('on')) $('.wish').removeClass('on');
    else $('.wish').addClass('on');
}
function fix(){
    var top = $(document).scrollTop();
    var content01 = $('#content01').offset().top;
//    if(top > content01) $('#tap').addClass('fix');
//    else $('#tap').removeClass('fix');
    if(top > content01){
        $('#tap').insertAfter('.top-inner'); $('.header').attr('style', 'height:82px');
    }else{
        $('#tap').insertBefore('#content01'); $('.header').attr('style', '');
    }
}
function taps(){
    var top = $(document).scrollTop() + 80;
    var content01 = $('#content01').offset().top - 50;
    var content02 = $('#content02').offset().top - 50;
    var content03 = $('#content03').offset().top - 50;
//    var content04 = $('#content04').offset().top - 50;
//    var content05 = $('#content05').offset().top - 50;
//    if(top > content01) $('#tap').addClass('fix');
//    else $('#tap').removeClass('fix');
    if(top > content01){
        $('#tap').insertAfter('.top-inner'); $('.header').attr('style', 'height:82px');
    }else{
        $('#tap').insertBefore('#content01'); $('.header').attr('style', '');
    }
    if(top > content01) {
        $('#tap li').eq(0).find('a').addClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
//        $('#tap li').eq(3).find('a').removeClass('active');
//        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content02) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').addClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
//        $('#tap li').eq(3).find('a').removeClass('active');
//        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content03) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').addClass('active');
//        $('#tap li').eq(3).find('a').removeClass('active');
//        $('#tap li').eq(4).find('a').removeClass('active');
    }
//    if(top > content04) {
//        $('#tap li').eq(0).find('a').removeClass('active');
//        $('#tap li').eq(1).find('a').removeClass('active');
//        $('#tap li').eq(2).find('a').removeClass('active');
//        $('#tap li').eq(3).find('a').addClass('active');
//        $('#tap li').eq(4).find('a').removeClass('active');
//    }
//    if(top > content05) {
//        $('#tap li').eq(0).find('a').removeClass('active');
//        $('#tap li').eq(1).find('a').removeClass('active');
//        $('#tap li').eq(2).find('a').removeClass('active');
//        $('#tap li').eq(3).find('a').removeClass('active');
//        $('#tap li').eq(4).find('a').addClass('active');
//    }
}
function move(num){
    var offset = '';
    if(num == 1) offset = $('#content01').offset();
    else if (num ==2) offset = $('#content02').offset();
    else if (num ==3) offset = $('#content03').offset();
//    else if (num ==4) offset = $('#content04').offset();
//    else if (num ==5) offset = $('#content05').offset();
    $('html').animate({scrollTop : offset.top - 100}, 400);
}
</script>


<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>