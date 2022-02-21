package com.enex.rm.hwm.service;

import java.util.List;
import java.util.Map;

import com.enex.rm.com.model.TRM60;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.THW20;
import com.enex.rm.hwm.model.THW30;

public interface HwmService {

	public void hwResouceRegister(THW10 thw10);
	public void hwResourceUpdate(THW10 thw10);
	public String createHWSeq();
	public THW10 hwResourceSearch(THW10 thw10);
	public void resourceMoveHistoryRegister(THW20 thw20);
	public void hwResouceUpdateMovingInfo(THW10 thw10);
	public List<THW10> searchProductInfo(String searchProduct);
	public List<THW10> getProductInfo(THW10 thw10);
	public List<THW10> discardTargetList(THW10 thw10);
	public int discardTotCount();
	public String createDiscardListSeq();
	public void makeDiscardListHeader(THW30 thw30);
	public int makeDiscardListDetailPC(THW30 thw30);
	public int makeDiscardListDetailMon(THW30 thw30);
	public int makeDiscardListDetailPrt(THW30 thw30);
	public List<THW10> hwm101Search(THW10 thw10);
	public List<THW10> hwm101ExcelSearch(THW10 thw10);
	public List<THW20> hwm102Search(THW20 thw20);
	public List<THW30> hwm104Search(THW30 thw30);
	public List<Map> hwm106Search(Map<String, String> getParam);
	public List<Map> hwm107Search(TRM60 trm60);
	public List<Map> hwm107Search01(Map<String, String> getParam);
	public List<THW10> discardEtcTargetList();
	public void updateDListFlagN(THW30 thw30);
	public List<Map> hwm105DListHead(THW30 thw30);
	public List<Map> hwm105DListDetail(THW30 thw30);
	public void hwDiscardUpdate(THW30 thw30);
	public void hwDiscardListUpdate(THW30 thw30);
	public List<Map> employeeHw(String empCode);
	public int orgMovingUpdateHWInfo(THW20 thw20);
	public List<Map> hwm005CheckTarget();
	public List<Map> getUsrOrgInfo(Map<String, String> getParam);

}
