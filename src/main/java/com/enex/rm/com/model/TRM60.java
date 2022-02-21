package com.enex.rm.com.model;

public class TRM60 {
	private String orgFlag;
	private String highOrgCode;
	private String highOrgName;
	private String hUseYN;
	private String hOrderCount;
	private String lowOrgCode;
	private String lowOrgName;
	private String lUseYN;
	private String lOrderCount;
	
	private String divisionCheck;
	private String teamCheck;
	
	public String getOrgFlag() {
		return orgFlag;
	}
	public void setOrgFlag(String orgFlag) {
		this.orgFlag = orgFlag;
	}
	public String getHighOrgCode() {
		return highOrgCode;
	}
	public void setHighOrgCode(String highOrgCode) {
		this.highOrgCode = highOrgCode;
	}
	public String getHighOrgName() {
		return highOrgName;
	}
	public void setHighOrgName(String highOrgName) {
		this.highOrgName = highOrgName;
	}
	public String gethUseYN() {
		return hUseYN;
	}
	public void sethUseYN(String hUseYN) {
		this.hUseYN = hUseYN;
	}
	public String gethOrderCount() {
		return hOrderCount;
	}
	public void sethOrderCount(String hOrderCount) {
		this.hOrderCount = hOrderCount;
	}
	public String getLowOrgCode() {
		return lowOrgCode;
	}
	public void setLowOrgCode(String lowOrgCode) {
		this.lowOrgCode = lowOrgCode;
	}
	public String getLowOrgName() {
		return lowOrgName;
	}
	public void setLowOrgName(String lowOrgName) {
		this.lowOrgName = lowOrgName;
	}
	public String getlUseYN() {
		return lUseYN;
	}
	public void setlUseYN(String lUseYN) {
		this.lUseYN = lUseYN;
	}
	public String getlOrderCount() {
		return lOrderCount;
	}
	public void setlOrderCount(String lOrderCount) {
		this.lOrderCount = lOrderCount;
	}
	
	
	public String getDivisionCheck() {
		return divisionCheck;
	}
	public void setDivisionCheck(String divisionCheck) {
		this.divisionCheck = divisionCheck;
	}
	public String getTeamCheck() {
		return teamCheck;
	}
	public void setTeamCheck(String teamCheck) {
		this.teamCheck = teamCheck;
	}
	@Override
	public String toString() {
		return "TRM60 [orgFlag=" + orgFlag + ", highOrgCode=" + highOrgCode + ", highOrgName=" + highOrgName
				+ ", hUseYN=" + hUseYN + ", hOrderCount=" + hOrderCount + ", lowOrgCode=" + lowOrgCode + ", lowOrgName="
				+ lowOrgName + ", lUseYN=" + lUseYN + ", lOrderCount=" + lOrderCount + ", divisionCheck="
				+ divisionCheck + ", teamCheck=" + teamCheck + "]";
	}
	
	
}
