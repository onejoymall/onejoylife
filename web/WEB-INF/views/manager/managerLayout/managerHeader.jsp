<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-28
  Time: 오전 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <!--    <meta name="viewport" content="user-scalable=yes, width=1200, target-densitydpi=medium-dpi" />-->
    <link href="/assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/common-admin.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/header-admin.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/${style}.css" rel="stylesheet" type="text/css">
    <link href="/assets/css/common/common.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <!-- Toastr -->
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
    <link rel="stylesheet" href="<c:url value="/assets/js/dynatree/ui.dynatree.css" />" id="skinSheet"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="<c:url value="/assets/js/dynatree/jquery.dynatree.js" />"></script>
    <script>
        //전역변수
        <c:if test="${not empty postUrl}">
        var postUrl = '<c:url value="${postUrl}"/> ';
        </c:if>
    </script>
</head>
<body>
<header class="clearfix">
    <div class="header-in">
        <div class="header-snb clearfix">
            <a href="/Manager/ManagerMain"><h1 class="header-logo"><span>onejoylife</span></h1></a>
            <div class="header-snb-right">
                <ul class="header-snb-nav">
                    <c:if test="${sessionScope.adminLogin == null}">
                        <li><a href="/Manager/ManagerSign/ManagerLogin">로그인</a></li>
                    </c:if>
                    <c:if test="${sessionScope.adminLogin != null}">
                        <li><a href="/Manager/ManagerSign/ManagerLogOut">로그아웃</a></li>
                        <li><a href="">비밀번호 변경</a></li>
                    </c:if>
                    <li class="language-nav"><a href="">국가선택</a>
                        <ul>
                            <li><a href="">한국</a></li>
                            <li><a href="">미국</a></li>
                            <li><a href="">중국</a></li>
                            <li><a href="">일본</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <c:if test="${sessionScope.adminLogin != null}">
    <div class="header-in">
        <div class="header-gnb">
            <ul class="gnb-out-ul">
                <li <c:if test="${topNav == 1}">class="active" </c:if>><a href="/Manager/info-join">운영관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/info-join">기본 관리</a></li>
                        <li><a href="/Manager/boardGroupList">게시판관리</a> </li>
                    </ul>
                </li>
                <li <c:if test="${topNav == 2}">class="active" </c:if>><a href="/Manager/Product">상품관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/Product">상품관리</a>
                            <ul>
                                <li><a href="/Manager/Product">상품리스트</a></li>
                                <li><a href="/Manager/ProductAdd">상품등록</a></li>
<%--                                <li><a href="">업체가격 수정승인</a></li>--%>
                            </ul>
                        </li>
                        <li><a href="/Manager/Giveaway">경품관리</a>
                            <ul>
                                <li><a href="/Manager/Giveaway">경품리스트</a></li>
                                <li><a href="/Manager/GiveawayAdd">경품등록</a></li>
                            </ul>
                        </li>
                        <li><a href="/Manager/promotion-coupon">프로모션관리</a>
                            <ul>
                                <li><a href="/Manager/promotion-coupon">쿠폰 등록 및 관리</a></li>
<%--                                <li><a href="">메인페이지, 기획전/이벤트 관리</a></li>--%>
                            </ul>
                        </li>
                        <li><a href="/Manager/option-product">상품속성관리</a>
                            <ul>
                                <li><a href="/Manager/option-product">상품옵션설정</a></li>
                                <li><a href="/Manager/market-config-partner">서비스 안내관리</a></li>
                                <li><a href="/Manager/option-brand">브랜드등록</a></li>
                            </ul>
                        </li>
                        <li><a href="/Manager/Category">카테고리관리</a>
                            <ul>
                                <li><a href="/Manager/Category">관리분류</a></li>
<%--                                <li><a href="">전시분류</a></li>--%>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li <c:if test="${topNav == 3}">class="active" </c:if>><a href="">업체관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/company-app">업체관리</a>
                            <ul>
                                <li><a href="/Manager/company-app">업체신청현황</a></li>
                            </ul>
                        </li>
<%--                        <li><a href="">공지사항관리</a></li>--%>
                    </ul>
                </li>
                <li <c:if test="${topNav == 4}">class="active" </c:if>><a href="">주문관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/order">주문관리</a>
                            <ul>
                                <li><a href="/Manager/order">주문현황관리</a></li>
                                <li><a href="/Manager/returned">교환/반품처리</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li <c:if test="${topNav == 5}">class="active" </c:if>><a href="">매출관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/class-sales">분류별 매출현황</a></li>
                        <li><a href="/Manager/product-sales">상품별 매출현황</a></li>
                        <li><a href="/Manager/date-sales">날짜별 매출현황</a></li>
                    </ul>
                </li>
                <li <c:if test="${topNav == 6}">class="active" </c:if>><a href="">회원관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/member-management">회원관리</a></li>
                        <li><a href="/Manager/memberLoginHistory">회원 로그인 이력</a></li>
                        <li><a href="/Manager/MgEPoint">회원 포인트 관리</a></li>
                    </ul>
                </li>
<%--                <li <c:if test="${topNav == 7}">class="active" </c:if>><a href="">계정관리</a>--%>
<%--                    <ul class="gnb-in-ul">--%>
<%--                        <li><a href="">사용권한 설정</a></li>--%>
<%--                        <li><a href="">사용자 계정관리</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
                <li <c:if test="${topNav == 8}">class="active" </c:if>><a href="">정산관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/calculate-company">업체별 정산내역</a>
<%--                            <ul>--%>
<%--                                <li><a href="">업체별 정산내역</a></li>--%>
<%--                                <li><a href="">크리에이터 정산내역</a></li>--%>
<%--                            </ul>--%>
                        </li>
<%--                        <li><a href="">경품관리</a></li>--%>
                    </ul>
                </li>
                <li <c:if test="${topNav == 9}">class="active" </c:if>><a href="">CS관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/boardList?bgno=16">상품 QA</a></li>
                        <li><a href="/Manager/boardList?bgno=15">상담관리</a>
                            <ul>
                                <li><a href="/Manager/boardList?bgno=15">1:1 메일문의 게시판</a></li>
                                <li><a href="/Manager/company-app">입점 및 제휴문의</a></li>
                                <li><a href="/Manager/boardList?bgno=8">공지사항</a></li>
                            </ul>
                        </li>
                        <li><a href="/Manager/cs-review">상풍평관리</a></li>
                        <li><a href="/Manager/boardList?bgno=16">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    </c:if>
</header>
