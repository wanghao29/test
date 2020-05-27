package com.asiainfo.cmc.utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;


public class RequestUtils {

	/**
	 * 获取页面字符参数
	 */
	public static String getStringParam(HttpServletRequest request,
			String param, String defaultValue) {
		String s = request.getParameter(param);
		return s == null ? defaultValue : s;
	}

	public static String getTrimString(HttpServletRequest request, String param) {
		String s = request.getParameter(param);
		return s == null ? null : s.trim();
	}

	/**
	 * 获取页面double参数
	 */
	public static double getDoubleParam(HttpServletRequest request,
			String param, double defaultValue) {
		String s = request.getParameter(param);
		if (s == null)
			return defaultValue;
		try {
			return Double.parseDouble(s);
		}
		catch (Exception e) {
		}
		return defaultValue;
	}

	/**
	 * 获取页面double参数
	 */
	public static long getLongParam(HttpServletRequest request, String param,
			long defaultValue) {
		String s = request.getParameter(param);
		if (s == null)
			return defaultValue;
		try {
			return Long.parseLong(s);
		}
		catch (Exception e) {
		}
		return defaultValue;
	}

	/**
	 * 获取页面int参数
	 */
	public static int getIntParam(HttpServletRequest request, String param,
			int defaultValue) {
		String s = request.getParameter(param);
		if (s == null)
			return defaultValue;
		try {
			return Integer.parseInt(s);
		}
		catch (Exception e) {
		}
		return defaultValue;
	}

	/**
	 * 获取页面Date参数
	 * 
	 * @param request
	 * @param param
	 * @param pattern
	 * @return
	 */
	public static Date getDateParam(HttpServletRequest request, String param,
			String pattern) {
		String s = request.getParameter(param);
		if (s != null) {
			try {
				return new SimpleDateFormat(pattern).parse(s);
			}
			catch (Exception e) {
			}
		}
		return null;
	}

	public static String[] getArrayParam(HttpServletRequest request,
			String param) {
		String[] s = request.getParameterValues(param);
		return (s == null) ? new String[0] : s;
	}
	
	public static Map<String, String> getParamsMapForKey(HttpServletRequest request,
			String[] queryKeys){
		Map<String, String> paramsMap = new HashMap<String, String>();
		for (int i = 0; i < queryKeys.length; i++) {
			String key = queryKeys[i];
			String value = request.getParameter(key);
			if(value!=null&&value.trim().length()>0)
				paramsMap.put(key,value.trim());
		}
		return paramsMap;
	}
	
	public static Map<String,String> getParamsMap(HttpServletRequest request){
		return getParamsMap(request,null);	
	}
	public static Map<String,Object> getParamsMapObj(HttpServletRequest request){
		return getParamsMapObj(request,null);	
	}
	public static Map<String,Object> getParamsMapObj(HttpServletRequest request,String charset){
		Map<String,Object> paramsMap = new HashMap();
		Map requestMap = request.getParameterMap();
		Set<String> keys = requestMap.keySet();
		for (Iterator key = keys.iterator(); key.hasNext();) {
			String paramName = (String) key.next();
			Object[] value = (Object[])requestMap.get(paramName);
			if(value.length>0){
				String pvalue = value[0].toString().trim();
				if(charset!=null){
					try {
						pvalue = URLDecoder.decode(pvalue,charset);
					} catch (UnsupportedEncodingException e) {
					}
				}	
				paramsMap.put(paramName, pvalue);
			}
		}
		return paramsMap;	
	}
	public static Map<String,String> getParamsMap(HttpServletRequest request,String charset){
		Map<String,String> paramsMap = new HashMap();
		Map requestMap = request.getParameterMap();
		Set<String> keys = requestMap.keySet();
		for (Iterator key = keys.iterator(); key.hasNext();) {
			String paramName = (String) key.next();
			Object[] value = (Object[])requestMap.get(paramName);
			if(value.length>0){
				String pvalue = value[0].toString().trim();
				if(charset!=null){
					try {
						pvalue = URLDecoder.decode(pvalue,charset);
					} catch (UnsupportedEncodingException e) {
					}
				}	
				paramsMap.put(paramName, pvalue);
			}
		}
		return paramsMap;	
	}
    public static String getfileName(String fileName,String userAgent ){
    	String finalFileName = null;
    	try {
            
            if(StringUtils.contains(userAgent, "MSIE")){//IE浏览器
                finalFileName = URLEncoder.encode(fileName,"UTF8");
            }else if(StringUtils.contains(userAgent, "Mozilla")){//google,火狐浏览器
                finalFileName = new String(fileName.getBytes(), "ISO8859-1");
            }else{
                finalFileName = URLEncoder.encode(fileName,"UTF8");//其他浏览器
            }
           // response.setHeader("Content-Disposition", "attachment; filename=\"" + finalFileName + "\"");//这里设置一下让浏览器弹出下载提示框，而不是直接在浏览器中打开
        } catch (UnsupportedEncodingException e) {
        }
    	
    	return finalFileName;
    }
}
