package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reply implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3503686340330700783L;
	
	private int boardNo;
	private String inquiryYN;
	private Date inquiryDate;
	private String inquiryContent;
	private String boardType;
	
	public Reply() {}

	public Reply(int boardNo, String inquiryYN, Date inquiryDate, String inquiryContent, String boardType) {
		this.boardNo = boardNo;
		this.inquiryYN = inquiryYN;
		this.inquiryDate = inquiryDate;
		this.inquiryContent = inquiryContent;
		this.boardType = boardType;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getInquiryYN() {
		return inquiryYN;
	}

	public void setInquiryYN(String inquiryYN) {
		this.inquiryYN = inquiryYN;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Reply [boardNo=" + boardNo + ", inquiryYN=" + inquiryYN + ", inquiryDate=" + inquiryDate
				+ ", inquiryContent=" + inquiryContent + ", boardType=" + boardType + "]";
	}
}
