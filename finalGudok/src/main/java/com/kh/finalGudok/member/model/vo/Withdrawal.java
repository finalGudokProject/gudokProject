package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Withdrawal implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -491343096128624421L;
	
	private int secessionNo;
	private int memberNo;
	private String memberId;
	private String email;
	private int secessionCategory;
	private String secessionContent;
	private Date secessionDate;
	
	public Withdrawal() {}

	public Withdrawal(int secessionNo, int memberNo, String memberId, String email, int secessionCategory,
			String secessionContent, Date secessionDate) {
		this.secessionNo = secessionNo;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
		this.secessionCategory = secessionCategory;
		this.secessionContent = secessionContent;
		this.secessionDate = secessionDate;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Withdrawal [secessionNo=" + secessionNo + ", memberNo=" + memberNo + ", memberId=" + memberId
				+ ", email=" + email + ", secessionCategory=" + secessionCategory + ", secessionContent="
				+ secessionContent + ", secessionDate=" + secessionDate + "]";
	}
}
