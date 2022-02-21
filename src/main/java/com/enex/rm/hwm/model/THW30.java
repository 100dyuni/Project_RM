package com.enex.rm.hwm.model;

import java.util.Arrays;

public class THW30 {
	private String dListSeq;
	private String dListTitle;
	private String writeDate;
	private String writeDateFrom;
	private String writeDateTo;
	private String pcCnt;
	private String monCnt;
	private String prtCnt;
	private String totCnt;
	private String detailSeq;
	private String rSeq;
	private String inputUsr;
	private String inputDate;

	private String dListTitleCheck;
	private String writeDateCheck;
	
	private String[] dListSeqs =null;
	private String useYN;
	
	public String getdListSeq() {
		return dListSeq;
	}
	public void setdListSeq(String dListSeq) {
		this.dListSeq = dListSeq;
	}
	public String getdListTitle() {
		return dListTitle;
	}
	public void setdListTitle(String dListTitle) {
		this.dListTitle = dListTitle;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getPcCnt() {
		return pcCnt;
	}
	public void setPcCnt(String pcCnt) {
		this.pcCnt = pcCnt;
	}
	public String getMonCnt() {
		return monCnt;
	}
	public void setMonCnt(String monCnt) {
		this.monCnt = monCnt;
	}
	public String getPrtCnt() {
		return prtCnt;
	}
	public void setPrtCnt(String prtCnt) {
		this.prtCnt = prtCnt;
	}
	public String getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(String totCnt) {
		this.totCnt = totCnt;
	}
	public String getDetailSeq() {
		return detailSeq;
	}
	public void setDetailSeq(String detailSeq) {
		this.detailSeq = detailSeq;
	}
	public String getrSeq() {
		return rSeq;
	}
	public void setrSeq(String rSeq) {
		this.rSeq = rSeq;
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
	public String getWriteDateFrom() {
		return writeDateFrom;
	}
	public void setWriteDateFrom(String writeDateFrom) {
		this.writeDateFrom = writeDateFrom;
	}
	public String getWriteDateTo() {
		return writeDateTo;
	}
	public void setWriteDateTo(String writeDateTo) {
		this.writeDateTo = writeDateTo;
	}
	public String getdListTitleCheck() {
		return dListTitleCheck;
	}
	public void setdListTitleCheck(String dListTitleCheck) {
		this.dListTitleCheck = dListTitleCheck;
	}
	public String getWriteDateCheck() {
		return writeDateCheck;
	}
	public void setWriteDateCheck(String writeDateCheck) {
		this.writeDateCheck = writeDateCheck;
	}
	public String[] getdListSeqs() {
		return dListSeqs;
	}
	public void setdListSeqs(String[] dListSeqs) {
		this.dListSeqs = dListSeqs;
	}
	
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	
	@Override
	public String toString() {
		return "THW30 [dListSeq=" + dListSeq + ", dListTitle=" + dListTitle + ", writeDate=" + writeDate
				+ ", writeDateFrom=" + writeDateFrom + ", writeDateTo=" + writeDateTo + ", pcCnt=" + pcCnt + ", monCnt="
				+ monCnt + ", prtCnt=" + prtCnt + ", totCnt=" + totCnt + ", detailSeq=" + detailSeq + ", rSeq=" + rSeq
				+ ", inputUsr=" + inputUsr + ", inputDate=" + inputDate + ", dListTitleCheck=" + dListTitleCheck
				+ ", writeDateCheck=" + writeDateCheck + ", dListSeqs=" + Arrays.toString(dListSeqs) + ", useYN="
				+ useYN + "]";
	}
	
	
}
