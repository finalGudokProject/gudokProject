package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Inquiry implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5203734110136893702L;
	
	private int boardNo;
	private String title;
	private String content;
	private Date writeDate;
	private int readNum;
	private String boardCode;
	private int memberNo;
	private String memberId;
	private String email;
	private int itemNo;
	private String inquiryYN;
	
	public Inquiry() {}

	public Inquiry(int boardNo, String title, String content, Date writeDate, int readNum, String boardCode,
			int memberNo, String memberId, String email, int itemNo, String inquiryYN) {
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.readNum = readNum;
		this.boardCode = boardCode;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
		this.itemNo = itemNo;
		this.inquiryYN = inquiryYN;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getReadNum() {
		return readNum;
	}

	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}

	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
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

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getInquiryYN() {
		return inquiryYN;
	}

	public void setInquiryYN(String inquiryYN) {
		this.inquiryYN = inquiryYN;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Inquiry [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writeDate=" + writeDate
				+ ", readNum=" + readNum + ", boardCode=" + boardCode + ", memberNo=" + memberNo + ", memberId="
				+ memberId + ", email=" + email + ", itemNo=" + itemNo + ", inquiryYN=" + inquiryYN + "]";
	}
}