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

<div class="modal1" id="modal-1">
    <div class="modal1-bg"></div>
    <div class="modal1-content clearfix">
        <div class="modal1-header">
            <h2 class="modal1-title">원조이몰 이용약관</h2>
            <button type="button" class="modal-close"></button>
        </div>
        <div class="modal1-body clearfix">
            <div class="modal1-body-wrap clearfix">
                <div class="modal1-in-txt clearfix">
                    <p>test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam voluptates accusantium sint officia corrupti, tempore quidem doloribus.test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam voluptates accusantium sint officia corrupti, tempore quidem doloribus.test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam voluptates accusantium sint officia corrupti, tempore quidem doloribus.test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam voluptates accusantium sint officia corrupti, tempore quidem doloribus.test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam voluptates accusantium sint officia corrupti, tempore quidem doloribus.test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam voluptates accusantium sint officia corrupti, tempore quidem doloribus.

                    </p>
                </div>
                <!-- <div class="btn-area clearfix">
                <button type="button" class="md-btn-default">확인</button>
                </div> -->
            </div>

        </div>
    </div>
</div>
<div class="modal1" id="modal-2">
    <div class="modal1-bg"></div>
    <div class="modal1-content clearfix">
        <div class="modal1-header">
            <h2 class="modal1-title">원조이몰 이용약관</h2>
            <button type="button" class="modal-close"></button>
        </div>
        <div class="modal1-body clearfix">
            <div class="modal1-body-wrap clearfix">
                <div class="modal1-in-txt clearfix">
                    <p>test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam voluptates accusantium sint officia corrupti, tempore quidem doloribus.test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam voluptates accusantium sint officia corrupti, tempore quidem doloribus.test Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum ullam quod nostrum aut debitis, reprehenderit ratione veniam a, rem dolore repudiandae aperiam volupt

                    </p>
                </div>
                <!-- <div class="btn-area clearfix">
                <button type="button" class="md-btn-default">확인</button>
                </div> -->
            </div>

        </div>
    </div>
</div>


<script>
	$(function(){
		$(".mo-btn1").click(function(){
			event.preventDefault();
			$("#modal-1").attr("style", "display:block");
			$('body').css("overflow", "hidden");
		});
		$(".mo-btn2").click(function(){
			event.preventDefault();
			$("#modal-2").attr("style", "display:block");
			$('body').css("overflow", "hidden");
		});
		$(".modal-close").click(function(){
			$(".modal1").attr("style", "display:none");
			$('body').css("overflow", "auto");
		});
		$(".modal1-bg").click(function(){
			$(".modal1").attr("style", "display:none");
			$('body').css("overflow", "auto");
		});
	});
</script>
