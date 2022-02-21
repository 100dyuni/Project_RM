package com.enex.rm.swm.model;

public class TSW20DT {
	private String swRegSeq;
	private String swRegDTSeq;
	private String sSeq;
	private String swType;
	private String swLicense;
	private String qty;
	private String inputUsr;
	private String inputDate;

	
	public String getSwRegSeq() {
		return swRegSeq;
	}
	public void setSwRegSeq(String swRegSeq) {
		this.swRegSeq = swRegSeq;
	}
	public String getsSeq() {
		return sSeq;
	}
	public void setsSeq(String sSeq) {
		this.sSeq = sSeq;
	}
	public String getSwType() {
		return swType;
	}
	public void setSwType(String swType) {
		this.swType = swType;
	}
	public String getSwLicense() {
		return swLicense;
	}
	public void setSwLicense(String swLicense) {
		this.swLicense = swLicense;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getSwRegDTSeq() {
		return swRegDTSeq;
	}
	public void setSwRegDTSeq(String swRegDTSeq) {
		this.swRegDTSeq = swRegDTSeq;
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
		return "TSW20DT [swRegSeq=" + swRegSeq + ", swRegDTSeq=" + swRegDTSeq + ", sSeq=" + sSeq + ", swType=" + swType
				+ ", swLicense=" + swLicense + ", qty=" + qty + ", inputUsr=" + inputUsr + ", inputDate=" + inputDate
				+ "]";
	}

	
}
