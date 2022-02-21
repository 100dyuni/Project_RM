package com.enex.rm.swm.model;

public class TSW20 {
	private String swRegSeq;
	private String LCodeType;
	private String LCode1;
	private String LCode1Name;
	private String LCode2;
	private String LCode2Name;
	private String Note;
	private String useYN;
	private String inputUsr;
	private String inputDate;
	
	public String getSwRegSeq() {
		return swRegSeq;
	}
	public void setSwRegSeq(String swRegSeq) {
		this.swRegSeq = swRegSeq;
	}
	public String getLCodeType() {
		return LCodeType;
	}
	public void setLCodeType(String lCodeType) {
		LCodeType = lCodeType;
	}
	public String getLCode1() {
		return LCode1;
	}
	public void setLCode1(String lCode1) {
		LCode1 = lCode1;
	}
	public String getLCode1Name() {
		return LCode1Name;
	}
	public void setLCode1Name(String lCode1Name) {
		LCode1Name = lCode1Name;
	}
	public String getLCode2() {
		return LCode2;
	}
	public void setLCode2(String lCode2) {
		LCode2 = lCode2;
	}
	public String getLCode2Name() {
		return LCode2Name;
	}
	public void setLCode2Name(String lCode2Name) {
		LCode2Name = lCode2Name;
	}
	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		Note = note;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public String getInputUsr() {
		return inputUsr;
	}
	public void setInputUsr(String inputUsr) {
		this.inputUsr = inputUsr;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	@Override
	public String toString() {
		return "TSW20 [swRegSeq=" + swRegSeq + ", LCodeType=" + LCodeType + ", LCode1=" + LCode1 + ", LCode1Name="
				+ LCode1Name + ", LCode2=" + LCode2 + ", LCode2Name=" + LCode2Name + ", Note=" + Note + ", useYN="
				+ useYN + ", inputUsr=" + inputUsr + ", inputDate=" + inputDate + "]";
	}

	
	
	
	
}
