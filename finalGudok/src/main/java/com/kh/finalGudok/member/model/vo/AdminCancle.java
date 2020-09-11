package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminCancle implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1070549419672589838L;
	
	private int cancleNo;
	private int subscribeNo;
	private int cancleCategory;
	private String cancleContent;
	private Date cancleDate;
	private String MemberId;
	private String itemName;
	private int subPrice;
	
	public AdminCancle() {}

	public AdminCancle(int cancleNo, int subscribeNo, int cancleCategory, String cancleContent, Date cancleDate,
			String memberId, String itemName, int subPrice) {
		super();
		this.cancleNo = cancleNo;
		this.subscribeNo = subscribeNo;
		this.cancleCategory = cancleCategory;
		this.cancleContent = cancleContent;
		this.cancleDate = cancleDate;
		MemberId = memberId;
		this.itemName = itemName;
		this.subPrice = subPrice;
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

	public String getMemberId() {
		return MemberId;
	}

	public void setMemberId(String memberId) {
		MemberId = memberId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getSubPrice() {
		return subPrice;
	}

	public void setSubPrice(int subPrice) {
		this.subPrice = subPrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "AdminCancle [cancleNo=" + cancleNo + ", subscribeNo=" + subscribeNo + ", cancleCategory="
				+ cancleCategory + ", cancleContent=" + cancleContent + ", cancleDate=" + cancleDate + ", MemberId="
				+ MemberId + ", itemName=" + itemName + ", subPrice=" + subPrice + "]";
	}

	

}
