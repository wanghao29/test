/**
 * Copyright (C) 2018 Long Inc., All Rights Reserved.
 */
package com.asiainfo.cmc.common;

/**
 * @TODO
 * @author Long
 * @date 2018年9月20日上午10:59:00
 */
public class CommonResponse {
	
	public static final int CODE_SUCCESS = 0;
	public static final int CODE_FAILURE = 1;
	
	public static final String MSG_SUCCESS = "成功";
	public static final String MSG_FAILURE = "失败";

	private int code;
	
	private String msg;
	
	public CommonResponse(int code, String msg){
		this.code = code;
		this.msg = msg;
	}
	
	public static CommonResponse getSuccessRes(){
		return new CommonResponse(CommonResponse.CODE_SUCCESS, CommonResponse.MSG_SUCCESS);
	}
	
	public static CommonResponse getFailureRes(){
		return new CommonResponse(CommonResponse.CODE_FAILURE, CommonResponse.MSG_FAILURE);
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
