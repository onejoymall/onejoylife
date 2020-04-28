<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/manager/managerLayout/managerHeader.jsp" %>
    <main>
        <div class="main-content">
            <div class="main-header">
                <h2 name="detail">지역별 배송비 설정</h2>

            </div>
            <div class="goods-detail-wrap">
                <form:form id="defaultForm" name="defaultForm" commandName="detail">
                    <h3>지역별 배송비 목록</h3>
                    <table class="goods-detail-table">
                        <colgroup>
                            <col width="142px">
                            <col width="800px">
                        </colgroup>
                    </table>
                </form:form>
            </div>
        </div>
    </main>
    <script type="text/javascript" src="/assets/js/goods-add.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
    <script src="<c:url value='/assets/js/lang/summernote-ko-KR.js'/>"></script>
    <script type="text/javascript" src="/assets/js/index.js"></script>

<%@ include file="/WEB-INF/views/manager/managerLayout/managerFooter.jsp" %>