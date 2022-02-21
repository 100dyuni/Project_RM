package com.enex.rm.com.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.enex.rm.com.model.TRM20;
import com.enex.rm.com.model.TRM60;
import com.enex.rm.com.service.ComService;
import com.enex.rm.hwm.controller.HwmController;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.THW20;
import com.enex.rm.hwm.model.TRM40;
import com.enex.rm.hwm.service.HwmService;
import com.enex.rm.modal.model.TRM10;

@Controller
public class ComController {
	
	private static final Logger logger = LoggerFactory.getLogger(HwmController.class);
	
	@Resource
	private ComService comservice;
	
	@Resource
	private HwmService hwmservice;
	
	@RequestMapping("highCodeSearch.do")
	@ResponseBody 
	public List<TRM20> highCodeSearch(TRM20 trm20){
		return comservice.highCodeSearch(trm20);
	}
	
	@RequestMapping("lowCodeSearch.do")
	@ResponseBody 
	public List<TRM20> lowCodeSearch(TRM20 trm20){
		return comservice.lowCodeSearch(trm20);	
	}
	
	@RequestMapping("createSelectBox.do")
	@ResponseBody 
	public List<TRM20> createSelectBox(TRM20 trm20){
		return comservice.createSelectBox(trm20);	
	}
	
	@RequestMapping("insertHighCode.do")
	@ResponseBody 
	public String insertHighCode(HttpServletRequest request, TRM20 trm20){
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		String usrId = request.getSession().getAttribute("usrID").toString();
		try {
			comservice.insertHighCode(trm20);
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
	
	@RequestMapping("saveLowCode.do")
	@ResponseBody 
	public String saveLowCode(HttpServletRequest request,TRM20 trm20){
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		String usrId = request.getSession().getAttribute("usrID").toString();
		try {
			comservice.saveLowCode(trm20);
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
	
	
	@RequestMapping("targetAgencyRegister.do")
	@ResponseBody
	public String targetAgencyRegister(HttpServletRequest request,  HttpServletResponse response,TRM40 trm40) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		try {
			if((trm40.getaSeq().equals(""))){
				trm40.setaSeq("A"+comservice.createTASeq());
				comservice.targetAgencyRegister(trm40);
			}else{
				comservice.targetAgencyUpdate(trm40);
			}
			resultCode=trm40.getaSeq();
		} catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
		}
		return resultCode;
	}
	

	@RequestMapping("searchTargetInfo.do")
	@ResponseBody
	public TRM40 searchTargetInfo(TRM40 trm40) throws Exception {
		return comservice.searchTargetInfo(trm40);
	}
	
	@RequestMapping("agencyListSearch.do")
	@ResponseBody
	public List<TRM40> agencyListSearch(TRM40 trm40) throws Exception {
		if(("null").equals(trm40.getActiveFlg())) {
			trm40.setActiveFlg("");
		}
		return comservice.agencyListSearch(trm40);
	}
	
	@RequestMapping("saveHighOrg.do")
	@ResponseBody 
	public String saveHighOrg(TRM60 trm60){
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		try {
			comservice.saveHighOrg(trm60);
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
	
	@RequestMapping("searchHighOrg.do")
	@ResponseBody
	public List<TRM60> searchHighOrgInfo(TRM60 trm60) throws Exception {
		if(("null").equals(trm60.gethUseYN())) {
			trm60.sethUseYN("");
		}
		return comservice.searchHighOrgInfo(trm60);
	}
	
	@RequestMapping("searchLowOrg.do")
	@ResponseBody
	public List<TRM60> searchLowOrg(TRM60 trm60) throws Exception {
		return comservice.searchLowOrg(trm60);
	}
	
	@RequestMapping("saveLowOrg.do")
	@ResponseBody 
	public String saveLowOrg(TRM60 trm60){
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		try {
			comservice.saveLowOrg(trm60);
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
	
	@RequestMapping("searchOrgMemberList.do")
	@ResponseBody
	public List<TRM60> searchOrgMemberList(TRM60 trm60) throws Exception {
		return comservice.searchOrgMemberList(trm60);
	}
	
	@RequestMapping("searchOrgMemberList2.do")
	@ResponseBody
	public List<TRM60> searchOrgMemberList2(TRM60 trm60) throws Exception {
		return comservice.searchOrgMemberList2(trm60);
	}
	
	@RequestMapping("mainEmpCount.do")
	@ResponseBody
	public List<Map> mainEmpCount(){
		return comservice.mainEmpCount();
	}
	
	@RequestMapping("mainHwTotCount.do")
	@ResponseBody
	public List<Map> mainHwTotCount(){
		return comservice.mainHwTotCount();
	}

	@RequestMapping("mainHwSpareCount.do")
	@ResponseBody
	public List<Map> mainHwSpareCount(){
		return comservice.mainHwSpareCount();
	}
	
	@RequestMapping("recentHwMoveHistory.do")
	@ResponseBody
	public List<Map> recentHwMoveHistory(){
		return comservice.recentHwMoveHistory();
	}
	
	@RequestMapping("mainHwYearSearch.do")
	@ResponseBody
	public List<Map> mainHwYearSearch(String ItemType){
		return comservice.mainHwYearSearch(ItemType);
	}
	
	@RequestMapping("getEmpInfo.do")
	@ResponseBody
	public Map getEmpInfo(String empCode){
		return comservice.getEmpInfo(empCode);
	}
	
	@RequestMapping("getHwInfoOfEmp.do")
	@ResponseBody
	public List<Map> getHwInfoOfEmp(String empCode){
		return comservice.getHwInfoOfEmp(empCode);
	}
	
	@RequestMapping("searchRetiredEmpList.do")
	@ResponseBody
	public List<Map> searchRetiredEmpList(){
		return comservice.searchRetiredEmpList();
	}
	
	@RequestMapping("searchRetiredEmpHwList.do")
	@ResponseBody
	public List<Map> searchRetiredEmpHwList(TRM10 trm10, HttpServletRequest request,  HttpServletResponse response) throws Exception {
		return comservice.searchRetiredEmpHwList(trm10);
	}
	
	@RequestMapping("searchRetiredEmpSwList.do")
	@ResponseBody
	public List<Map> searchRetiredEmpSwList(TRM10 trm10, HttpServletRequest request,  HttpServletResponse response) throws Exception {
		return comservice.searchRetiredEmpSwList(trm10);
	}
	
	@RequestMapping("retiredEmpSwUpdate.do")
	@ResponseBody
	public String retiredEmpSwUpdate(HttpServletRequest request,  HttpServletResponse response,TRM10 trm10) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String usrId = request.getSession().getAttribute("usrID").toString();
		String resultCode = "S";
		
		try {
			comservice.retiredEmpSwUseYNUpdate(trm10);
			
		} catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
		}
		
		return resultCode;
	}
	
	@RequestMapping("setEmptyCodeSB.do")
	@ResponseBody 
	public List<TRM20> setEmptyCodeSB(){
		return comservice.setEmptyCodeSB();	
	}
	
	@RequestMapping("setDivisionSB.do")
	@ResponseBody 
	public List<Map> setDivisionSB(TRM60 trm60){
		return comservice.setDivisionSB(trm60);	
	}
	
	@RequestMapping("searchEmptyList.do")
	@ResponseBody 
	public List<Map> searchEmptyList(THW10 thw10){
		return comservice.searchEmptyList(thw10);	
	}
	
	@RequestMapping("tot103Save.do") 
	@ResponseBody 
	public String tot103Save(THW20 thw20, HttpServletRequest request){
		THW10 thw10 = new THW10();
		String[] rSeqList = thw20.getrSeqList();
		String resultCode = "";
		String usrId = request.getSession().getAttribute("usrID").toString();
		thw20.setInputUsr(usrId);
		
		try {
			
			for(int i=0; i<rSeqList.length; i++) {
				thw10.setrSeq(rSeqList[i].toString());
				List<THW10> lThw10 = hwmservice.getProductInfo(thw10);
				thw20.setrSeq(lThw10.get(0).getrSeq());
				thw20.setIdentiCode(lThw10.get(0).getIdentiCode());
				thw20.setStartLCode1(lThw10.get(0).getLCode1());
				thw20.setStartLCode1Name(lThw10.get(0).getLCode1Name());
				thw20.setStartLCode2(lThw10.get(0).getLCode2());
				thw20.setStartLCode2Name(lThw10.get(0).getLCode2Name());
				thw20.setNote("["+thw20.getArrDate()+"] 자산회수");
				
				hwmservice.resourceMoveHistoryRegister(thw20);
				thw20.setNote(lThw10.get(0).getNote() +"  ["+thw20.getArrDate()+"] 자산회수");
			
				hwmservice.orgMovingUpdateHWInfo(thw20);
			}
			
			resultCode = "S";
			
		}catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
			
		}
		
	
		return resultCode;
	}
	
	
}
