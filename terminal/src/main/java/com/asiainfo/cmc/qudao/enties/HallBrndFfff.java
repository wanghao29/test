package com.asiainfo.cmc.qudao.enties;

import java.io.Serializable;

/**
 * 主要品牌厅店维度覆盖程度统计表
 */
public class HallBrndFfff  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String termBrndNam;  //终端品牌名称
	private String cityNam;      //地市名称
	private String hallCnt;     //厅店数量
	private String ttttTyp;      //基站类型2-覆盖程度 t1 、 t2、  t3 、 t4、   t5、  t6
	private String num;          //量
	private String rete01;       //高覆盖基站  占比
	private String rete02;       //高覆盖基站覆盖客户数占比
	private String rete03;       //中高覆盖基站  占比
	private String rete04;       //中高覆盖基站覆盖客户数占比
	private String rete05;       //中覆盖基站  占比
	private String rete06;       //中覆盖基站覆盖客户数占比
	private String rete07;       //中低覆盖基站  占比
	private String rete08;       //中低覆盖基站覆盖客户数占比
	private String rete09;       //低覆盖基站  占比
	private String rete10;       //低覆盖基站覆盖客户数占比
	private String rete11;       //超低覆盖基站  占比
	private String rete12;       //超低覆盖基站覆盖客户数占比
	private String rete13;       //零覆盖基站  占比
	private String rete14;       //零覆盖基站覆盖客户数占比
	private Integer month;
	private Integer type;        //1新增、0存量
	
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
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getRete01() {
		return rete01;
	}
	public void setRete01(String rete01) {
		this.rete01 = rete01;
	}
	public String getRete02() {
		return rete02;
	}
	public void setRete02(String rete02) {
		this.rete02 = rete02;
	}
	public String getRete03() {
		return rete03;
	}
	public void setRete03(String rete03) {
		this.rete03 = rete03;
	}
	public String getRete04() {
		return rete04;
	}
	public void setRete04(String rete04) {
		this.rete04 = rete04;
	}
	public String getRete05() {
		return rete05;
	}
	public void setRete05(String rete05) {
		this.rete05 = rete05;
	}
	public String getRete06() {
		return rete06;
	}
	public void setRete06(String rete06) {
		this.rete06 = rete06;
	}
	public String getRete07() {
		return rete07;
	}
	public void setRete07(String rete07) {
		this.rete07 = rete07;
	}
	public String getRete08() {
		return rete08;
	}
	public void setRete08(String rete08) {
		this.rete08 = rete08;
	}
	public String getRete09() {
		return rete09;
	}
	public void setRete09(String rete09) {
		this.rete09 = rete09;
	}
	public String getRete10() {
		return rete10;
	}
	public void setRete10(String rete10) {
		this.rete10 = rete10;
	}
	public String getRete11() {
		return rete11;
	}
	public void setRete11(String rete11) {
		this.rete11 = rete11;
	}
	public String getRete12() {
		return rete12;
	}
	public void setRete12(String rete12) {
		this.rete12 = rete12;
	}
	public String getRete13() {
		return rete13;
	}
	public void setRete13(String rete13) {
		this.rete13 = rete13;
	}
	public String getRete14() {
		return rete14;
	}
	public void setRete14(String rete14) {
		this.rete14 = rete14;
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
	public String getHallCnt() {
		return hallCnt;
	}
	public void setHallCnt(String hallCnt) {
		this.hallCnt = hallCnt;
	}
	
}
