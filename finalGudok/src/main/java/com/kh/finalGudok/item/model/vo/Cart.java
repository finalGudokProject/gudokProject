package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;

public class Cart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8675149466168540926L;

	private int cartNo;
	private int itemNo;
	private int memberNo;
	private String memberId;
	private String email;
	private String cartSubs;
	private int cartCount;
	private String itemName;
	private int itemPrice;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cartNo, int itemNo, int memberNo, String memberId, String email, String cartSubs, int cartCount,
			String itemName, int itemPrice) {
		super();
		this.cartNo = cartNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
		this.cartSubs = cartSubs;
		this.cartCount = cartCount;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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

	public String getCartSubs() {
		return cartSubs;
	}

	public void setCartSubs(String cartSubs) {
		this.cartSubs = cartSubs;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", memberId=" + memberId
				+ ", email=" + email + ", cartSubs=" + cartSubs + ", cartCount=" + cartCount + ", itemName=" + itemName
				+ ", itemPrice=" + itemPrice + "]";
	}

	
	
}
