package com.enex.rm.com.model;

public class TRM70 {
	private String pdFlag;
	private String name;
	private String tel;
	
	public String getPdFlag() {
		return pdFlag;
	}
	public void setPdFlag(String pdFlag) {
		this.pdFlag = pdFlag;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "TRM70 [pdFlag=" + pdFlag + ", name=" + name + ", tel=" + tel + "]";
	}
	
	
}
