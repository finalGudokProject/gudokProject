package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;

public class Cart implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -316212554287467153L;
	
	private int cartNo;
	private int itemNo;
	private int memberNo;
	private String cartSubs;
	private int cartCount;
	private String itemName;
	private int itemPrice;
	private String imagePath;
	private String imageOriginalName;
	private String imageRename;
	
	public Cart() {}

	public Cart(int cartNo, int itemNo, int memberNo, String cartSubs, int cartCount, String itemName, int itemPrice,
			String imagePath, String imageOriginalName, String imageRename) {
		this.cartNo = cartNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.cartSubs = cartSubs;
		this.cartCount = cartCount;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.imagePath = imagePath;
		this.imageOriginalName = imageOriginalName;
		this.imageRename = imageRename;
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

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getImageOriginalName() {
		return imageOriginalName;
	}

	public void setImageOriginalName(String imageOriginalName) {
		this.imageOriginalName = imageOriginalName;
	}

	public String getImageRename() {
		return imageRename;
	}

	public void setImageRename(String imageRename) {
		this.imageRename = imageRename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", cartSubs=" + cartSubs
				+ ", cartCount=" + cartCount + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", imagePath="
				+ imagePath + ", imageOriginalName=" + imageOriginalName + ", imageRename=" + imageRename + "]";
	}
}