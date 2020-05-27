package com.asiainfo.cmc.aopLog;

import java.io.Serializable;
import java.sql.Timestamp;

public class Log  implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer seq; // 
	private String roleName;//角色名
	private String userName; //用户名
	private String userId; //用户id
	private String method; //方法
	private String module; //模块
	private String moduleMenu; //模块菜单
	private String moduleMenuKpi; //模块菜单指标
	private String ip; //请求ip
	private String description;//操作描述
	private String params; //请求参数
	private Timestamp beginTime; //执行开始时间
	private Timestamp endTime;//执行结束时间
	private String loginOutTime;//执行结束时间
	
	
	private String exceptionCode;//异常代码
	private String exceptionDetail;//异常详情
	private String type;//执行操作类型//query 查询 update更新 delete 删除 add增加
	private String city;//用户所属地市
	private String billcyc;//操作账期
	private String business;//业务
	private String step;//代码执行步骤
	private String loginTime;
	private String sessionId;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
 
 
	public Timestamp getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Timestamp beginTime) {
		this.beginTime = beginTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getExceptionCode() {
		return exceptionCode;
	}
	public void setExceptionCode(String exceptionCode) {
		this.exceptionCode = exceptionCode;
	}
	public String getExceptionDetail() {
		return exceptionDetail;
	}
	public void setExceptionDetail(String exceptionDetail) {
		this.exceptionDetail = exceptionDetail;
	}
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
 
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getBillcyc() {
		return billcyc;
	}
	public void setBillcyc(String billcyc) {
		this.billcyc = billcyc;
	}
	public String getModuleMenu() {
		return moduleMenu;
	}
	public void setModuleMenu(String moduleMenu) {
		this.moduleMenu = moduleMenu;
	}
	public String getModuleMenuKpi() {
		return moduleMenuKpi;
	}
	public void setModuleMenuKpi(String moduleMenuKpi) {
		this.moduleMenuKpi = moduleMenuKpi;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getLoginOutTime() {
		return loginOutTime;
	}
	public void setLoginOutTime(String loginOutTime) {
		this.loginOutTime = loginOutTime;
	}
 

	
	 
}
