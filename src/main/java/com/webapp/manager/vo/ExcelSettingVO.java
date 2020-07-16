package com.webapp.manager.vo;

public class ExcelSettingVO extends MgCommonVO {
	private String column_name;
	private String column_text;
	
	public String getColumn_name() {
		return column_name;
	}
	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}
	public String getColumn_text() {
		return column_text;
	}
	public void setColumn_text(String column_text) {
		this.column_text = column_text;
	}
}
