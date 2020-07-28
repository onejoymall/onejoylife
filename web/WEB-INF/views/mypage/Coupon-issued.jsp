<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<script type="text/javascript">
var msg = "${msg}";
alert(msg ? msg : "${afn:getMessage('error.wrong_access',sessionScope.locale)}");
location.href="/MyPage/Coupon";
</script>
<c:import url="/layout/footer"/>

<%-- <%@ include file="/WEB-INF/views/layout/footer.jsp" %> --%>
