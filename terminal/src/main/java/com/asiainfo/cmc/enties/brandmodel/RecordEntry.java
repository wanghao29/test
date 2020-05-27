package com.asiainfo.cmc.enties.brandmodel;
/**
 * 保存操盘记录的实体类
 * @author Administrator
 *表名 recor_set_user
 */

public class RecordEntry {
	  
private int userId;//用户id	
	
private String brand;//品牌

private String spec;//型号

private String brandKind;//品牌种类

private String timeKind;//时间种类

private String brandCompation;//竞品品牌

private String specCompation;//竞品型号

private String  brandContrast;//对标品品牌

private String specContrast;//对标品型号

private String startTime;//开始时间

private String  contrastKind;//对比类型

private String endTime;//结束时间

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}

public String getBrand() {
	return brand;
}

public void setBrand(String brand) {
	this.brand = brand;
}

public String getSpec() {
	return spec;
}

public void setSpec(String spec) {
	this.spec = spec;
}

public String getBrandKind() {
	return brandKind;
}

public void setBrandKind(String brandKind) {
	this.brandKind = brandKind;
}

public String getTimeKind() {
	return timeKind;
}

public void setTimeKind(String timeKind) {
	this.timeKind = timeKind;
}

public String getBrandCompation() {
	return brandCompation;
}

public void setBrandCompation(String brandCompation) {
	this.brandCompation = brandCompation;
}

public String getSpecCompation() {
	return specCompation;
}

public void setSpecCompation(String specCompation) {
	this.specCompation = specCompation;
}

public String getBrandContrast() {
	return brandContrast;
}

public void setBrandContrast(String brandContrast) {
	this.brandContrast = brandContrast;
}

public String getSpecContrast() {
	return specContrast;
}

public void setSpecContrast(String specContrast) {
	this.specContrast = specContrast;
}

public String getStartTime() {
	return startTime;
}

public void setStartTime(String startTime) {
	this.startTime = startTime;
}

public String getContrastKind() {
	return contrastKind;
}

public void setContrastKind(String contrastKind) {
	this.contrastKind = contrastKind;
}

public String getEndTime() {
	return endTime;
}

public void setEndTime(String endTime) {
	this.endTime = endTime;
}


	
	
	
	
	
	
	
	
	
	
}
