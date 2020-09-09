package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PaymentInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8069509695407087214L;
		
	private int paymentNo;
	private int amount;
	private int point;
	private int subscribeNo;
	private Date paymentDate;
	
	public PaymentInfo() {
		super();
	}

	public PaymentInfo(int paymentNo, int amount, int point, int subscribeNo, Date paymentDate) {
		super();
		this.paymentNo = paymentNo;
		this.amount = amount;
		this.point = point;
		this.subscribeNo = subscribeNo;
		this.paymentDate = paymentDate;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getSubscribeNo() {
		return subscribeNo;
	}

	public void setSubscribeNo(int subscribeNo) {
		this.subscribeNo = subscribeNo;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", amount=" + amount + ", point=" + point + ", subscribeNo="
				+ subscribeNo + ", paymentDate=" + paymentDate + "]";
	}
	
	

}
