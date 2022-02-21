package com.enex.rm.hwm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.enex.rm.com.model.TRM60;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.THW20;
import com.enex.rm.hwm.model.THW30;

@Service
public class HwmServiceImpl implements HwmService {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void hwResouceRegister(THW10 thw10) {
		sqlSessionTemplate.insert("HWResourceInsert", thw10);	
	}
	
	@Override
	public void hwResourceUpdate(THW10 thw10) {
		sqlSessionTemplate.update("HWResourceUpdate", thw10);
	}
	
	@Override
	public String createHWSeq() {
		return sqlSessionTemplate.selectOne("createHWSeq");
	}

	@Override
	public THW10 hwResourceSearch(THW10 thw10) {
		return sqlSessionTemplate.selectOne("hwResourceSearch", thw10);
	}

	@Override
	public void resourceMoveHistoryRegister(THW20 thw20) {
		sqlSessionTemplate.insert("resourceMoveHistoryRegister", thw20);
	}

	@Override
	public void hwResouceUpdateMovingInfo(THW10 thw10) {
		sqlSessionTemplate.update("hwResouceUpdateMovingInfo", thw10);
	}

	@Override
	public List<THW10> searchProductInfo(String searchProduct) {
		return sqlSessionTemplate.selectList("searchProductInfo", searchProduct);
	}

	@Override
	public List<THW10> getProductInfo(THW10 thw10) {
		return sqlSessionTemplate.selectList("getProductInfo", thw10);
	}

	@Override
	public List<THW10> discardTargetList(THW10 thw10) {
		return sqlSessionTemplate.selectList("discardTargetList",thw10);
	}

	@Override
	public int discardTotCount() {
		return sqlSessionTemplate.selectOne("discardTotCount");
	}

	@Override
	public String createDiscardListSeq() {	
		return sqlSessionTemplate.selectOne("createDiscardListSeq");
	}

	@Override
	public void makeDiscardListHeader(THW30 thw30) {
		 sqlSessionTemplate.insert("makeDiscardListHeader",thw30);
	}

	@Override
	public int makeDiscardListDetailPC(THW30 thw30) {
		return sqlSessionTemplate.insert("makeDiscardListDetailPC",thw30);
	}

	@Override
	public int makeDiscardListDetailMon(THW30 thw30) {
		return sqlSessionTemplate.insert("makeDiscardListDetailMon",thw30);
	}

	@Override
	public int makeDiscardListDetailPrt(THW30 thw30) {
		return sqlSessionTemplate.insert("makeDiscardListDetailPrt",thw30);
	}

	@Override
	public List<THW10> hwm101Search(THW10 thw10) {
		return sqlSessionTemplate.selectList("hwm101Search",thw10);
	}

	@Override
	public List<THW10> hwm101ExcelSearch(THW10 thw10) {
		return sqlSessionTemplate.selectList("hwm101ExcelSearch",thw10);
	}

	@Override
	public List<THW20> hwm102Search(THW20 thw20) {
		return sqlSessionTemplate.selectList("hwm102Search",thw20);
	}

	@Override
	public List<THW30> hwm104Search(THW30 thw30) {
		return sqlSessionTemplate.selectList("hwm104Search",thw30);
	}

	@Override 
	public List<Map> hwm106Search( Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("searchDepartmentalAssets",getParam);
	}

	@Override
	public List<Map> hwm107Search(TRM60 trm60) {
		return sqlSessionTemplate.selectList("searchAnnualAssets",trm60);
	}

	@Override
	public List<Map> hwm107Search01(Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("searchAnnualAssets",getParam);
	}

	@Override
	public List<THW10> discardEtcTargetList() {
		return sqlSessionTemplate.selectList("discardEtcTargetList");
	}

	@Override
	public void updateDListFlagN(THW30 thw30) {
		sqlSessionTemplate.update("updateDListFlagN",thw30);
		
	}

	@Override
	public List<Map> hwm105DListHead(THW30 thw30) {
		return sqlSessionTemplate.selectList("hwm105DListHead",thw30);
	}

	@Override
	public List<Map> hwm105DListDetail(THW30 thw30) {
		return sqlSessionTemplate.selectList("hwm105DListDetail",thw30);
	}

	@Override
	public void hwDiscardUpdate(THW30 thw30) {
		sqlSessionTemplate.update("hwDiscardUpdate", thw30);
		
	}

	@Override
	public void hwDiscardListUpdate(THW30 thw30) {
		sqlSessionTemplate.update("hwDiscardListUpdate", thw30);
	}

	@Override
	public List<Map> employeeHw(String empCode) {
		return sqlSessionTemplate.selectList("employeeHw",empCode);
	}

	@Override
	public int orgMovingUpdateHWInfo(THW20 thw20) {
		return sqlSessionTemplate.update("orgMovingUpdateHWInfo", thw20);
	}

	@Override
	public List<Map> hwm005CheckTarget() {
		return sqlSessionTemplate.selectList("hwm005CheckTarget");
	}

	@Override
	public List<Map> getUsrOrgInfo(Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("getUsrOrgInfo",getParam);
	}

}
