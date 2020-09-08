package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ItemListView implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6337821619057909757L;
	private int itemNo;
	private String categoryName;
	private String categoryNo;
	private Date itemDate;
	private String itemName;
	private String itemMemo;
	private String itemPath;
	private String itemOriginal;
	private String itemRename;
	private String imagePath;
	private String imageOriginalName;
	private String imageRename;
	private int itemPrice;
	private int itemDiscount;
	private Double itemRate;
	private int reviewCount;
	private int itemChoice;
	private int heartNo;
	private String sortName;

	public ItemListView() {
		// TODO Auto-generated constructor stub
	}

	public ItemListView(int itemNo, String categoryName, String categoryNo, Date itemDate, String itemName,
			String itemMemo, String itemPath, String itemOriginal, String itemRename, String imagePath,
			String imageOriginalName, String imageRename, int itemPrice, int itemDiscount, Double itemRate,
			int reviewCount, int itemChoice, int heartNo, String sortName) {
		super();
		this.itemNo = itemNo;
		this.categoryName = categoryName;
		this.categoryNo = categoryNo;
		this.itemDate = itemDate;
		this.itemName = itemName;
		this.itemMemo = itemMemo;
		this.itemPath = itemPath;
		this.itemOriginal = itemOriginal;
		this.itemRename = itemRename;
		this.imagePath = imagePath;
		this.imageOriginalName = imageOriginalName;
		this.imageRename = imageRename;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemRate = itemRate;
		this.reviewCount = reviewCount;
		this.itemChoice = itemChoice;
		this.heartNo = heartNo;
		this.sortName = sortName;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Date getItemDate() {
		return itemDate;
	}

	public void setItemDate(Date itemDate) {
		this.itemDate = itemDate;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemMemo() {
		return itemMemo;
	}

	public void setItemMemo(String itemMemo) {
		this.itemMemo = itemMemo;
	}

	public String getItemPath() {
		return itemPath;
	}

	public void setItemPath(String itemPath) {
		this.itemPath = itemPath;
	}

	public String getItemOriginal() {
		return itemOriginal;
	}

	public void setItemOriginal(String itemOriginal) {
		this.itemOriginal = itemOriginal;
	}

	public String getItemRename() {
		return itemRename;
	}

	public void setItemRename(String itemRename) {
		this.itemRename = itemRename;
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

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemDiscount() {
		return itemDiscount;
	}

	public void setItemDiscount(int itemDiscount) {
		this.itemDiscount = itemDiscount;
	}

	public Double getItemRate() {
		return itemRate;
	}

	public void setItemRate(Double itemRate) {
		this.itemRate = itemRate;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getItemChoice() {
		return itemChoice;
	}

	public void setItemChoice(int itemChoice) {
		this.itemChoice = itemChoice;
	}

	public int getHeartNo() {
		return heartNo;
	}

	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ItemListView [itemNo=" + itemNo + ", categoryName=" + categoryName + ", categoryNo=" + categoryNo
				+ ", itemDate=" + itemDate + ", itemName=" + itemName + ", itemMemo=" + itemMemo + ", itemPath="
				+ itemPath + ", itemOriginal=" + itemOriginal + ", itemRename=" + itemRename + ", imagePath="
				+ imagePath + ", imageOriginalName=" + imageOriginalName + ", imageRename=" + imageRename
				+ ", itemPrice=" + itemPrice + ", itemDiscount=" + itemDiscount + ", itemRate=" + itemRate
				+ ", reviewCount=" + reviewCount + ", itemChoice=" + itemChoice + ", heartNo=" + heartNo + ", sortName="
				+ sortName + "]";
	}

	
	

}
