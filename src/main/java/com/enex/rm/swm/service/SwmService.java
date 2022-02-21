package com.enex.rm.swm.service;

import java.util.List;
import java.util.Map;

import com.enex.rm.swm.model.TSW10;
import com.enex.rm.swm.model.TSW20;
import com.enex.rm.swm.model.TSW20DT;

public interface SwmService {

	public String createSWSeq();

	public void swLicenseInsert(TSW10 tsw10);

	public void swLicenseUpdate(TSW10 tsw10);

	public TSW10 searchSwLicense(TSW10 tsw10);

	public Map getSWLicenseInfo(TSW10 tsw10);

	public void updateTSW20FlgN(TSW20 tsw20);

	public String createSwRegSeq();

	public List<Map> getSwInfoOfEmp(String empCode);

	public void usrSWHeadInfo(TSW20 tsw20);

	public void updateUsrSwHeadInfo(TSW20 tsw20);

	public String createswRegDTSeq(TSW20DT tsw20dt);

	public void usrSWDetailInfoSave(TSW20DT tsw20dt);

	public void usrSWRegDtInfo(TSW20DT tsw20dt);

	public List<Map> searchSWPurchaseHistory(TSW10 tsw10);

	public List<Map> searchSwActiveAndPurCount(TSW10 tsw10);

	public List<Map> searchSwManageRegister(Map<String, String> getParam);

	public List<Map> swm103MiddleData();

	public List<Map> searchAgenSwManageRegister(Map<String, String> getParam);

	public List<Map> searchSwm104DepSwData(Map<String, String> getParam);

	public List<Map> getHwInfoOfEtc(Map<String, String> getParam);

	public List<Map> getSwInfoOfEtc(Map<String, String> getParam);

	public List<Map> swm105Search(Map<String, String> getParam);

}
