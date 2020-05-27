package com.asiainfo.cmc.enties.brandmodel;

/**
 * 8字结果地市表  ZD_RESULT_8AREA_D   HCODE 厅店编号
 * 关联的厅店名称表   ZD_CTMS_HALL  外键  ORGACODE 厅店编号
 * @author yuxuandong
 *
 */
public class ZdResult8AreaD {

	private String month;//月份
	private String areaname;//地市
	private String subname;//厅店属性
	private String subtype;//
	private float value;//结果
	private String tfullname;//厅店名称
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getAreaname() {
		return areaname;
	}
	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getSubtype() {
		return subtype;
	}
	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}
	public float getValue() {
		return value;
	}
	public void setValue(float value) {
		this.value = value;
	}
	public String getTfullname() {
		return tfullname;
	}
	public void setTfullname(String tfullname) {
		this.tfullname = tfullname;
	}
	
}
