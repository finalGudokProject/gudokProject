package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminExchange implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4268791731921456975L;

	
	private int exchangeNo;
	private String exchangeStatus;
	private String exchangeContent;
	private Date exchangeDate;
	private String itemName;
	private int subscribeNo;
	private int exchangeCategory;
	private String memberId;
	private int itemPrice;
	private int totalPayment;
	
	
	public AdminExchange() {}


	public AdminExchange(int exchangeNo, String exchangeStatus, String exchangeContent, Date exchangeDate,
			String itemName, int subscribeNo, int exchangeCategory, String memberId, int itemPrice, int totalPayment) {
		super();
		this.exchangeNo = exchangeNo;
		this.exchangeStatus = exchangeStatus;
		this.exchangeContent = exchangeContent;
		this.exchangeDate = exchangeDate;
		this.itemName = itemName;
		this.subscribeNo = subscribeNo;
		this.exchangeCategory = exchangeCategory;
		this.memberId = memberId;
		this.itemPrice = itemPrice;
		this.totalPayment = totalPayment;
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


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}


	public int getTotalPayment() {
		return totalPayment;
	}


	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "AdminExchange [exchangeNo=" + exchangeNo + ", exchangeStatus=" + exchangeStatus + ", exchangeContent="
				+ exchangeContent + ", exchangeDate=" + exchangeDate + ", itemName=" + itemName + ", subscribeNo="
				+ subscribeNo + ", exchangeCategory=" + exchangeCategory + ", memberId=" + memberId + ", itemPrice="
				+ itemPrice + ", totalPayment=" + totalPayment + "]";
	}

	
	

}
