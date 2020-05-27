package com.asiainfo.cmc.enties;

public class FeeProgressBalance {
    private Integer id;

    private String zzc;

    private String sgtzx;

    private String hlwzc;

    private String khqljchdj;

    private String khqljrglcb;

    private String bykhfy;

    private String bhdjhrglcbys;

    private String byjd;

    private String ljkhfy;

    private String fyjd;

    private String fyjdjhx;

    private String month;

    private String df;

    public FeeProgressBalance(Integer id, String zzc, String sgtzx, String hlwzc, String khqljchdj, String khqljrglcb,
			String bykhfy, String bhdjhrglcbys, String byjd, String ljkhfy, String fyjd, String fyjdjhx, String month, String df) {
		super();
		this.id = id;
		this.zzc = zzc;
		this.sgtzx = sgtzx;
		this.hlwzc = hlwzc;
		this.khqljchdj = khqljchdj;
		this.khqljrglcb = khqljrglcb;
		this.bykhfy = bykhfy;
		this.bhdjhrglcbys = bhdjhrglcbys;
		this.byjd = byjd;
		this.ljkhfy = ljkhfy;
		this.fyjd = fyjd;
		this.fyjdjhx = fyjdjhx;
		this.month = month;
		this.df = df;
	}

	public FeeProgressBalance() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getZzc() {
        return zzc;
    }

    public void setZzc(String zzc) {
        this.zzc = zzc;
    }

    public String getSgtzx() {
        return sgtzx;
    }

    public void setSgtzx(String sgtzx) {
        this.sgtzx = sgtzx;
    }

    public String getHlwzc() {
        return hlwzc;
    }

    public void setHlwzc(String hlwzc) {
        this.hlwzc = hlwzc;
    }

    public String getKhqljchdj() {
        return khqljchdj;
    }

    public void setKhqljchdj(String khqljchdj) {
        this.khqljchdj = khqljchdj;
    }

    public String getKhqljrglcb() {
        return khqljrglcb;
    }

    public void setKhqljrglcb(String khqljrglcb) {
        this.khqljrglcb = khqljrglcb;
    }

    public String getBykhfy() {
        return bykhfy;
    }

    public void setBykhfy(String bykhfy) {
        this.bykhfy = bykhfy;
    }

    public String getBhdjhrglcbys() {
        return bhdjhrglcbys;
    }

    public void setBhdjhrglcbys(String bhdjhrglcbys) {
        this.bhdjhrglcbys = bhdjhrglcbys;
    }

    public String getByjd() {
        return byjd;
    }

    public void setByjd(String byjd) {
        this.byjd = byjd;
    }

    public String getLjkhfy() {
        return ljkhfy;
    }

    public void setLjkhfy(String ljkhfy) {
        this.ljkhfy = ljkhfy;
    }

    public String getFyjd() {
		return fyjd;
	}

	public void setFyjd(String fyjd) {
		this.fyjd = fyjd;
	}

	public String getFyjdjhx() {
		return fyjdjhx;
	}

	public void setFyjdjhx(String fyjdjhx) {
		this.fyjdjhx = fyjdjhx;
	}

	public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }

	public String getDf() {
		return df;
	}

	public void setDf(String df) {
		this.df = df;
	}
    
    
}