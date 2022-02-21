package com.enex.rm.hwm.model;

public class THW20EX {
	
	private String IdentiCodeCheck;
	private String ItemTypeCheck;
	private String ModelNameCheck;
	private String LCodeTypeCheck;
	private String arrLCode1Check;
	private String arrLCode2Check;
	private String startDateCheck;
	private String arrDateCheck;
	
	public String getIdentiCodeCheck() {
		return IdentiCodeCheck;
	}
	public void setIdentiCodeCheck(String identiCodeCheck) {
		IdentiCodeCheck = identiCodeCheck;
	}
	public String getItemTypeCheck() {
		return ItemTypeCheck;
	}
	public void setItemTypeCheck(String itemTypeCheck) {
		ItemTypeCheck = itemTypeCheck;
	}
	public String getModelNameCheck() {
		return ModelNameCheck;
	}
	public void setModelNameCheck(String modelNameCheck) {
		ModelNameCheck = modelNameCheck;
	}
	public String getLCodeTypeCheck() {
		return LCodeTypeCheck;
	}
	public void setLCodeTypeCheck(String lCodeTypeCheck) {
		LCodeTypeCheck = lCodeTypeCheck;
	}
	public String getArrLCode1Check() {
		return arrLCode1Check;
	}
	public void setArrLCode1Check(String arrLCode1Check) {
		this.arrLCode1Check = arrLCode1Check;
	}
	public String getArrLCode2Check() {
		return arrLCode2Check;
	}
	public void setArrLCode2Check(String arrLCode2Check) {
		this.arrLCode2Check = arrLCode2Check;
	}
	public String getStartDateCheck() {
		return startDateCheck;
	}
	public void setStartDateCheck(String startDateCheck) {
		this.startDateCheck = startDateCheck;
	}
	public String getArrDateCheck() {
		return arrDateCheck;
	}
	public void setArrDateCheck(String arrDateCheck) {
		this.arrDateCheck = arrDateCheck;
	}
	
	@Override
	public String toString() {
		return "THW20EX [IdentiCodeCheck=" + IdentiCodeCheck + ", ItemTypeCheck=" + ItemTypeCheck + ", ModelNameCheck="
				+ ModelNameCheck + ", LCodeTypeCheck=" + LCodeTypeCheck + ", arrLCode1Check=" + arrLCode1Check
				+ ", arrLCode2Check=" + arrLCode2Check + ", startDateCheck=" + startDateCheck + ", arrDateCheck="
				+ arrDateCheck + "]";
	}
	
	
	
}
