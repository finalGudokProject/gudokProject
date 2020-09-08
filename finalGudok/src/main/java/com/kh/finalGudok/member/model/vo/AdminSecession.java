package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminSecession implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2887391850505703163L;

	
	private int secessionNo;
	private int memberNo;
	private String memberId;
	private String email;
	private int secessionCategory;
	private String secessionContent;
	private Date secessionDate;
	private int gradeNo;
	private int total;
	
	
	public AdminSecession() {}


	public AdminSecession(int secessionNo, int memberNo, String memberId, String email, int secessionCategory,
			String secessionContent, Date secessionDate, int gradeNo, int total) {
		super();
		this.secessionNo = secessionNo;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
		this.secessionCategory = secessionCategory;
		this.secessionContent = secessionContent;
		this.secessionDate = secessionDate;
		this.gradeNo = gradeNo;
		this.total = total;
	}


	public int getSecessionNo() {
		return secessionNo;
	}


	public void setSecessionNo(int secessionNo) {
		this.secessionNo = secessionNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public int getSecessionCategory() {
		return secessionCategory;
	}


	public void setSecessionCategory(int secessionCategory) {
		this.secessionCategory = secessionCategory;
	}


	public String getSecessionContent() {
		return secessionContent;
	}


	public void setSecessionContent(String secessionContent) {
		this.secessionContent = secessionContent;
	}


	public Date getSecessionDate() {
		return secessionDate;
	}


	public void setSecessionDate(Date secessionDate) {
		this.secessionDate = secessionDate;
	}


	public int getGradeNo() {
		return gradeNo;
	}


	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "AdminSecession [secessionNo=" + secessionNo + ", memberNo=" + memberNo + ", memberId=" + memberId
				+ ", email=" + email + ", secessionCategory=" + secessionCategory + ", secessionContent="
				+ secessionContent + ", secessionDate=" + secessionDate + ", gradeNo=" + gradeNo + ", total=" + total
				+ "]";
	}


	

}
