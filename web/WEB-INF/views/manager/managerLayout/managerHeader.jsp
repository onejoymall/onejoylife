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



    <!-- Toastr -->
    <link rel='stylesheet' href='<c:url value="/assets/plugins/toast/jquery.toast.min.css"/>'/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
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
                    <c:if test="${!sessionScope.adminLogin}">
                        <li><a href="/Manager/ManagerSign/ManagerLogin">로그인</a></li>
                    </c:if>
                    <c:if test="${sessionScope.adminLogin}">
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
    <c:if test="${sessionScope.adminLogin}">
    <div class="header-in">
        <div class="header-gnb">
            <ul class="gnb-out-ul">
                <li <c:if test="${topNav == 1}">class="active" </c:if>><a href="/Manager/ManagerMain">운영관리</a></li>
                <li <c:if test="${topNav == 2}">class="active" </c:if>><a href="/Manager/Product">상품관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="">상품관리</a>
                            <ul>
                                <li><a href="/Manager/Product">상품리스트</a></li>
                                <li><a href="/Manager/ProductAdd">상품등록</a></li>
<%--                                <li><a href="">업체가격 수정승인</a></li>--%>
                            </ul>
                        </li>
                        <li><a href="">경품관리</a>
                            <ul>
                                <li><a href="">경품리스트</a></li>
                                <li><a href="">경품등록</a></li>
                            </ul>
                        </li>
                        <li><a href="">프로모션관리</a>
                            <ul>
                                <li><a href="">쿠폰 등록 및 관리</a></li>
                                <li><a href="">메인페이지, 기획전/이벤트 관리</a></li>
                            </ul>
                        </li>
                        <li><a href="">상품속성관리</a>
                            <ul>
                                <li><a href="">상품옵션설정</a></li>
                                <li><a href="">서비스 안내관리</a></li>
                                <li><a href="">브랜드등록</a></li>
                            </ul>
                        </li>
                        <li><a href="/Manager/Category">카테고리관리</a>
                            <ul>
                                <li><a href="/Manager/Category">관리분류</a></li>
                                <li><a href="">전시분류</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="">업체관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="">업체관리</a>
                            <ul>
                                <li><a href="">업체신청현황</a></li>
                                <li><a href="">업체현황조회</a></li>
                            </ul>
                        </li>
                        <li><a href="">공지사항관리</a></li>
                    </ul>
                </li>
                <li><a href="">주문관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="">주문관리</a>
                            <ul>
                                <li><a href="">주문현황관리</a></li>
                                <li><a href="">주문취소관리</a></li>
                                <li><a href="">교환/반품처리</a></li>
                            </ul>
                        </li>
                        <li><a href="">배송관리</a>
                            <ul>
                                <li><a href="">배송준비중 처리</a></li>
                                <li><a href="">송장번호 입력</a></li>
                                <li><a href="">배송정보 변경</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="">매출관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="">분류별 매출현황</a></li>
                        <li><a href="">상품별 매출현황</a></li>
                        <li><a href="">날짜별 매출현황</a></li>
                    </ul>
                </li>
                <li><a href="">회원관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="">일반 회원관리</a></li>
                        <li><a href="">회원 마케팅관리</a></li>
                    </ul>
                </li>
                <li><a href="">계정관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="">사용권한 설정</a></li>
                        <li><a href="">사용자 계정관리</a></li>
                    </ul>
                </li>
                <li><a href="">정산관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="">업체별 정산내역</a>
                            <ul>
                                <li><a href="">업체별 정산내역</a></li>
                                <li><a href="">크리에이터 정산내역</a></li>
                            </ul>
                        </li>
                        <li><a href="">경품관리</a></li>
                    </ul>
                </li>
                <li><a href="">CS관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="">상품 QA</a></li>
                        <li><a href="">상담관리</a>
                            <ul>
                                <li><a href="">1:1 메일문의 게시판</a></li>
                                <li><a href="">입점 및 제휴문의</a></li>
                                <li><a href="">공지사항</a></li>
                            </ul>
                        </li>
                        <li><a href="">상풍평관리</a></li>
                        <li><a href="">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    </c:if>
</header>
