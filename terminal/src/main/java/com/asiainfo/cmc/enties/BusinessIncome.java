package com.asiainfo.cmc.enties;

public class BusinessIncome {
    private Integer id;

    private String cwbbyysr;

    private String hlwsr;

    private String sjdbsr;

    private String hlwsjdbsr;

    private String bywcqk;

    private String bywcqktz;

    private String qnwcsr;

    private String qnwcd;

    private String mbz;

    private String bysrwcl;

    private String sjwcd;

    private String fz;

    private String month;


    public BusinessIncome(Integer id, String cwbbyysr, String hlwsr, String sjdbsr, String hlwsjdbsr, String bywcqk, String bywcqktz, String qnwcsr, String qnwcd, String mbz, String bysrwcl, String sjwcd, String fz, String month) {
        this.id = id;
        this.cwbbyysr = cwbbyysr;
        this.hlwsr = hlwsr;
        this.sjdbsr = sjdbsr;
        this.hlwsjdbsr = hlwsjdbsr;
        this.bywcqk = bywcqk;
        this.bywcqktz = bywcqktz;
        this.qnwcsr = qnwcsr;
        this.qnwcd = qnwcd;
        this.mbz = mbz;
        this.bysrwcl = bysrwcl;
        this.sjwcd = sjwcd;
        this.fz = fz;
        this.month = month;
    }

    public BusinessIncome() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCwbbyysr() {
        return cwbbyysr;
    }

    public void setCwbbyysr(String cwbbyysr) {
        this.cwbbyysr = cwbbyysr;
    }

    public String getHlwsr() {
        return hlwsr;
    }

    public void setHlwsr(String hlwsr) {
        this.hlwsr = hlwsr;
    }

    public String getSjdbsr() {
        return sjdbsr;
    }

    public void setSjdbsr(String sjdbsr) {
        this.sjdbsr = sjdbsr;
    }

    public String getHlwsjdbsr() {
        return hlwsjdbsr;
    }

    public void setHlwsjdbsr(String hlwsjdbsr) {
        this.hlwsjdbsr = hlwsjdbsr;
    }

    public String getBywcqk() {
        return bywcqk;
    }

    public void setBywcqk(String bywcqk) {
        this.bywcqk = bywcqk;
    }

    public String getBywcqktz() {
        return bywcqktz;
    }

    public void setBywcqktz(String bywcqktz) {
        this.bywcqktz = bywcqktz;
    }

    public String getQnwcsr() {
        return qnwcsr;
    }

    public void setQnwcsr(String qnwcsr) {
        this.qnwcsr = qnwcsr;
    }

    public String getQnwcd() {
        return qnwcd;
    }

    public void setQnwcd(String qnwcd) {
        this.qnwcd = qnwcd;
    }

    public String getMbz() {
        return mbz;
    }

    public void setMbz(String mbz) {
        this.mbz = mbz;
    }

    public String getBysrwcl() {
        return bysrwcl;
    }

    public void setBysrwcl(String bysrwcl) {
        this.bysrwcl = bysrwcl;
    }

    public String getSjwcd() {
        return sjwcd;
    }

    public void setSjwcd(String sjwcd) {
        this.sjwcd = sjwcd;
    }

    public String getFz() {
        return fz;
    }

    public void setFz(String fz) {
        this.fz = fz;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }
}