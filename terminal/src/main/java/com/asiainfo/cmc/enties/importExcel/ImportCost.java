package com.asiainfo.cmc.enties.importExcel;

/**
 * 导入酬金信息
 * @author yuxuandong
 *
 */
public class ImportCost {

	private String type8; //8字类型
	
	private String month;//月份
	
	private String dimension;//维度  ：净利
	
	private String kpiName;//维度一：五大战区
	
	private String AREANAME;//地市
	
	private String commission;//酬金
	
	private String cost;//费用

	public String getType8() {
		return type8;
	}

	public void setType8(String type8) {
		this.type8 = type8;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDimension() {
		return dimension;
	}

	public void setDimension(String dimension) {
		this.dimension = dimension;
	}

	public String getKpiName() {
		return kpiName;
	}

	public void setKpiName(String kpiName) {
		this.kpiName = kpiName;
	}

	public String getAREANAME() {
		return AREANAME;
	}

	public void setAREANAME(String aREANAME) {
		AREANAME = aREANAME;
	}

	public String getCommission() {
		return commission;
	}

	public void setCommission(String commission) {
		this.commission = commission;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public ImportCost(String type8, String month, String dimension, String kpiName, String aREANAME, String commission,
			String cost) {
		super();
		this.type8 = type8;
		this.month = month;
		this.dimension = dimension;
		this.kpiName = kpiName;
		AREANAME = aREANAME;
		this.commission = commission;
		this.cost = cost;
	}

	public ImportCost() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
