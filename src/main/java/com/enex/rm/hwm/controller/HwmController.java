package com.enex.rm.hwm.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.enex.rm.com.model.TRM60;
import com.enex.rm.com.service.MakeExcel;
import com.enex.rm.hwm.model.THW10;
import com.enex.rm.hwm.model.THW10EX;
import com.enex.rm.hwm.model.THW20;
import com.enex.rm.hwm.model.THW20EX;
import com.enex.rm.hwm.model.THW30;
import com.enex.rm.hwm.service.HwmService;

@Controller
public class HwmController {
	
	private static final Logger logger = LoggerFactory.getLogger(HwmController.class);
	
	@Resource
	private HwmService hwmservice;
	
	@RequestMapping("hwResouceRegister.do")
	@ResponseBody
	public String hwResouceRegister(HttpServletRequest request,  HttpServletResponse response,THW10 thw10) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		String usrId = request.getSession().getAttribute("usrID").toString();
		
		try {
			if(thw10.getrSeq().equals("")){
				thw10.setrSeq(hwmservice.createHWSeq());
				thw10.setInputUsr(usrId);
				hwmservice.hwResouceRegister(thw10);
			}else{
				thw10.setUpdateUsr(usrId);
				hwmservice.hwResourceUpdate(thw10);
			}
			resultCode=thw10.getrSeq();
		} catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
		}
		return resultCode;
	}
	
	@RequestMapping("searchHwResource.do")
	@ResponseBody
	public THW10 hwResourceSearch(THW10 thw10) throws Exception {
		return hwmservice.hwResourceSearch(thw10);
	}
	
	@RequestMapping("resourceMoveHistory.do")
	@ResponseBody
	public String resourceMoveHistory(HttpServletRequest request,  HttpServletResponse response,THW20 thw20) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		String usrId = request.getSession().getAttribute("usrID").toString();
		try {
			THW10 thw10 = new THW10();
			thw20.setInputUsr(usrId);
			hwmservice.resourceMoveHistoryRegister(thw20);//파일이동 히스토리 저장
			
			thw10.setrSeq(thw20.getrSeq());
			thw10.setIdentiCode(thw20.getIdentiCode());
			
			thw10=hwmservice.hwResourceSearch(thw10);
			
			thw10.setLCodeType(thw20.getArrLCodeType());
			thw10.setLCode1(thw20.getArrLCode1());
			thw10.setLCode1Name(thw20.getArrLCode1Name());
			thw10.setLCode2(thw20.getArrLCode2());
			thw10.setLCode2Name(thw20.getArrLCode2Name());
			
			if((thw10.getNote() == null ) || ("").equals(thw10.getNote())) {
				thw10.setNote(thw20.getNote());
			}else {
				thw10.setNote(thw10.getNote()+"  "+thw20.getNote());
			}
			thw10.setPreUsrDep(thw20.getStartLCode1Name());
			thw10.setPreUsr(thw20.getStartLCode2Name());
			thw10.setUpdateUsr(usrId);
			hwmservice.hwResouceUpdateMovingInfo(thw10);//제품정보 업데이트
			
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

	@RequestMapping("searchProductInfo.do") 
	@ResponseBody 
	public List<THW10> searchProductInfo(String searchProduct){
		return hwmservice.searchProductInfo(searchProduct);
	}
	
	@RequestMapping("getProductInfo.do") 
	@ResponseBody 
	public List<THW10> getProductInfo(HttpServletRequest request, THW10 thw10){
		return hwmservice.getProductInfo(thw10);
	}
	
	@RequestMapping("hwm001MovingHistory.do")
	public ModelAndView hwm001ToHwm002(THW10 thw10,ModelAndView mv, HttpServletRequest request) throws Exception{
		return new ModelAndView("hwm/hwm002.tiles","thw10",thw10);
	}
	
	@RequestMapping("discardTargetList.do") 
	@ResponseBody 
	public List<THW10> discardTargetList(HttpServletRequest request, THW10 thw10){
		return hwmservice.discardTargetList(thw10);
	}
	
	@RequestMapping("discardEtcTargetList.do") 
	@ResponseBody 
	public List<THW10> discardEtcTargetList(HttpServletRequest request){
		return hwmservice.discardEtcTargetList();
	}
	
	@RequestMapping("discardTotCount.do") 
	@ResponseBody 
	public int discardTotCount(HttpServletRequest request){
		return hwmservice.discardTotCount();
	}
	
	@RequestMapping("makeDiscardList.do") 
	@ResponseBody 
	public String makeDiscardList(HttpServletRequest request, HttpServletResponse response,THW30 thw30) throws Exception {
		thw30.setdListSeq(hwmservice.createDiscardListSeq());
		int listDetailSeq = 0;
		String resultCode="";
		String usrId = request.getSession().getAttribute("usrID").toString();
		
		try {
			thw30.setInputUsr(usrId);
			thw30.setUseYN("Y");
			hwmservice.makeDiscardListHeader(thw30);
			
			if(Integer.parseInt(thw30.getPcCnt())>0) {
				thw30.setDetailSeq(Integer.toString(listDetailSeq));
				listDetailSeq += hwmservice.makeDiscardListDetailPC(thw30);	
			}
			
			if(Integer.parseInt(thw30.getMonCnt())>0) {
				thw30.setDetailSeq(Integer.toString(listDetailSeq));
				listDetailSeq += hwmservice.makeDiscardListDetailMon(thw30);
			}
			
			if(Integer.parseInt(thw30.getPrtCnt())>0) {
				thw30.setDetailSeq(Integer.toString(listDetailSeq));
				listDetailSeq += hwmservice.makeDiscardListDetailPrt(thw30);
			}
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
	
	@RequestMapping("hwm101Search.do") 
	@ResponseBody 
	public List<THW10> hwm101Search(THW10 thw10){
		return hwmservice.hwm101Search(thw10);
	}
	
	@RequestMapping("hwm101ExcelSearch.do") 
	@ResponseBody 
	public List<THW10> hwm101Excel(HttpServletRequest request,THW10 thw10){
		return hwmservice.hwm101Search(thw10);
	}
	
	
	@RequestMapping(value = "/hwm101Excel.do")
	public void hwm101Excel(HttpServletRequest request, HttpServletResponse response, THW10 thw10,THW10EX thw10ex) {
		if(!("on").equals(thw10ex.getItemTypeCheck())){
			thw10.setItemType("");
		}
		if(!("on").equals(thw10ex.getItemStatusCheck())){
			thw10.setItemStatus("");
		}
		if(!("on").equals(thw10ex.getModelNameCheck())){
			thw10.setModelName("");
		}
		if(!("on").equals(thw10ex.getIdentiCodeCheck())){
			thw10.setIdentiCode("");
		}
		if(!("on").equals(thw10ex.getLCodeTypeCheck())){
			thw10.setLCodeType("");
		}
		if(!("on").equals(thw10ex.getLCode1Check())){
			thw10.setLCode1("");
		}
		if(!("on").equals(thw10ex.getLCode2Check())){
			thw10.setLCode2("");
		}
		if(!("on").equals(thw10ex.getNoteCheck())){
			thw10.setNote("");
		}
		if(!("on").equals(thw10ex.getManufacCheck())){
			thw10.setManufac("");
		}
		if(!("on").equals(thw10ex.getProductDateCheck())){
			thw10.setProductDateFrom("");
			thw10.setProductDateTo("");
		}
		if(!("on").equals(thw10ex.getPurNumCheck())){
			thw10.setPurNum("");
		}
		if(!("on").equals(thw10ex.getPurDateCheck())){
			thw10.setPurDateFrom("");
			thw10.setPurDateTo("");
		}
		
		List<THW10> searchList = hwmservice.hwm101ExcelSearch(thw10);
		Map<String , Object> beans = new HashMap<String , Object>();
		beans.put("listview",searchList);
		
		MakeExcel me= new MakeExcel();
		me.download(request, response, beans, me.get_Filename("ENEXRM"), "hwm101.xlsx");
	}
	
	 
	@RequestMapping("hwm101DetailSearch.do")
	public ModelAndView hwm101DetailSearch(THW10 thw10,ModelAndView mv, HttpServletRequest request) throws Exception{
		return new ModelAndView("hwm/hwm001.tiles","thw10",thw10);
	}
	
	@RequestMapping("hwm102Search.do") 
	@ResponseBody 
	public List<THW20> hwm102Search(THW20 thw20){
		return hwmservice.hwm102Search(thw20);
	}
	
	@RequestMapping(value = "/hwm102Excel.do")
	public void hwm102Excel(HttpServletRequest request, HttpServletResponse response, THW20 thw20,THW20EX thw20ex) {

		if(!("on".equals(thw20ex.getIdentiCodeCheck()))) {
			thw20.setIdentiCode("");
		}
		if(!("on".equals(thw20ex.getItemTypeCheck()))) {
			thw20.setItemType("");
		}
		if(!("on".equals(thw20ex.getModelNameCheck()))) {
			thw20.setModelName("");
		}
		if(!("on".equals(thw20ex.getLCodeTypeCheck()))) {
			thw20.setArrLCodeType("");
		}
		if(!("on".equals(thw20ex.getArrLCode1Check()))) {
			thw20.setArrLCode1("");
		}
		if(!("on".equals(thw20ex.getArrLCode2Check()))) {
			thw20.setArrLCode2("");
		}
		if(!("on".equals(thw20ex.getArrDateCheck()))) {
			thw20.setArrDateFrom("");
			thw20.setArrDateTo("");
		}
		
		List<THW20> searchList = hwmservice.hwm102Search(thw20);
		Map<String , Object> beans = new HashMap<String , Object>();
		beans.put("listview",searchList);
		MakeExcel me= new MakeExcel();
		me.download(request, response, beans, me.get_Filename("ENEXRM"), "hwm102.xlsx");
	}
	
	@RequestMapping("hwm104Search.do") 
	@ResponseBody 
	public List<THW30> hwm104Search(THW30 thw30){
		return hwmservice.hwm104Search(thw30);
	}
	
	@RequestMapping("hwm106Search.do") 
	@ResponseBody 
	public List<Map> hwm106Search(@RequestParam Map<String,String> getParam){
		return hwmservice.hwm106Search(getParam);
	}
	
	@RequestMapping(value = "/hwm106Excel.do")
	public void hwm106Excel(HttpServletRequest request, HttpServletResponse response, TRM60 trm60,@RequestParam Map<String,String> getParam) {
		
		if(!("on".equals(getParam.get("divisionCheck")))) {
			getParam.replace("highOrgCode", "");
		}
		
		if(!("on".equals(getParam.get("teamCheck")))) {
			getParam.replace("lowOrgCode", "");
		}
		
		if(!("on".equals(getParam.get("ItemTypeCheck")))) {
			getParam.replace("ItemType", "");
		}
		
		List<Map> searchResult = hwmservice.hwm106Search(getParam); 
		Map<String,Object> beans = new HashMap<String, Object>(); 
		beans.put("listview",searchResult);
		MakeExcel me= new MakeExcel(); me.download(request, response, beans, me.get_Filename("ENEXRM"), "hwm106.xlsx");
		
	}
	
	@RequestMapping("hwm107Search.do") 
	@ResponseBody 
	public List<Map> hwm107Search(@RequestParam Map<String,String> getParam){
		return hwmservice.hwm107Search01(getParam);
	}
	
	@RequestMapping("hwm107Excel.do")
	public void hwm107Excel(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,String> getParam) {
		
		if(!("on").equals(getParam.get("ItemTypeCheck"))) {
			getParam.put("ItemType", "");
		}
		
		if(!("on").equals(getParam.get("divisionCheck"))) {
			getParam.put("highOrgCode", "");
		}
		
		if(!("on").equals(getParam.get("teamCheck"))) {
			getParam.put("lowOrgCode", "");
		}
		
		List<Map> searchResult = hwmservice.hwm107Search01(getParam);
		Map<String,Object> beans = new HashMap<String, Object>();
		beans.put("listview",searchResult);
		MakeExcel me= new MakeExcel();
		me.download(request, response, beans, me.get_Filename("ENEXRM"), "hwm107.xlsx");
		
	}
	
	@RequestMapping("hwm104Detail.do")
	public ModelAndView hwm104Detail(THW30 thw30,ModelAndView mv, HttpServletRequest request) throws Exception{
		return new ModelAndView("hwm/hwm105.tiles","thw30",thw30);
	}
	
	@RequestMapping("hwm104Del.do") 
	@ResponseBody 
	public String deleteDList(HttpServletRequest request,  HttpServletResponse response,THW30 thw30) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		try {
			hwmservice.updateDListFlagN(thw30);
			
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
	
	@RequestMapping("hwm105DListHead.do") 
	@ResponseBody 
	public List<Map> hwm105DListHead(THW30 thw30){
		return hwmservice.hwm105DListHead(thw30);
	}
	
	@RequestMapping("hwm105DListDetail.do") 
	@ResponseBody 
	public List<Map> hwm105DListDetail(THW30 thw30){
		return hwmservice.hwm105DListDetail(thw30);
	}
	
	@RequestMapping("hwm105Excel.do")
	public void hwm105Excel(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,String> getParam) {
		
		THW30 thw30 = new THW30();
		thw30.setdListSeq(getParam.get("dListSeq"));
		thw30.setdListTitle(getParam.get("disListTitle"));
		thw30.setWriteDate(getParam.get("writeDate"));
		thw30.setTotCnt(getParam.get("totCnt"));
		thw30.setPcCnt(getParam.get("pcCnt"));
		thw30.setMonCnt(getParam.get("monCnt"));
		thw30.setPrtCnt(getParam.get("prtCnt"));
		
		List<Map> searchResult = hwmservice.hwm105DListDetail(thw30);
		Map<String,Object> beans = new HashMap<String, Object>();
		beans.put("headData",thw30);
		beans.put("listview",searchResult);
		MakeExcel me= new MakeExcel();
		me.download(request, response, beans, me.get_Filename("ENEXRM"), "hwm105.xlsx");
		
	}
	
	@RequestMapping("hwm105Discard.do")
	@ResponseBody
	public String hwm105Discard(HttpServletRequest request,  HttpServletResponse response,THW30 thw30) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		try {
			hwmservice.hwDiscardUpdate(thw30);
			hwmservice.hwDiscardListUpdate(thw30);
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
	
	@RequestMapping("employeeHw.do") 
	@ResponseBody 
	public List<Map> employeeHw(String empCode){
		return hwmservice.employeeHw(empCode);
	}
	
	@RequestMapping("hwm005Save.do") 
	@ResponseBody 
	public String hwm005Save(THW20 thw20, HttpServletRequest request){
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
				thw20.setArrLCodeType(lThw10.get(0).getLCodeType());
				thw20.setArrLCode2(lThw10.get(0).getLCode2());
				thw20.setArrLCode2Name(lThw10.get(0).getLCode2Name());
				thw20.setNote("["+thw20.getArrDate()+"] 조직변경");
				
				hwmservice.resourceMoveHistoryRegister(thw20);
				thw20.setNote(lThw10.get(0).getNote() +" ["+thw20.getArrDate()+"] 조직변경");
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
	
	@RequestMapping("hwm005CheckTarget.do") 
	@ResponseBody 
	public List<Map> hwm005CheckTarget(){
		return hwmservice.hwm005CheckTarget();
	}
	
	@RequestMapping("getUsrOrgInfo.do") 
	@ResponseBody 
	public List<Map> getUsrOrgInfo(@RequestParam Map<String,String> getParam){
		return hwmservice.getUsrOrgInfo(getParam);
	}
	
	@RequestMapping("backHwm106Paging.do") 
	@ResponseBody 
	public ModelAndView backHwm106Paging(@RequestParam Map<String,String> getParam){
		return new ModelAndView("hwm/hwm106.tiles","bParam",getParam);
	}
	
}
