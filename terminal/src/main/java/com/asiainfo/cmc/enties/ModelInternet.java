package com.asiainfo.cmc.enties;

/**
* @author WANGHAO
* @version 创建时间：2020年4月15日 上午11:33:22
* @ClassName 类名称  zd_result_internet_lsl
* @Description 类描述  主要用于互联网期初数据主页面数据的采集
*/

public class ModelInternet {
	
	private String stat_day;//统计日期
	
	private String startTime;//开始时间
	
	private String endTime;//结束时间
	
	private String type;//大类
	
	private String brand;//品牌
	
	private String spec;//机型
	
	private String memory;//配置
	
	private String color;//颜色
	
	private String clientname;//渠道
	
	private String saleamount;//销量
	
	private String saleincom;//收入
	
	private String saleprofit;//毛利

	public String getStat_day() {
		return stat_day;
	}

	public void setStat_day(String stat_day) {
		this.stat_day = stat_day;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getClientname() {
		return clientname;
	}

	public void setClientname(String clientname) {
		this.clientname = clientname;
	}

	public String getSaleamount() {
		return saleamount;
	}

	public void setSaleamount(String saleamount) {
		this.saleamount = saleamount;
	}

	public String getSaleincom() {
		return saleincom;
	}

	public void setSaleincom(String saleincom) {
		this.saleincom = saleincom;
	}

	public String getSaleprofit() {
		return saleprofit;
	}

	public void setSaleprofit(String saleprofit) {
		this.saleprofit = saleprofit;
	}

	public ModelInternet(String stat_day, String startTime, String endTime, String type, String brand, String spec,
			String memory, String color, String clientname, String saleamount, String saleincom, String saleprofit) {
		super();
		this.stat_day = stat_day;
		this.startTime = startTime;
		this.endTime = endTime;
		this.type = type;
		this.brand = brand;
		this.spec = spec;
		this.memory = memory;
		this.color = color;
		this.clientname = clientname;
		this.saleamount = saleamount;
		this.saleincom = saleincom;
		this.saleprofit = saleprofit;
	}

	public ModelInternet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	
}
