<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
<main>
    <div class="main-content">
        <div class="main-header">
            <h2 name="detail">배너관리</h2>
            <div class="main-hd-btn-wrap">
<%--                <button type="button" name="detail">화면 보기</button>--%>
                <button type="button" id="formBannerSubmit">저장하기</button>
            </div>
        </div>
        <div class="main-body">
            <form name="defaultForm" id="defaultForm" method="post"  enctype="multipart/form-data">


            <div class="main-left">
                <ul class="category-tree">
                	<c:if test="${not empty list}">
                    <c:forEach var="list" items="${list}" varStatus="status">
                        <li>
                            <a href="#" onclick="selectBanner(${list.banner_id})"><span></span>${list.banner_name}</a>
                        </li>
                    </c:forEach>
                	</c:if>
                </ul>
            </div>
            <div class="main-right hidden">
                <div class="main-right-1">
                    <div class="main-right-head">
<%--                        <p>--%>
<%--                            [ <span id="pd_category_name"></span> ]<input type="text">--%>
<%--                        </p>--%>
                        <p class="left-head-tit">
                            <span>
                            	<input type="hidden" name="banner_id">
                                <input type="text" name="banner_name"  style="color:#363636!important;">
                            </span>
                        </p>
                    </div>
                    <div class="main-right-sec">
                        <table class="right-table">
                            <colgroup>
                                <col style="width: 20%;">
                                <col style="width: 80%;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>배너 클릭시 타입</td>
                                <td class="radio-td">
                                    <input type="radio" id="right-ra1" name="banner_event_type" class="styleClass" value="H" checked>
                                    <label for="right-ra1"><span>링크</span></label>
                                    <input type="radio" id="right-ra2" name="banner_event_type" class="styleClass" value="P">
                                    <label for="right-ra2"><span>상품</span></label>
                                    <input type="radio" id="right-ra3" name="banner_event_type" class="styleClass" value="C">
                                    <label for="right-ra3"><span>카테고리</span></label>
                                </td>
                            </tr>
                            <tr class="banner-input banner-H">
                                <td>링크</td>
                                <td><input type="text" class="text-width" name="banner_href"></td>
                            </tr>
                            <tr class="banner-input banner-C hidden">
                                <td>카테고리 번호</td>
                                <td><input type="text" class="text-width" name="banner_product_ct"></td>
                            </tr>
                            <tr class="banner-input banner-P hidden">
                                <td>상품코드</td>
                                <td><input type="text" class="text-width" name="banner_product_cd"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="main-right-2">
                    <div class="main-right-sec">
                        <table class="right-table">
                            <colgroup>
                                <col style="width: 20%;">
                                <col style="width: 80%;">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>배너 이미지</td>
                                <td>
                                    <img src="" onerror="this.src='http://placehold.it/330x150'" width="330" class="file_link1" />
                                    <div class="fileBox">
                                        <input type="text" class="fileName" name="fileName" readonly="readonly">
                                        <label for="searchDetailTopImg" class="btn_file">파일찾기</label>
                                        <input type="file" id="searchDetailTopImg" name="uploadfile" class="uploadBtn">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</main>

<script>
$(function(){
	$("input[type=radio]").on("input click",function(){
		$(".banner-input").addClass("hidden");
		$(".banner-"+$(this).val()).removeClass("hidden");
	});
})
</script>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>
