package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Exchange implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8657867651061839219L;
	
	private int exchangeNo;
	private String exchangeStatus;
	private String exchangeContent;
	private Date exchangeDate;
	private String itemName;
	private int subscribeNo;
	private int exchangeCategory;
	
	public Exchange() {}

	public Exchange(int exchangeNo, String exchangeStatus, String exchangeContent, Date exchangeDate, String itemName,
			int subscribeNo, int exchangeCategory) {
		this.exchangeNo = exchangeNo;
		this.exchangeStatus = exchangeStatus;
		this.exchangeContent = exchangeContent;
		this.exchangeDate = exchangeDate;
		this.itemName = itemName;
		this.subscribeNo = subscribeNo;
		this.exchangeCategory = exchangeCategory;
	}

	public int getExchangeNo() {
		return exchangeNo;
	}

	public void setExchangeNo(int exchangeNo) {
		this.exchangeNo = exchangeNo;
	}

	public String getExchangeStatus() {
		return exchangeStatus;
	}

	public void setExchangeStatus(String exchangeStatus) {
		this.exchangeStatus = exchangeStatus;
	}

	public String getExchangeContent() {
		return exchangeContent;
	}

	public void setExchangeContent(String exchangeContent) {
		this.exchangeContent = exchangeContent;
	}

	public Date getExchangeDate() {
		return exchangeDate;
	}

	public void setExchangeDate(Date exchangeDate) {
		this.exchangeDate = exchangeDate;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getSubscribeNo() {
		return subscribeNo;
	}

	public void setSubscribeNo(int subscribeNo) {
		this.subscribeNo = subscribeNo;
	}

	public int getExchangeCategory() {
		return exchangeCategory;
	}

	public void setExchangeCategory(int exchangeCategory) {
		this.exchangeCategory = exchangeCategory;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Exchange [exchangeNo=" + exchangeNo + ", exchangeStatus=" + exchangeStatus + ", exchangeContent="
				+ exchangeContent + ", exchangeDate=" + exchangeDate + ", itemName=" + itemName + ", subscribeNo="
				+ subscribeNo + ", exchangeCategory=" + exchangeCategory + "]";
	}
}