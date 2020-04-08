<%--
  Created by IntelliJ IDEA.
  User: road
  Date: 2020-01-28
  Time: 오전 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="default-modal">
  <div class="modal-content">
    <div class="modal-header">
      <h2>test</h2>
      <button type="button" class="style-modal-close" onclick="$('.default-modal').attr('style','display:none')">×</button>
    </div>
    <div class="modal-body">
      test
    </div>
  </div>
</div>
</body>
<!-- Toastr -->
<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
<script src='<c:url value="/assets/js/summernote-ko-KR.js"/>'></script>
<script type="text/javascript" src="/assets/js/index.js"></script>
<script src='<c:url value="/assets/plugins/toast/jquery.toast.min.js"/>'></script>
<script src='<c:url value="/assets/js/commonScript.js"/>'></script>
<script src='<c:url value="/assets/js/commonScriptSub.js"/>'></script>
<script src='<c:url value="/assets/js/commonMgScript.js"/>'></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
