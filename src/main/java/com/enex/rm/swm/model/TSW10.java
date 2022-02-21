package com.enex.rm.swm.model;

public class TSW10 {
	private String sSeq; 
	private String purNum; 
	private String purDate;
	private String purDateFrom;
	private String purDateTo;
	private String Note; 
	private String swType;
	private String swLicense; 
	private String purQty;
	private String startDate;
	private String endDate;
	private String usrId;
	
	public String getsSeq() {
		return sSeq;
	}
	public void setsSeq(String sSeq) {
		this.sSeq = sSeq;
	}
	public String getPurNum() {
		return purNum;
	}
	public void setPurNum(String purNum) {
		this.purNum = purNum;
	}
	public String getPurDate() {
		return purDate;
	}
	public void setPurDate(String purDate) {
		this.purDate = purDate;
	}
	
	public String getPurDateFrom() {
		return purDateFrom;
	}
	public void setPurDateFrom(String purDateFrom) {
		this.purDateFrom = purDateFrom;
	}
	public String getPurDateTo() {
		return purDateTo;
	}
	public void setPurDateTo(String purDateTo) {
		this.purDateTo = purDateTo;
	}
	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		Note = note;
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
	public String getPurQty() {
		return purQty;
	}
	public void setPurQty(String purQty) {
		this.purQty = purQty;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	@Override
	public String toString() {
		return "TSW10 [sSeq=" + sSeq + ", purNum=" + purNum + ", purDate=" + purDate + ", purDateFrom=" + purDateFrom
				+ ", purDateTo=" + purDateTo + ", Note=" + Note + ", swType=" + swType + ", swLicense=" + swLicense
				+ ", purQty=" + purQty + ", startDate=" + startDate + ", endDate=" + endDate + ", usrId=" + usrId + "]";
	}
	
	
	
	
}
