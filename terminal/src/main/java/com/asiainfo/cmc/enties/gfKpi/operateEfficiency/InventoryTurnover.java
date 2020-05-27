package com.asiainfo.cmc.enties.gfKpi.operateEfficiency;

import java.math.BigDecimal;

public class InventoryTurnover {
	   private String billcyc;
	   
	   private BigDecimal zjywcb;//直接业务成本
	   
	   private BigDecimal hlwcb;//互联网成本
	   private BigDecimal sjdbcb;//省间调拨成本
	   private BigDecimal hlwsjdbcb;//互联网省间调拨成本
	   private BigDecimal gfkhzjywcb;//广分考核直接业务成本
	   private BigDecimal chjz;//存货净值
	   private BigDecimal hlwchjz;//互联网存货净值
	   private BigDecimal gfkhchjz;//广分考核存货净值
	   private BigDecimal chzzl;//存货周转率
	   private BigDecimal mbcs;//目标次数
	   private BigDecimal df; //得分
	public String getBillcyc() {
		return billcyc;
	}
	public void setBillcyc(String billcyc) {
		this.billcyc = billcyc;
	}
	public BigDecimal getZjywcb() {
		return zjywcb;
	}
	public void setZjywcb(BigDecimal zjywcb) {
		this.zjywcb = zjywcb;
	}
	public BigDecimal getHlwcb() {
		return hlwcb;
	}
	public void setHlwcb(BigDecimal hlwcb) {
		this.hlwcb = hlwcb;
	}
	public BigDecimal getSjdbcb() {
		return sjdbcb;
	}
	public void setSjdbcb(BigDecimal sjdbcb) {
		this.sjdbcb = sjdbcb;
	}
	public BigDecimal getHlwsjdbcb() {
		return hlwsjdbcb;
	}
	public void setHlwsjdbcb(BigDecimal hlwsjdbcb) {
		this.hlwsjdbcb = hlwsjdbcb;
	}
	public BigDecimal getGfkhzjywcb() {
		return gfkhzjywcb;
	}
	public void setGfkhzjywcb(BigDecimal gfkhzjywcb) {
		this.gfkhzjywcb = gfkhzjywcb;
	}
	public BigDecimal getChjz() {
		return chjz;
	}
	public void setChjz(BigDecimal chjz) {
		this.chjz = chjz;
	}
	public BigDecimal getHlwchjz() {
		return hlwchjz;
	}
	public void setHlwchjz(BigDecimal hlwchjz) {
		this.hlwchjz = hlwchjz;
	}
	public BigDecimal getGfkhchjz() {
		return gfkhchjz;
	}
	public void setGfkhchjz(BigDecimal gfkhchjz) {
		this.gfkhchjz = gfkhchjz;
	}
	public BigDecimal getChzzl() {
		return chzzl;
	}
	public void setChzzl(BigDecimal chzzl) {
		this.chzzl = chzzl;
	}
	public BigDecimal getMbcs() {
		return mbcs;
	}
	public void setMbcs(BigDecimal mbcs) {
		this.mbcs = mbcs;
	}
	public BigDecimal getDf() {
		return df;
	}
	public void setDf(BigDecimal df) {
		this.df = df;
	}
	   
	   
}
