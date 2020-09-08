package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Visitor implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4623819843607694955L;
	
	private String visitNo;	//방문자 시퀀스
	private String visitIp;	//방문자 ip
	private Date visitTime;	//방문  시간
	private String visitRefer; //방문자가 어느 사이트를 타고 들어왔는지 
	private String visitAgent;	//방문자 브라우저 정보

	public Visitor() {}

	public Visitor(String visitNo, String visitIp, Date visitTime, String visitRefer, String visitAgent) {
		super();
		this.visitNo = visitNo;
		this.visitIp = visitIp;
		this.visitTime = visitTime;
		this.visitRefer = visitRefer;
		this.visitAgent = visitAgent;
	}

	public String getVisitNo() {
		return visitNo;
	}

	public void setVisitNo(String visitNo) {
		this.visitNo = visitNo;
	}

	public String getVisitIp() {
		return visitIp;
	}

	public void setVisitIp(String visitIp) {
		this.visitIp = visitIp;
	}

	public Date getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(Date visitTime) {
		this.visitTime = visitTime;
	}

	public String getVisitRefer() {
		return visitRefer;
	}

	public void setVisitRefer(String visitRefer) {
		this.visitRefer = visitRefer;
	}

	public String getVisitAgent() {
		return visitAgent;
	}

	public void setVisitAgent(String visitAgent) {
		this.visitAgent = visitAgent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Visitor [visitNo=" + visitNo + ", visitIp=" + visitIp + ", visitTime=" + visitTime + ", visitRefer="
				+ visitRefer + ", visitAgent=" + visitAgent + "]";
	}

	
	
}
