package com.asiainfo.cmc.common;

import java.util.HashMap;
import java.util.List;

import com.github.pagehelper.Page;



public final class ResultMap extends HashMap<String, Object> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1863541422467539L;
	public final static String RETURN_FLAG="retFlag";
	public final static String MSG="msg";
	
	public final static int SUCCESS_FLAG = 1;
	public final static int FAILURE_FLAG = 0;
	
	public static ResultMap defaultResultMap()
	{
		ResultMap result =new ResultMap();
		result.put(RETURN_FLAG, SUCCESS_FLAG);
		return result;
	}
	
	public void fails(String msg)
	{
		this.put(RETURN_FLAG, FAILURE_FLAG);
		this.put(MSG, msg);
	}
	
	public void setPageInfo(Page page)
	{
		//put(/*IPage.ROWS*/"",page == null ? null : page.getThisPageElements());
		put(/*IPage.PAGE_NO*/"pageNumber",page == null ? null : page.getStartRow());
		put(/*IPage.PAGE_SIZE*/"",page == null ? null : page.getPageSize());
		put(/*IPage.TOTAL*/"total",page == null ? 0 : page.getTotal());
		put(/*IPage.PAGE_COUNT*/"",page == null ? 0 : page.getTotal());
	}
	
	public void setData(List l){
		put(/*IPage.ROWS*/"rows",l);
	}

}
