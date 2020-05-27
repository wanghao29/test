package com.asiainfo.cmc.qudao.vo;

import java.util.List;

public class BrndCoverVo {
	private String startMonth;
    private String endMonth;
	private String termBrndNam;  //终端品牌名称
	private String cityNam;      //地市名称
	private String ttttTyp;      //基站类型2-覆盖程度 t1 、 t2、  t3 、 t4、   t5、  t6
	private String brndFfffTyp;  //基站类型2-覆盖程度 高覆盖、 中高覆盖、 中覆盖、 中低覆盖、 低覆盖、 零覆盖
	private Integer month;
	private Integer type;        //1新增、0存量
		
	private List<String> months;

	
		
	public String getTermBrndNam() {
		return termBrndNam;
	}
	public void setTermBrndNam(String termBrndNam) {
		this.termBrndNam = termBrndNam;
	}
	public String getCityNam() {
		return cityNam;
	}
	public void setCityNam(String cityNam) {
		this.cityNam = cityNam;
	}
	public String getTtttTyp() {
		return ttttTyp;
	}
	public void setTtttTyp(String ttttTyp) {
		this.ttttTyp = ttttTyp;
	}
	public String getBrndFfffTyp() {
		return brndFfffTyp;
	}
	public void setBrndFfffTyp(String brndFfffTyp) {
		this.brndFfffTyp = brndFfffTyp;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public List<String> getMonths() {
		return months;
	}
	public void setMonths(List<String> months) {
		this.months = months;
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
