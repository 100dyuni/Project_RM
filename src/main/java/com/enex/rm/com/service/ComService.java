package com.enex.rm.com.service;

import java.util.List;
import java.util.Map;

import com.enex.rm.com.model.TRM20;
import com.enex.rm.com.model.TRM60;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.TRM40;
import com.enex.rm.modal.model.TRM10;

public interface ComService {

	public List<TRM20> highCodeSearch(TRM20 trm20);
	public List<TRM20> lowCodeSearch(TRM20 trm20);
	public List<TRM20> createSelectBox(TRM20 trm20);
	public int insertHighCode(TRM20 trm20);
	public void saveLowCode(TRM20 trm20);
	public String createTASeq();
	public void targetAgencyRegister(TRM40 trm40);
	public void targetAgencyUpdate(TRM40 trm40);
	public TRM40 searchTargetInfo(TRM40 trm40);
	public List<TRM40> agencyListSearch(TRM40 trm40);
	public void saveHighOrg(TRM60 trm60);
	public List<TRM60> searchHighOrgInfo(TRM60 trm60);
	public List<TRM60> searchLowOrg(TRM60 trm60);
	public void saveLowOrg(TRM60 trm60);
	public List<TRM60> searchOrgMemberList(TRM60 trm60);
	public List<Map> mainEmpCount();
	public List<Map> mainHwTotCount();
	public List<Map> mainHwSpareCount();
	public List<Map> recentHwMoveHistory();
	public List<Map> mainHwYearSearch(String ItemType);
	public TRM10 loginAccount(String iD);
	public Map getEmpInfo(String empCode);
	public List<Map> getHwInfoOfEmp(String empCode);
	public List<TRM60> searchOrgMemberList2(TRM60 trm60);
	public List<Map> searchRetiredEmpList();
	public List<Map> searchRetiredEmpHwList(TRM10 trm10);
	public List<Map> searchRetiredEmpSwList(TRM10 trm10);
	public void retiredEmpSwUseYNUpdate(TRM10 trm10);
	public List<TRM20> setEmptyCodeSB();
	public List<Map> setDivisionSB(TRM60 trm60);
	public List<Map> searchEmptyList(THW10 thw10);

}
