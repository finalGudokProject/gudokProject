package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BannerItem implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2129353950904527484L;
	private int itemNo;				//상품번호
	private String itemName;		//상품명
	private int itemPrice;			//가격
	private int itemCount;			//조회수
	private int itemRate;			//평점
	private String itemDpStatus;	//전시상태
	private int itemCmSales;		//누적판매량
	private int itemChoice;			//찜누적수
	private Date itemDate;			//상품등록일
	private String itemRecommend;	//추천상품
	private String categoryNo;		//카테고리번호
	private String itemMemo;		//상품메모
	private String itemEventStatus;	//이벤트상품
	private String imageOriginalName;	//원래 파일명
	private String imageRename;			//변경된 파일명
	private String imagePath;			//저장경로
	private int eventNo;			//이벤트 번호
	private String eventStatus;		//이벤트 상태
	private String eventName;		//이벤트명
	private int itemDiscount;		//할인율
	
	public BannerItem() {}

	public BannerItem(int itemNo, String itemName, int itemPrice, int itemCount, int itemRate, String itemDpStatus,
			int itemCmSales, int itemChoice, Date itemDate, String itemRecommend, String categoryNo, String itemMemo,
			String itemEventStatus, String imageOriginalName, String imageRename, String imagePath, int eventNo,
			String eventStatus, String eventName, int itemDiscount) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemCount = itemCount;
		this.itemRate = itemRate;
		this.itemDpStatus = itemDpStatus;
		this.itemCmSales = itemCmSales;
		this.itemChoice = itemChoice;
		this.itemDate = itemDate;
		this.itemRecommend = itemRecommend;
		this.categoryNo = categoryNo;
		this.itemMemo = itemMemo;
		this.itemEventStatus = itemEventStatus;
		this.imageOriginalName = imageOriginalName;
		this.imageRename = imageRename;
		this.imagePath = imagePath;
		this.eventNo = eventNo;
		this.eventStatus = eventStatus;
		this.eventName = eventName;
		this.itemDiscount = itemDiscount;
	}

	

	public BannerItem(Integer valueOf) {
		
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

	public int getItemCount() {
		return itemCount;
	}

	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}

	public int getItemRate() {
		return itemRate;
	}

	public void setItemRate(int itemRate) {
		this.itemRate = itemRate;
	}

	public String getItemDpStatus() {
		return itemDpStatus;
	}

	public void setItemDpStatus(String itemDpStatus) {
		this.itemDpStatus = itemDpStatus;
	}

	public int getItemCmSales() {
		return itemCmSales;
	}

	public void setItemCmSales(int itemCmSales) {
		this.itemCmSales = itemCmSales;
	}

	public int getItemChoice() {
		return itemChoice;
	}

	public void setItemChoice(int itemChoice) {
		this.itemChoice = itemChoice;
	}

	public Date getItemDate() {
		return itemDate;
	}

	public void setItemDate(Date itemDate) {
		this.itemDate = itemDate;
	}

	public String getItemRecommend() {
		return itemRecommend;
	}

	public void setItemRecommend(String itemRecommend) {
		this.itemRecommend = itemRecommend;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getItemMemo() {
		return itemMemo;
	}

	public void setItemMemo(String itemMemo) {
		this.itemMemo = itemMemo;
	}

	public String getItemEventStatus() {
		return itemEventStatus;
	}

	public void setItemEventStatus(String itemEventStatus) {
		this.itemEventStatus = itemEventStatus;
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

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventStatus() {
		return eventStatus;
	}

	public void setEventStatus(String eventStatus) {
		this.eventStatus = eventStatus;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public int getItemDiscount() {
		return itemDiscount;
	}

	public void setItemDiscount(int itemDiscount) {
		this.itemDiscount = itemDiscount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BannerItem [itemNo=" + itemNo + ", itemName=" + itemName + ", itemPrice=" + itemPrice + ", itemCount="
				+ itemCount + ", itemRate=" + itemRate + ", itemDpStatus=" + itemDpStatus + ", itemCmSales="
				+ itemCmSales + ", itemChoice=" + itemChoice + ", itemDate=" + itemDate + ", itemRecommend="
				+ itemRecommend + ", categoryNo=" + categoryNo + ", itemMemo=" + itemMemo + ", itemEventStatus="
				+ itemEventStatus + ", imageOriginalName=" + imageOriginalName + ", imageRename=" + imageRename
				+ ", imagePath=" + imagePath + ", eventNo=" + eventNo + ", eventStatus=" + eventStatus + ", eventName="
				+ eventName + ", itemDiscount=" + itemDiscount + "]";
	}
}
