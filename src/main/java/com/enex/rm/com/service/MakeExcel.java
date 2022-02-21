package com.enex.rm.com.service;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.enex.rm.hwm.controller.HwmController;

public class MakeExcel {
    static final Logger LOGGER = LoggerFactory.getLogger(HwmController.class);

    public MakeExcel() {}

    public String get_Filename() {
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddmmmm");
        return ft.format(new Date());
    }

    public String get_Filename(String pre) {
        return pre + get_Filename();
    }
    
    /**
     * Make Excel & Download. 
     */
    public void download(HttpServletRequest request, HttpServletResponse response, Map<String , Object> beans, String filename, String templateFile) {
        String tempPath = request.getSession().getServletContext().getRealPath("/WEB-INF/excel") ;
        
        try { 
            InputStream is = new BufferedInputStream(new FileInputStream(tempPath + "/" + templateFile));
            XLSTransformer transformer = new XLSTransformer();
            Workbook resultWorkbook = transformer.transformXLS(is, beans);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + ".xlsx\"");
            OutputStream os = response.getOutputStream();
            resultWorkbook.write(os);
            
        } catch (Exception e) {
            LOGGER.error("MakeExcel");
        }
    }

}
