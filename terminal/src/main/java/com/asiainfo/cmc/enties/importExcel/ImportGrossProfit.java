package com.asiainfo.cmc.enties.importExcel;

/**
 * 毛利额--手工导入
 * @author yuxuandong
 *
 */
public class ImportGrossProfit {
	private String month;
	
	private String city;
	
	private String brand;
	
	private String value;

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public ImportGrossProfit(String month, String city, String brand, String value) {
		super();
		this.month = month;
		this.city = city;
		this.brand = brand;
		this.value = value;
	}

	public ImportGrossProfit() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
