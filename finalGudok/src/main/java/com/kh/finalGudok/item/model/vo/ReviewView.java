package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ReviewView implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6898845706476905649L;
	private int reviewNo;
	private int itemNo;
	private String reviewContent;
	private String reviewRate;
	private String imagePath;
	private String imageOriginalName;
	private String imageRename;
	private Date reviewDate;
	private Date reviewModify;
	private String memberId;
	private String memberName;
	public ReviewView() {
		// TODO Auto-generated constructor stub
	}
	public ReviewView(int reviewNo, int itemNo, String reviewContent, String reviewRate, String imagePath,
			String imageOriginalName, String imageRename, Date reviewDate, Date reviewModify, String memberId,
			String memberName) {
		super();
		this.reviewNo = reviewNo;
		this.itemNo = itemNo;
		this.reviewContent = reviewContent;
		this.reviewRate = reviewRate;
		this.imagePath = imagePath;
		this.imageOriginalName = imageOriginalName;
		this.imageRename = imageRename;
		this.reviewDate = reviewDate;
		this.reviewModify = reviewModify;
		this.memberId = memberId;
		this.memberName = memberName;
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
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImageOriginalName() {
		return imageOriginalName;
	}
	public void setImageOriginalName(String imageOriginalName) {
		this.imageOriginalName = imageOriginalName;
	}
	public String getImageRename() {
		return imageRename;
	}
	public void setImageRename(String imageRename) {
		this.imageRename = imageRename;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public Date getReviewModify() {
		return reviewModify;
	}
	public void setReviewModify(Date reviewModify) {
		this.reviewModify = reviewModify;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ReviewView [reviewNo=" + reviewNo + ", itemNo=" + itemNo + ", reviewContent=" + reviewContent
				+ ", reviewRate=" + reviewRate + ", imagePath=" + imagePath + ", imageOriginalName=" + imageOriginalName
				+ ", imageRename=" + imageRename + ", reviewDate=" + reviewDate + ", reviewModify=" + reviewModify
				+ ", memberId=" + memberId + ", memberName=" + memberName + "]";
	}
	
}
