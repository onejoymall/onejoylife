<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<ul class="cateList">
<c:if test="${not empty categoryList}">
<c:forEach var="ctegoryList" items="${categoryList}" varStatus="status">
    <li>
        <a href="/product?product_ct=${ctegoryList.pd_category_id}">${ctegoryList.pd_category_name}</a>
        <button type="button"></button>
        <ul class="cateList-2dp">
        <c:if test="${not empty subList}">
            <c:forEach var="subList" items="${subList}">
                <c:if test="${ctegoryList.pd_category_id eq subList.pd_category_upper_code}">
                    <li>
                    <a href="/product?product_ct=${subList.pd_category_id}"><span></span>${subList.pd_category_name}</a>
                    <button type="button"></button>
                    <ul class="cateList-3dp">
                    <c:if test="${not empty thirdList}">
                        <c:forEach var="thirdList" items="${thirdList}">
                            <c:if test="${subList.pd_category_id eq thirdList.pd_category_upper_code}">
                                <li>
                                <a href="/product?product_ct=${thirdList.pd_category_id}"><span></span>${thirdList.pd_category_name}</a>
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
    </li>
</c:forEach>
</c:if>
</ul>