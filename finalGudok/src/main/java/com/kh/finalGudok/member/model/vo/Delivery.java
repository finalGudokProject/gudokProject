package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Delivery implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4507571784165298970L;
	
	private int deliveryNo;
	private String deliveryStatus;
	private int subscribeNo;
	private String itemName;
	private Date subscribeDate;
	private String exchangeStatus;
	private int itemNo;
	
	public Delivery() {}

	public Delivery(int deliveryNo, String deliveryStatus, int subscribeNo, String itemName, Date subscribeDate,
			String exchangeStatus, int itemNo) {
		this.deliveryNo = deliveryNo;
		this.deliveryStatus = deliveryStatus;
		this.subscribeNo = subscribeNo;
		this.itemName = itemName;
		this.subscribeDate = subscribeDate;
		this.exchangeStatus = exchangeStatus;
		this.itemNo = itemNo;
	}

	public int getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public int getSubscribeNo() {
		return subscribeNo;
	}

	public void setSubscribeNo(int subscribeNo) {
		this.subscribeNo = subscribeNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Date getSubscribeDate() {
		return subscribeDate;
	}

	public void setSubscribeDate(Date subscribeDate) {
		this.subscribeDate = subscribeDate;
	}

	public String getExchangeStatus() {
		return exchangeStatus;
	}

	public void setExchangeStatus(String exchangeStatus) {
		this.exchangeStatus = exchangeStatus;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Delivery [deliveryNo=" + deliveryNo + ", deliveryStatus=" + deliveryStatus + ", subscribeNo="
				+ subscribeNo + ", itemName=" + itemName + ", subscribeDate=" + subscribeDate + ", exchangeStatus="
				+ exchangeStatus + ", itemNo=" + itemNo + "]";
	}
}
