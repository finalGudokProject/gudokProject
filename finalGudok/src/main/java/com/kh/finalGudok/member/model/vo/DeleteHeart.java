package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;

public class DeleteHeart implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7828189392568189385L;
	
	private int memberNo;
	private int heartNo;
	
	public DeleteHeart() {}
	
	public DeleteHeart(int memberNo, int heartNo) {
		this.memberNo = memberNo;
		this.heartNo = heartNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getHeartNo() {
		return heartNo;
	}

	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}

	@Override
	public String toString() {
		return "deleteHeart [memberNo=" + memberNo + ", heartNo=" + heartNo + "]";
	}	
}
