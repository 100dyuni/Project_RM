package com.enex.rm.com.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.enex.rm.com.model.TRM20;
import com.enex.rm.com.model.TRM60;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.TRM40;
import com.enex.rm.modal.model.TRM10;

@Service
public class ComServiceImpl implements ComService{

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<TRM20> highCodeSearch(TRM20 trm20) {
		return sqlSessionTemplate.selectList("highCodeSearch", trm20);
	}

	@Override
	public List<TRM20> lowCodeSearch(TRM20 trm20) {
		return sqlSessionTemplate.selectList("lowCodeSearch", trm20);
	}

	@Override
	public List<TRM20> createSelectBox(TRM20 trm20) {
		return sqlSessionTemplate.selectList("createSelectBox", trm20);
	}

	@Override
	public int insertHighCode(TRM20 trm20) {
		return sqlSessionTemplate.insert("insertHighCode", trm20);
	}

	@Override
	public void saveLowCode(TRM20 trm20) {
		if(sqlSessionTemplate.update("updateLowCode",trm20)<1){
			sqlSessionTemplate.insert("insertLowCode", trm20);	
		}
	}
	
	@Override
	public String createTASeq() {
		return sqlSessionTemplate.selectOne("createTASeq");
	}

	@Override
	public void targetAgencyRegister(TRM40 trm40) {
		sqlSessionTemplate.insert("targetAgencyInsert", trm40);
	}
	
	@Override
	public void targetAgencyUpdate(TRM40 trm40) {
		sqlSessionTemplate.update("targetAgencyUpdate", trm40);
	}

	@Override
	public TRM40 searchTargetInfo(TRM40 trm40) {
		return sqlSessionTemplate.selectOne("searchTargetInfo", trm40);
	}

	@Override
	public List<TRM40> agencyListSearch(TRM40 trm40) {
		return sqlSessionTemplate.selectList("agencyListSearch",trm40);
	}

	@Override
	public void saveHighOrg(TRM60 trm60) {
		if(sqlSessionTemplate.update("updateHighOrg",trm60)<1){
			sqlSessionTemplate.insert("insertHighOrg", trm60);	
		}
		
	}

	@Override
	public List<TRM60> searchHighOrgInfo(TRM60 trm60) {
		return sqlSessionTemplate.selectList("searchHighOrgInfo",trm60);
	}

	@Override
	public List<TRM60> searchLowOrg(TRM60 trm60) {
		return sqlSessionTemplate.selectList("searchLowOrgInfo",trm60);
	}

	@Override
	public void saveLowOrg(TRM60 trm60) {
		if(sqlSessionTemplate.update("updateLowOrg",trm60)<1){
			sqlSessionTemplate.insert("insertLowOrg", trm60);	
		}
	}

	@Override
	public List<TRM60> searchOrgMemberList(TRM60 trm60) {
		return sqlSessionTemplate.selectList("searchOrgMemberList",trm60);
	}

	@Override
	public List<Map> mainEmpCount() {
		return sqlSessionTemplate.selectList("mainEmpCount");
	}

	@Override
	public List<Map> mainHwTotCount() {
		return sqlSessionTemplate.selectList("mainHwTotCount");
	}

	@Override
	public List<Map> mainHwSpareCount() {
		return sqlSessionTemplate.selectList("mainHwSpareCount");
	}

	@Override
	public List<Map> recentHwMoveHistory() {
		return sqlSessionTemplate.selectList("mainRecentHwMoving");
	}

	@Override
	public List<Map> mainHwYearSearch(String ItemType) {
		return sqlSessionTemplate.selectList("mainHwYearSearch",ItemType);
	}

	@Override
	public TRM10 loginAccount(String iD) {
		return sqlSessionTemplate.selectOne("loginAccount", iD);
	}

	@Override
	public Map getEmpInfo(String empCode) {
		return sqlSessionTemplate.selectOne("getEmpInfo", empCode);
	}

	@Override
	public List<Map> getHwInfoOfEmp(String empCode) {
		return sqlSessionTemplate.selectList("getHwInfoOfEmp",empCode);
	}

	@Override
	public List<TRM60> searchOrgMemberList2(TRM60 trm60) {
		return sqlSessionTemplate.selectList("searchOrgMemberList2",trm60);
	}

	@Override
	public List<Map> searchRetiredEmpList() {
		return sqlSessionTemplate.selectList("searchRetiredEmpList");
	}

	@Override
	public List<Map> searchRetiredEmpHwList(TRM10 trm10) {
		return sqlSessionTemplate.selectList("searchRetiredEmpHwList",trm10);
	}

	@Override
	public List<Map> searchRetiredEmpSwList(TRM10 trm10) {
		return sqlSessionTemplate.selectList("searchRetiredEmpSwList",trm10);
	}

	@Override
	public void retiredEmpSwUseYNUpdate(TRM10 trm10) {
		sqlSessionTemplate.update("SwUseNUpdate",trm10);
	}

	@Override
	public List<TRM20> setEmptyCodeSB() {
		return sqlSessionTemplate.selectList("setEmptyCodeSB");
	}

	@Override
	public List<Map> setDivisionSB(TRM60 trm60) {
		return sqlSessionTemplate.selectList("setDivisionSB",trm60);
	}

	@Override
	public List<Map> searchEmptyList(THW10 thw10) {
		return sqlSessionTemplate.selectList("searchEmptyList",thw10);
	}	

}
