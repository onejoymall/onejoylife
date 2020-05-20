<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-05-14
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal" id="modal-info-privacy">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoPrivacy.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="link-info-main">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoMain.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="link-info-main2">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoMain2.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="modal-info-privacy2">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoPrivacy2.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal" id="modal-info-privacy3">
    <div class="modal-bg"></div>
    <div class="modal-content clearfix">
        <div class="modal-header">
           <h2 class="modal-title"></h2>
        </div>
        <div class="modal-body clearfix">
            <div class="modal-body-wrap">
                <div class="modal-in-txt clearfix">
                    <p><c:out value="${infoPrivacy3.market_config_value}" escapeXml="false"/></p>
                </div>
                <div class="btn-area clearfix">
                    <button type="button" href="javascript:void(0)" class="md-btn-default">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $("#mo-btn1").click(function(){
            event.preventDefault();
            $("#modal-info-privacy").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#modal-info-privacy").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#mo-btn2").click(function(){
            event.preventDefault();
            $("#link-info-main").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#link-info-main").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#mo-btn3").click(function(){
            event.preventDefault();
            $("#link-info-main2").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#link-info-main2").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#mo-btn4").click(function(){
            event.preventDefault();
            $("#modal-info-privacy2").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#modal-info-privacy2").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
    $(function(){
        $("#mo-btn5").click(function(){
            event.preventDefault();
            $("#modal-info-privacy3").attr("style", "display:block");
            $('body').css("overflow", "hidden");
        });
        $(".md-btn-default").click(function(){
            $("#modal-info-privacy3").attr("style", "display:none");
            $('body').css("overflow", "auto");
        });
    });
</script>
