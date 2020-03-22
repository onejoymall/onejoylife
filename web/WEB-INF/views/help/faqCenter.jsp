<%--
  Created by IntelliJ IDEA.
  User: myLoad
  Date: 2020-03-01
  Time: 오후 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div class="wrap">
    <div class="page-box">
        <main class="clearfix">
            <%@ include file="/WEB-INF/views/layout/helpLeftNav.jsp" %>
            <div class="right-contain">
                <div class="r-sec1">
                    <p class="sec1-h1">FAQ</p>
                    <div class="faq-search-box">
                        <span>FAQ 검색</span>
                        <form action="" id="faq-search-form" name="faq-search-form" method="get">
                            <input type="text" id="faq-search" name="faq-search" class="input-text">
                            <button id="faq-search-btn" type="button" class="search-btn">검색</button>
                        </form>
                    </div>
                    <div class="faq-sort-list">
                        <div class="faq-sort-item" id="faq-faq">
                            <a href="#">
                                <div class="imgbox"><i></i></div>
                                <p>자주하는질문</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-qna">
                            <a href="#">
                                <div class="imgbox"><i></i></div>
                                <p>상품문의</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-pay">
                            <a href="#">
                                <div class="imgbox"><i></i></div>
                                <p>주문/결제</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-refund">
                            <a href="#">
                                <div class="imgbox"><i></i></div>
                                <p>교환/반품/환불</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-shipping">
                            <a href="#">
                                <div class="imgbox"><i></i></div>
                                <p>배송/설치/AS</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-event">
                            <a href="#">
                                <div class="imgbox"><i></i></div>
                                <p>이벤트/경품</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-epoint">
                            <a href="#">
                                <div class="imgbox"><i></i></div>
                                <p>E-포인트</p>
                            </a>
                        </div>
                        <div class="faq-sort-item" id="faq-etc">
                            <a href="#">
                                <div class="imgbox"><i></i></div>
                                <p>기타</p>
                            </a>
                        </div>
                    </div>
                    <div class="faq-search-result active">
                        <p><b class="text-red">"<span id="search1">냉장구</span>"</b>관련 검색결과 총 <b class="text-red"><span id="search2">0</span></b> 개가 검색되었습니다.</p>
                    </div>
                    <ul class="faq-data-list">
                        <li class="faq-data-title">
                            <div class="faq-sort">타입</div>
                            <div class="faq-title">질문 제목</div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    상품
                                </div>
                                <div class="faq-title"><span>LCD 화면에 줄이 생겨서 지저분하게 보여요.</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            매장의 경우 자택과 달리 많은 조명과 빛으로 인해 TV 화면이 상대적으로 밝고 선명하게 느껴질 수 있습니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    배송
                                </div>
                                <div class="faq-title"><span>상품문의</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                            문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                            감사합니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    배송
                                </div>
                                <div class="faq-title"><span>LCD TV의 화면이 매장과 달라보이는 이유는 뭔가요?</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            매장의 경우 자택과는 달리 많은 조명과 빛 때문에 TV 화면이 상대적으로 밝고 선명하게 느껴질 수 있습니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    이벤트
                                </div>
                                <div class="faq-title"><span>LCD TV를 구입하면 벽걸이 설치는 무료인가요?</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                            문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                            감사합니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    회원가입
                                </div>
                                <div class="faq-title"><span>회원가입 시 입력한 배송 정보를 바꾸고 싶어요.</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                            문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                            감사합니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    포인트
                                </div>
                                <div class="faq-title"><span>포인트 사용 내역은 어디에서 확인할 수 있나요?</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                            문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                            감사합니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    기타
                                </div>
                                <div class="faq-title"><span>회원 탈퇴는 어디에서 할 수 있나요?</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                            문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                            감사합니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    배송
                                </div>
                                <div class="faq-title"><span>몇 시까지 주문 시 익일배송을 받을 수 있나요?</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                            문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                            감사합니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    배송
                                </div>
                                <div class="faq-title"><span>상품문의</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                            문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                            감사합니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item">
                            <div class="main-title-box" tabindex="0">
                                <div class="faq-sort">
                                    배송
                                </div>
                                <div class="faq-title"><span>상품문의</span></div>
                            </div>
                            <div class="content-box">
                                <div class="faq-setting-box">
                                    <span>첨부파일 : <i class="file-ic"></i><a href="#" class="file-name">설치신청서.DOC</a></span>
                                </div>
                                <div class="faq-content-body">
                                    <div class="faq-content-body-a">
                                        <p>
                                            안녕하세요, 고객님. 원조이라이프 고객센터입니다.<br>
                                            문의하신 상품의 다른 색상을 확인해 본 결과, 오프라인 매장에서만 판매하고 있는 제품임을 양해 부탁드립니다.<br>
                                            감사합니다.
                                        </p>
                                    </div>
                                    <div class="faq-content-body-c">
                                        <p>답변이 충분하지 않으셨다면 1:1 문의를 이용해주세요. <span><a href="help-4.html">1:1 문의하기</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="faq-data-item-none">
                            <p>검색된 결과가 없습니다.</p>
                        </li>
                    </ul>
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

        </main>
    </div>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

