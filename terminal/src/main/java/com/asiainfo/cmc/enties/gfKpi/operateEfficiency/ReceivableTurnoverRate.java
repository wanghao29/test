package com.asiainfo.cmc.enties.gfKpi.operateEfficiency;

import java.math.BigDecimal;

/*应收账款周转率*/
public class ReceivableTurnoverRate {
	   private String billcyc;
	   
	   private BigDecimal yysr;//运营收入
	   
	   private BigDecimal sjdb;//省间调拨
	   private BigDecimal yysrkhsr;//运营收入（只剔除省间调拨）
	   private BigDecimal yszkjz;//应收帐款净值
	   private BigDecimal byyskzzl;//本月应收款周转率
	   private BigDecimal ndyskzzl;//年度应收款周转率
	   private BigDecimal mbz;//目标值
	   private BigDecimal df;// 
	   private BigDecimal nddf;// 年度得分
	public String getBillcyc() {
		return billcyc;
	}
	public void setBillcyc(String billcyc) {
		this.billcyc = billcyc;
	}
	public BigDecimal getYysr() {
		return yysr;
	}
	public void setYysr(BigDecimal yysr) {
		this.yysr = yysr;
	}
	public BigDecimal getSjdb() {
		return sjdb;
	}
	public void setSjdb(BigDecimal sjdb) {
		this.sjdb = sjdb;
	}
	public BigDecimal getYysrkhsr() {
		return yysrkhsr;
	}
	public void setYysrkhsr(BigDecimal yysrkhsr) {
		this.yysrkhsr = yysrkhsr;
	}
	public BigDecimal getYszkjz() {
		return yszkjz;
	}
	public void setYszkjz(BigDecimal yszkjz) {
		this.yszkjz = yszkjz;
	}
	public BigDecimal getByyskzzl() {
		return byyskzzl;
	}
	public void setByyskzzl(BigDecimal byyskzzl) {
		this.byyskzzl = byyskzzl;
	}
	public BigDecimal getNdyskzzl() {
		return ndyskzzl;
	}
	public void setNdyskzzl(BigDecimal ndyskzzl) {
		this.ndyskzzl = ndyskzzl;
	}
	public BigDecimal getMbz() {
		return mbz;
	}
	public void setMbz(BigDecimal mbz) {
		this.mbz = mbz;
	}
	public BigDecimal getDf() {
		return df;
	}
	public void setDf(BigDecimal df) {
		this.df = df;
	}
	public BigDecimal getNddf() {
		return nddf;
	}
	public void setNddf(BigDecimal nddf) {
		this.nddf = nddf;
	}
	   
}
