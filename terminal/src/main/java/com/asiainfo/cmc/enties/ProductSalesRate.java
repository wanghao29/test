package com.asiainfo.cmc.enties;

public class ProductSalesRate {
    private Integer id;

    private String khxl;

    private String zdcp;

    private String mbz;

    private String wcl;

    private String fz;

    private String month;

    public ProductSalesRate(Integer id, String khxl, String zdcp, String mbz, String wcl, String fz, String month) {
        this.id = id;
        this.khxl = khxl;
        this.zdcp = zdcp;
        this.mbz = mbz;
        this.wcl = wcl;
        this.fz = fz;
        this.month = month;
    }

    public ProductSalesRate() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKhxl() {
        return khxl;
    }

    public void setKhxl(String khxl) {
        this.khxl = khxl;
    }

    public String getZdcp() {
        return zdcp;
    }

    public void setZdcp(String zdcp) {
        this.zdcp = zdcp == null ? null : zdcp.trim();
    }

    public String getMbz() {
        return mbz;
    }

    public void setMbz(String mbz) {
        this.mbz = mbz;
    }

    public String getWcl() {
        return wcl;
    }

    public void setWcl(String wcl) {
        this.wcl = wcl;
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