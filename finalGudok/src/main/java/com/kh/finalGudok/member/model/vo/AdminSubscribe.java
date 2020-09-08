package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminSubscribe implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4128161630927070726L;


	
	private int subscribeNo;
	private int itemNo;
	private int cycleNo;
	private String subscribeStatus;
	private Date subscribeDate;
	private int amount;
	private int memberNo;
	private String memberId;
	private String email;
	private String exchangeStatus;
	private String itemName;
	private String deliveryStatus;
	private String address1;
	private String address2;
	private String address3;
	private int itemPrice;
	private int point;
	
	
	public AdminSubscribe() {
		super();
	}


	public AdminSubscribe(int subscribeNo, int itemNo, int cycleNo, String subscribeStatus, Date subscribeDate,
			int amount, int memberNo, String memberId, String email, String exchangeStatus, String itemName,
			String deliveryStatus, String address1, String address2, String address3, int itemPrice, int point) {
		super();
		this.subscribeNo = subscribeNo;
		this.itemNo = itemNo;
		this.cycleNo = cycleNo;
		this.subscribeStatus = subscribeStatus;
		this.subscribeDate = subscribeDate;
		this.amount = amount;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
		this.exchangeStatus = exchangeStatus;
		this.itemName = itemName;
		this.deliveryStatus = deliveryStatus;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.itemPrice = itemPrice;
		this.point = point;
	}


	public int getSubscribeNo() {
		return subscribeNo;
	}


	public void setSubscribeNo(int subscribeNo) {
		this.subscribeNo = subscribeNo;
	}


	public int getItemNo() {
		return itemNo;
	}


	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}


	public int getCycleNo() {
		return cycleNo;
	}


	public void setCycleNo(int cycleNo) {
		this.cycleNo = cycleNo;
	}


	public String getSubscribeStatus() {
		return subscribeStatus;
	}


	public void setSubscribeStatus(String subscribeStatus) {
		this.subscribeStatus = subscribeStatus;
	}


	public Date getSubscribeDate() {
		return subscribeDate;
	}


	public void setSubscribeDate(Date subscribeDate) {
		this.subscribeDate = subscribeDate;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
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


	public String getExchangeStatus() {
		return exchangeStatus;
	}


	public void setExchangeStatus(String exchangeStatus) {
		this.exchangeStatus = exchangeStatus;
	}


	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getDeliveryStatus() {
		return deliveryStatus;
	}


	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getAddress3() {
		return address3;
	}


	public void setAddress3(String address3) {
		this.address3 = address3;
	}


	public int getItemPrice() {
		return itemPrice;
	}


	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}


	public int getPoint() {
		return point;
	}


	public void setPoint(int point) {
		this.point = point;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "AdminSubscribe [subscribeNo=" + subscribeNo + ", itemNo=" + itemNo + ", cycleNo=" + cycleNo
				+ ", subscribeStatus=" + subscribeStatus + ", subscribeDate=" + subscribeDate + ", amount=" + amount
				+ ", memberNo=" + memberNo + ", memberId=" + memberId + ", email=" + email + ", exchangeStatus="
				+ exchangeStatus + ", itemName=" + itemName + ", deliveryStatus=" + deliveryStatus + ", address1="
				+ address1 + ", address2=" + address2 + ", address3=" + address3 + ", itemPrice=" + itemPrice
				+ ", point=" + point + "]";
	}


	
	

}