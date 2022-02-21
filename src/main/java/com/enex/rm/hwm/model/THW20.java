package com.enex.rm.hwm.model;

import java.util.Arrays;

import com.enex.rm.com.model.PagingVO;

public class THW20 {
	private String mSeq;
	private String rSeq;
	private String IdentiCode;
	private String ItemType;
	private String ModelName;
	private String startLCode1;
	private String startLCode1Name;
	private String startLCode2;
	private String startLCode2Name;
	private String startDate;
	private String startDateFrom;
	private String startDateTo;
	private String arrLCodeType;
	private String arrLCode1;
	private String arrLCode1Name;
	private String arrLCode2;
	private String arrLCode2Name;
	private String arrDate;
	private String arrDateFrom;
	private String arrDateTo;
	private String inputUsr;
	private String inputDate;
	private String manaEmp;
	private String note;
	private PagingVO pagingvo;
	
	private String[] rSeqList=null;
	
	public void clean() throws Exception { 
	}
	
	public String getmSeq() {
		return mSeq;
	}
	public void setmSeq(String mSeq) {
		this.mSeq = mSeq;
	}
	public String getrSeq() {
		return rSeq;
	}
	public void setrSeq(String rSeq) {
		this.rSeq = rSeq;
	}
	public String getIdentiCode() {
		return IdentiCode;
	}
	public void setIdentiCode(String identiCode) {
		IdentiCode = identiCode;
	}
	public String getModelName() {
		return ModelName;
	}
	public void setModelName(String modelName) {
		ModelName = modelName;
	}
	public String getStartLCode1() {
		return startLCode1;
	}
	public void setStartLCode1(String startLCode1) {
		this.startLCode1 = startLCode1;
	}
	public String getStartLCode1Name() {
		return startLCode1Name;
	}
	public void setStartLCode1Name(String startLCode1Name) {
		this.startLCode1Name = startLCode1Name;
	}
	public String getStartLCode2() {
		return startLCode2;
	}
	public void setStartLCode2(String startLCode2) {
		this.startLCode2 = startLCode2;
	}
	public String getStartLCode2Name() {
		return startLCode2Name;
	}
	public void setStartLCode2Name(String startLCode2Name) {
		this.startLCode2Name = startLCode2Name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getArrLCodeType() {
		return arrLCodeType;
	}
	public void setArrLCodeType(String arrLCodeType) {
		this.arrLCodeType = arrLCodeType;
	}
	public String getArrLCode1() {
		return arrLCode1;
	}
	public void setArrLCode1(String arrLCode1) {
		this.arrLCode1 = arrLCode1;
	}
	public String getArrLCode1Name() {
		return arrLCode1Name;
	}
	public void setArrLCode1Name(String arrLCode1Name) {
		this.arrLCode1Name = arrLCode1Name;
	}
	public String getArrLCode2() {
		return arrLCode2;
	}
	public void setArrLCode2(String arrLCode2) {
		this.arrLCode2 = arrLCode2;
	}
	public String getArrLCode2Name() {
		return arrLCode2Name;
	}
	public void setArrLCode2Name(String arrLCode2Name) {
		this.arrLCode2Name = arrLCode2Name;
	}
	public String getArrDate() {
		return arrDate;
	}
	public void setArrDate(String arrDate) {
		this.arrDate = arrDate;
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
	public String getManaEmp() {
		return manaEmp;
	}
	public void setManaEmp(String manaEmp) {
		this.manaEmp = manaEmp;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getStartDateFrom() {
		return startDateFrom;
	}
	public void setStartDateFrom(String startDateFrom) {
		this.startDateFrom = startDateFrom;
	}
	public String getStartDateTo() {
		return startDateTo;
	}
	public void setStartDateTo(String startDateTo) {
		this.startDateTo = startDateTo;
	}
	public String getArrDateFrom() {
		return arrDateFrom;
	}
	public void setArrDateFrom(String arrDateFrom) {
		this.arrDateFrom = arrDateFrom;
	}
	public String getArrDateTo() {
		return arrDateTo;
	}
	public void setArrDateTo(String arrDateTo) {
		this.arrDateTo = arrDateTo;
	}
	
	public PagingVO getPagingvo() {
		return pagingvo;
	}
	public void setPagingvo(PagingVO pagingvo) {
		this.pagingvo = pagingvo;
	}
	
	public String getItemType() {
		return ItemType;
	}
	public void setItemType(String itemType) {
		ItemType = itemType;
	}
	
	
	public String[] getrSeqList() {
		return rSeqList;
	}
	public void setrSeqList(String[] rSeqList) {
		this.rSeqList = rSeqList;
	}
	@Override
	public String toString() {
		return "THW20 [mSeq=" + mSeq + ", rSeq=" + rSeq + ", IdentiCode=" + IdentiCode + ", ItemType=" + ItemType
				+ ", ModelName=" + ModelName + ", startLCode1=" + startLCode1 + ", startLCode1Name=" + startLCode1Name
				+ ", startLCode2=" + startLCode2 + ", startLCode2Name=" + startLCode2Name + ", startDate=" + startDate
				+ ", startDateFrom=" + startDateFrom + ", startDateTo=" + startDateTo + ", arrLCodeType=" + arrLCodeType
				+ ", arrLCode1=" + arrLCode1 + ", arrLCode1Name=" + arrLCode1Name + ", arrLCode2=" + arrLCode2
				+ ", arrLCode2Name=" + arrLCode2Name + ", arrDate=" + arrDate + ", arrDateFrom=" + arrDateFrom
				+ ", arrDateTo=" + arrDateTo + ", inputUsr=" + inputUsr + ", inputDate=" + inputDate + ", manaEmp="
				+ manaEmp + ", note=" + note + ", pagingvo=" + pagingvo + ", rSeqList=" + Arrays.toString(rSeqList)
				+ "]";
	}
	
	

	
}
