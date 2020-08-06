package com.webapp.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.vo.MgDeliveryVO;

@Controller
public class MgSystemController {
    @Autowired
    private MgSystemDAO mgSystemDAO;
    @Autowired
    private SelectorDAO selectorDAO;
    //배송관리
    @RequestMapping(value = "/Manager/Delivery")
    public String MgDelivery(@RequestParam HashMap params, ModelMap model, MgDeliveryVO mgDeliveryVO, HttpSession session) throws Exception {
        try {
        	Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
        	if(adminLogin.equals("admin")){
    			mgDeliveryVO.setStore_id("admin");
    		}else {
    			mgDeliveryVO.setStore_id(email);
    		}
            Map<String,Object> detail = mgSystemDAO.getSystemDelivery(mgDeliveryVO);
            model.addAttribute("detail", detail);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("style", "goods-add");
        return "manager/system/delivery";
    }
    
    //지역별 배송비 관리
    @RequestMapping(value = "/Manager/Delivery-area")
    public String MgDeliveryArea(@RequestParam HashMap params, ModelMap model, MgDeliveryVO mgDeliveryVO, HttpSession session, SearchVO searchVO) throws Exception {
        try {
        	Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
        	if(adminLogin.equals("admin")){
    			mgDeliveryVO.setStore_id("admin");
    			params.put("store_id","admin");
    		}else {
    			mgDeliveryVO.setStore_id(email);
    			params.put("store_id",email);
    		}
            Map<String,Object> detail = mgSystemDAO.getSystemDelivery(mgDeliveryVO);
            model.addAttribute("detail", detail);
            searchVO.setDisplayRowCount(10);
            searchVO.pageCalculate(mgSystemDAO.getDeliveryAreaListCount(params));
            
            params.put("displayRowCount",searchVO.getDisplayRowCount());
            params.put("rowStart",searchVO.getRowStart());
            List<Map<String,Object>> arealist = mgSystemDAO.getDeliveryAreaList(params);
            model.addAttribute("list", arealist);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("topNav", 1);
        model.addAttribute("Pk", "area_id");
        model.addAttribute("table_name", "store_delivery_area");
        model.addAttribute("style", "goods");
        return "manager/system/delivery-area";
    }
    
    //엑셀다운설정
    @RequestMapping(value = "/Manager/excelSetting/{type}")
    public String excelSettingGiveaway(@RequestParam HashMap params, ModelMap model, MgDeliveryVO mgDeliveryVO, HttpSession session,@PathVariable String type) throws Exception {
    	try {
    		Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			params.put("store_id","admin");
    		}else {
    			params.put("store_id",email);
    		}
    		params.put("type_value",type);
    		Map<String, Object> getExcelSettingDetail = mgSystemDAO.getExcelSettingDetail(params);
    		model.addAttribute("detail", getExcelSettingDetail);
    		
    		params.put("code","excel_setting_"+type);
    		params.put("orderKey","code_id");
    		params.put("orderValue","asc");
    		List<Map<String, Object>> excel_column_list = selectorDAO.getSelectorList(params);
    		model.addAttribute("excel_column_list", excel_column_list);
    		
    		params.put("code","excel_setting_type_name_"+type);
    		List<Map<String, Object>> excel_setting_type = selectorDAO.getSelectorList(params);
    		model.addAttribute("excel_setting_type", excel_setting_type.get(0));
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	model.addAttribute("topNav", 1);
    	model.addAttribute("style", "excel-setting");
    	model.addAttribute("postUrl", "/Manager/excel-setting-proc");
    	return "/manager/excel-setting";
    }
}
