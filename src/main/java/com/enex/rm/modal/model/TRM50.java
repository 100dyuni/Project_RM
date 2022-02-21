package com.enex.rm.modal.model;

public class TRM50 {
	private String etcLocaSeq;
	private String etcLocaType;
	private String etcLocation;
	private String inputUsr;
	
	public String getEtcLocaSeq() {
		return etcLocaSeq;
	}
	public void setEtcLocaSeq(String etcLocaSeq) {
		this.etcLocaSeq = etcLocaSeq;
	}
	public String getEtcLocation() {
		return etcLocation;
	}
	public void setEtcLocation(String etcLocation) {
		this.etcLocation = etcLocation;
	}
	public String getInputUsr() {
		return inputUsr;
	}
	public void setInputUsr(String inputUsr) {
		this.inputUsr = inputUsr;
	}
	
	public String getEtcLocaType() {
		return etcLocaType;
	}
	public void setEtcLocaType(String etcLocaType) {
		this.etcLocaType = etcLocaType;
	}
	
	@Override
	public String toString() {
		return "TRM50 [etcLocaSeq=" + etcLocaSeq + ", etcLocaType=" + etcLocaType + ", etcLocation=" + etcLocation
				+ ", inputUsr=" + inputUsr + "]";
	}

	

}
