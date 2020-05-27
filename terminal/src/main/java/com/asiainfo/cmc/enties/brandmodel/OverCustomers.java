package com.asiainfo.cmc.enties.brandmodel;

import java.util.List;

public class OverCustomers {
private String BRANDNAME;//品牌
	
	private String SPEC;     //型号
	
	private String DODATE;   //处理日期YYYY-MM-DD
	
	private String AREANAME; //地市
	
	private String ORGACODE; //客户ctms组织编码
	
	private int cnt;       //数量
	
	private List<String> months;
	
	private Integer month;
 
	private String startMonth;
	
	private String endMonth;

	public String getBRANDNAME() {
		return BRANDNAME;
	}

	public void setBRANDNAME(String bRANDNAME) {
		BRANDNAME = bRANDNAME;
	}

	public String getSPEC() {
		return SPEC;
	}

	public void setSPEC(String sPEC) {
		SPEC = sPEC;
	}

	public String getDODATE() {
		return DODATE;
	}

	public void setDODATE(String dODATE) {
		DODATE = dODATE;
	}

	public String getAREANAME() {
		return AREANAME;
	}

	public void setAREANAME(String aREANAME) {
		AREANAME = aREANAME;
	}

	public String getORGACODE() {
		return ORGACODE;
	}

	public void setORGACODE(String oRGACODE) {
		ORGACODE = oRGACODE;
	}





	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public List<String> getMonths() {
		return months;
	}

	public void setMonths(List<String> months) {
		this.months = months;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public String getStartMonth() {
		return startMonth;
	}

	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}

	public String getEndMonth() {
		return endMonth;
	}

	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}
}
