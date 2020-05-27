package com.asiainfo.cmc.aopLog.controller;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asiainfo.cmc.aopLog.ExportExcel;
import com.asiainfo.cmc.aopLog.Log;
import com.asiainfo.cmc.aopLog.service.ISystemLogService;
import com.asiainfo.cmc.common.ConvertFormat;
import com.asiainfo.cmc.config.DS;
import com.asiainfo.cmc.utils.RequestUtils;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;



@Controller
@RequestMapping("/systemLog")
public class SystemLogCrt {
	
	@Resource
	private ISystemLogService systemLogService;
	
	@DS("dataSource")@RequestMapping(value = "/index", method = RequestMethod.GET)
   	public String newIndex(HttpServletRequest request, Locale locale, Model model ) {
   		 
   	 
   		return "authority/log/systermLog";
   	}
	
	
	

	
	@DS("dataSource")@RequestMapping(value = "/queryData",  method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public JSONObject query(HttpServletRequest req, HttpServletResponse res) {
		res.setContentType("text/html;charset=UTF-8");
		int page, rows ;
		JSONObject returnJSONObject = new JSONObject();
		page = ConvertFormat.parseInt(req.getParameter("page"));
		rows = ConvertFormat.parseInt(req.getParameter("rows"));
		Map<String,Object> params = new HashMap<String,Object>();
		params = RequestUtils.getParamsMapObj(req);
/*		params.put("startTime", "2019-04-23 02:29:12");
		params.put("endTime", "2019-04-23 05:59:59");*/
		try {
			List<Log> outList = new ArrayList<Log>();
			PageInfo<Log> pageInfo =systemLogService.queryData(params);
			
			outList=pageInfo.getList();
			returnJSONObject.put("page", page);
			returnJSONObject.put("total",Math.ceil((double) pageInfo.getTotal() / rows));//;
			returnJSONObject.put("records", pageInfo.getTotal());
			returnJSONObject.put("rows", outList);
			/*PrintWriter writer = res.getWriter();
			writer.println(returnJSONObject);
			writer.flush();*/
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return returnJSONObject;


	}
	
	@RequestMapping(value = "/exportExcel",  method = {RequestMethod.GET,RequestMethod.POST})
	public void exportExcel(HttpServletRequest req, HttpServletResponse res) {
		res.setContentType("text/html;charset=UTF-8");
		String fileName = "登录日志";
		Map<String,Object> params = new HashMap<String,Object>();
		params = RequestUtils.getParamsMapObj(req);
/*		params.put("startTime", "2019-04-23 02:29:12");
		params.put("endTime", "2019-04-23 05:59:59");*/
		try {
			 String[] rowsName = new String[]{"序号","用户名称","用户名","登录ip","描述","登录时间","登出时间"};
 
			List<Log> outList =systemLogService.exportExcel(params);
			
			
			 List<Object[]>  dataList = new ArrayList<Object[]>();
		        Object[] objs = null;
		        for (int i = 0; i < outList.size(); i++) {
		        	Log data = outList.get(i);
		            objs = new Object[rowsName.length];
		            objs[0] = 1;
		            objs[1] = data.getUserName();
		            objs[2] = data.getUserId();
		            objs[3] = data.getIp();
		            objs[4] = data.getDescription();
		            objs[5] = data.getLoginTime();
		            objs[6] = data.getLoginOutTime();
		            dataList.add(objs);
		        }
			
			
			
			
			ExportExcel ex = new ExportExcel(fileName, rowsName, dataList);
			HSSFWorkbook workbook=  ex.export();
			
			//res.setCharacterEncoding("UTF-8");
           // res.setContentType("application/vnd.ms-excel");
            //res.setHeader("Content-Disposition", headStr);
            //res.setHeader("Content-disposition", "attachment; filename="+fileName+"logs.xls");

            res.setContentType("application/octet-stream;charset=utf-8");
            res.setHeader("Content-Disposition", "attachment;filename="
		+ new String(fileName.getBytes(),"iso-8859-1") + ".xls");
 
            OutputStream out = res.getOutputStream();
            workbook.write(out);
			 
			/*PrintWriter writer = res.getWriter();
			writer.println(returnJSONObject);
			writer.flush();*/
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	 

	}
}
