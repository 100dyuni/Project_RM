package com.enex.rm.modal.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enex.rm.com.model.TRM60;
import com.enex.rm.com.model.TRM70;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.THW20;
import com.enex.rm.hwm.model.TRM40;
import com.enex.rm.modal.model.TRM10;
import com.enex.rm.modal.model.TRM50;
import com.enex.rm.modal.service.ModalService;

@Controller
public class ModalController {
	
	@Resource
	private ModalService modalService;
	
	@RequestMapping("modalSearchEmp.do") 
	@ResponseBody 
	public List<TRM10> modalSearchEmp(String searchEmp){
		return modalService.modalSearchEmp(searchEmp);
	}
	
	@RequestMapping("modalSearchTarget.do") 
	@ResponseBody 
	public List<TRM40> modalSearchTarget(String searchTarget){
		return modalService.modalSearchTarget(searchTarget);
	}
	
	@RequestMapping("modalSearchProduct.do") 
	@ResponseBody 
	public List<THW10> modalSearchProduct(String searchProduct){
		return modalService.modalSearchProduct(searchProduct);
	}
	
	@RequestMapping("modalSearchEtcLoca.do") 
	@ResponseBody 
	public List<TRM50> modalSearchEtcLoca(String searchLocation){
		return modalService.modalSearchEtcLoca(searchLocation);
	}

	@RequestMapping("simpleHWMoveingHistorySeach.do") 
	@ResponseBody 
	public List<THW20> simpleHWMoveingHistorySeach(THW20 thw20){
		return modalService.simpleHWMoveingHistorySeach(thw20);
	}
	
	
	
	@RequestMapping("etcLocationRegister.do")
	@ResponseBody
	public String etcLocationRegister(HttpServletRequest request,  HttpServletResponse response,TRM50 trm50) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		try {
			modalService.etcLocationRegister(trm50);
			resultCode="S";
		} catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
		}
		return resultCode;
	}
	
	@RequestMapping("hwFlagUpdateModal.do")
	@ResponseBody
	public String hwFlagUpdateModal(HttpServletRequest request,  HttpServletResponse response,THW10 thw10) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		try {
			modalService.hwFlagUpdateModal(thw10);
			resultCode="S";
		}catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
		}
		
		return resultCode;
	}
	
	@RequestMapping("searchTeamInfo.do") 
	@ResponseBody 
	public List<THW10> searchTeamInfoModal(String searchTeam){
		return modalService.modalSearchTeam(searchTeam);
	}
	
	@RequestMapping("modalSearchHighOrg.do") 
	@ResponseBody 
	public List<THW10> modalSearchHighOrg(TRM60 trm60){
		return modalService.modalSearchHighOrg(trm60);
	}
	
	@RequestMapping("createEtcLCodeTypeSB.do") 
	@ResponseBody 
	public List<Map> createEtcLCodeTypeSB(){
		return modalService.createEtcLCodeTypeSB();
	}
	
	@RequestMapping("pdDirectorySave.do") 
	@ResponseBody 
	public String pdDirectorySave(@RequestParam Map<String,String> getParam) {
		String resultCode ="";
		
		try {
			modalService.delTelDirectory();
			
			if(!("").equals(getParam.get("pd1_name"))) {
				TRM70 trm70 = new TRM70();
				trm70.setPdFlag("pd1");
				trm70.setName(getParam.get("pd1_name"));
				trm70.setTel(getParam.get("pd1_tel"));
				
				modalService.insertTelDirectory(trm70);
			}
			
			if(!("").equals(getParam.get("pd2_name"))) {
				TRM70 trm70 = new TRM70();
				trm70.setPdFlag("pd2");
				trm70.setName(getParam.get("pd2_name"));
				trm70.setTel(getParam.get("pd2_tel"));
				
				modalService.insertTelDirectory(trm70);
			}
			
			if(!("").equals(getParam.get("pd3_name"))) {
				TRM70 trm70 = new TRM70();
				trm70.setPdFlag("pd3");
				trm70.setName(getParam.get("pd3_name"));
				trm70.setTel(getParam.get("pd3_tel"));
				
				modalService.insertTelDirectory(trm70);
			}
			
			if(!("").equals(getParam.get("pd4_name"))) {
				TRM70 trm70 = new TRM70();
				trm70.setPdFlag("pd");
				trm70.setName(getParam.get("pd4_name"));
				trm70.setTel(getParam.get("pd4_tel"));
				
				modalService.insertTelDirectory(trm70);
			}
				
			if(!("").equals(getParam.get("pd5_name"))) {
				TRM70 trm70 = new TRM70();
				trm70.setPdFlag("pd5");
				trm70.setName(getParam.get("pd5_name"));
				trm70.setTel(getParam.get("pd5_tel"));
				
				modalService.insertTelDirectory(trm70);
			}
			
			if(!("").equals(getParam.get("pd6_name"))) {
				TRM70 trm70 = new TRM70();
				trm70.setPdFlag("pd6");
				trm70.setName(getParam.get("pd6_name"));
				trm70.setTel(getParam.get("pd6_tel"));
				
				modalService.insertTelDirectory(trm70);
			}
			
			resultCode ="S";
		}catch (Exception e) {
			resultCode ="E";
		}
		
		return resultCode;
	}
	
	@RequestMapping("phoneDirecSearch.do") 
	@ResponseBody 
	public List<Map> phoneDirecSearch(){
		return modalService.phoneDirecSearch();
	}
	
	@RequestMapping("modalSearchLowOrg.do")
	@ResponseBody
	public List<TRM60> modalSearchLowOrg(TRM60 trm60) throws Exception {
		return modalService.modalSearchLowOrg(trm60);
	}
	
	
}
