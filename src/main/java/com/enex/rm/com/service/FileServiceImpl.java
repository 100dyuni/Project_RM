package com.enex.rm.com.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.enex.rm.com.model.UpFileVO;

@Service
public class FileServiceImpl implements FileService{
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void fileHistory(UpFileVO fileVo) {
		System.out.println("파일 히스토리를 쌓으러 왔쪄욤");
		sqlSessionTemplate.insert("filHistoryInsert", fileVo);
	}

	@Override
	public UpFileVO findServerFileName(String identiCode) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("findServerFileName",identiCode);
	}

	@Override
	public void updateFileNameTHW10(UpFileVO vo) {
		sqlSessionTemplate.update("updateFileNameTHW10",vo);
	}

}
