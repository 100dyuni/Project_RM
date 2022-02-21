package com.enex.rm.modal.model;

public class TRM10 {
	private String empCode;	
	private String empName;	
	private String depCode1;	
	private String depName1;	
	private String rankNum;
	private String rankName;	
	private String position;
	private String depCode2;
	private String depName2;
	private String[] empCodeList;
	
	
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDepCode1() {
		return depCode1;
	}
	public void setDepCode1(String depCode1) {
		this.depCode1 = depCode1;
	}
	public String getDepName1() {
		return depName1;
	}
	public void setDepName1(String depName1) {
		this.depName1 = depName1;
	}
	public String getRankNum() {
		return rankNum;
	}
	public void setRankNum(String rankNum) {
		this.rankNum = rankNum;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDepCode2() {
		return depCode2;
	}
	public void setDepCode2(String depCode2) {
		this.depCode2 = depCode2;
	}
	public String getDepName2() {
		return depName2;
	}
	public void setDepName2(String depName2) {
		this.depName2 = depName2;
	}
	
	
	public String[] getEmpCodeList() {
		return empCodeList;
	}
	public void setEmpCodeList(String[] empCodeList) {
		this.empCodeList = empCodeList;
	}
	
	@Override
	public String toString() {
		return "TRM10 [empCode=" + empCode + ", empName=" + empName + ", depCode1=" + depCode1 + ", depName1="
				+ depName1 + ", rankNum=" + rankNum + ", rankName=" + rankName + ", position=" + position
				+ ", depCode2=" + depCode2 + ", depName2=" + depName2 + "]";
	}
	
	
}
