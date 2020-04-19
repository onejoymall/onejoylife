<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <section class="main-section">
        <h2 class="main-section-title hide">main section</h2>
        <article class="epoint-gift-wrap">
            <div class="inner clearfix">
                <div class="inner-left">
                    <p>필터</p>
                    <div class="inner-filter1 category">
                        <p class="filter-tit">카테고리</p>
                        <ul>
                            <li><a href="/product/search-page?product_name=${param.product_name}" <c:if test="${empty param.product_ct}">class="active"</c:if>><span>전체</span></a></li>
                    <c:if test="${not empty categoryList}">
                        <c:forEach var="ctegoryList" items="${categoryList}" varStatus="status">
                            <li>
                                <a href="javascript:void(0);"  data-id="${ctegoryList.pd_category_id}" <c:if test="${ctegoryList.pd_category_id eq param.product_ct}">class="active"</c:if>>${ctegoryList.pd_category_name}</a>
                                <div class="out-ul" style="display: none;">
                                    <ul>
                            <c:if test="${not empty subList}">
                                <c:forEach var="subList" items="${subList}">
                                    <c:if test="${ctegoryList.pd_category_id eq subList.pd_category_upper_code}">
                                        <li>
                                            <a href="javascript:void(0);" data-id="${subList.pd_category_id}"<c:if test="${subList.pd_category_id eq param.product_ct}">class="active"</c:if> >${subList.pd_category_name}</a>
                                            <ul class="in-ul">
                                    <c:if test="${not empty thirdList}">
                                        <c:forEach var="thirdList" items="${thirdList}">
                                            <c:if test="${subList.pd_category_id eq thirdList.pd_category_upper_code}">
                                                <li>
                                                    <a href="javascript:void(0);" data-id="${thirdList.pd_category_id}" <c:if test="${thirdList.pd_category_id eq param.product_ct}">class="active"</c:if>>${thirdList.pd_category_name}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                            </ul>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                                    </ul>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>

                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">국내/해외</p>
                        <ul>

                            <li>
                                <input type="checkbox" id="in-ck1" name="product_delivery_International_type" value="A" <c:forTokens items="${param.product_delivery_International_type}" delims="^" var="item"><c:if test="${item eq 'A'}">checked</c:if></c:forTokens>>
                                <label for="in-ck1"><span><span>국내</span></span></label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck2" name="product_delivery_International_type" value="C" <c:forTokens items="${param.product_delivery_International_type}" delims="^" var="item"><c:if test="${item eq 'C'}">checked</c:if></c:forTokens>>
                                <label for="in-ck2"><span><span>해외</span></span></label>
                            </li>
                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">배송혜택</p>
                        <ul>
                            <li>
                                <input type="checkbox" id="in-ck3" name="product_delivery_payment_class" value="T" <c:forTokens items="${param.product_delivery_payment_class}" delims="^" var="item"><c:if test="${item eq 'T'}">checked</c:if></c:forTokens>>
                                <label for="in-ck3"><span><span>무료배송</span></span></label>
                            </li>
                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">브랜드</p>
                        <ul>
                    <c:if test="${not empty brandList}">
                        <c:forEach var="brandList" items="${brandList}" varStatus="status">
                            <li>
                                <input type="checkbox" id="brand${status.index}" name="product_brand" value="${brandList.product_brand}" <c:forTokens items="${param.product_brand}" delims="^" var="item"><c:if test="${item eq brandList.product_brand}">checked</c:if></c:forTokens>>
                                <label for="brand${status.index}"><span><span>${brandList.product_brand_name}</span></span></label>
                            </li>
                        </c:forEach>
                    </c:if>
                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">색상</p>
                        <ul>
                            <li>
                                <input type="checkbox" id="in-ck8" name="product_option_color" value="red" <c:forTokens items="${param.product_option_color}" delims="^" var="item"><c:if test="${item eq 'red'}">checked</c:if></c:forTokens>>
                                <label for="in-ck8"><span><span class="color-box1"></span></span></label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck9"  name="product_option_color" value="orangered" <c:forTokens items="${param.product_option_color}" delims="^" var="item"><c:if test="${item eq 'orangered'}">checked</c:if></c:forTokens>>
                                <label for="in-ck9"><span><span class="color-box2"></span></span></label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck10"  name="product_option_color" value="yellow" <c:forTokens items="${param.product_option_color}" delims="^" var="item"><c:if test="${item eq 'yellow'}">checked</c:if></c:forTokens>>
                                <label for="in-ck10"><span><span class="color-box3"></span></span></label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck11"  name="product_option_color" value="green" <c:forTokens items="${param.product_option_color}" delims="^" var="item"><c:if test="${item eq 'green'}">checked</c:if></c:forTokens>>
                                <label for="in-ck11"><span><span class="color-box4"></span></span></label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck12"  name="product_option_color" value="blue" <c:forTokens items="${param.product_option_color}" delims="^" var="item"><c:if test="${item eq 'blue'}">checked</c:if></c:forTokens>>
                                <label for="in-ck12"><span><span class="color-box5"></span></span></label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck13"  name="product_option_color" value="indigo" <c:forTokens items="${param.product_option_color}" delims="^" var="item"><c:if test="${item eq 'indigo'}">checked</c:if></c:forTokens>>
                                <label for="in-ck13"><span><span class="color-box6"></span></span></label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck14"  name="product_option_color" value="purple" <c:forTokens items="${param.product_option_color}" delims="^" var="item"><c:if test="${item eq 'purple'}">checked</c:if></c:forTokens>>
                                <label for="in-ck14"><span><span class="color-box7"></span></span></label>
                            </li>
                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">평점</p>
                        <ul>
                            <li>
                                <input type="checkbox" id="in-ck15" name="product_score" value="5" <c:forTokens items="${param.product_score}" delims="^" var="item"><c:if test="${item eq 5}">checked</c:if></c:forTokens>>
                                <label for="in-ck15">
                                    <span>
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                        </div>
                                        <p class="score">(5점)</p>
                                    </span>
                                </label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck16" name="product_score" value="4" <c:forTokens items="${param.product_score}" delims="^" var="item"><c:if test="${item eq 4}">checked</c:if></c:forTokens>>
                                <label for="in-ck16">
                                    <span>
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-empty"></i>
                                        </div>
                                        <p class="score">(4점)</p>
                                    </span>
                                </label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck17" name="product_score" value="3" <c:forTokens items="${param.product_score}" delims="^" var="item"><c:if test="${item eq 3}">checked</c:if></c:forTokens>>
                                <label for="in-ck17">
                                    <span>
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-empty"></i>
                                            <i class="y-star-empty"></i>
                                        </div>
                                        <p class="score">(3점)</p>
                                    </span>
                                </label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck18" name="product_score" value="2" <c:forTokens items="${param.product_score}" delims="^" var="item"><c:if test="${item eq 2}">checked</c:if></c:forTokens>>
                                <label for="in-ck18">
                                    <span>
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-full"></i>
                                            <i class="y-star-empty"></i>
                                            <i class="y-star-empty"></i>
                                            <i class="y-star-empty"></i>
                                        </div>
                                        <p class="score">(2점)</p>
                                    </span>
                                </label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck19" name="product_score" value="1" <c:forTokens items="${param.product_score}" delims="^" var="item"><c:if test="${item eq 1}">checked</c:if></c:forTokens>>
                                <label for="in-ck19">
                                    <span>
                                        <div class="star-box">
                                            <i class="y-star-full"></i>
                                            <i class="y-star-empty"></i>
                                            <i class="y-star-empty"></i>
                                            <i class="y-star-empty"></i>
                                            <i class="y-star-empty"></i>
                                        </div>
                                        <p class="score">(1점)</p>
                                    </span>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">가격</p>
                        <ul>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(0,10000);" data-id="1" class="filter-tit-a"><span>1만원 이하</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(10000,20000);" data-id="2" class="filter-tit-a"><span>1만원 ~ 2만원</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(20000,30000);" data-id="3" class="filter-tit-a"><span>2만원 ~ 3만원</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(30000,40000);" data-id="4" class="filter-tit-a"><span>3만원 ~ 4만원</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(40000,50000);" data-id="5" class="filter-tit-a"><span>4만원 ~ 5만원</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(50000,100000000);" data-id="6" class="filter-tit-a"><span>5만원 이상</span></a></li>
                        </ul>
                        <div class="input-search">
                            <input type="text" name="searchToPayment" id="searchToPayment" value="${param.searchToPayment}">
                            <span> ~ </span>
                            <input type="text" name="searchBePayment" id="searchBePayment" value="${param.searchBePayment}">
                            <button>검색</button>
                        </div>
                    </div>
                </div>
                <div class="inner-right">
                    <form id="form1" name="form1"  method="post">
                        <p class="gift-amount"><span>${param.product_name}</span> 에 대한 검색 결과 <span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span> 건</p>
                        <div class="sort-tab">
                            <div class="sort-tab-left">
                                <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=1&product_name=${param.product_name}"/>'">랭킹순</button>
                                <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2&product_name=${param.product_name}"/>'">낮은가격순</button>
                                <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3&product_name=${param.product_name}"/>'">높은가격순</button>
                                <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=4&product_name=${param.product_name}"/>'">판매량</button>
                                <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=5&product_name=${param.product_name}"/>'">최신순</button>
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
                                <c:set var="lineCut" value="${status.count%3}"></c:set>
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
                </div>
            </div>
        </article>
    </section>
    <script>
        //검색 필터
        $(document).ready(function(){
            $(".out-ul").hide();
            $(".category ul li a").click(function(){
                event.preventDefault();
                $(this).next().slideToggle(300);
            });
        });
        $(function(){
            $('.category ul li>a').click(function(){
                $('.inner-filter1 li>a').removeClass('active');
                $(this).addClass('active');
                //검색필터 담기
                var dataId=  $(this).attr("data-id");
                if(dataId){
                    $('input[name=product_ct]').remove();
                    $('#main-search-form').append(
                        '<input type="hidden" name="product_ct" value="'+$(this).attr('data-id')+'">'
                    )
                }else{
                    $('input[name=product_ct]').remove();
                }

            });
        })
    </script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>