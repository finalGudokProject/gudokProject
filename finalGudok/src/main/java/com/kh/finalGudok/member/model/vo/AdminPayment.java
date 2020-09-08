package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminPayment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6451044665432823259L;

	
	private int paymentNo; //결제번호
	private int itemNo; //상품번호
	private String itemName; //상품명
	private int itemPrice; //상품가격
	private int amount; //수량
	private int point; //사용 포인트
	private int subscribeNo;
	private Date paymentDate; //결제일자
	private int memberNo;
	private String memberId;
	private String email;
	private int totalPayment; //총 결제금액
	private int totalCount; //총 결제건
	private String categoryNo;
	
	public AdminPayment() {}

	public AdminPayment(int paymentNo, int itemNo, String itemName, int itemPrice, int amount, int point,
			int subscribeNo, Date paymentDate, int memberNo, String memberId, String email, int totalPayment,
			int totalCount, String categoryNo) {
		super();
		this.paymentNo = paymentNo;
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.amount = amount;
		this.point = point;
		this.subscribeNo = subscribeNo;
		this.paymentDate = paymentDate;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
		this.totalPayment = totalPayment;
		this.totalCount = totalCount;
		this.categoryNo = categoryNo;
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

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
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

	public int getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "AdminPayment [paymentNo=" + paymentNo + ", itemNo=" + itemNo + ", itemName=" + itemName + ", itemPrice="
				+ itemPrice + ", amount=" + amount + ", point=" + point + ", subscribeNo=" + subscribeNo
				+ ", paymentDate=" + paymentDate + ", memberNo=" + memberNo + ", memberId=" + memberId + ", email="
				+ email + ", totalPayment=" + totalPayment + ", totalCount=" + totalCount + ", categoryNo=" + categoryNo
				+ "]";
	}


	
	
}
	