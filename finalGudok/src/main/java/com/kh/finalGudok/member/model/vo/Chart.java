package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;

public class Chart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 451659653724475857L;
	
	private int visitorNum;
	private int memberNum;
	private String vDay;
	
	public Chart() {}

	public Chart(int visitorNum, int memberNum, String vDay) {
		super();
		this.visitorNum = visitorNum;
		this.memberNum = memberNum;
		this.vDay = vDay;
	}

	public int getVisitorNum() {
		return visitorNum;
	}

	public void setVisitorNum(int visitorNum) {
		this.visitorNum = visitorNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getvDay() {
		return vDay;
	}

	public void setvDay(String vDay) {
		this.vDay = vDay;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Chart [visitorNum=" + visitorNum + ", memberNum=" + memberNum + ", vDay=" + vDay + "]";
	}
	
	
	

}
