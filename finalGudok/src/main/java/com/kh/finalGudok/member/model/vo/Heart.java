package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;

public class Heart implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4631523059183129200L;
	
	private int heartNo;
	private int itemNo;
	private int memberNo;
	private int itemPrice;
	private String imagePath;
	private String imageOriginalName;
	private String imageRename;
	private String itemName;
	
	public Heart() {}

	public Heart(int heartNo, int itemNo, int memberNo, int itemPrice, String imagePath, String imageOriginalName,
			String imageRename, String itemName) {
		this.heartNo = heartNo;
		this.itemNo = itemNo;
		this.memberNo = memberNo;
		this.itemPrice = itemPrice;
		this.imagePath = imagePath;
		this.imageOriginalName = imageOriginalName;
		this.imageRename = imageRename;
		this.itemName = itemName;
	}

	public int getHeartNo() {
		return heartNo;
	}

	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
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

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Heart [heartNo=" + heartNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", itemPrice="
				+ itemPrice + ", imagePath=" + imagePath + ", imageOriginalName=" + imageOriginalName + ", imageRename="
				+ imageRename + ", itemName=" + itemName + "]";
	}
}
