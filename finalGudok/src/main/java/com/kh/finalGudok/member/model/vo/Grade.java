package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;

public class Grade implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 2550198526120512942L;
	
	
	private int gradeNo;	//등급 코드
	private String gradeName; //등급명
	private int total; 		//등급별 회원 수
	private double gradeRate;	//적립율
	private int gradeMin;	//구매 최소금액
	private int gradeMember;	//등급별 회원 수
	
	public Grade() {}

	public Grade(int gradeNo, String gradeName, int total, double gradeRate, int gradeMin, int gradeMember) {
		super();
		this.gradeNo = gradeNo;
		this.gradeName = gradeName;
		this.total = total;
		this.gradeRate = gradeRate;
		this.gradeMin = gradeMin;
		this.gradeMember = gradeMember;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public double getGradeRate() {
		return gradeRate;
	}

	public void setGradeRate(double gradeRate) {
		this.gradeRate = gradeRate;
	}

	public int getGradeMin() {
		return gradeMin;
	}

	public void setGradeMin(int gradeMin) {
		this.gradeMin = gradeMin;
	}

	public int getGradeMember() {
		return gradeMember;
	}

	public void setGradeMember(int gradeMember) {
		this.gradeMember = gradeMember;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Grade [gradeNo=" + gradeNo + ", gradeName=" + gradeName + ", total=" + total + ", gradeRate="
				+ gradeRate + ", gradeMin=" + gradeMin + ", gradeMember=" + gradeMember + "]";
	}
	
	

}
