package com.enex.rm.com.model;

public class TRM20 {

	private String highCode;
	private String highCodeName;
	private String lowCode;
	private String lowCodeName;
	private String useYN;
	private String orderCount;
	private String inputUsr;
	private String inputDate;
	private String updateUsr;
	private String updateDate;
	
	public String getHighCode() {
		return highCode;
	}
	public void setHighCode(String highCode) {
		this.highCode = highCode;
	}
	public String getHighCodeName() {
		return highCodeName;
	}
	public void setHighCodeName(String highCodeName) {
		this.highCodeName = highCodeName;
	}
	public String getLowCode() {
		return lowCode;
	}
	public void setLowCode(String lowCode) {
		this.lowCode = lowCode;
	}
	public String getLowCodeName() {
		return lowCodeName;
	}
	public void setLowCodeName(String lowCodeName) {
		this.lowCodeName = lowCodeName;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public String getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
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
	public String getUpdateUsr() {
		return updateUsr;
	}
	public void setUpdateUsr(String updateUsr) {
		this.updateUsr = updateUsr;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "TRM20 [highCode=" + highCode + ", highCodeName=" + highCodeName + ", lowCode=" + lowCode
				+ ", lowCodeName=" + lowCodeName + ", useYN=" + useYN + ", orderCount=" + orderCount + ", inputUsr="
				+ inputUsr + ", inputDate=" + inputDate + ", updateUsr=" + updateUsr + ", updateDate=" + updateDate
				+ "]";
	}
	
	
}
