package com.asiainfo.cmc.enties;

public class AccountReceivableTurnoverRatio {
    private Integer id;

    private String yysr;

    private String sgtzxm;

    private String sjdb;

    private String yszkkhsr;

    private String yszkjz;

    private String byyskzzl;

    private String ndyskzzl;

    private String mbz;

    private String df;

    private String month;

    public AccountReceivableTurnoverRatio(Integer id, String yysr, String sgtzxm, String sjdb, String yszkkhsr, String yszkjz, String byyskzzl, String ndyskzzl, String mbz, String df, String month) {
        this.id = id;
        this.yysr = yysr;
        this.sgtzxm = sgtzxm;
        this.sjdb = sjdb;
        this.yszkkhsr = yszkkhsr;
        this.yszkjz = yszkjz;
        this.byyskzzl = byyskzzl;
        this.ndyskzzl = ndyskzzl;
        this.mbz = mbz;
        this.df = df;
        this.month = month;
    }

    public AccountReceivableTurnoverRatio() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYysr() {
        return yysr;
    }

    public void setYysr(String yysr) {
        this.yysr = yysr;
    }

    public String getSgtzxm() {
        return sgtzxm;
    }

    public void setSgtzxm(String sgtzxm) {
        this.sgtzxm = sgtzxm;
    }

    public String getSjdb() {
        return sjdb;
    }

    public void setSjdb(String sjdb) {
        this.sjdb = sjdb;
    }

    public String getYszkkhsr() {
        return yszkkhsr;
    }

    public void setYszkkhsr(String yszkkhsr) {
        this.yszkkhsr = yszkkhsr;
    }

    public String getYszkjz() {
        return yszkjz;
    }

    public void setYszkjz(String yszkjz) {
        this.yszkjz = yszkjz;
    }

    public String getByyskzzl() {
        return byyskzzl;
    }

    public void setByyskzzl(String byyskzzl) {
        this.byyskzzl = byyskzzl;
    }

    public String getNdyskzzl() {
        return ndyskzzl;
    }

    public void setNdyskzzl(String ndyskzzl) {
        this.ndyskzzl = ndyskzzl;
    }

    public String getMbz() {
        return mbz;
    }

    public void setMbz(String mbz) {
        this.mbz = mbz;
    }

    public String getDf() {
        return df;
    }

    public void setDf(String df) {
        this.df = df;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }
}