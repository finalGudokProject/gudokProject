package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;

public class Heart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8175161018884060914L;
	private int heartNo;
	private int itemNo;
	private int memberNo;
	private String memberId;
	private String email;
	public Heart() {
		// TODO Auto-generated constructor stub
	}
	public Heart(int heartNo, int itemNo, int memberNo, String memberId, String email) {
		super();
		this.heartNo = heartNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
	}
	public int getHeartNo() {
		return heartNo;
	}
	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Heart [heartNo=" + heartNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", memberId=" + memberId
				+ ", email=" + email + "]";
	}
	
	
	
}
