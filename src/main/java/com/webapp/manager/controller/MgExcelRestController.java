package com.webapp.manager.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webapp.common.service.ExcelService;
import com.webapp.common.vo.Fruit;
import com.webapp.manager.dao.MgDownloadDAO;
import com.webapp.manager.vo.ProductVO;

@Controller
public class MgExcelRestController {
    @Autowired
    MgDownloadDAO mgDownloadDAO;
    @RequestMapping(value = "/downloadExcelFile", method = RequestMethod.GET)
    public String downloadExcelFile(Model model, ExcelService excelService,ProductVO productVO) throws SQLException {
        ;
        String[] names = {"자몽", "애플망고", "멜론", "오렌지"};
        long[] prices = {5000, 10000, 7000, 6000};
        int[] quantities = {50, 50, 40, 40};
        List<Fruit> list = excelService.makeFruitList(names, prices, quantities);
//
        SXSSFWorkbook workbook = excelService.excelFileDownloadProcess(list);

//        SXSSFWorkbook workbook = excelService.getTableRow(productList);
        try{
//            List<Map<String,Object>> productVOS = mgDownloadDAO.getProductDtoList(productVO);
//            model.addAttribute("productVOS", productVOS);
        }catch (Exception e){
            e.printStackTrace();
        }
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "과일표");

        return "excelDownloadView";
    }
}
