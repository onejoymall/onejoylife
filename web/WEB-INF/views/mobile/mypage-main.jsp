<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>onejoy life</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <link href="../../assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/common-mobile.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/m-header.css" rel="stylesheet" type="text/css">
    <link href="../../assets/css/mobile/m-login.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400&display=swap&subset=korean" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script type="text/javascript">
        window.addEventListener("load", function(){
        setTimeout(loaded, 100);

        }, false);

        function loaded(){
        window.scrollTo(0, 1);
        }
        
        function handleFirstTab(e) {
          if (e.keyCode === 9) {
            document.body.classList.add('user-is-tabbing');

            window.removeEventListener('keydown', handleFirstTab);
            window.addEventListener('mousedown', handleMouseDownOnce);
          }
        }

        function handleMouseDownOnce() {
          document.body.classList.remove('user-is-tabbing');

          window.removeEventListener('mousedown', handleMouseDownOnce);
          window.addEventListener('keydown', handleFirstTab);
        }

        window.addEventListener('keydown', handleFirstTab);
    </script>
</head>
<body>
    <div class="pt-48 pb-5">
        <header class="header clearfix">
            <div class="top-inner">
                <button class="back-arr"><i class="back-ic"></i></button>
                <h1><a href="/">원조이몰</a></h1>
                <div class="h-cart">
                    <a href="#" class="cart-inner">
                        <i class="cart"></i>
                        <span class="cart-num">100</span>
                    </a>
                </div>
            </div>
        </header>
        <section class="subheader">
            <div class="subTitle clearfix">마이페이지</div>
            <div class="point-box clearfix">
                <p><span>hildonghong@onjoy.co.kr</span>님<a href="" class="setting-i"></a></p>
                <div class="coupon clearfix">
                    <div>
                        <p class="c-sub-tit">쿠폰</p>
                        <p class="c-sub-num"><a href=""><span>5</span></a></p>
                    </div>
                    <div>
                        <p class="c-sub-tit">배송중</p>
                        <p class="c-sub-num"><a href=""><span>5</span></a></p>
                    </div>
                    <div>
                        <p class="c-sub-tit">응모중인 경품</p>
                        <p class="c-sub-num"><a href=""><span>5</span></a></p>
                    </div>
                </div>
                <div class="point">
                    <div class="clearfix">
                        <p>E-POINT</p>
                        <p><a href="">999,999,999</a></p>
                    </div>
                    <div class="clearfix">
                        <p>OJT</p>
                        <p><a href="">999,999,999</a></p>
                    </div>
                    <div class="clearfix">
                        <p>OJST</p>
                        <p><a href="">999,999,999</a></p>
                    </div>
                </div>
            </div>
        </section>
        <div class="wrap clearfix page-list">
            <ul>
                <li>나의 혜택관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="">E.POINT 조회</a></li>
                        <li><a href="">쿠폰조회</a></li>
                    </ul>
                </li>
                <li>나의 쇼핑관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="">장바구니</a></li>
                        <li><a href="">찜목록</a></li>
                        <li><a href="">주문/배송조회</a></li>
                        <li><a href="">취소/재결제/교환/반품</a></li>
                        <li><a href="">나의 상품평보기</a></li>
                        <li><a href="">자주 구매하는 상품</a></li>
                    </ul>
                </li>
                <li>나의 경품관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="">경품 체험하기</a></li>
                        <li><a href="">경품 당첨내역 조회</a></li>
                    </ul>
                </li>
                <li>나의 정보관리
                    <hr>
                    <ul class="in-ul">
                        <li><a href="">회원정보 변경</a></li>
                        <li><a href="">배송지 정보</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="mo-footer">

        </div>
    </div>

    <%@ include file="/WEB-INF/views/mobile/layout/fix-nav.jsp" %>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".back-arr").click(function(){
                window.history.back();
            });
        });
    </script>
</body>
</html>