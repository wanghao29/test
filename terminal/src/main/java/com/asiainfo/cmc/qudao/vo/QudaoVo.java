package com.asiainfo.cmc.qudao.vo;

import java.util.List;

/**
 * 渠道基站月表、渠道厅店月表
 */
public class QudaoVo {
	
    private String statMonth;     // 月份
    private String termBrnd;      // 品牌
    private String termMdl;       // 型号
    private String a4gPlusInd;    //4g+:是、否
    private String cityNam;       // 厅店、基站地市cityCd、cityNam
    private String name;          // 厅店、基站名称hallNam、neNam
    private String longitude;     // 厅店、基站经度 hallLongitude、cellLongitude
    private String latitude;      // 厅店、基站纬度 hallLatitude、cellLatitude
    
    //select2
    private String id;
    private String text;
    //mybatis查询画像信息需要的参数
    private String field;
    private List<Integer> ids;
    private List<String> months;
    
	public String getStatMonth() {
		return statMonth;
	}
	public void setStatMonth(String statMonth) {
		this.statMonth = statMonth;
	}
	public String getTermBrnd() {
		return termBrnd;
	}
	public void setTermBrnd(String termBrnd) {
		this.termBrnd = termBrnd;
	}
	public String getTermMdl() {
		return termMdl;
	}
	public void setTermMdl(String termMdl) {
		this.termMdl = termMdl;
	}
	public String getCityNam() {
		return cityNam;
	}
	public void setCityNam(String cityNam) {
		this.cityNam = cityNam;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public List<String> getMonths() {
		return months;
	}
	public void setMonths(List<String> months) {
		this.months = months;
	}
	public String getA4gPlusInd() {
		return a4gPlusInd;
	}
	public void setA4gPlusInd(String a4gPlusInd) {
		this.a4gPlusInd = a4gPlusInd;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
		
}
