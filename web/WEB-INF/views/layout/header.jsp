<%--
  Created by IntelliJ IDEA.
  User: ttagg
  Date: 2020-01-17
  Time: 오전 1:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <!--    <meta name="viewport" content="user-scalable=yes, width=1200, target-densitydpi=medium-dpi" />-->
    <link href="<c:url value="/assets/css/reset.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/common.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/jquery.bxslider.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/header.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/footer.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/assets/css/${style}.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&display=swap&subset=korean" rel="stylesheet">
    <!--
    [if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]
-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="<c:url value="/assets/js/jquery.bxslider.min.js"/>"></script>
</head>
<body>
<header class="header">
    <div class="usermenu-section">
        <div class="usermenu-inner">
            <ul class="usermenu">
    <c:if test="${!loginStatus}">

        <li><a href="/sign/signup">회원가입</a></li>
        <li><a href="/sign/login">로그인</a></li>
        <li><a href="#">장바구니</a></li>
        <li><a href="#">주문배송</a></li>
        <li><a href="#">고객센터</a></li>

    </c:if>
    <c:if test="${loginStatus}">
        <li><a href="#">장바구니</a></li>
        <li><a href="#">주문배송</a></li>
        <li><a href="/MyPage/DashBoard">MyPage</a></li>
        <li><a href="#">고객센터</a></li>
        <li><a href="/sign/logout">로그아웃</a></li>
    </c:if>

            </ul>
        </div>
    </div>
    <div class="header-logo">
        <div class="header-logo-inner">
            <a href="/"><h1>onejoylife</h1></a>
        </div>
    </div>
    <div class="gnb-section">
        <div class="gnb-inner">
            <ul class="gnb">
                <li>
                    <i class="main-menu-ic"></i>전체 카테고리
                    <ul class="gnb-submenu">
                        <li>
                            <a href="#">뷰티</a>
                            <ul class="gnb-submenu-2dp">
                                <li>
                                    <a href="#">수입</a>
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
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
                            <ul class="gnb-submenu-2dp">
                                <li>
                                    <a href="#">과일</a>
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">산/들/바다</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">쌀/잡곡</a>
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">쌀</a></li>
                                        <li><a href="#">잡곡</a></li>
                                        <li><a href="#">혼합곡</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">정육/계란</a>
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">소고기</a></li>
                                        <li><a href="#">돼지고기</a></li>
                                        <li><a href="#">닭/오리/양고기</a></li>
                                        <li><a href="#">계란/알류</a></li>
                                        <li><a href="#">양념/가공육</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">수산물/건어물</a>
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">생선류</a></li>
                                        <li><a href="#">조개류</a></li>
                                        <li><a href="#">생선회</a></li>
                                        <li><a href="#">오징어/낙지</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">간편/냉장/냉동</a>
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">만두/돈까스/떡갈비</a></li>
                                        <li><a href="#">면/떡/국/찌개</a></li>
                                        <li><a href="#">햄/어묵/맛살</a></li>
                                        <li><a href="#">빙과/디저트</a></li>
                                        <li><a href="#">밀키트</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">라면/즉석밥/통조림</a>
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">스낵</a></li>
                                        <li><a href="#">견과</a></li>
                                        <li><a href="#">빵</a></li>
                                        <li><a href="#">떡</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">밀가루/오일/소스/장류</a>
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">밀가루/설탕/소금/조미료</a></li>
                                        <li><a href="#">장류</a></li>
                                        <li><a href="#">소스류</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">생수/음료/커피/유제품</a>
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">생수</a></li>
                                        <li><a href="#">음료</a></li>
                                        <li><a href="#">커피</a></li>
                                        <li><a href="#">유제품</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">건강/홍삼/선식</a>
                                    <ul class="gnb-submenu-3dp">
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
                            <ul class="gnb-submenu-2dp">
                                <li>
                                    <a href="#">강아지</a>
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
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
                            <ul class="gnb-submenu-2dp">
                                <li>
                                    <a href="#">모바일</a>
                                    <ul class="gnb-submenu-3dp">
                                        <li><a href="#">휴대폰</a></li>
                                        <li><a href="#">액세서리</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">가전</a>
                                    <ul class="gnb-submenu-3dp">
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
                                    <ul class="gnb-submenu-3dp">
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
                        <li><a href="#">여행 · 티켓</a></li>
                        <li><a href="#">렌탈</a></li>
                        <li><a href="#">경품</a></li>
                    </ul>
                </li>
                <li><a href="#">오늘의 특가</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="#">라이브 쇼핑</a></li>
            </ul>
            <div class="search-box">
                <form action="" id="main-search-form" name="main-search-form" method="get">
                    <input type="text" id="main-search" name="main-search" class="input-text">
                    <button id="main-search-btn" type="submit" class="search-btn"></button>
                </form>
            </div>
        </div>
    </div>
</header>
