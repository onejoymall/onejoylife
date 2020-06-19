package com.webapp.manager.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.webapp.board.common.SearchVO;
import com.webapp.manager.dao.MgDownloadDAO;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.ProductVO;

@Controller
public class MgExcelRestController {
    @Autowired
    MgDownloadDAO mgDownloadDAO;
    
    @RequestMapping(value = "/{type}/downloadExcelFile")
    public void productDownloadExcelFile(@RequestParam HashMap params, @PathVariable String type, MgCommonVO mgCommonVO, Model model, ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO) throws Exception {
    	try {
    		List<Map<String, Object>> list = null;
    		switch(type) {
    			//상품 엑셀선택다운
	    		case "product": 
	    			list = mgDownloadDAO.getProductDtoList(mgCommonVO);
					break;
					
				//경품 엑셀선택다운
	    		case "giveaway": 
	    			list = mgDownloadDAO.getGiveawayDtoList(mgCommonVO);
					break;
				
				//주문 엑셀선택다운
	    		case "order": 
	    			list = mgDownloadDAO.getOrderDtoList(mgCommonVO);
					break;
					
				//쿠폰 엑셀선택다운
	    		case "coupon": 
//	    			list = mgDownloadDAO.getProductDtoList(mgCommonVO);
	    			break;
	    			
	    		//환불/교환 엑셀선택다운
	    		case "returned": 
	    			list = mgDownloadDAO.getReturnedDtoList(mgCommonVO);
	    			break;
	    			
	    		//qna 엑셀선택다운
	    		case "qna": 
//	    			list = mgDownloadDAO.getProductDtoList(mgCommonVO);
	    			break;
	    			
	    		//1:1 엑셀선택다운
	    		case "oneToOne": 
//	    			list = mgDownloadDAO.getProductDtoList(mgCommonVO);
	    			break;
    		}
    		excelDown(request,response,type,list);
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    }
    
    //양식다운로드
    @RequestMapping(value = "/downloadFile/{type}")
    public void downloadFile(@PathVariable String type, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	excelDown(request,response,type,null);
    }
    
    //주문 엑셀업로드
    @RequestMapping(value = "/uploadExcelFile/{type}")
    public void uploadExcelFile(Model model, MgCommonVO mgCommonVO, ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO,@PathVariable String type,
    		@RequestParam(value="uploadfile", required=false) MultipartFile uploadFile) throws Exception {
    	try {
    		List<Map<String,Object>> list = parseExcelToList(uploadFile);
    		
    	}catch (Exception e) {
    		e.printStackTrace();	
		}
    }

    //엑셀다운
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
    
    //엑셀 리스트로 파싱
    private List<Map<String,Object>> parseExcelToList(MultipartFile uploadFile) throws Exception{
    	List<Map<String,Object>> list = new ArrayList<>();
		OPCPackage opcPackage = OPCPackage.open(uploadFile.getInputStream());
		XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
        
        // 첫번째 시트 불러오기
        XSSFSheet sheet = workbook.getSheetAt(0);
        
        //칼럼네임 설정
        XSSFRow columnNameRow = sheet.getRow(1);
        String[] columnNames = new String[columnNameRow.getLastCellNum()+1];
        for(int i=0;i<columnNameRow.getLastCellNum()+1;i++) {
        	XSSFCell cell = columnNameRow.getCell(i);
        	if(cell != null) columnNames[i] = cell.getStringCellValue();
        }
        
        //데이터 row 리스트에 넣기
        for(int i=4; i<sheet.getLastRowNum() + 1; i++) {
        	Map<String, Object> map = new HashMap<>();
            XSSFRow row = sheet.getRow(i);
            
            // 행이 존재하기 않으면 패스
            if(null == row) {
                continue;
            }
            
            for(int j=0;j<row.getLastCellNum() + 1;j++) {
	            XSSFCell cell = row.getCell(j);
	            if(null != cell) {
	            	String value = "";
	            	if( cell.getCellType() == CellType.FORMULA ) {
	                    value = cell.getCellFormula();
	                }else if( cell.getCellType() == CellType.NUMERIC ) {
	                    value = cell.getNumericCellValue() + "";
	                }else if( cell.getCellType() == CellType.STRING ) {
	                    value = cell.getStringCellValue();
	                }else if( cell.getCellType() == CellType.BOOLEAN ) {
	                    value = cell.getBooleanCellValue() + "";
	                }else if( cell.getCellType() == CellType.ERROR ) {
	                    value = cell.getErrorCellValue() + "";
	                }else if( cell.getCellType() == CellType.BLANK ) {
	                    value = "";
	                }
	            	map.put(columnNames[j], value);
	            }
            }

            if(!isEmpty(map)) {
            	list.add(map);
            }
        }
    	return list;
    }
}
