<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-28
  Time: 오전 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
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
    <link href="<c:url value="/assets/css/toastr.css"/>" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<c:url value="/assets/js/dynatree/ui.dynatree.css" />" id="skinSheet"/>
    <!-- timepicker -->
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="<c:url value="/assets/js/dynatree/jquery.dynatree.js" />"></script>
    <!-- timepicker -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
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
                        <li  class="pass-btn"><a href="">비밀번호 변경</a></li>
                    </c:if>
                    <!-- <li class="language-nav"><a href="">국가선택</a>
                        <ul>
                            <li><a href="">한국</a></li>
                            <li><a href="">미국</a></li>
                            <li><a href="">중국</a></li>
                            <li><a href="">일본</a></li>
                        </ul>
                    </li> -->
                </ul>
            </div>
        </div>
    </div>
    <c:if test="${sessionScope.adminLogin != null}">
    <div class="header-in">
        <div class="header-gnb">
        <c:if test="${not empty menuList}">
            <ul class="gnb-out-ul">
         		<c:if test="${afn:contains(menuList, '9') || 
       						 afn:contains(menuList, '10') || 
       						 afn:contains(menuList, '46') || 
       						 afn:contains(menuList, '47') ||
       						 afn:contains(menuList, '48') ||
       						 afn:contains(menuList, '49') ||
       						 afn:contains(menuList, '51') }">
                <li <c:if test="${topNav == 1}">class="active" </c:if>><a href="/Manager/info-join">운영관리</a>
                    <ul class="gnb-in-ul">
                    	<c:if test="${afn:contains(menuList, '9')}">
                        <li><a href="/Manager/info-join">기본 관리</a></li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '10')}">
                        <li><a href="/Manager/boardGroupList">게시판관리</a> </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '46') || afn:contains(menuList, '47')}">
                        <li><a href="/Manager/Delivery">배송관리</a> 
                           	<ul>
                            	<c:if test="${afn:contains(menuList, '46')}">
                                <li><a href="/Manager/Delivery">기본배송 관리</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '47')}">
                                <li><a href="/Manager/Delivery-area">지역별 배송비 설정</a></li>
                                </c:if>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '48')}">
                        <li><a href="/Manager/banner">배너관리</a> </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '49')}">
                            <li><a href="/Manager/systemHistory">운영로그</a> </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '51')}">
                            <li><a href="/Manager/excelSetting/product">엑셀다운로드관리</a> </li>
                        </c:if>
                    </ul>
                </li>
                </c:if>
                <c:if test="${afn:contains(menuList, '29') ||
                			  afn:contains(menuList, '30') ||
                			  afn:contains(menuList, '31') ||
                			  afn:contains(menuList, '32') ||
                			  afn:contains(menuList, '33') ||
                			  afn:contains(menuList, '34') ||
                			  afn:contains(menuList, '35') ||
                			  afn:contains(menuList, '36') ||
                			  afn:contains(menuList, '37') ||
                			  afn:contains(menuList, '45') ||
                			  afn:contains(menuList, '50') ||
                			  afn:contains(menuList, '58')}">
                <li <c:if test="${topNav == 2}">class="active" </c:if>><a href="/Manager/Product">상품관리</a>
                    <ul class="gnb-in-ul">
                    	<c:if test="${afn:contains(menuList, '29') || afn:contains(menuList, '30')}">
                        <li><a href="/Manager/Product">상품관리</a>
                            <ul>
                            	<c:if test="${afn:contains(menuList, '29')}">
                                <li><a href="/Manager/Product">상품리스트</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '30')}">
                                <li><a href="/Manager/ProductAdd">상품등록</a></li>
                                </c:if>
<%--                                <li><a href="">업체가격 수정승인</a></li>--%>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '31') || afn:contains(menuList, '32') || afn:contains(menuList, '45') }">
                        <li><a href="/Manager/Giveaway">경품관리</a>
                            <ul>
                            	<c:if test="${afn:contains(menuList, '31')}">
                                <li><a href="/Manager/Giveaway">경품리스트</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '32')}">
                                <li><a href="/Manager/GiveawayAdd">경품등록</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '45')}">
                                    <li><a href="/Manager/GiveawayPartList">경품 참여 관리</a></li>
                                </c:if>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '33') || afn:contains(menuList, '58')}">
                        <li><a href="/Manager/promotion-coupon">프로모션관리</a>
                            <ul>
                            	<c:if test="${afn:contains(menuList, '33')}">
                                <li><a href="/Manager/promotion-coupon">쿠폰 등록 및 관리</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '58')}">
                                <li><a href="/Manager/product-proposal">상품제안</a></li>
                                </c:if>
<%--                                <li><a href="">메인페이지, 기획전/이벤트 관리</a></li>--%>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '34') || afn:contains(menuList, '35') || afn:contains(menuList, '36') || afn:contains(menuList, '50')}">
                        <li><a href="/Manager/option-product">상품속성관리</a>
                            <ul>
                            	<c:if test="${afn:contains(menuList, '34')}">
                                <li><a href="/Manager/option-product">상품옵션설정</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '35')}">
                                <li><a href="/Manager/market-config-partner">서비스 안내관리</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '36')}">
                                <li><a href="/Manager/option-brand">브랜드등록</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '50')}">
                                <li><a href="/Manager/product-definition">상품정보고시설정</a></li>
                                </c:if>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '37')}">
                        <li><a href="/Manager/Category">카테고리관리</a>
                            <ul>
                                <li><a href="/Manager/Category">관리분류</a></li>
<%--                                <li><a href="">전시분류</a></li>--%>
                            </ul>
                        </li>
                        </c:if>
                    </ul>
                </li>
                </c:if>
                <c:if test="${afn:contains(menuList, '38')}">
                <li <c:if test="${topNav == 3}">class="active" </c:if>><a href="/Manager/company-app">업체관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/company-app">업체관리</a>
                            <ul>
                                <li><a href="/Manager/company-app">업체신청현황</a></li>
                            </ul>
                        </li>
<%--                        <li><a href="">공지사항관리</a></li>--%>
                    </ul>
                </li>
                </c:if>
                <c:if test="${afn:contains(menuList, '39') || afn:contains(menuList, '40')}">
                <li <c:if test="${topNav == 4}">class="active" </c:if>><a href="/Manager/order">주문관리</a>
                    <ul class="gnb-in-ul">
                        <li><a href="/Manager/order">주문관리</a>
                            <ul>
                            	<c:if test="${afn:contains(menuList, '39')}">
                                <li><a href="/Manager/order">주문현황관리</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '40')}">
                                <li><a href="/Manager/returned">교환/반품처리</a></li>
                                </c:if>
                            </ul>
                        </li>
                    </ul>
                </li>
                </c:if>
                <c:if test="${afn:contains(menuList, '18') || afn:contains(menuList, '19') || afn:contains(menuList, '20')}">
                <li <c:if test="${topNav == 5}">class="active" </c:if>><a href="/Manager/class-sales">매출관리</a>
                    <ul class="gnb-in-ul">
                    	<c:if test="${afn:contains(menuList, '18')}">
                        <li><a href="/Manager/class-sales">분류별 매출현황</a></li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '19')}">
                        <li><a href="/Manager/product-sales">상품별 매출현황</a></li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '20')}">
                        <li><a href="/Manager/date-sales">날짜별 매출현황</a></li>
                        </c:if>
                    </ul>
                </li>
                </c:if>
                <c:if test="${afn:contains(menuList, '22') || afn:contains(menuList, '23') || afn:contains(menuList, '24')}">
                <li <c:if test="${topNav == 6}">class="active" </c:if>><a href="/Manager/member-management">회원관리</a>
                    <ul class="gnb-in-ul">
                    	<c:if test="${afn:contains(menuList, '22')}">
                        <li><a href="/Manager/member-management">회원관리</a></li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '23')}">
                        <li><a href="/Manager/memberLoginHistory">회원 로그인 이력</a></li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '24')}">
                        <li><a href="/Manager/MgEPoint">회원 포인트 관리</a></li>
                        </c:if>
                    </ul>
                </li>
                </c:if>
<%--                <li <c:if test="${topNav == 7}">class="active" </c:if>><a href="">계정관리</a>--%>
<%--                    <ul class="gnb-in-ul">--%>
<%--                        <li><a href="">사용권한 설정</a></li>--%>
<%--                        <li><a href="">사용자 계정관리</a></li>--%>
<%--                    </ul>--%>
<%--                </li> --%>
				<c:if test="${afn:contains(menuList, '24') ||  afn:contains(menuList, '59')}">
                <li <c:if test="${topNav == 8}">class="active" </c:if>><a href="/Manager/calculate-company">정산관리</a>
                    <ul class="gnb-in-ul">
                    <c:if test="${afn:contains(menuList, '24')}">
                        <li><a href="/Manager/calculate-company">업체별 정산내역</a></li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '59')}">
                          <li><a href="/Manager/calculate-applyCompany">업체별 정산신청내역</a>  </li>
                          </c:if>
                     
<%--                            <ul>--%>
<%--                                <li><a href="">업체별 정산내역</a></li>--%>
<%--                                <li><a href="">크리에이터 정산내역</a></li>--%>
<%--                            </ul>--%>
                      
<%--                        <li><a href="">경품관리</a></li>--%>
                    </ul>
                </li>
                </c:if>
                <c:if test="${afn:contains(menuList, '25') ||
                			  afn:contains(menuList, '41') ||
                			  afn:contains(menuList, '42') ||
                			  afn:contains(menuList, '43') ||
                			  afn:contains(menuList, '27') ||
                			  afn:contains(menuList, '28')}">
                <li <c:if test="${topNav == 9}">class="active" </c:if>><a href="/Manager/listQna">CS관리</a>
                    <ul class="gnb-in-ul">
                    	<c:if test="${afn:contains(menuList, '24')}">
                        <li><a href="/Manager/listQna">상품 QA</a></li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '41') || afn:contains(menuList, '42') || afn:contains(menuList, '43')}">
                        <li><a href="/Manager/boardList?bgno=15">상담관리</a>
                            <ul>
                            	<c:if test="${afn:contains(menuList, '41')}">
                                <li><a href="/Manager/boardList?bgno=15">1:1 메일문의 게시판</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '42')}">
                                <li><a href="/Manager/company-app">입점 및 제휴문의</a></li>
                                </c:if>
                                <c:if test="${afn:contains(menuList, '43')}">
                                <li><a href="/Manager/boardList?bgno=8">공지사항</a></li>
                                </c:if>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '27')}">
                        <li><a href="/Manager/cs-review">상풍평관리</a></li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '28')}">
                        <li><a href="/Manager/boardList?bgno=16">FAQ</a></li>
                        </c:if>
  						</ul>
		               	 </li>
                </li>
                </c:if>
		               	<c:if test="${afn:contains(menuList, '55')}">
		                <li <c:if test="${topNav == 10}">class="active" </c:if>><a href="/Manager/companyInfo">쇼핑몰 정보</a>
                    	<ul class="gnb-in-ul">
                    	<c:if test="${afn:contains(menuList, '55')}">
                        <li><a href="/Manager/companyInfo">정보등록</a></li>
            			</c:if>
                        </ul>
                        </li>
                        </c:if>
                        <c:if test="${afn:contains(menuList, '56')}">
                        <li <c:if test="${topNav == 11}">class="active" </c:if>><a href="/Manager/storeInfo">입점업체 정보</a>
                        <ul class="gnb-in-ul">
                        <c:if test="${afn:contains(menuList, '56')}">
                        <li><a href="/Manager/storeInfo">정보수정</a></li>
                        </c:if>
                        </ul>
                        </li>
                        </c:if>

		               	<c:if test="${afn:contains(menuList, '57')}">
                        <li <c:if test="${topNav == 12}">class="active"</c:if>><a href="/Manager/boardList?bgno=9">입점업체 공지</a>
                    	<ul class="gnb-in-ul">
		               	<c:if test="${afn:contains(menuList, '57')}">
                            <li><a href="/Manager/boardList?bgno=9">입점업체 공지사항</a></li>
                        </c:if>
                        </ul>
                        </c:if>
            </ul>
        </c:if>
        </div>
    </div>
    </c:if>
</header>
