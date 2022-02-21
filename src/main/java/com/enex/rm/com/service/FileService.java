package com.enex.rm.com.service;

import com.enex.rm.com.model.UpFileVO;

public interface FileService {
	public void fileHistory(UpFileVO fileVo);
	public UpFileVO findServerFileName(String identiCode);
	public void updateFileNameTHW10(UpFileVO vo);
}
