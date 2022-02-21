package com.enex.rm.com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.enex.rm.com.model.MediaUtils;
import com.enex.rm.com.model.UpFileVO;
import com.enex.rm.com.service.FileService;
import com.enex.rm.hwm.controller.HwmController;

@Controller
public class FileUploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(HwmController.class);

	@Resource
	private FileService fileservice;
	
	private String upLoadDriectory = "D:\\ENEXRM";
	
	@RequestMapping(value = "upFile.do", method=RequestMethod.GET)
	public String upFile() {
		return "upFile";
	}
	
	@RequestMapping(value = "insertFile.do", method=RequestMethod.POST)
	@ResponseBody
	public String insertFile(UpFileVO vo) throws IOException{
		MultipartFile upFile = vo.getUploadFile();
		UUID uuid = UUID.randomUUID();
		String inputFileName="";
		if(!upFile.isEmpty()) {
			String fileName = upFile.getOriginalFilename();
			vo.setFileName(fileName);
			if(imgFileFormatCheck(fileName)){
				//IOUtils.copy(upFile.getInputStream(),new FileOutputStream(new File(upLoadDriectory,"s"+fileName)));
				inputFileName=uuid.toString()+".jpg";
				IOUtils.copy(upFile.getInputStream(),new FileOutputStream(new File(upLoadDriectory,inputFileName)));
				System.out.println("output fileName : " + inputFileName);
				return inputFileName;
			}else {
				return "E01";//FomatError
			}
			
		}else {
			System.out.println("파일의 크기가 0이거나 존재하지 않는 파일");
			return "E02";//파일의 크기가 0이거나 존재하지 않는 파일
		}
	}
	
	public static boolean imgFileFormatCheck(String fileName) {
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		formatName=formatName.toUpperCase();
		System.out.println("imgFileFormatCheck : " + formatName);
		final String[] CHECK_EXTENSION = {"JPG","PNG","GIF"};
		for(int i=0; i<CHECK_EXTENSION.length; i++) {
			if(formatName.equals(CHECK_EXTENSION[i])) {
				return true;
			}
		}
		return false;
	}
	
	@RequestMapping(value = "insertFileHistory.do")
	@ResponseBody
	public String insertFileHistory(UpFileVO vo)throws Exception{
		String resultCode="";
		try {
			fileservice.fileHistory(vo);
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
	
	@RequestMapping("loadImgModal.do") 
	@ResponseBody 
	public ResponseEntity<byte[]> loadImgModal(@RequestParam("UUID") String uuid)throws Exception{
		InputStream in =null;
		ResponseEntity<byte[]> entity = null;
		System.out.println("loadImgModal.do");
		System.out.println(uuid);
		String fileName=uuid;
		try {
			String formatNmae =fileName.substring(fileName.lastIndexOf(".")+1);
			HttpHeaders headers = new HttpHeaders();
			MediaType mType= MediaUtils.getMediaType(formatNmae);
			in = new java.io.FileInputStream(upLoadDriectory+"\\"+fileName);
			headers.setContentType(mType);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
		
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		//System.out.println(modalService.modalSearchEmp(searchEmp));
		return entity;
	}
	
	@RequestMapping("findServerFileName.do")
	@ResponseBody
	public UpFileVO FindServerFileName(String IdentiCode) throws Exception {
		return fileservice.findServerFileName(IdentiCode);
	}
	
	@RequestMapping("updateFileNameTHW10.do")
	@ResponseBody
	public void updateFileNameTHW10(UpFileVO vo) {
		fileservice.updateFileNameTHW10(vo);
	}
	
	
}

