package com.enex.rm.swm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.enex.rm.com.service.MakeExcel;
import com.enex.rm.swm.model.TSW10;
import com.enex.rm.swm.model.TSW20;
import com.enex.rm.swm.model.TSW20DT;
import com.enex.rm.swm.service.SwmService;



@Controller
public class SwmController {
	
private static final Logger logger = LoggerFactory.getLogger(SwmController.class);
	
	@Resource
	private SwmService swmservice;
	
	@RequestMapping("swLicenseRegister.do")
	@ResponseBody
	public String swRegister(HttpServletRequest request,  HttpServletResponse response,TSW10 tsw10) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		String usrId = request.getSession().getAttribute("usrID").toString();
		tsw10.setUsrId(usrId);
		try {
			if(("").equals(tsw10.getsSeq())){
				tsw10.setsSeq(swmservice.createSWSeq());
				swmservice.swLicenseInsert(tsw10);
			}else {
				swmservice.swLicenseUpdate(tsw10);
			}
			resultCode=tsw10.getsSeq();
		}catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
		}
		return resultCode;
	}
	
	@RequestMapping("searchSwLicense.do")
	@ResponseBody
	public TSW10 searchSwLicense(TSW10 tsw10) throws Exception {
		return swmservice.searchSwLicense(tsw10);
	}
	
	@RequestMapping("getSWLicenseInfo.do")
	@ResponseBody
	public Map getSWLicenseInfo(TSW10 tsw10) throws Exception {
		return swmservice.getSWLicenseInfo(tsw10);
	}
	
	@RequestMapping("usrSWHeadInfoSave.do")
	@ResponseBody
	public String usrSWHeadInfoSave(HttpServletRequest request,  HttpServletResponse response) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		TSW10 tsw10 = new TSW10();
		TSW20 tsw20 = new TSW20();
		
		String resultCode = "";
		ArrayList swReqList = new ArrayList();
		
		tsw20.setLCodeType(request.getParameter("LCodeType"));
		tsw20.setLCode1(request.getParameter("divisionCode"));
		tsw20.setLCode1Name(request.getParameter("divisionName"));
		tsw20.setLCode2(request.getParameter("empCode"));
		tsw20.setLCode2Name(request.getParameter("empName"));
		tsw20.setSwRegSeq(request.getParameter("swRegSeq"));
		tsw20.setNote(request.getParameter("Note"));
		
		tsw20.setInputUsr(request.getSession().getAttribute("usrID").toString());
		try {
			if(( tsw20.getSwRegSeq() == null ) || ("").equals(tsw20.getSwRegSeq()) ){
				tsw20.setSwRegSeq(swmservice.createSwRegSeq());
				swmservice.usrSWHeadInfo(tsw20);
			}else{
				swmservice.updateUsrSwHeadInfo(tsw20);
			}
			
			resultCode=tsw20.getSwRegSeq().toString();
	
		}catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
		}		
		return resultCode;
	}
	
	@RequestMapping("getSwInfoOfEmp.do")
	@ResponseBody
	public List<Map> getHwInfoOfEmp(String empCode){
		return swmservice.getSwInfoOfEmp(empCode);
	}
	
	@RequestMapping("usrSWDetailInfoSave.do")
	@ResponseBody
	public String usrSWDetailInfoSave(@RequestParam String jsonData, HttpServletRequest request,  HttpServletResponse response) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		String resultCode = "";
		TSW20DT tsw20dt = new TSW20DT();
		
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = new HashMap<String, Object>();

		JSONArray array = JSONArray.fromObject(jsonData);
		
		List<Map<String, Object>> resendList = new ArrayList<Map<String, Object>>();
		tsw20dt.setInputUsr(request.getSession().getAttribute("usrID").toString());
		try {
			for(int i=0; i<array.size(); i++){
				//JSONArray 형태의 값을 가져와 JSONObject 로 풀어준다.    
				JSONObject obj = (JSONObject)array.get(i);
			    
				Map<String, Object> resendMap = new HashMap<String, Object>();
			
			    tsw20dt.setSwRegSeq(obj.get("swRegSeq").toString());
			    tsw20dt.setsSeq(obj.get("SwListsSeq").toString());
			    tsw20dt.setQty(obj.get("SwQty").toString());
			    tsw20dt.setSwType(obj.get("swType").toString());
			    tsw20dt.setSwLicense(obj.get("swLicense").toString());
			    
			    if(tsw20dt.getSwRegDTSeq() == null) {
			    	tsw20dt.setSwRegDTSeq(swmservice.createswRegDTSeq(tsw20dt));
			    }
			    swmservice.usrSWDetailInfoSave(tsw20dt);
			    
			}
			swmservice.usrSWRegDtInfo(tsw20dt);
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
	
	
	@RequestMapping("swm101Search.do")
	@ResponseBody
	public List<Map> searchSWPurchaseHistory(TSW10 tsw10){
		return swmservice.searchSWPurchaseHistory(tsw10);
	}
	
	@RequestMapping("swm101Excel.do")
	public void swm101Excel(HttpServletRequest request, HttpServletResponse response, TSW10 tsw10) {
		if(!("on").equals(request.getParameter("purNumCheck"))) {
			tsw10.setPurNum("");
		}
		
		if(!("on").equals(request.getParameter("purDateCheck"))) {
			tsw10.setPurDateFrom("");
			tsw10.setPurDateTo("");
		}

		if(!("on").equals(request.getParameter("swTypeCheck"))) {
			tsw10.setSwType("");
		}

		if(!("on").equals(request.getParameter("swLicenseCheck"))) {
			tsw10.setSwLicense("");
		}
		
		List<Map> searchList = swmservice.searchSWPurchaseHistory(tsw10);
		Map<String , Object> beans = new HashMap<String , Object>();
		beans.put("listview",searchList);
		
		MakeExcel me= new MakeExcel();
		me.download(request, response, beans, me.get_Filename("ENEXRM"), "swm101.xlsx");
	}
	
	@RequestMapping("swm102Search.do")
	@ResponseBody
	public List<Map> searchSwActiveAndPurCount(TSW10 tsw10){
		return swmservice.searchSwActiveAndPurCount(tsw10);
	}
	
	@RequestMapping("swm102Excel.do")
	public void swm102Excel(HttpServletRequest request, HttpServletResponse response, TSW10 tsw10) {
		if(!("on").equals(request.getParameter("swTypeCheck"))) {
			tsw10.setSwType("");
		}

		if(!("on").equals(request.getParameter("swLicenseCheck"))) {
			tsw10.setSwLicense("");
		}
		
		List<Map> searchList = swmservice.searchSwActiveAndPurCount(tsw10);
		Map<String , Object> beans = new HashMap<String , Object>();
		beans.put("listview",searchList);
		
		MakeExcel me= new MakeExcel();
		me.download(request, response, beans, me.get_Filename("ENEXRM"), "swm102.xlsx");
	}
	

	@RequestMapping("searchSwManageRegister.do")
	@ResponseBody
	public List<Map> searchSwManageRegister(@RequestParam Map<String,String> getParam){
		
		if(("AGEN").equals(getParam.get("orgFlag"))) {
			return swmservice.searchAgenSwManageRegister(getParam);
		}
		else {
			return swmservice.searchSwManageRegister(getParam);
		}
		
	}
	
	@RequestMapping("swm103MiddleData.do")
	@ResponseBody
	public List<Map> swm103MiddleData(){
		return swmservice.swm103MiddleData();
	}
	
	@RequestMapping("searchSwm104DepSwData.do")
	@ResponseBody
	public List<Map> searchSwm104DepSwData(@RequestParam Map<String,String> getParam){
		return swmservice.searchSwm104DepSwData(getParam);
	}
	
	@RequestMapping("swm103depSwSearch.do")
	@ResponseBody
	public ModelAndView swm103depSwSearch(@RequestParam Map<String,String> getParam){
		return new ModelAndView("swm/swm104.tiles","param",getParam);
	}
	
	@RequestMapping("getHwInfoOfEtc.do")
	@ResponseBody
	public List<Map> getHwInfoOfEtc(@RequestParam Map<String,String> getParam){
		System.out.println(getParam);
		return swmservice.getHwInfoOfEtc(getParam);
	}
	
	@RequestMapping("getSwInfoOfEtc.do")
	@ResponseBody
	public List<Map> getSwInfoOfEtc(@RequestParam Map<String,String> getParam){
		return swmservice.getSwInfoOfEtc(getParam);
	}
	
	@RequestMapping("etcSWHeadInfoSave.do")
	@ResponseBody
	public String etcSWHeadInfoSave(HttpServletRequest request,  HttpServletResponse response) throws Exception {
		final Log logger = LogFactory.getLog(getClass());
		TSW10 tsw10 = new TSW10();
		TSW20 tsw20 = new TSW20();
		
		String resultCode = "";
		ArrayList swReqList = new ArrayList();
		
		tsw20.setLCodeType(request.getParameter("LCodeType"));
		tsw20.setLCode1(request.getParameter("LCode1"));
		tsw20.setLCode1Name(request.getParameter("LCode1Name"));
		tsw20.setLCode2(request.getParameter("LCode2"));
		tsw20.setLCode2Name("");
		tsw20.setSwRegSeq(request.getParameter("swRegSeq"));
		tsw20.setNote(request.getParameter("Note"));
		
		tsw20.setInputUsr(request.getSession().getAttribute("usrID").toString());
		try {
			if(( tsw20.getSwRegSeq() == null ) || ("").equals(tsw20.getSwRegSeq()) ){
				tsw20.setSwRegSeq(swmservice.createSwRegSeq());
				swmservice.usrSWHeadInfo(tsw20);
			}else{
				swmservice.updateUsrSwHeadInfo(tsw20);
			}
			
			resultCode=tsw20.getSwRegSeq().toString();
	
		}catch (Exception e) {
			if (logger.isDebugEnabled()) {
				logger.debug(e.toString());
				e.printStackTrace();
			}
			resultCode="E";
		}		
		return resultCode;
	}

	@RequestMapping("swm105Search.do")
	@ResponseBody
	public List<Map> swm105Search(@RequestParam Map<String,String> getParam){
		return swmservice.swm105Search(getParam);
	}
}
