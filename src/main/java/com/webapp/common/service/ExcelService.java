package com.webapp.common.service;

import com.webapp.common.vo.Fruit;
import com.webapp.mall.dao.ProductDAO;
import com.webapp.manager.vo.ProductVO;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExcelService {
	@Autowired
	ProductDAO productDAO;
	/**
	 * 엑셀파일로 만들 리스트 생성
	 * @param names
	 * @param prices
	 * @param quantities
	 * @return 엑셀파일 리스트
	 */
	public ArrayList<Fruit> makeFruitList(String[] names, long[] prices, int[] quantities){
		ArrayList<Fruit> list = new ArrayList<Fruit>();
		for(int i=0; i< names.length; i++) {
			Fruit fruit = new Fruit(names[i], prices[i], quantities[i]);
			list.add(fruit);
		}
		return list;
	}
	public SXSSFWorkbook getTableRowWorkbook(List<ProductVO> list){
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		// 시트 생성
		SXSSFSheet sheet = workbook.createSheet("상품목록");
		Row row = null;
		int rowCount = 0;
		int cellCount = 0;
		// 제목 Cell 생성
		row = sheet.createRow(rowCount++);

		row.createCell(cellCount++).setCellValue("id");
		row.createCell(cellCount++).setCellValue("name");
		row.createCell(cellCount++).setCellValue("writer");


		return workbook;
	}
	/**
	 * 과일 리스트를 간단한 엑셀 워크북 객체로 생성
	 * @param list
	 * @return 생성된 워크북
	 */
	public SXSSFWorkbook makeSimpleFruitExcelWorkbook(List<Fruit> list) {
		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// 시트 생성
		SXSSFSheet sheet = workbook.createSheet("과일표");

		//시트 열 너비 설정
		sheet.setColumnWidth(0, 1500);
		sheet.setColumnWidth(0, 3000);
		sheet.setColumnWidth(0, 3000);
		sheet.setColumnWidth(0, 1500);

		// 헤더 행 생
		Row headerRow = sheet.createRow(0);
		// 해당 행의 첫번째 열 셀 생성
		Cell headerCell = headerRow.createCell(0);
		headerCell.setCellValue("번호");
		// 해당 행의 두번째 열 셀 생성
		headerCell = headerRow.createCell(1);
		headerCell.setCellValue("과일이름");
		// 해당 행의 세번째 열 셀 생성
		headerCell = headerRow.createCell(2);
		headerCell.setCellValue("가격");
		// 해당 행의 네번째 열 셀 생성
		headerCell = headerRow.createCell(3);
		headerCell.setCellValue("수량");

		// 과일표 내용 행 및 셀 생성
		Row bodyRow = null;
		Cell bodyCell = null;
		for(int i=0; i<list.size(); i++) {
			Fruit fruit = list.get(i);

			// 행 생성
			bodyRow = sheet.createRow(i+1);
			// 데이터 번호 표시
			bodyCell = bodyRow.createCell(0);
			bodyCell.setCellValue(i + 1);
			// 데이터 이름 표시
			bodyCell = bodyRow.createCell(1);
			bodyCell.setCellValue(fruit.getName());
			// 데이터 가격 표시
			bodyCell = bodyRow.createCell(2);
			bodyCell.setCellValue(fruit.getPrice());
			// 데이터 수량 표시
			bodyCell = bodyRow.createCell(3);
			bodyCell.setCellValue(fruit.getQuantity());
		}

		return workbook;
	}

	/**
	 * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소
	 * @param list
	 * @return
	 */
	public SXSSFWorkbook excelFileDownloadProcess(List<Fruit> list) {
		return this.makeSimpleFruitExcelWorkbook(list);
	}
	public SXSSFWorkbook getTableRow(List<ProductVO> list) {
		return this.getTableRowWorkbook(list);
	}
	
}
