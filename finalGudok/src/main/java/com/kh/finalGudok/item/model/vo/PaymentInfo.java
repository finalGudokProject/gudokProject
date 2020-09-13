package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PaymentInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8069509695407087214L;
		
	private int paymentNo;
	private int itemNo;
	private int point;
	private Date paymentDate;
	private int memberNo;
	private String memberId;
	private String email;
	private String customerUid;
	
	public PaymentInfo() {
		super();
	}

	public PaymentInfo(int paymentNo, int itemNo, int point, Date paymentDate, int memberNo, String memberId,
			String email, String customerUid) {
		this.paymentNo = paymentNo;
		this.itemNo = itemNo;
		this.point = point;
		this.paymentDate = paymentDate;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
		this.customerUid = customerUid;
	}

	public int getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
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

	public String getCustomerUid() {
		return customerUid;
	}

	public void setCustomerUid(String customerUid) {
		this.customerUid = customerUid;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PaymentInfo [paymentNo=" + paymentNo + ", itemNo=" + itemNo + ", point=" + point + ", paymentDate="
				+ paymentDate + ", memberNo=" + memberNo + ", memberId=" + memberId + ", email=" + email
				+ ", customerUid=" + customerUid + "]";
	}

}
