package com.asiainfo.cmc.enties;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

 
public class SalesShare4G {
    private Integer id;

    private String khjx;

    private String dyzb;

    private String syzb;

    private String jcdf;

    private String jf;

    private String gydf;

    private String df;

    private String month;

    public SalesShare4G(Integer id, String khjx, String dyzb, String syzb, String jcdf, String jf, String gydf, String df, String month) {
        this.id = id;
        this.khjx = khjx;
        this.dyzb = dyzb;
        this.syzb = syzb;
        this.jcdf = jcdf;
        this.jf = jf;
        this.gydf = gydf;
        this.df = df;
        this.month = month;
    }

    public SalesShare4G() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKhjx() {
        return khjx;
    }

    public void setKhjx(String khjx) {
        this.khjx = khjx == null ? null : khjx.trim();
    }

    public String getDyzb() {
        return dyzb;
    }

    public void setDyzb(String dyzb) {
        this.dyzb = dyzb;
    }

    public String getSyzb() {
        return syzb;
    }

    public void setSyzb(String syzb) {
        this.syzb = syzb;
    }

    public String getJcdf() {
        return jcdf;
    }

    public void setJcdf(String jcdf) {
        this.jcdf = jcdf;
    }

    public String getJf() {
        return jf;
    }

    public void setJf(String jf) {
        this.jf = jf;
    }

    public String getGydf() {
        return gydf;
    }

    public void setGydf(String gydf) {
        this.gydf = gydf;
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