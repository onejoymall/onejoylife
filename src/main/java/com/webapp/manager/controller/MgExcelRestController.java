package com.webapp.manager.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.webapp.board.common.SearchVO;
import com.webapp.common.service.ExcelService;
import com.webapp.common.vo.Fruit;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.manager.dao.MgDownloadDAO;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.ProductVO;

@Controller
public class MgExcelRestController {
    @Autowired
    MgDownloadDAO mgDownloadDAO;
    
//    @RequestMapping(value = "/downloadExcelFile", method = RequestMethod.GET)
//    public String downloadExcelFile(Model model, ExcelService excelService,ProductVO productVO) throws SQLException {
//        String[] names = {"자몽", "애플망고", "멜론", "오렌지"};
//        long[] prices = {5000, 10000, 7000, 6000};
//        int[] quantities = {50, 50, 40, 40};
//        List<Fruit> list = excelService.makeFruitList(names, prices, quantities);
////
//        SXSSFWorkbook workbook = excelService.excelFileDownloadProcess(list);
//
////        SXSSFWorkbook workbook = excelService.getTableRow(productList);
//        try{
////            List<Map<String,Object>> productVOS = mgDownloadDAO.getProductDtoList(productVO);
////            model.addAttribute("productVOS", productVOS);
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        model.addAttribute("locale", Locale.KOREA);
//        model.addAttribute("workbook", workbook);
//        model.addAttribute("workbookName", "과일표");
//
//        return "excelDownloadView";
//    }
    
    @RequestMapping(value = "/product/downloadExcelFile")
    public void productDownloadExcelFile(@RequestParam HashMap params, MgCommonVO mgCommonVO, Model model, ExcelService excelService,ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO) throws Exception {
    	try {
    		List<Map<String, Object>> productList = mgDownloadDAO.getProductDtoList(mgCommonVO);
    		excelDown(request,response,"product",productList);
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    }
    
    @RequestMapping(value = "/giveaway/downloadExcelFile")
    public void giveawayDownloadExcelFile(@RequestParam HashMap params, MgCommonVO mgCommonVO, Model model, ExcelService excelService,ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO) throws Exception {
    	try {
    		List<Map<String, Object>> giveawayList = mgDownloadDAO.getGiveawayDtoList(mgCommonVO);
        	excelDown(request,response,"giveaway",giveawayList);
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    }
    
    @RequestMapping(value = "/order/downloadExcelFile")
    public void orderDownloadExcelFile(@RequestParam HashMap params, MgCommonVO mgCommonVO, Model model, ExcelService excelService,ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO) throws Exception {
    	try {
    		List<Map<String, Object>> orderList = mgDownloadDAO.getOrderDtoList(mgCommonVO); 
        	excelDown(request,response,"order",orderList);
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    }
    
    @RequestMapping(value = "/coupon/downloadExcelFile")
    public void couponDownloadExcelFile(Model model, MgCommonVO mgCommonVO, ExcelService excelService,ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO) throws Exception {
//    	List<Map<String, Object>> couponList = mgDownloadDAO.getCouponDtoList(searchVO);
//    	excelDown(request,response,"coupon",couponList);
    }
    
    @RequestMapping(value = "/returned/downloadExcelFile")
    public void returnedDownloadExcelFile(Model model, MgCommonVO mgCommonVO, ExcelService excelService,ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO) throws Exception {
    	try {
    		List<Map<String, Object>> returnedList = mgDownloadDAO.getReturnedDtoList(mgCommonVO);
        	excelDown(request,response,"returned",returnedList);
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    }
    
    @RequestMapping(value = "/qna/downloadExcelFile")
    public void qnaDownloadExcelFile(Model model, MgCommonVO mgCommonVO, ExcelService excelService,ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO) throws Exception {
//    	List<Map<String, Object>> qnaList = mgDownloadDAO.getQnaDtoList(searchVO);
//    	excelDown(request,response,"qna",couponList);
    }
    
    @RequestMapping(value = "/oneToOne/downloadExcelFile")
    public void oneToOneDownloadExcelFile(Model model, MgCommonVO mgCommonVO, ExcelService excelService,ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO) throws Exception {
//    	List<Map<String, Object>> couponList = mgDownloadDAO.getGiveawayDtoList(searchVO);
//    	excelDown(request,response,"oneToOne",couponList);
    }
    
    private void excelDown(HttpServletRequest request, HttpServletResponse response, String keyword, List<Map<String, Object>> list) throws Exception{
    	String tempPath = request.getSession().getServletContext().getRealPath("/assets/template/");
    	try(InputStream is = new BufferedInputStream(new FileInputStream(tempPath+keyword+"_template.xlsx"))) {
    		//파일 네임 설정
    		Date date = new Date();
    		SimpleDateFormat dayformat = new SimpleDateFormat("yyyyMMdd");
    		SimpleDateFormat hourformat = new SimpleDateFormat("hhmmss");
    		String day = dayformat.format(date);
    		String hour = hourformat.format(date);
    		String fileName = keyword + "_" + day + "_" + hour + ".xlsx";
    		
    		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName);            
    		try (OutputStream os = response.getOutputStream()) {
    			Context context = new Context();
    			context.putVar("list", list);
    			JxlsHelper.getInstance().processTemplate(is, os, context);
    		}
    	}
    }
}
