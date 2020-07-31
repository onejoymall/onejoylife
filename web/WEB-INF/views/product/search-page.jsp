<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
    <section class="main-section">
        <h2 class="main-section-title hide">main section</h2>
        <article class="epoint-gift-wrap">
            <div class="inner clearfix">
                <c:import url="/layout/scrollRight"/>
                <div class="inner-left">
                    <p>필터</p>
                    <div class="inner-filter1 category">
                        <p class="filter-tit">${afn:getMessage('category',sessionScope.locale)}</p>
                        <ul>
                            <li><a href="/product/search-page?product_name=${param.product_name}" <c:if test="${empty param.product_ct}">class="active"</c:if>><span>${afn:getMessage("all",sessionScope.locale)}</span></a></li>
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
                        <p class="filter-tit">${afn:getMessage("domestic_foreign",sessionScope.locale)}</p>
                        <ul>

                            <li>
                                <input type="checkbox" id="in-ck1" name="product_delivery_International_type" value="A" <c:forTokens items="${param.product_delivery_International_type}" delims="^" var="item"><c:if test="${item eq 'A'}">checked</c:if></c:forTokens>>
                                <label for="in-ck1"><span><span>${afn:getMessage("domestic",sessionScope.locale)}</span></span></label>
                            </li>
                            <li>
                                <input type="checkbox" id="in-ck2" name="product_delivery_International_type" value="C" <c:forTokens items="${param.product_delivery_International_type}" delims="^" var="item"><c:if test="${item eq 'C'}">checked</c:if></c:forTokens>>
                                <label for="in-ck2"><span><span>${afn:getMessage("foreign",sessionScope.locale)}</span></span></label>
                            </li>
                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">${afn:getMessage("shoppingBenefit",sessionScope.locale)}</p>
                        <ul>
                            <li>
                                <input type="checkbox" id="in-ck3" name="product_delivery_payment_class" value="T" <c:forTokens items="${param.product_delivery_payment_class}" delims="^" var="item"><c:if test="${item eq 'T'}">checked</c:if></c:forTokens>>
                                <label for="in-ck3"><span><span>${afn:getMessage("free_shipping",sessionScope.locale)}</span></span></label>
                            </li>
                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">${afn:getMessage("brand",sessionScope.locale)}</p>
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
                        <p class="filter-tit">${afn:getMessage("color",sessionScope.locale)}</p>
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
                        <p class="filter-tit">${afn:getMessage("reviewRating",sessionScope.locale)}</p>
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
                                        <p class="score">(${afn:getMessage("score_5",sessionScope.locale)})</p>
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
                                        <p class="score">(${afn:getMessage("score_4",sessionScope.locale)})</p>
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
                                        <p class="score">(${afn:getMessage("score_3",sessionScope.locale)})</p>
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
                                        <p class="score">(${afn:getMessage("score_2",sessionScope.locale)})</p>
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
                                        <p class="score">(${afn:getMessage("score_1",sessionScope.locale)})</p>
                                    </span>
                                </label>
                            </li>
                        </ul>
                    </div>
                    <div class="inner-filter1">
                        <p class="filter-tit">${afn:getMessage("price",sessionScope.locale)}</p>
                        <ul>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(0,10000);" data-id="1" class="filter-tit-a"><span>${afn:getMessage("1_thousand",sessionScope.locale)} ${afn:getMessage("Lessthan",sessionScope.locale)}</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(10000,20000);" data-id="2" class="filter-tit-a"><span>${afn:getMessage("1_thousand",sessionScope.locale)} ~ ${afn:getMessage("2_thousand",sessionScope.locale)}</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(20000,30000);" data-id="3" class="filter-tit-a"><span>${afn:getMessage("2_thousand",sessionScope.locale)} ~ ${afn:getMessage("3_thousand",sessionScope.locale)}</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(30000,40000);" data-id="4" class="filter-tit-a"><span>${afn:getMessage("3_thousand",sessionScope.locale)} ~ ${afn:getMessage("4_thousand",sessionScope.locale)}</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(40000,50000);" data-id="5" class="filter-tit-a"><span>${afn:getMessage("4_thousand",sessionScope.locale)} ~ ${afn:getMessage("5_thousand",sessionScope.locale)}</span></a></li>
                            <li><a href="javascript:void(0)" onclick="setPaymentfilter(50000,100000000);" data-id="6" class="filter-tit-a"><span>${afn:getMessage("5_thousand",sessionScope.locale)} ${afn:getMessage("Morethan",sessionScope.locale)}</span></a></li>
                        </ul>
                        <div class="input-search">
                            <input type="text" name="searchToPayment" id="searchToPayment" value="${param.searchToPayment}">
                            <span> ~ </span>
                            <input type="text" name="searchBePayment" id="searchBePayment" value="${param.searchBePayment}">
<%--                            <button>검색</button>--%>
                        </div>
                    </div>
                </div>
                <div class="inner-right">
                    <form id="form1" name="form1"  method="get">


                        <p class="gift-amount"><span>${param.product_name}</span> ${afn:getMessage("msg.search.search_results_for",sessionScope.locale)} <span class="gift-amount-number"><fmt:formatNumber value="${searchVO.totRow}" groupingUsed="true" /></span> ${afn:getMessage("case",sessionScope.locale)}</p>
                        <div class="sort-tab">
                            <div class="sort-tab-left">
                                <c:if test="${not empty param.product_ct}">
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=1&product_name=${param.product_name}"/>'">${afn:getMessage("shortRanking",sessionScope.locale)}</button>
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=ASC&sortOrder=2&product_name=${param.product_name}"/>'">${afn:getMessage("shortLowPrice",sessionScope.locale)}</button>
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&orderByKey=product_payment&orderByValue=DESC&sortOrder=3&product_name=${param.product_name}"/>'">${afn:getMessage("shorthighPrice",sessionScope.locale)}</button>
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=4&product_name=${param.product_name}"/>'">${afn:getMessage("shortSales",sessionScope.locale)}</button>
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?product_ct=${param.product_ct}&sortOrder=5&product_name=${param.product_name}"/>'">${afn:getMessage("shortNewest",sessionScope.locale)}</button>
                                </c:if>
                                <c:if test="${empty param.product_ct}">
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == 1}"><c:out value=" active"/></c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=1&product_name=${param.product_name}"/>'">${afn:getMessage("shortRanking",sessionScope.locale)}</button>
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder == '2'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?orderByKey=product_payment&orderByValue=ASC&sortOrder=2&product_name=${param.product_name}"/>'">${afn:getMessage("shortLowPrice",sessionScope.locale)}</button>
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 3}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?orderByKey=product_payment&orderByValue=DESC&sortOrder=3&product_name=${param.product_name}"/>'">${afn:getMessage("shorthighPrice",sessionScope.locale)}</button>
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq '4'}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=4&product_name=${param.product_name}"/>'">${afn:getMessage("shortSales",sessionScope.locale)}</button>
                                    <button type="button" class="sort-tab-item <c:if test="${searchVO.sortOrder eq 5}">active</c:if>" onclick="location.href='<c:url value="/product/search-page?sortOrder=5&product_name=${param.product_name}"/>'">${afn:getMessage("shortNewest",sessionScope.locale)}</button>
                                </c:if>
                            </div>
                            <div class="sort-tab-right">
                                <select name="displayRowCount" class="order-select">
                                    <option value="12" <c:if test="${searchVO.displayRowCount ==12}">selected</c:if>>${afn:getMessage("display_row12",sessionScope.locale)}</option>
                                    <option value="32" <c:if test="${searchVO.displayRowCount ==32}">selected</c:if>>${afn:getMessage("display_row32",sessionScope.locale)}</option>
                                    <option value="64" <c:if test="${searchVO.displayRowCount ==64}">selected</c:if>>${afn:getMessage("display_row64",sessionScope.locale)}</option>
                                    <option value="128" <c:if test="${searchVO.displayRowCount ==128}">selected</c:if>>${afn:getMessage("display_row128",sessionScope.locale)}</option>
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
                                        <div class="img-out">
                                            <img src='${list.file_1}' onerror="this.src='http://placehold.it/300x300'" >
                                        </div>
                                                <%--                        <p class="sale-percent">35<span>%</span></p>--%>
                                            <%--                        <i class="share-ic"></i>--%>
<%--                                        <p class="info-production">${list.product_made_company_name}</p>--%>
                                        <p class="sale-percent">${list.percent_discount} <span>%</span></p>
                        				<i class="share-ic" onclick="share_product('${list.product_cd}', '${list.product_name}')"></i>
                       					<p class="info-production">${list.product_made_company_name}</p>
                                        <p class="point-pdt-title">${list.product_name}</p>
                                    </a>
                                    <p class="info-price">
                    <span class="price-before">
                        <fmt:formatNumber value="${list.product_user_payment}" groupingUsed="true" />>${afn:getMessage("korea_won",sessionScope.locale)}</span>
                                        <i class="right-arrow"></i><fmt:formatNumber value="${list.product_payment}" groupingUsed="true" />${afn:getMessage("korea_won",sessionScope.locale)}
                                    </p>
                                    <p class="info-score">
                                        <i class="star-ic"></i>
                                        	<c:if test="${list.review_score == 0 }"><span class="score-number" >0.0</span></c:if>
					    					<c:if test="${list.review_score != NULL and list.review_score != 0 }"><span class="score-number" >${list.review_score}</span></c:if>
					                       
					                        <c:if test="${list.review_cnt == NULL }"><span class="score-text">0${afn:getMessage("reviewCount",sessionScope.locale)}</span></c:if>
					                        <c:if test="${list.review_cnt != NULL }"><span class="score-text">${list.review_cnt}${afn:getMessage("reviewCount",sessionScope.locale)}</span></c:if>
					                        <input type="hidden" name="product_option_yn" value="${list.product_option_yn}" />
					                        <a href="#"  onclick="addShoppingBasketF('${list.product_cd}')"  data-yn="${list.product_option_yn}" class="list-cartic"></a>
                                    </p>
                                </div>
                                <c:if test="${lineCut  == 0}">
                            </div>
                            <div class="row clearfix">
                                </c:if>
                                </c:forEach>
                                </c:if>
                                <c:if test="${empty list}">
                                    ${afn:getMessage("msg.none_content",sessionScope.locale)}
                                </c:if>
                            </div>
                        </div>
                        <c:if test="${not empty param.product_name}">
                        <input type="hidden" name="product_name" value="${param.product_name}">
                        </c:if>
                        <c:if test="${not empty param.product_ct}">
                        <input type="hidden" name=product_ct value="${param.product_ct}">
                        </c:if>
                        <c:if test="${not empty param.product_score}">
                        <input type="hidden" name="product_score" value="${param.product_score}">
                        </c:if>
                        <c:if test="${not empty param.product_option_color}">
                        <input type="hidden" name="product_option_color" value="${param.product_option_color}">
                        </c:if>
                        <c:if test="${not empty param.product_delivery_International_type}">
                        <input type="hidden" name="product_delivery_International_type" value="${param.product_delivery_International_type}">
                        </c:if>
                        <c:if test="${not empty param.product_delivery_payment_class}">
                        <input type="hidden" name="product_delivery_payment_class" value="${param.product_delivery_payment_class}">
                        </c:if>
                        <c:if test="${not empty param.product_brand}">
                        <input type="hidden" name="product_brand" value="${param.product_brand}">
                        </c:if>
                        <c:if test="${not empty param.searchToPayment}">
                        <input type="hidden" name="searchToPayment" value="${param.searchToPayment}">
                        </c:if>
                        <c:if test="${not empty param.searchBePayment}">
                        <input type="hidden" name="searchBePayment" value="${param.searchBePayment}">
                        </c:if>
                        <c:if test="${not empty param.orderByKey}">
                        <input type="hidden" name="orderByKey" value="${param.orderByKey}">
                        </c:if>
                        <c:if test="${not empty param.orderByValue}">
                        <input type="hidden" name="orderByValue" value="${param.orderByValue}">
                        </c:if>
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
                    $('#main-search-form').submit();
                }else{
                    $('input[name=product_ct]').remove();
                }

            });
        })
    </script>
   <c:import url="/layout/footer"/>
<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>