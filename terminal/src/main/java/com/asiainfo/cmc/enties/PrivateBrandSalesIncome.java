package com.asiainfo.cmc.enties;

public class PrivateBrandSalesIncome {
    private Integer id;

    private Float sr;

    private Float srtz;

    private Float qnwcsr;

    private Float mbz;

    private Float sjwcd;

    private Float qnwcd;

    private Float bysrwcl;

    private Float fz;

    private String month;

    public PrivateBrandSalesIncome(Integer id, Float sr, Float srtz, Float qnwcsr, Float mbz, Float sjwcd, Float qnwcd, Float bysrwcl, Float fz, String month) {
        this.id = id;
        this.sr = sr;
        this.srtz = srtz;
        this.qnwcsr = qnwcsr;
        this.mbz = mbz;
        this.sjwcd = sjwcd;
        this.qnwcd = qnwcd;
        this.bysrwcl = bysrwcl;
        this.fz = fz;
        this.month = month;
    }

    public PrivateBrandSalesIncome() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Float getSr() {
        return sr;
    }

    public void setSr(Float sr) {
        this.sr = sr;
    }

    public Float getSrtz() {
        return srtz;
    }

    public void setSrtz(Float srtz) {
        this.srtz = srtz;
    }

    public Float getQnwcsr() {
        return qnwcsr;
    }

    public void setQnwcsr(Float qnwcsr) {
        this.qnwcsr = qnwcsr;
    }

    public Float getMbz() {
        return mbz;
    }

    public void setMbz(Float mbz) {
        this.mbz = mbz;
    }

    public Float getSjwcd() {
        return sjwcd;
    }

    public void setSjwcd(Float sjwcd) {
        this.sjwcd = sjwcd;
    }

    public Float getQnwcd() {
        return qnwcd;
    }

    public void setQnwcd(Float qnwcd) {
        this.qnwcd = qnwcd;
    }

    public Float getBysrwcl() {
        return bysrwcl;
    }

    public void setBysrwcl(Float bysrwcl) {
        this.bysrwcl = bysrwcl;
    }

    public Float getFz() {
        return fz;
    }

    public void setFz(Float fz) {
        this.fz = fz;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }
}