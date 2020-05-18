<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/sub-header"/>

<div class="underPurchase">
    <div class="content">
        <form name="defaultForm" id="defaultForm" method="POST" action="/product/productPayment">
        <div class="closeBox">
            <button type="button" class="closeBtn"></button>
        </div>

        <div class="scroll">
        <%--<select class="width-100">
            <option value="" selected>상품선택</option>
        </select>--%>
            ${option}

            <div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>${list.product_name}</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button type="button" class="button number-minus"></button>
                           <input type="number" name="payment_order_quantity" value="1">
                           <button type="button" class="button number-plus"></button>
                            <input type="hidden" name="order_max" value="${list.product_max_limit}" />
                            <input type="hidden" name="order_min" value="${list.product_min_limit}" />
                        </div>
                    </li>
                    <li><h3><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" /><span class="text-sm">원</span></h3></li>
                </ul>
            </div>
            <%--<div class="purchaseBox mb-1">
                <div class="item-delete">
                    <i class="ri-close-line"></i>
                </div>
                <h4>컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수컵누들 쌀국수</h4>
                <ul class="flexbetween">
                    <li class="width-35">
                        <div class="number-group">
                           <button type="button" class="button number-minus"></button>
                           <input type="number" value="1">
                           <button type="button" class="button number-plus"></button>
                        </div>
                    </li>
                    <li><h3>1,500<span class="text-sm">원</span></h3></li>
                </ul>
            </div>--%>
            <ul class="flexbetween mt-2 mb-5">
                <%--<li>
                    <h3>총 합계금액</h3>
                </li>
                <li>
                    <h2 class="red">4,500<span class="text-sm">원</span></h2>
                </li>--%>
            </ul>
        </div>
        <ul class="footerBtns">
            <li><a href="#" onclick="addShoppingBasket('${list.product_cd}')">장바구니</a></li>
            <li><a href="#" id="paymentSubmit">바로구매</a></li>
        </ul>
            <input type="hidden" name="product_cd" id="product_cd" value="${list.product_cd}">
        </form>
    </div>
    
</div>

<div class="underPop" id="review">
    <div class="content">
        <header>
           <h3>상품평 작성하기</h3>
            <button type="button" class="popClose">
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
                <li><img src='${list.file_1}' onerror="this.src='http://placehold.it/550'"></li>
                 <c:if test="${not empty list.file_5}">
                <li><img src='${list.file_5}' onerror="this.src='http://placehold.it/550'" ></li>
                 </c:if>
            </ul>
            <div class="share-list">
                <a href="#none"><i class="facebook-ic"></i></a>
                <a href="#none"><i class="twitter-ic"></i></a>
                <a href="#none"><i class="kakao-ic"></i></a>
            </div>
        </div>
    </section>
    <section class="wrap">
       <div class="mb-1">
          <%-- <span class="label label-danger">세일</span>
           <span class="label label-warning">쿠폰</span>--%>
       </div>
       <h2 class="my-2">${list.product_brand_name}<br> ${list.product_name}</h2>
       <hr class="grey">
       <ul class="flexbetween py-05 mt-2">
           <li>소비자가</li>
           <li class="line-through grey"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</li>
       </ul>
       <ul class="flexbetween py-05">
           <li>세일</li>
           <li class="line-through grey">319,000원</li>
       </ul>--%>
       <ul class="flexbetween py-05">
           <li>판매가</li>
           <li class="text-lg text-bold red"><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원</span></li>
       </ul>
<%--       <p class="coupon-late py-05"><span class="red text-lg">20% 쿠폰</span><span class="grey text-light mx-1">|</span>19.03.18-19.04.17</p>>--%>
       <%--<ul class="flexbetween py-05">
           <li>카드할인혜택</li>
           <li class="text-bold">삼성카드 청구할인 5%</li>
       </ul>--%>
    </section>
    <section class="subheader">
        <ul class="shareBtns">
            <li><a href="#" class="wish favorite <c:if test="${heart}">on</c:if>"  data-id="${list.product_cd}">

                <i class="heart-empty <c:if test="${heart}">heart-full</c:if>"> </i>
                위시리스트</a></li>
            <li><a href="#" class="share">공유하기</a></li>
        </ul>
        <a href="${lineBannerList1.url}" class="width-100">
            <img src="${lineBannerList1.file_1}" class="width-100" /></a>
        <img src="../../assets/img/goods-view/bnr1.jpg" alt="" class="width-100">
        <ul class="taps" id="tap">
           <li><a href="javascript:move(1)" class="active">상품설명</a></li>
           <li><a href="javascript:move(2)">상품정보</a></li>
           <li><a href="javascript:move(3)">리뷰 <span class="red text-sm">65</span></a></li>
           <li><a href="javascript:move(4)">Q&A <span class="red text-sm">65</span></a></li>
           <li><a href="javascript:move(5)">배송/환불</a></li>
       </ul>        
        <div class="my-1" id="content01">
           <c:out value="${list.product_html}" escapeXml="false"/>
        </div>
    </section>
    <section class="wrap">
        <div class="mt-1 mb-3">
            <h3 class="mb-1">함께 본 상품</h3>
            <hr class="mb-1">
            <div class="shareProducts">
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
        </div>
        </div>
        <div class="my-1 " id="content02">
             <h3 class="mb-1">상품 필수정보</h3>
             <hr class="mb-1">
             <h2 class="mb-05">SM-G05-ZR/SS</h2>
             <p>일반세탁기 WA15M6551KS [15KG / 워블세탁기 / 회오리세탁 / 다이아몬드필터 / 인버터모터 / 무세제통세척]</p>
         </div>
         <c:out value="${configtop.market_config_value}" escapeXml="false"/>
         <div class="my-1 bg_grey p-2 ">
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
         <c:out value="${configbot.market_config_value}" escapeXml="false"/>
        <c:import url="/product/productDetailReview"/>
        <!-- <div class="mt-4 mb-2" id="content03">
           <ul class="flexbetween mb-1">
               <li><h3>평가 및 리뷰<span class="red text-md ml-1">65</span></h3></li>
               <li><button class="btn btn-black" id="btn_review">작성하기</button></li>
           </ul>
            <hr>
            <div class="bg_grey p-2 text-center">
                <h2><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-half-fill red"></i></h2>
                <h2 class="text-bold pb-1">4.5</h2>
                <p>225개의 상품평이 있습니다.</p>
                <hr class="grey my-1">
                <ul class="flexbetween py-05">
                   <li>상품</li>
                   <li class="text-md">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i> 5.0
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li>가격</li>
                   <li class="text-md">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-half-fill red mx-05"></i><i class="ri-star-line red"></i> 3.5
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li>배송</li>
                   <li class="text-md">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-line red"></i> 4.0
                   </li>
               </ul>
                <ul class="flexbetween py-05">
                   <li>친절도</li>
                   <li class="text-md">
                       <i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-half-fill red"></i> 4.5
                   </li>
               </ul>
            </div>
            <hr>
            <ul class="product pb-0">
               <ul class="options pb-0">
                    <li><h5>2019.04.10 <br>김*주</h5></li>
                    <li><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-line red"></i> 4.0</li>
                </ul>
                <ul>
                    <li><img src="http://placehold.it/300x300" alt=""></li>
                    <li>
                       <p>카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서 친절히 답해주셔서 감사하구요, 아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^ 감사합니다</p>
                    </li>
                </ul>
            </ul>
            <ul class="product pb-0">
               <ul class="options pb-0">
                    <li><h5>2019.04.10 <br>김*주</h5></li>
                    <li><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-fill red"></i><i class="ri-star-fill red mx-05"></i><i class="ri-star-line red"></i> 4.0</li>
                </ul>
                <ul>
                    <li><img src="http://placehold.it/300x300" alt=""></li>
                    <li>
                       <p>카메라 잘받았습니다. 보증서도 이상없이 있고, 무엇보다 질문답게시판에 3번정도의 질문을했는데 판매자님께서 친절히 답해주셔서 감사하구요, 아직 꼼꼼히 보진못했지만 이상 없는 듯 합니다. 모두 안심하고 구매하셔도 될 듯 합니다^^ 감사합니다</p>
                    </li>
                </ul>
            </ul>
            <ul class="centerBtns mt-3">
                <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
                <li><a href="#" class="active">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
            </ul>
        </div> -->
        <div class="mt-4 mb-2" id="content04">
           <ul class="flexbetween mb-1">
               <li><h3>상품 Q&A<span class="red text-md ml-1">65</span></h3></li>
               <li><button class="btn btn-black" id="btn_qna">작성하기</button></li>
           </ul>
           <hr>
           <div class="qnaNothing">문의 내역이 없습니다.</div>
           <div class="goodsQna active">
               <div class="goodsHeader">
                  <p>
                       <span class="tapGrey">답변대기</span>
                       <span class="date">2019.05.27</span>
                       <span>Ymaaa***</span>
                  </p>
                  <h4 class="pt-1">유통기한이 개봉 후 몇개월인가요?</h4>
               </div>
               <div class="goodsBody">
                   <div class="goodsBodyQ text-md">
                      <span>질문</span>
                       매장에서 봤는데 화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요?
                       <p class="mt-1">
                           <button class="btn">수정</button>
                           <button class="btn">삭제</button>   
                       </p>
                       
                   </div>
                   <div class="goodsBodyA text-md">
                      <span>답변</span>
                       안녕하세요, 고객님. 원조이라이프 고객센터입니다. 문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.감사합니다.
                       <p class="mt-1 grey">답변일 : 2019.05.07</p>
                   </div>
               </div>
           </div>
           <div class="goodsQna">
               <div class="goodsHeader">
                  <p>
                       <span class="tapRed">답변완료</span>
                       <span class="date">2019.05.27</span>
                       <span>Ymaaa***</span>
                  </p>
                  <h4 class="pt-1">유통기한이 개봉 후 몇개월인가요?</h4>
               </div>
               <div class="goodsBody">
                   <div class="goodsBodyQ text-md">
                      <span>질문</span>
                       매장에서 봤는데 화이트말고 메탈색이 있던데 쇼핑몰에서도 구입할 수 있나요?
                       <p class="mt-1">
                           <button class="btn">수정</button>
                           <button class="btn">삭제</button>   
                       </p>
                       
                   </div>
                   <div class="goodsBodyA text-md">
                      <span>답변</span>
                       안녕하세요, 고객님. 원조이라이프 고객센터입니다. 문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.감사합니다.
                       <p class="mt-1 grey">답변일 : 2019.05.07</p>
                   </div>
               </div>
           </div>
           <ul class="centerBtns mt-3">
                <li><a href="#"><i class="ri-arrow-left-s-line"></i></a></li>
                <li><a href="#" class="active">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#"><i class="ri-arrow-right-s-line"></i></a></li>
            </ul>
        </div>
        <div class="mt-4 mb-2">
            <h3 class="mb-1">같은 공급사 상품</h3>
            <hr class="mb-1">
            <div class="shareProducts">
                <div class="shareProducts">
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
                <a href="#" class="product">
                    <div class="productImg"><img src="../../assets/img/goods-view/main-slider.jpg"></div>
                    <h5 class="mt-05">봄맞이 트렌치코트, 자켓 외 30종 할인봄맞이 트렌치코트, 자켓 외 30종 할인</h5>
                    <h4 class="text-bold red">92,000 <span class="text-sm">원</span></h4>
                </a>
            </div>
            </div>
        </div>
        <div class="mt-4 mb-2" id="content05">
            <h3 class="mb-1">배송/결제/교환/환불</h3>
            <hr>
            <div class="grey bg_grey p-2">
                <h3 class="mb-1">배송 안내</h3>
                <hr class="grey mb-1">
                ${list.product_delivery_info}
                <br>
                <b>상품 출고지</b>
                <br>
                - (${store_delivery.forward_postcode}) 
                  ${store_delivery.forward_roadAddress}
                  ${store_delivery.forward_extraAddress}
                  <br><br>
                <h3 class="mb-1">교환/반품 안내</h3>
                <hr class="grey mb-1">
                <b>교환 및 반품 주소</b>
                <br>
                - (${store_delivery.refund_postcode}) 
                  ${store_delivery.refund_roadAddress}
                  ${store_delivery.refund_extraAddress}
                  <br><br>
                ${list.product_change_info}
                <h3 class="mb-1">환불 안내</h3>
                <hr class="grey mb-1">
                ${list.product_service_info}
            </div>
        </div>
    </section>
    <button type="button" class="btn btn_bottom btn-redcover" id="btn_purchase">구매하기</button>

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
    $('.optionBtn').click(function(){
            $(this).siblings('.optionBtn').removeClass('on');
            $(this).addClass('on');
        })
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
    $('#btn_purchase').on('click',function(){
        $('.underPurchase').addClass('on');
    })
    $('.popClose').on('click',function(){
        $('.underPop').removeClass('on');
    })
    $('.closeBtn').on('click',function(){
        $('.underPurchase').removeClass('on');
    })
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
/*function wish(){
    if($('.wish').hasClass('on')) $('.wish').removeClass('on');
    else $('.wish').addClass('on');
}*/
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
    var content04 = $('#content04').offset().top - 50;
    var content05 = $('#content05').offset().top - 50;
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
        $('#tap li').eq(3).find('a').removeClass('active');
        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content02) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').addClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
        $('#tap li').eq(3).find('a').removeClass('active');
        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content03) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').addClass('active');
        $('#tap li').eq(3).find('a').removeClass('active');
        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content04) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
        $('#tap li').eq(3).find('a').addClass('active');
        $('#tap li').eq(4).find('a').removeClass('active');
    }
    if(top > content05) {
        $('#tap li').eq(0).find('a').removeClass('active');
        $('#tap li').eq(1).find('a').removeClass('active');
        $('#tap li').eq(2).find('a').removeClass('active');
        $('#tap li').eq(3).find('a').removeClass('active');
        $('#tap li').eq(4).find('a').addClass('active');
    }
}
function move(num){
    var offset = '';
    if(num == 1) offset = $('#content01').offset();
    else if (num ==2) offset = $('#content02').offset();
    else if (num ==3) offset = $('#content03').offset();
    else if (num ==4) offset = $('#content04').offset();
    else if (num ==5) offset = $('#content05').offset();
    $('html').animate({scrollTop : offset.top - 100}, 400);
}
</script>


<%@ include file="/WEB-INF/views/mobile/layout/footer.jsp" %>