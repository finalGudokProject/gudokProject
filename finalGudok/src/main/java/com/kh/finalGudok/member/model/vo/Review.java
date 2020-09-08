package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5099028150623802596L;
	
	private int reviewNo;
	private int itemNo;
	private String reviewContent;
	private String reviewRate;
	private Date reviewDate;
	private Date reviewModifyDate;
	private int memberNo;
	private int memberId;
	private String email;
	
	public Review() {}

	public Review(int reviewNo, int itemNo, String reviewContent, String reviewRate, Date reviewDate,
			Date reviewModifyDate, int memberNo, int memberId, String email) {
		this.reviewNo = reviewNo;
		this.itemNo = itemNo;
		this.reviewContent = reviewContent;
		this.reviewRate = reviewRate;
		this.reviewDate = reviewDate;
		this.reviewModifyDate = reviewModifyDate;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(String reviewRate) {
		this.reviewRate = reviewRate;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public Date getReviewModifyDate() {
		return reviewModifyDate;
	}

	public void setReviewModifyDate(Date reviewModifyDate) {
		this.reviewModifyDate = reviewModifyDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", itemNo=" + itemNo + ", reviewContent=" + reviewContent
				+ ", reviewRate=" + reviewRate + ", reviewDate=" + reviewDate + ", reviewModifyDate=" + reviewModifyDate
				+ ", memberNo=" + memberNo + ", memberId=" + memberId + ", email=" + email + "]";
	}
}
