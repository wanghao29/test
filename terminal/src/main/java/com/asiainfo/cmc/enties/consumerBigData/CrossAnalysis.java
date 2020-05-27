package com.asiainfo.cmc.enties.consumerBigData;

/**
 * 消费者交叉分析表
 * @author yuxuandong
 *
 */
public class CrossAnalysis {

	private int  statMo;          // '月份',

	private String cmccBranchCd;  // '地市',

	private String custGpNam;   //'客户群',

    private int custGpCnt;          //'客户群数量',

    private int ywstUsrCnt;          //'异网渗透用户数',

    private int ydfkUsrCnt;          //'移动副卡用户数',

    private int ydfkHighFluxUsrCnt;   //'移动副卡高流量用户数（高于500M）',

    private int ydfkLowgprsHighwifiUsrCnt;    //'低流量（<500M）高WIFI流量（>1000M）用户数'

	public int getStat_mo() {
		return statMo;
	}

	public void setStat_mo(int statMo) {
		this.statMo = statMo;
	}

	public String getCmccBranchCd() {
		return cmccBranchCd;
	}

	public void setCmccBranchCd(String cmccBranchCd) {
		this.cmccBranchCd = cmccBranchCd;
	}

	public String getCustGpNam() {
		return custGpNam;
	}

	public void setCustGpNam(String custGpNam) {
		this.custGpNam = custGpNam;
	}

	public int getCustGpCnt() {
		return custGpCnt;
	}

	public void setCustGpCnt(int custGpCnt) {
		this.custGpCnt = custGpCnt;
	}

	public int getYwstUsrCnt() {
		return ywstUsrCnt;
	}

	public void setYwstUsrCnt(int ywstUsrCnt) {
		this.ywstUsrCnt = ywstUsrCnt;
	}

	public int getYdfkUsrCnt() {
		return ydfkUsrCnt;
	}

	public void setYdfkUsrCnt(int ydfkUsrCnt) {
		this.ydfkUsrCnt = ydfkUsrCnt;
	}

	public int getYdfkHighFluxUsrCnt() {
		return ydfkHighFluxUsrCnt;
	}

	public void setYdfkHighFluxUsrCnt(int ydfkHighFluxUsrCnt) {
		this.ydfkHighFluxUsrCnt = ydfkHighFluxUsrCnt;
	}

	public int getYdfkLowgprsHighwifiUsrCnt() {
		return ydfkLowgprsHighwifiUsrCnt;
	}

	public void setYdfkLowgprsHighwifiUsrCnt(int ydfkLowgprsHighwifiUsrCnt) {
		this.ydfkLowgprsHighwifiUsrCnt = ydfkLowgprsHighwifiUsrCnt;
	}

	public CrossAnalysis(int statMo, String cmccBranchCd, String custGpNam, int custGpCnt, int ywstUsrCnt,
			int ydfkUsrCnt, int ydfkHighFluxUsrCnt, int ydfkLowgprsHighwifiUsrCnt) {
		super();
		this.statMo = statMo;
		this.cmccBranchCd = cmccBranchCd;
		this.custGpNam = custGpNam;
		this.custGpCnt = custGpCnt;
		this.ywstUsrCnt = ywstUsrCnt;
		this.ydfkUsrCnt = ydfkUsrCnt;
		this.ydfkHighFluxUsrCnt = ydfkHighFluxUsrCnt;
		this.ydfkLowgprsHighwifiUsrCnt = ydfkLowgprsHighwifiUsrCnt;
	}

	public CrossAnalysis() {
		super();
		// TODO Auto-generated constructor stub
	}


}