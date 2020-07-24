package com.webapp.manager.vo;

public class ExcelSettingVO extends MgCommonVO {
	private String column_value[];
	private String column_name[];
	
	public String[] getColumn_value() {
		return column_value;
	}
	public void setColumn_value(String[] column_value) {
		this.column_value = column_value;
	}
	public String[] getColumn_name() {
		return column_name;
	}
	public void setColumn_name(String[] column_name) {
		this.column_name = column_name;
	}
	
}
