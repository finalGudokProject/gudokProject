package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;

public class ReviewImage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -369275225450420925L;
	
	private int reviewimageNo;
	private int reviewNo;
	private int rImageNo;
	public ReviewImage() {
		// TODO Auto-generated constructor stub
	}
	public ReviewImage(int reviewimageNo, int reviewNo, int rImageNo) {
		super();
		this.reviewimageNo = reviewimageNo;
		this.reviewNo = reviewNo;
		this.rImageNo = rImageNo;
	}
	public int getReviewimageNo() {
		return reviewimageNo;
	}
	public void setReviewimageNo(int reviewimageNo) {
		this.reviewimageNo = reviewimageNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getrImageNo() {
		return rImageNo;
	}
	public void setrImageNo(int rImageNo) {
		this.rImageNo = rImageNo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ReviewImage [reviewimageNo=" + reviewimageNo + ", reviewNo=" + reviewNo + ", rImageNo=" + rImageNo
				+ "]";
	}
	
}
