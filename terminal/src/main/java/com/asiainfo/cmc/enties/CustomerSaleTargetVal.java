package com.asiainfo.cmc.enties;

public class CustomerSaleTargetVal {
    private Integer id;

    private String kakhxlmbz;

    private String kakhdm;
    private String kakhdmdesc;

    private String kakhxs;

    private String kakhxslj;

    private String mbz;

    private String wcqkzb;

    private String df;

    private String sjjd;

    private String month;

    public CustomerSaleTargetVal(Integer id, String kakhxlmbz, String kakhdm, String kakhdmdesc,  String kakhxs, String kakhxslj, String mbz, String wcqkzb, String df, String sjjd, String month) {
        this.id = id;
        this.kakhxlmbz = kakhxlmbz;
        this.kakhdm = kakhdm;
        this.kakhdmdesc = kakhdmdesc;
        
        this.kakhxs = kakhxs;
        this.kakhxslj = kakhxslj;
        this.mbz = mbz;
        this.wcqkzb = wcqkzb;
        this.df = df;
        this.sjjd = sjjd;
        this.month = month;
    }

    public CustomerSaleTargetVal() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKakhxlmbz() {
        return kakhxlmbz;
    }

    public String getKakhdmdesc() {
		return kakhdmdesc;
	}

	public void setKakhdmdesc(String kakhdmdesc) {
		this.kakhdmdesc = kakhdmdesc;
	}

	public void setKakhxlmbz(String kakhxlmbz) {
        this.kakhxlmbz = kakhxlmbz;
    }

    public String getKakhdm() {
        return kakhdm;
    }

    public void setKakhdm(String kakhdm) {
        this.kakhdm = kakhdm == null ? null : kakhdm.trim();
    }

    public String getKakhxs() {
        return kakhxs;
    }

    public void setKakhxs(String kakhxs) {
        this.kakhxs = kakhxs;
    }

    public String getKakhxslj() {
        return kakhxslj;
    }

    public void setKakhxslj(String kakhxslj) {
        this.kakhxslj = kakhxslj;
    }

 
    public String getMbz() {
		return mbz;
	}

	public void setMbz(String mbz) {
		this.mbz = mbz;
	}

	public String getWcqkzb() {
        return wcqkzb;
    }

    public void setWcqkzb(String wcqkzb) {
        this.wcqkzb = wcqkzb;
    }

    public String getDf() {
        return df;
    }

    public void setDf(String df) {
        this.df = df;
    }

    public String getSjjd() {
        return sjjd;
    }

    public void setSjjd(String sjjd) {
        this.sjjd = sjjd;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }
}