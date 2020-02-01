<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-31
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<section class="main-section">
    <h2 class="main-section-title hide">main section</h2>
    <article class="epoint-gift-wrap">
        <div class="inner clearfix">
            <h3>E-point 경품추첨</h3>
            <p class="gift-amount">경품 카테고리에 <span class="gift-amount-number">1,017</span>개의 상품이 등록되어 있습니다.</p>
            <div class="sort-tab">
                <div class="sort-tab-left">
                    <button type="button" class="sort-tab-item active">임박순</button>
                    <button type="button" class="sort-tab-item">낮은가격순</button>
                    <button type="button" class="sort-tab-item">높은가격순</button>
                </div>
                <div class="sort-tab-right">
                    <select name="order" class="order-select">
                        <option value="9">9개씩 보기</option>
                        <option value="24">24개씩 보기</option>
                        <option value="60">60개씩 보기</option>
                    </select>
                </div>
            </div>
            <div class="point-product-list">
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img1.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                        </a>
                        <p class="point-pdt-price">469,000원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <span class="progress-now-number">80%</span><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img2.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>
                        </a>
                        <p class="point-pdt-price">391,200원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img3.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="point-pdt-price">193,800원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img1.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                        </a>
                        <p class="point-pdt-price">469,000원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <span class="progress-now-number">80%</span><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img2.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>
                        </a>
                        <p class="point-pdt-price">391,200원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img3.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="point-pdt-price">193,800원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img1.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">발뮤다 가습기 (ERN-1100SD-WK)</p>
                        </a>
                        <p class="point-pdt-price">469,000원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <span class="progress-now-number">80%</span><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img2.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">[매넌/아르댓/뮤제外]19 WINTER 코트 대전 최대20% 할인</p>
                        </a>
                        <p class="point-pdt-price">391,200원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                    <div class="point-product-item">
                        <a href="<c:url value="/giveaway/giveawaydetail"/>">
                            <img src="../assets/img/e-point-img3.png" />
                            <i class="share-ic"></i>
                            <p class="point-pdt-title">[스페셜오더]_Everywhere Quilting Set (4 Color)</p>
                        </a>
                        <p class="point-pdt-price">193,800원</p>
                        <p class="deadline">~2020.02.03</p>
                        <div class="point-pdt-parti-wrap">
                            <div class="parti-percent-wrap">
                                <span class="progress">0%</span>
                                <span class="progress-now">참여율 <b class="progress-now-number">80%</b><span class="parti-ppl"> &#40;<span class="parti-ppl-number">150</span>명 참여 중&#41;</span></span>
                                <span class="progress">100%</span>
                            </div>
                            <div class="progress-bar">
                                <div class="progress-bar-active"></div>
                            </div>
                            <div class="parti-point-wrap">
                                <p><span class="parti-point-now">195,980</span>/239,000 E-point</p>
                                <p>&#40;현재 참여 응모포인트/전체 응모포인트&#41;</p>
                            </div>
                        </div>
                    </div>
                </div>
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">≪</a></li>
                    <li class="page-item"><a class="page-link" href="#">＜</a></li>
                    <li class="page-item"><a class="page-link active" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">6</a></li>
                    <li class="page-item"><a class="page-link" href="#">7</a></li>
                    <li class="page-item"><a class="page-link" href="#">8</a></li>
                    <li class="page-item"><a class="page-link" href="#">9</a></li>
                    <li class="page-item"><a class="page-link" href="#">10</a></li>
                    <li class="page-item"><a class="page-link" href="#">＞</a></li>
                    <li class="page-item"><a class="page-link" href="#">≫</a></li>
                </ul>
            </div>
        </div>
    </article>
</section>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>