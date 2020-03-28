<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <div class="modal" id="modal-info-main" >
        <div class="modal-content">
            <div class="modal-header">
                <h2></h2>
                <button type="button" class="modal-close" rel="modal:close">×</button>
            </div>
            ${infoMain.market_config_value}
        </div>
    </div>
    <div class="modal" id="modal-info-privacy" >
        <div class="modal-content">
            <div class="modal-header">
                <h2></h2>
                <button type="button" class="modal-close" rel="modal:close">×</button>
            </div>
            ${infoPrivacy.market_config_value}
        </div>
    </div>

