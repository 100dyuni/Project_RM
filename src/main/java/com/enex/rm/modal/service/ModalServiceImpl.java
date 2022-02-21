package com.enex.rm.modal.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.enex.rm.com.model.TRM60;
import com.enex.rm.com.model.TRM70;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.THW20;
import com.enex.rm.hwm.model.TRM40;
import com.enex.rm.modal.model.TRM10;
import com.enex.rm.modal.model.TRM50;
@Service
public class ModalServiceImpl implements ModalService{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<TRM10> modalSearchEmp(String searchEmp) {
		return sqlSessionTemplate.selectList("modalSearchEmp",searchEmp);
	}
	@Override
	public List<TRM40> modalSearchTarget(String searchTarget) {
		return sqlSessionTemplate.selectList("modalSearchTarget",searchTarget);
	}
	@Override
	public List<THW10> modalSearchProduct(String searchProduct) {
		return sqlSessionTemplate.selectList("modalSearchProduct",searchProduct);
	}
	@Override
	public List<TRM50> modalSearchEtcLoca(String searchLocation) {
		return sqlSessionTemplate.selectList("modalSearchEtcLocation",searchLocation);
	}
	@Override
	public int etcLocationRegister(TRM50 trm50) {
		return sqlSessionTemplate.insert("etcLocationRegister", trm50);		
	}
	@Override
	public int hwFlagUpdateModal(THW10 thw10) {
		return sqlSessionTemplate.update("hwFlagUpdate", thw10);
		
	}
	@Override
	public List<THW20> simpleHWMoveingHistorySeach(THW20 thw20) {
		return sqlSessionTemplate.selectList("simpleHWMoveingHistorySeach",thw20);
	}
	@Override
	public List<THW10> modalSearchTeam(String searchTeam) {
		return sqlSessionTemplate.selectList("modalSearchTeam",searchTeam);
	}
	
	@Override
	public List<THW10> modalSearchHighOrg(TRM60 trm60) {
		return sqlSessionTemplate.selectList("modalSearchHighOrg",trm60);
	}
	
	@Override
	public List<Map> createEtcLCodeTypeSB() {
		return sqlSessionTemplate.selectList("createEtcLCodeTypeSB");
	}
	
	@Override
	public void delTelDirectory() {
		sqlSessionTemplate.delete("deleteTelDirectory");
		
	}
	
	@Override
	public void insertTelDirectory(TRM70 trm70) {
		sqlSessionTemplate.insert("insertTelDirectory",trm70);
	}
	
	@Override
	public List<Map> phoneDirecSearch() {
		return sqlSessionTemplate.selectList("phoneDirecSearch");
	}
	@Override
	public List<TRM60> modalSearchLowOrg(TRM60 trm60) {
		return sqlSessionTemplate.selectList("modalSearchLowOrg",trm60);
	}

}
