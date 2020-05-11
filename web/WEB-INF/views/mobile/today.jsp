<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="/mobile/layout/main-header"/>

    <section class="subheader">
        <div class="txt-box">
            <ul class="txt-box-ul">
                <li class="<c:if test="${searchVO.product_ct eq null}">active</c:if>"><a href="/mall/today" >전체</a></li>
                <c:if test="${not empty categoryList}">
                <c:forEach var="categoryList" items="${categoryList}" varStatus="status">
                    <li <c:if test="${searchVO.product_ct eq categoryList.pd_category_id}">class="active"</c:if> ><a href="/mall/today?product_ct=${categoryList.pd_category_id}">${categoryList.pd_category_name}</a></li>
                </c:forEach>
            	</c:if>
            </ul>
        </div>
    </section>
    <section class="wrap category-wrap">
        
        <p class="gift-amount">오늘의 특가 전체 카테고리에 <span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span>개의 상품이 등록되어 있습니다.</p>
        <article class="epoint-gift-wrap">
                <div class="sort-tab clearfix">
                    <div class="sort-tab-left">
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '1'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&sortOrder=1"/>'">랭킹순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2"/>'">낮은가격순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '3'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3"/>'">높은가격순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '4'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&sortOrder=4"/>'">판매량</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '5'}">active</c:if>" onclick="location.href='<c:url value="/mall/today?product_ct=${param.product_ct}&sortOrder=5"/>'">최신순</button>
                    </div>
                </div>
                <div class="point-product-list">
                	<c:if test="${not empty list}">
                	<c:forEach var="list" items="${list}" varStatus="status">
                    <div class="point-product-item">
                        <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">
                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/300x300'" >
                            <p class="info-production">${list.product_made_company_name}</p>
                            <p class="point-pdt-title">${list.product_name}</p>
                        </a>
                        <p class="info-price">
                            <span class="price-before"><fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</span><br><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원
                        </p>
                        <p class="info-score">
                            <i class="star-ic"></i>
                            <span class="score-number">4.5</span>
                            <span class="score-text">(5,324)</span>
                        </p>
                    </div>
                    </c:forEach>
       				</c:if>
                </div>
            </div>
        </article>
    </section>
    <nav class="nav">
        <ul>
            <li><a href="#" id="nav-cate"><i class="cate-ic">카테고리</i></a></li>
            <li><a href="../../index-mobile.html" id="nav-home"><i class="home-ic">홈</i></a></li>
            <li><a href="/product/search-page" id="nav-src"><i class="src-ic">검색</i></a></li>
            <li><a href="mypage-main.html" id="nav-user"><i class="user-ic">마이페이지</i></a></li>
        </ul>
    </nav>
    <div class="category">
       <div class="cate-bg"></div>
        <div class="content">
            <div class="cate-close"><span></span></div>
            <header class="cate-hd">
                <div class="cate-hdTop">
                    <p><span>asiddfdfj@naver.com</span>님 환영합니다.</p>
<!--                    <a href="#" class="login">로그인 ＞</a>-->
                </div>
                <ul class="cate-hdBtm">
                    <li><a href="sub/mobile/mypage-main.html"><i class="user-ic"></i><p>마이페이지</p></a></li>
                    <li><a href="sub/mobile/mypage-6.html"><i class="ship-ic"></i><p>주문/배송</p></a></li>
                    <li><a href="sub/mobile/mypage-5.html"><i class="heart-ic"></i><p>위시리스트</p></a></li>
                    <li><a href="sub/mobile/help-4-2.html"><i class="call-ic"></i><p>고객센터</p></a></li>
                </ul>
            </header>
            <div class="cate-body">
                <h4 class="cate-ttl">카테고리</h4>
                <hr>
                <ul class="cateList">
                    <li>
                        <a href="#">뷰티</a>
                        <ul class="cateList-2dp">
                            <li>
                                <a href="#">수입</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">명품</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">매스티지</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">매스</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">트렌드</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">해외직구</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스킨케어</a></li>
                                    <li><a href="#">클렌징 ∙ 필링</a></li>
                                    <li><a href="#">팩 ∙ 마스크</a></li>
                                    <li><a href="#">메이크업</a></li>
                                    <li><a href="#">네일케어</a></li>
                                    <li><a href="#">헤어케어</a></li>
                                    <li><a href="#">바디케어</a></li>
                                    <li><a href="#">향수</a></li>
                                    <li><a href="#">남성 화장품</a></li>
                                    <li><a href="#">뷰티소품</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">식품</a>
                        <ul class="cateList-2dp">
                            <li>
                                <a href="#">과일</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">사과/배</a></li>
                                    <li><a href="#">감귤/한라봉</a></li>
                                    <li><a href="#">감</a></li>
                                    <li><a href="#">키위</a></li>
                                    <li><a href="#">토마토/자두/복숭아</a></li>
                                    <li><a href="#">수박/메론/참외</a></li>
                                    <li><a href="#">딸기/블루베리/기타</a></li>
                                    <li><a href="#">바나나/오렌지/수입과일</a></li>
                                    <li><a href="#">냉동과일</a></li>
                                    <li><a href="#">건조과일</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">채소</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">산/들/바다</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">쌀/잡곡</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">쌀</a></li>
                                    <li><a href="#">잡곡</a></li>
                                    <li><a href="#">혼합곡</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">정육/계란</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">소고기</a></li>
                                    <li><a href="#">돼지고기</a></li>
                                    <li><a href="#">닭/오리/양고기</a></li>
                                    <li><a href="#">계란/알류</a></li>
                                    <li><a href="#">양념/가공육</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">수산물/건어물</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">생선류</a></li>
                                    <li><a href="#">조개류</a></li>
                                    <li><a href="#">생선회</a></li>
                                    <li><a href="#">오징어/낙지</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">간편/냉장/냉동</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">만두/돈까스/떡갈비</a></li>
                                    <li><a href="#">면/떡/국/찌개</a></li>
                                    <li><a href="#">햄/어묵/맛살</a></li>
                                    <li><a href="#">빙과/디저트</a></li>
                                    <li><a href="#">밀키트</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">라면/즉석밥/통조림</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">라면</a></li>
                                    <li><a href="#">즉석식품</a></li>
                                    <li><a href="#">통조림</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">김치</a>
                            </li>
                            <li>
                                <a href="#">스낵/견과/빵/떡</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">스낵</a></li>
                                    <li><a href="#">견과</a></li>
                                    <li><a href="#">빵</a></li>
                                    <li><a href="#">떡</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">밀가루/오일/소스/장류</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">밀가루/설탕/소금/조미료</a></li>
                                    <li><a href="#">장류</a></li>
                                    <li><a href="#">소스류</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">생수/음료/커피/유제품</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">생수</a></li>
                                    <li><a href="#">음료</a></li>
                                    <li><a href="#">커피</a></li>
                                    <li><a href="#">유제품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">건강/홍삼/선식</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">헬스/뷰티</a></li>
                                    <li><a href="#">홍삼/인삼/산삼</a></li>
                                    <li><a href="#">선식/대체식품</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">전통주</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">반려동물</a>
                        <ul class="cateList-2dp">
                            <li>
                                <a href="#">강아지</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">사료</a></li>
                                    <li><a href="#">간식</a></li>
                                    <li><a href="#">건강</a></li>
                                    <li><a href="#">위생/배변</a></li>
                                    <li><a href="#">미용/목욕</a></li>
                                    <li><a href="#">급수기/급식기</a></li>
                                    <li><a href="#">하우스/울타리</a></li>
                                    <li><a href="#">이동장</a></li>
                                    <li><a href="#">의류/액세서리</a></li>
                                    <li><a href="#">목줄/인식표/리드줄</a></li>
                                    <li><a href="#">장난감</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">고양이</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">사료</a></li>
                                    <li><a href="#">간식</a></li>
                                    <li><a href="#">건강</a></li>
                                    <li><a href="#">위생/배변</a></li>
                                    <li><a href="#">미용/목욕</a></li>
                                    <li><a href="#">급수기/급식기</a></li>
                                    <li><a href="#">하우스/울타리</a></li>
                                    <li><a href="#">이동장</a></li>
                                    <li><a href="#">의류/액세서리</a></li>
                                    <li><a href="#">목줄/인식표/리드줄</a></li>
                                    <li><a href="#">장난감</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">모바일·디지털</a>
                        <ul class="cateList-2dp">
                            <li>
                                <a href="#">모바일</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">휴대폰</a></li>
                                    <li><a href="#">액세서리</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">가전</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">TV/영상가전</a></li>
                                    <li><a href="#">냉장고/김치냉장고/냉동고</a></li>
                                    <li><a href="#">세탁기</a></li>
                                    <li><a href="#">계절가전</a></li>
                                    <li><a href="#">주방가전</a></li>
                                    <li><a href="#">생활가전</a></li>
                                    <li><a href="#">이미용가전</a></li>
                                    <li><a href="#">건강가전</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">디지털·컴퓨터</a>
                                <ul class="cateList-3dp">
                                    <li><a href="#">게임 · 소프트웨어</a></li>
                                    <li><a href="#">노트북 · 데스크탑</a></li>
                                    <li><a href="#">PC부품 · 주변기기</a></li>
                                    <li><a href="#">저장장치</a></li>
                                    <li><a href="#">모니터</a></li>
                                    <li><a href="#">프린터 · 복합기 · 잉크</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#" class="noDp">여행 · 티켓</a></li>
                    <li><a href="#" class="noDp">렌탈</a></li>
                    <li><a href="#" class="noDp">경품</a></li>
                </ul>
                <div class="logoutWrap">
                   <hr>
                    <a href="#" class="logout">로그아웃 <i class="ri-logout-box-r-line"></i></a>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
