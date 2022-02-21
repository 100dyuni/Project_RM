package com.enex.rm.modal.service;

import java.util.List;
import java.util.Map;

import com.enex.rm.com.model.TRM60;
import com.enex.rm.com.model.TRM70;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.THW20;
import com.enex.rm.hwm.model.TRM40;
import com.enex.rm.modal.model.TRM10;
import com.enex.rm.modal.model.TRM50;

public interface ModalService {

	public List<TRM10> modalSearchEmp(String searchEmp);

	public List<TRM40> modalSearchTarget(String searchTarget);

	public List<THW10> modalSearchProduct(String searchProduct);

	public List<TRM50> modalSearchEtcLoca(String searchLocation);

	public int etcLocationRegister(TRM50 trm50);

	public int hwFlagUpdateModal(THW10 thw10);

	public List<THW20> simpleHWMoveingHistorySeach(THW20 thw20);

	public List<THW10> modalSearchTeam(String searchTeam);

	public List<THW10> modalSearchHighOrg(TRM60 trm60);

	public List<Map> createEtcLCodeTypeSB();

	public void delTelDirectory();

	public void insertTelDirectory(TRM70 trm70);

	public List<Map> phoneDirecSearch();

	public List<TRM60> modalSearchLowOrg(TRM60 trm60);
}
