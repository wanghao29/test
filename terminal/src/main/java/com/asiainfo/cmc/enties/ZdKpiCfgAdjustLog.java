package com.asiainfo.cmc.enties;
/**
 * ZD_KPI_CFG_ADJUST_LOG 调整日志表
 * @author yuxuandong
 *
 */
public class ZdKpiCfgAdjustLog {

	private int  id; 
	private String month;//账期	
	private String kpiID;//KPIID 	指标id
	private String kpiName;//KPINAME	指标名称
	private String fieldID;//FIELDID	字段id
	private String fieldName;//FIELDNAME	字段名称
	private String tzq;//TZQ	调整前值	
	private String tzz;//TZZ	调整值
	private String tzh;//TZH	调整后值
	private String tz_time;//TZ_TIME	调整时间
	private String userID;//USERID	账号id
	private String userName;//USERNAME	调整人名称
	private String bz;//BZ		备注
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getKpiID() {
		return kpiID;
	}
	public void setKpiID(String kpiID) {
		this.kpiID = kpiID;
	}
	public String getKpiName() {
		return kpiName;
	}
	public void setKpiName(String kpiName) {
		this.kpiName = kpiName;
	}
	public String getFieldID() {
		return fieldID;
	}
	public void setFieldID(String fieldID) {
		this.fieldID = fieldID;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getTzq() {
		return tzq;
	}
	public void setTzq(String tzq) {
		this.tzq = tzq;
	}
	public String getTzz() {
		return tzz;
	}
	public void setTzz(String tzz) {
		this.tzz = tzz;
	}
	public String getTzh() {
		return tzh;
	}
	public void setTzh(String tzh) {
		this.tzh = tzh;
	}
	public String getTz_time() {
		return tz_time;
	}
	public void setTz_time(String tz_time) {
		this.tz_time = tz_time;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public ZdKpiCfgAdjustLog(int id, String month, String kpiID, String kpiName, String fieldID, String fieldName,
			String tzq, String tzz, String tzh, String tz_time, String userID, String userName, String bz) {
		super();
		this.id = id;
		this.month = month;
		this.kpiID = kpiID;
		this.kpiName = kpiName;
		this.fieldID = fieldID;
		this.fieldName = fieldName;
		this.tzq = tzq;
		this.tzz = tzz;
		this.tzh = tzh;
		this.tz_time = tz_time;
		this.userID = userID;
		this.userName = userName;
		this.bz = bz;
	}
	public ZdKpiCfgAdjustLog() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
