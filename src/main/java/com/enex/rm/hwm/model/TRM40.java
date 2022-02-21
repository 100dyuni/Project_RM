package com.enex.rm.hwm.model;

public class TRM40 {
	private String aSeq;
	private String agencyName;
	private String activeFlg;
	private String manageDep;
	private String manageDepName;
	private String manageEmp;
	private String manageEmpName;
	private String inputUsr;
	private String inputDate;
	private String updateUsr;
	private String updateDate;
	
	
	public String getaSeq() {
		return aSeq;
	}
	public void setaSeq(String aSeq) {
		this.aSeq = aSeq;
	}
	
	public String getAgencyName() {
		return agencyName;
	}
	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}
	public String getActiveFlg() {
		return activeFlg;
	}
	public void setActiveFlg(String activeFlg) {
		this.activeFlg = activeFlg;
	}
	public String getManageDep() {
		return manageDep;
	}
	public void setManageDep(String manageDep) {
		this.manageDep = manageDep;
	}
	public String getManageDepName() {
		return manageDepName;
	}
	public void setManageDepName(String manageDepName) {
		this.manageDepName = manageDepName;
	}
	public String getManageEmp() {
		return manageEmp;
	}
	public void setManageEmp(String manageEmp) {
		this.manageEmp = manageEmp;
	}
	public String getManageEmpName() {
		return manageEmpName;
	}
	public void setManageEmpName(String manageEmpName) {
		this.manageEmpName = manageEmpName;
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
		return "TRM40 [aSeq=" + aSeq + ", agencyName=" + agencyName + ", activeFlg=" + activeFlg + ", manageDep="
				+ manageDep + ", manageDepName=" + manageDepName + ", manageEmp=" + manageEmp + ", manageEmpName="
				+ manageEmpName + ", inputUsr=" + inputUsr + ", inputDate=" + inputDate + ", updateUsr=" + updateUsr
				+ ", updateDate=" + updateDate + "]";
	}

}
