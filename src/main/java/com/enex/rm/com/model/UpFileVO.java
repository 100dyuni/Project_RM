package com.enex.rm.com.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class UpFileVO {
	
	private MultipartFile uploadFile;
	private String fileName;
	private Date insertDate;
	private String IdentiCode;
	private String UUID;
	private String pgid;
	
	public String getPgid() {
		return pgid;
	}
	public void setPgid(String pgid) {
		this.pgid = pgid;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getIdentiCode() {
		return IdentiCode;
	}
	public void setIdentiCode(String identiCode) {
		IdentiCode = identiCode;
	}
	public String getUUID() {
		return UUID;
	}
	public void setUUID(String uUID) {
		UUID = uUID;
	}
	
	
	
	
	
}
