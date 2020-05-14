<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-31
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <h3>${categoryRowData.pd_category_name}</h3>
<%--            <div class="txt-box">--%>
<%--                <ul class="txt-box-ul">--%>
<%--                    <li class="active"><a href="#" >전체</a></li>--%>
<%--                    <li><a href="#">스킨케어</a></li>--%>
<%--                    <li><a href="#">클렌징 ∙ 필링</a></li>--%>
<%--                    <li><a href="#">팩 ∙ 마스크</a></li>--%>
<%--                    <li><a href="#">메이크업</a></li>--%>
<%--                    <li><a href="#">네일케어</a></li>--%>
<%--                    <li><a href="#">헤어케어</a></li>--%>
<%--                    <li><a href="#">바디케어</a></li>--%>
<%--                    <li><a href="#">향수</a></li>--%>
<%--                    <li><a href="#">남성 화장품</a></li>--%>
<%--                    <li><a href="#">뷰티소품</a></li>--%>
<%--                    <li></li>--%>
<%--                    <li></li>--%>
<%--                    <li></li>--%>
<%--                    <li></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
            <c:if test="${not empty categoryRowData.file_link3 and categoryRowData.pd_category_event_use_yn eq 'Y' || categoryRowData.file_link5 and categoryRowData.event_use_yn eq 'Y'}">
            <section class="main-section">
                <h2 class="main-section-title hide">main section</h2>
                <article class="main-slider">
                    <h3 class="main-slider-title hide">main slider</h3>
                    <div class="main-slider-inner">
                        <ul class="main-slider-wrap">
                            <c:if test="${not empty categoryRowData.file_link3 and categoryRowData.pd_category_event_use_yn eq 'Y'}">
                                <li id="main-slide-1"><a href="#" style="background: url(${categoryRowData.file_link3}) no-repeat center / contain !important;"></a></li>
                            </c:if>

                            <c:if test="${not empty categoryRowData.file_link5 and categoryRowData.event_use_yn eq 'Y'}">
                                <li id="main-slide-1"><a href="#" style="background:url(${categoryRowData.file_link5}) no-repeat center / contain !important;"></a></li>
                            </c:if>
                        </ul>
                    </div>
                </article>
            </section>
            </c:if>
            <p class="gift-amount">${categoryRowData.pd_category_name} 전체 카테고리에 <span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span>개의 상품이 등록되어 있습니다.</p>
<%--            <div class="nav-tit clearfix">--%>
<%--                <h4>MD추천</h4>--%>
<%--                <div class="row clearfix">--%>
<%--                    <div class="point-product-item">--%>
<%--                        <a href="gift-view.html">--%>
<%--                            <img src="../assets/img/list-img.png" />--%>
<%--                            <p class="sale-percent">35<span>%</span></p>--%>
<%--                            <i class="share-ic"></i>--%>
<%--                            <p class="info-production">삼성전자</p>--%>
<%--                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>--%>
<%--                        </a>--%>
<%--                        <p class="info-price">--%>
<%--                            <span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원--%>
<%--                        </p>--%>
<%--                        <p class="info-score">--%>
<%--                            <i class="star-ic"></i>--%>
<%--                            <span class="score-number">4.5</span>--%>
<%--                            <span class="score-text">5,324개 평가</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                    <div class="point-product-item">--%>
<%--                        <a href="#">--%>
<%--                            <img src="../assets/img/list-img2.png" />--%>
<%--                            <i class="share-ic"></i>--%>
<%--                            <p class="info-production">삼성전자</p>--%>
<%--                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>--%>
<%--                        </a>--%>
<%--                        <p class="info-price">15,080원</p>--%>
<%--                        <p class="info-score">--%>
<%--                            <i class="star-ic"></i>--%>
<%--                            <span class="score-number">4.5</span>--%>
<%--                            <span class="score-text">5,324개 평가</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                    <div class="point-product-item">--%>
<%--                        <a href="#">--%>
<%--                            <img src="../assets/img/list-img3.png" />--%>
<%--                            <i class="share-ic"></i>--%>
<%--                            <p class="info-production">삼성전자</p>--%>
<%--                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>--%>
<%--                        </a>--%>
<%--                        <p class="info-price">15,080원</p>--%>
<%--                        <p class="info-score">--%>
<%--                            <i class="star-ic"></i>--%>
<%--                            <span class="score-number">4.5</span>--%>
<%--                            <span class="score-text">5,324개 평가</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                    <div class="point-product-item mar-r">--%>
<%--                        <a href="#">--%>
<%--                            <img src="../assets/img/list-img4.png" />--%>
<%--                            <p class="sale-percent">35<span>%</span></p>--%>
<%--                            <i class="share-ic"></i>--%>
<%--                            <p class="info-production">삼성전자</p>--%>
<%--                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>--%>
<%--                        </a>--%>
<%--                        <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>--%>
<%--                        <p class="info-score">--%>
<%--                            <i class="star-ic"></i>--%>
<%--                            <span class="score-number">4.5</span>--%>
<%--                            <span class="score-text">5,324개 평가</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="nav-tit clearfix">--%>
<%--                <h4>인기상품</h4>--%>
<%--                <div class="row clearfix">--%>
<%--                    <div class="point-product-item">--%>
<%--                        <a href="gift-view.html">--%>
<%--                            <img src="../assets/img/list-img.png" />--%>
<%--                            <p class="sale-percent">35<span>%</span></p>--%>
<%--                            <i class="share-ic"></i>--%>
<%--                            <p class="info-production">삼성전자</p>--%>
<%--                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>--%>
<%--                        </a>--%>
<%--                        <p class="info-price">--%>
<%--                            <span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원--%>
<%--                        </p>--%>
<%--                        <p class="info-score">--%>
<%--                            <i class="star-ic"></i>--%>
<%--                            <span class="score-number">4.5</span>--%>
<%--                            <span class="score-text">5,324개 평가</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                    <div class="point-product-item">--%>
<%--                        <a href="#">--%>
<%--                            <img src="../assets/img/list-img2.png" />--%>
<%--                            <i class="share-ic"></i>--%>
<%--                            <p class="info-production">삼성전자</p>--%>
<%--                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>--%>
<%--                        </a>--%>
<%--                        <p class="info-price">15,080원</p>--%>
<%--                        <p class="info-score">--%>
<%--                            <i class="star-ic"></i>--%>
<%--                            <span class="score-number">4.5</span>--%>
<%--                            <span class="score-text">5,324개 평가</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                    <div class="point-product-item">--%>
<%--                        <a href="#">--%>
<%--                            <img src="../assets/img/list-img3.png" />--%>
<%--                            <i class="share-ic"></i>--%>
<%--                            <p class="info-production">삼성전자</p>--%>
<%--                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>--%>
<%--                        </a>--%>
<%--                        <p class="info-price">15,080원</p>--%>
<%--                        <p class="info-score">--%>
<%--                            <i class="star-ic"></i>--%>
<%--                            <span class="score-number">4.5</span>--%>
<%--                            <span class="score-text">5,324개 평가</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                    <div class="point-product-item mar-r">--%>
<%--                        <a href="#">--%>
<%--                            <img src="../assets/img/list-img4.png" />--%>
<%--                            <p class="sale-percent">35<span>%</span></p>--%>
<%--                            <i class="share-ic"></i>--%>
<%--                            <p class="info-production">삼성전자</p>--%>
<%--                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>--%>
<%--                        </a>--%>
<%--                        <p class="info-price"><span class="price-before">23,200원</span><i class="right-arrow"></i>15,080원</p>--%>
<%--                        <p class="info-score">--%>
<%--                            <i class="star-ic"></i>--%>
<%--                            <span class="score-number">4.5</span>--%>
<%--                            <span class="score-text">5,324개 평가</span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <form id="form1" name="form1"  method="post">
                <div class="sort-tab">
                    <div class="sort-tab-left">
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=1"/>'">랭킹순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2"/>'">낮은가격순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3"/>'">높은가격순</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=4"/>'">판매량</button>
                        <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product?product_ct=${param.product_ct}&sortOrder=5"/>'">최신순</button>
                    </div>
                    <div class="sort-tab-right">
                        <select name="displayRowCount" class="order-select">
                            <option value="12" <c:if test="${searchVO.displayRowCount ==12}">selected</c:if>>12개씩 보기</option>
                            <option value="32" <c:if test="${searchVO.displayRowCount ==32}">selected</c:if>>32개씩 보기</option>
                            <option value="64" <c:if test="${searchVO.displayRowCount ==64}">selected</c:if>>64개씩 보기</option>
                            <option value="128" <c:if test="${searchVO.displayRowCount ==128}">selected</c:if>>128개씩 보기</option>
                        </select>
                    </div>
                </div>
                <div class="point-product-list">
                <div class="row clearfix">
            <c:if test="${not empty list}">
                <c:forEach var="list" items="${list}" varStatus="status">
                <c:set var="lineCut" value="${status.count%4}"></c:set>
                <div class="point-product-item">
                    <a href="<c:url value="/product/productDetail?product_cd=${list.product_cd}"/>">

                        <img src='${list.file_1}' onerror="this.src='http://placehold.it/300x300'" >
<%--                        <p class="sale-percent">35<span>%</span></p>--%>
<%--                        <i class="share-ic"></i>--%>
                        <p class="info-production">${list.product_made_company_name}</p>
                        <p class="point-pdt-title">${list.product_name}</p>
                    </a>
                    <p class="info-price">
                        <span class="price-before">
                            <fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />원</span>
                        <i class="right-arrow"></i><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />원
                    </p>
                    <p class="info-score">
                        <i class="star-ic"></i>
                        <span class="score-number">4.5</span>
                        <span class="score-text">5,324개 평가</span>
                    </p>
                </div>
                <c:if test="${lineCut  == 0}">
            </div>
            <div class="row clearfix">
            </c:if>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            표시할 내용이 없습니다.
        </c:if>
            </div>
        </div>

                <jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
<%--                <input type="hidden" name="staticRowEnd" id="staticRowEnd" value="<c:out value="${param.staticRowEnd}"/>">--%>
            </form>
    </article>
</section>
<script>
    $('.order-select').on("change",function () {
        $('#form1').submit();
    })
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>