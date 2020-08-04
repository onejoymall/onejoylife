package com.webapp.manager.controller;

import static org.springframework.util.CollectionUtils.isEmpty;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.webapp.board.common.SearchVO;
import com.webapp.common.dao.SelectorDAO;
import com.webapp.common.support.CurlPost;
import com.webapp.manager.dao.MgDownloadDAO;
import com.webapp.manager.dao.MgSystemDAO;
import com.webapp.manager.vo.MgCommonVO;
import com.webapp.manager.vo.ProductVO;

@Controller
public class MgExcelRestController {
	@Autowired
    private DataSourceTransactionManager txManager;
    @Autowired
    MgDownloadDAO mgDownloadDAO;
    @Autowired
    SelectorDAO selectorDAO;
    @Autowired
    MgSystemDAO mgSystemDAO;
    @Value("${t_key}")
    private String t_key;
    @Value("${t_url}")
    private String t_url;
    
    @RequestMapping(value = "/{type}/downloadExcelFile")
    public void productDownloadExcelFile(@RequestParam HashMap params, @PathVariable String type, MgCommonVO mgCommonVO, Model model, ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO,HttpSession session) throws Exception {
    	try {
    		Map<String, Object> companylist = null;
        	List<Map<String, Object>> companys = null;
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
				
				//경품참여 엑셀선택다운
	    		case "giveawayPart": 
	    			companylist = CurlPost.curlPostFn(
	                        t_url+"/api/v1/companylist?t_key="+t_key,
	                        "",
	                        "",
	                        "get"
	                );
	    			companys = (List)companylist.get("Company");
	    			
	    			list = mgDownloadDAO.getGiveawayPartDtoList(mgCommonVO);
	    			for(Map<String,Object> map : list) {
	    				List<Map<String, Object>> company = companys.stream().filter(item -> item.get("Code").equals(map.get("delivery_t_code"))).collect(Collectors.toList());
	    				if(company != null && !company.isEmpty()) {
	    					map.put("delivery_t_code_name",company.get(0).get("Name"));
	    				}
	    			}
	    			break;
	    			
				//주문 엑셀선택다운
	    		case "order": 
	    			companylist = CurlPost.curlPostFn(
	                        t_url+"/api/v1/companylist?t_key="+t_key,
	                        "",
	                        "",
	                        "get"
	                );
	    			companys = (List)companylist.get("Company");
	    			
	    			list = mgDownloadDAO.getOrderDtoList(mgCommonVO);
	    			for(Map<String,Object> map : list) {
	    				List<Map<String, Object>> company = companys.stream().filter(item -> item.get("Code").equals(map.get("delivery_t_code"))).collect(Collectors.toList());
	    				if(company != null && !company.isEmpty()) {
	    					map.put("delivery_t_code_name",company.get(0).get("Name"));
	    				}
	    			}
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
    		
    		Object adminLogin = session.getAttribute("adminLogin");
        	String email = (String)session.getAttribute("email");
    		if(adminLogin.equals("admin")){
    			params.put("store_id","admin");
    		}else {
    			params.put("store_id",email);
    		}
    		params.put("type_value",type);
    		Map<String, Object> getExcelSettingDetail = mgSystemDAO.getExcelSettingDetail(params);
    		if(getExcelSettingDetail == null) {
    			params.put("store_id","admin");
    		}
    		getExcelSettingDetail = mgSystemDAO.getExcelSettingDetail(params);
    		
    		excelDownPoi(request,response,type,list,getExcelSettingDetail);
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    }
    
    //양식다운로드
    @RequestMapping(value = "/downloadFile/{type}")
    public void downloadFile(@RequestParam HashMap params, @PathVariable String type, HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
    	try{
	    	Object adminLogin = session.getAttribute("adminLogin");
	    	String email = (String)session.getAttribute("email");
			if(adminLogin.equals("admin")){
				params.put("store_id","admin");
			}else {
				params.put("store_id",email);
			}
			params.put("type_value",type);
			Map<String, Object> getExcelSettingDetail = mgSystemDAO.getExcelSettingDetail(params);
			if(getExcelSettingDetail == null) {
				params.put("store_id","admin");
			}
			getExcelSettingDetail = mgSystemDAO.getExcelSettingDetail(params);
			
	    	excelDownPoi(request,response,type,null,getExcelSettingDetail);
	    }catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    //사용방법다운로드
    @RequestMapping(value = "/downloadHowUse/{type}")
    public void downloadHowUse(@RequestParam HashMap params, @PathVariable String type, HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
    	try{
    		String tempPath = request.getSession().getServletContext().getRealPath("/assets/template/");
        	try(InputStream is = new BufferedInputStream(new FileInputStream(tempPath+type+"_howtouse.xlsx"))) {
        		//파일 네임 설정
        		response.setHeader("Content-Disposition", "attachment; filename=\"" + type+"_howtouse.xlsx");            
        		try (OutputStream os = response.getOutputStream()) {
        			Context context = new Context();
        			JxlsHelper.getInstance().processTemplate(is, os, context);
        		}
        	}
    	}catch (Exception e) {
    		e.printStackTrace();
    	}
    }
    
    //엑셀업로드
    @Transactional(propagation=Propagation.REQUIRES_NEW,rollbackFor = {RuntimeException.class, Exception.class})
    @ResponseBody
    @RequestMapping(value = "/uploadExcelFile/{type}")
    public HashMap<String, Object> uploadExcelFile(Model model, MgCommonVO mgCommonVO, ProductVO productVO,HttpServletRequest request, HttpServletResponse response,SearchVO searchVO,@PathVariable String type,
    		@RequestParam(value="uploadfile", required=false) MultipartFile uploadFile) throws Exception {
    	DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
        HashMap<String, Object> error = new HashMap<String, Object>();
        try {
			List<Map<String,Object>> list = parseExcelToList(uploadFile);
			
			switch(type) {
				//상품 엑셀업로드
	    		case "product": 
					break;
					
				//경품 엑셀업로드
	    		case "giveaway": 
					break;
				
				//경품참여 엑셀업로드
	    		case "giveawayPart": 
	    			mgDownloadDAO.upadteGiveawayPartBatch(list);
	    			break;
	    			
				//주문 엑셀업로드
	    		case "order": 
	    			mgDownloadDAO.upadteOrderBatch(list);
					break;
					
				//쿠폰 엑셀업로드
	    		case "coupon": 
	    			break;
	    			
	    		//환불/교환 엑셀업로드
	    		case "returned": 
	    			break;
	    			
	    		//qna 엑셀업로드
	    		case "qna": 
	    			break;
	    			
	    		//1:1 엑셀업로드
	    		case "oneToOne": 
	    			break;
			}
			resultMap.put("success","success");
			txManager.commit(status);
        }catch (Exception e) {
        	resultMap.put("e",e);
        	txManager.rollback(status);
		}
		
    	return resultMap;
    }

    //엑셀다운 jstl방식
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
    
    //엑셀다운 poi방식
    private void excelDownPoi(HttpServletRequest request, HttpServletResponse response, String keyword, List<Map<String, Object>> list,Map<String,Object> setting) throws Exception{
    	SXSSFWorkbook workbook = makeWorkBook(list,keyword,setting);
        
		//파일 네임 설정
		Date date = new Date();
		SimpleDateFormat dayformat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat hourformat = new SimpleDateFormat("hhmmss");
		String day = dayformat.format(date);
		String hour = hourformat.format(date);
		String fileName = keyword + "_" + day + "_" + hour + ".xlsx";
		
		/***** 여기서부터는 각 브라우저에 따른 파일이름 인코딩작업 start *****/
        String browser = request.getHeader("User-Agent");
        if (browser.indexOf("MSIE") > -1) {
            fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.indexOf("Trident") > -1) {       // IE11
            fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
        } else if (browser.indexOf("Firefox") > -1) {
            fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
        } else if (browser.indexOf("Opera") > -1) {
            fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
        } else if (browser.indexOf("Chrome") > -1) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < fileName.length(); i++) {
               char c = fileName.charAt(i);
               if (c > '~') {
                     sb.append(URLEncoder.encode("" + c, "UTF-8"));
                       } else {
                             sb.append(c);
                       }
                }
                fileName = sb.toString();
        } else if (browser.indexOf("Safari") > -1){
            fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1")+ "\"";
        } else {
             fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1")+ "\"";
        }
		/***** 여기서부터는 각 브라우저에 따른 파일이름 인코딩작업 end *****/
		
		response.setContentType("application/download;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        OutputStream os = null;
		try {
			os = response.getOutputStream();
			workbook.write(os);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(workbook != null) {
				try {
					workbook.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			   
			if(os != null) {
				try {
					os.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
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
        XSSFRow columnNameRow = sheet.getRow(0);
        String[] columnNames = new String[columnNameRow.getLastCellNum()+1];
        for(int i=0;i<columnNameRow.getLastCellNum()+1;i++) {
        	XSSFCell cell = columnNameRow.getCell(i);
        	if(cell != null) columnNames[i] = cell.getStringCellValue();
        }
        
        //데이터 row 리스트에 넣기
        for(int i=2; i<sheet.getLastRowNum() + 1; i++) {
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
	                    value = String.valueOf(cell.getCellFormula());
	                }else if( cell.getCellType() == CellType.NUMERIC ) {
	                    value = String.valueOf(cell.getNumericCellValue());
	                }else if( cell.getCellType() == CellType.STRING ) {
	                    value = String.valueOf(cell.getStringCellValue());
	                }else if( cell.getCellType() == CellType.BOOLEAN ) {
	                    value = String.valueOf(cell.getBooleanCellValue());
	                }else if( cell.getCellType() == CellType.ERROR ) {
	                    value = String.valueOf(cell.getErrorCellValue());
	                }else if( cell.getCellType() == CellType.BLANK ) {
	                    value = "";
	                }
	            	if(value.equals("")) value = null;
	            	map.put(columnNames[j], value);
	            }
            }

            if(!isEmpty(map)) {
            	list.add(map);
            }
        }
    	return list;
    }
    
    //워크북생성
    private SXSSFWorkbook makeWorkBook(List<Map<String,Object>> list,String keyword,Map<String,Object> setting) {    	
    	SXSSFWorkbook workbook = new SXSSFWorkbook();
    	// 시트 생성
        SXSSFSheet sheet = workbook.createSheet((String)setting.get("type_name"));
        
        //시트 열 너비 설정
//        sheet.setColumnWidth(0, 1500);
//        sheet.setColumnWidth(1, 3000);
//        sheet.setColumnWidth(2, 3000);
//        sheet.setColumnWidth(3, 1500);
        
        // 숨김행
        Row hideRow = sheet.createRow(0);
        hideRow.setZeroHeight(true);	//첫행숨김
        String[] column_val_arr = ((String)setting.get("column_value")).split("`",-1);
        String[] column_name_arr = ((String)setting.get("column_name")).split("`",-1);
        
        for(int i=0; i<column_val_arr.length; i++) {
        	Cell hideCell = hideRow.createCell(i);
        	hideCell.setCellValue(column_val_arr[i]);
        }
        
        //헤더행
        CellStyle generalCellStyle = workbook.createCellStyle();
        DataFormat generalFormat = workbook.createDataFormat();
        generalCellStyle.setDataFormat(generalFormat.getFormat("@"));
        
        CellStyle headerCellStyle = workbook.createCellStyle();
        Font fontBold = workbook.createFont();
        fontBold.setBold(true);
        headerCellStyle.setFont(fontBold);
        headerCellStyle.setDataFormat(generalFormat.getFormat("@"));
        
        Row headerRow = sheet.createRow(1);
        
        for(int i=0; i<column_val_arr.length; i++) {
        	Cell headerCell = headerRow.createCell(i);
        	headerCell.setCellStyle(headerCellStyle);
        	headerCell.setCellValue(column_name_arr[i]);
        }
        
        //데이터 리스트
        if(list != null) {
	        for(int i=0; i<list.size(); i++) {
	        	//행 생성
	        	Row bodyRow = sheet.createRow(i+2);
	        	for(int j=0; j<column_val_arr.length; j++) {
	        		Cell bodyCell = bodyRow.createCell(j);
	        		bodyCell.setCellStyle(generalCellStyle);
	        		if(list.get(i).get(column_val_arr[j]) != null && !list.get(i).get(column_val_arr[j]).equals("")) {
	        			bodyCell.setCellValue(String.valueOf(list.get(i).get(column_val_arr[j])));
	        		}else {
	        			bodyCell.setCellValue("");
	        		}
	        	}
	        }
        }
        
        return workbook;
    }
}
