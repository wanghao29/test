package com.asiainfo.cmc.enties;

public class TerminalSaleShare {
    private Integer id;

    private String wsso;

    private String jhl;

    private String tzxl;

    private String xlzb;

    private String df;

    private String month;

    public TerminalSaleShare(Integer id, String wsso, String jhl, String tzxl, String xlzb, String df, String month) {
        this.id = id;
        this.wsso = wsso;
        this.jhl = jhl;
        this.tzxl = tzxl;
        this.xlzb = xlzb;
        this.df = df;
        this.month = month;
    }

    public TerminalSaleShare() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWsso() {
        return wsso;
    }

    public void setWsso(String wsso) {
        this.wsso = wsso;
    }

    public String getJhl() {
        return jhl;
    }

    public void setJhl(String jhl) {
        this.jhl = jhl;
    }

    public String getTzxl() {
        return tzxl;
    }

    public void setTzxl(String tzxl) {
        this.tzxl = tzxl;
    }

    public String getXlzb() {
        return xlzb;
    }

    public void setXlzb(String xlzb) {
        this.xlzb = xlzb;
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