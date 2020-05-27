package com.asiainfo.cmc.enties.consumerBigData;

/**
 * 终端-多维度信心-关于 num 的详情表
 * @author yuxuandong
 *ZD_MULT_idimensional_num_details
 */
public class ZdMultIdimensionalNumDetails {

	public Integer id;
	public String num;//与ZdMultIdimensional表的num对应关系
	public String key;
	public String value;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public ZdMultIdimensionalNumDetails(Integer id, String num, String key, String value) {
		super();
		this.id = id;
		this.num = num;
		this.key = key;
		this.value = value;
	}
	public ZdMultIdimensionalNumDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
