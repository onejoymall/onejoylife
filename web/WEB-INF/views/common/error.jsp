<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/arr.tld" prefix="afn" %>

<!DOCTYPE html>
<html>
<head><title>${afn:getMessage("error_title",sessionScope.locale)}</title></head>
<body>
<strong>${afn:getMessage("msg_errorInfo1-1",sessionScope.locale)}</strong>
<br><br>
${afn:getMessage("msg_errorInfo1-2",sessionScope.locale)}
</body>
</html>
