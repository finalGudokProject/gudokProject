package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Cancle implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 683644714681348585L;
	
	private int cancleNo;
	private int subscribeNo;
	private int cancleCategory;
	private String cancleContent;
	private Date cancleDate;
	
	public Cancle() {}

	public Cancle(int cancleNo, int subscribeNo, int cancleCategory, String cancleContent, Date cancleDate) {
		this.cancleNo = cancleNo;
		this.subscribeNo = subscribeNo;
		this.cancleCategory = cancleCategory;
		this.cancleContent = cancleContent;
		this.cancleDate = cancleDate;
	}

	public int getCancleNo() {
		return cancleNo;
	}

	public void setCancleNo(int cancleNo) {
		this.cancleNo = cancleNo;
	}

	public int getSubscribeNo() {
		return subscribeNo;
	}

	public void setSubscribeNo(int subscribeNo) {
		this.subscribeNo = subscribeNo;
	}

	public int getCancleCategory() {
		return cancleCategory;
	}

	public void setCancleCategory(int cancleCategory) {
		this.cancleCategory = cancleCategory;
	}

	public String getCancleContent() {
		return cancleContent;
	}

	public void setCancleContent(String cancleContent) {
		this.cancleContent = cancleContent;
	}

	public Date getCancleDate() {
		return cancleDate;
	}

	public void setCancleDate(Date cancleDate) {
		this.cancleDate = cancleDate;
	}

	@Override
	public String toString() {
		return "Cancle [cancleNo=" + cancleNo + ", subscribeNo=" + subscribeNo + ", cancleCategory=" + cancleCategory
				+ ", cancleContent=" + cancleContent + ", cancleDate=" + cancleDate + "]";
	}
}