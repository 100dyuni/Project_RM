package com.enex.rm.swm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.enex.rm.swm.model.TSW10;
import com.enex.rm.swm.model.TSW20;
import com.enex.rm.swm.model.TSW20DT;

@Service
public class SwmServiceImpl implements SwmService{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public String createSWSeq() {
		return sqlSessionTemplate.selectOne("createSWSeq");
	}

	@Override
	public void swLicenseInsert(TSW10 tsw10) {
		sqlSessionTemplate.insert("swLicenseInsert", tsw10);
	}

	@Override
	public void swLicenseUpdate(TSW10 tsw10) {
		sqlSessionTemplate.update("swLicenseUpdate", tsw10);
	}

	@Override
	public TSW10 searchSwLicense(TSW10 tsw10) {
		return sqlSessionTemplate.selectOne("searchSwLicense",tsw10);
	}

	@Override
	public Map getSWLicenseInfo(TSW10 tsw10) {
		return sqlSessionTemplate.selectOne("getSWLicenseInfo", tsw10);
	}

	@Override
	public void updateTSW20FlgN(TSW20 tsw20) {
		sqlSessionTemplate.update("updateTSW20FlgN", tsw20);
	}

	@Override
	public String createSwRegSeq() {
		return sqlSessionTemplate.selectOne("createSwRegSeq");
	}

	@Override
	public List<Map> getSwInfoOfEmp(String empCode) {
		return sqlSessionTemplate.selectList("getSwInfoOfEmp",empCode);
	}

	@Override
	public void usrSWHeadInfo(TSW20 tsw20) {
		sqlSessionTemplate.insert("usrSWHeadInfo",tsw20);
	}

	@Override
	public void updateUsrSwHeadInfo(TSW20 tsw20) {
		sqlSessionTemplate.update("updateUsrSwHeadInfo",tsw20);
	}

	@Override
	public String createswRegDTSeq(TSW20DT tsw20dt) {
		return sqlSessionTemplate.selectOne("createswRegDTSeq",tsw20dt);
	}

	@Override
	public void usrSWDetailInfoSave(TSW20DT tsw20dt) {
		sqlSessionTemplate.insert("usrSWDetailInfoSave",tsw20dt);
	}

	@Override
	public void usrSWRegDtInfo(TSW20DT tsw20dt) {
		sqlSessionTemplate.update("usrSWRegDtInfo",tsw20dt);
	}

	@Override
	public List<Map> searchSWPurchaseHistory(TSW10 tsw10) {
		return sqlSessionTemplate.selectList("searchSWPurchaseHistory",tsw10);
	}

	@Override
	public List<Map> searchSwActiveAndPurCount(TSW10 tsw10) {
		return sqlSessionTemplate.selectList("searchSwActiveAndPurCount",tsw10);
	}

	@Override
	public List<Map> searchSwManageRegister(Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("searchSwManageRegister",getParam);
	}

	@Override
	public List<Map> swm103MiddleData() {
		return sqlSessionTemplate.selectList("swm103MiddleData");
	}

	@Override
	public List<Map> searchAgenSwManageRegister(Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("searchAgenSwManageRegister",getParam);
	}

	@Override
	public List<Map> searchSwm104DepSwData(Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("searchSwm104DepSwData",getParam);
	}

	@Override
	public List<Map> getHwInfoOfEtc(Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("getHwInfoOfEtc",getParam);
	}

	@Override
	public List<Map> getSwInfoOfEtc(Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("getSwInfoOfEtc",getParam);
	}

	@Override
	public List<Map> swm105Search(Map<String, String> getParam) {
		return sqlSessionTemplate.selectList("swm105Search",getParam);
	}

}
