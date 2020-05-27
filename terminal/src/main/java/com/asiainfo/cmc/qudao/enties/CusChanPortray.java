package com.asiainfo.cmc.qudao.enties;

import java.io.Serializable;

public class CusChanPortray implements Serializable {

	private static final long serialVersionUID = -5408721828352887928L;
	
	private Integer id;
	private String name;      //字段名
	private String cnName;    //字段中文名
	private String type;     //字段类型：1基础特性、2流量特性、3流速特性、4流向特性、5品牌偏好、6厂家信息   0未使用        
	private Integer showType; //展示类型：0未使用的字段(不展示)、1固定值字段、2曲线图、3环形图、4柱状图、  5多值饼图、 6Top图  44堆叠柱状图
	private String detail;
	private String value1;  //键。图形中需展示多个值时，多个值逗号隔开。如环形图的占比条目，曲线图的各个月份
	public String getValue1() {
		return value1;
	}
	public void setValue1(String value1) {
		this.value1 = value1;
	}
	private String value;     //值。图形中需展示多个值时，多个值逗号隔开。如环形图的占比值，曲线图的各个月份的值
	private String tableName; //表名	
	private Integer choice;   //标识，供页面是否默认选中：画像展示默认选中为1,列表查询默认选中为2,同时选中为3
	private String business;  //业务
	private String unit;      //单位
	private String tip;      //单位
	

	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public void setChoice(Integer choice) {
		this.choice = choice;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCnName() {
		return cnName;
	}
	public void setCnName(String cnName) {
		this.cnName = cnName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getShowType() {
		return showType;
	}
	public void setShowType(Integer showType) {
		this.showType = showType;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public Integer getId() {
		return id;
	}
	public Integer getChoice() {
		return choice;
	}
	public String getUnit() {
		return unit;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
}
