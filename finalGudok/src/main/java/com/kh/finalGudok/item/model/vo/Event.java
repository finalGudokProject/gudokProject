package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;

public class Event implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -22352937179450221L;
	
	private int eventNo;			//이벤트 번호
	private int itemNo;				//상품번호
	private String eventStatus;		//이벤트 상태
	private String eventName;		//이벤트명
	private int itemDiscount;		//할인율
	private String imageOriginalName;	//원래 파일명
	private String imageRename;			//변경된 파일명
	private String imagePath;			//저장경로
	

	
	
	public Event() {}


	public Event(int eventNo, int itemNo, String eventStatus, String eventName, int itemDiscount,
			String imageOriginalName, String imageRename, String imagePath) {
		super();
		this.eventNo = eventNo;
		this.itemNo = itemNo;
		this.eventStatus = eventStatus;
		this.eventName = eventName;
		this.itemDiscount = itemDiscount;
		this.imageOriginalName = imageOriginalName;
		this.imageRename = imageRename;
		this.imagePath = imagePath;
	}


	


	public Event(int eventNo) {
		super();
		this.eventNo = eventNo;
	}


	public int getEventNo() {
		return eventNo;
	}


	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}


	public int getItemNo() {
		return itemNo;
	}


	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
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


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", itemNo=" + itemNo + ", eventStatus=" + eventStatus + ", eventName="
				+ eventName + ", itemDiscount=" + itemDiscount + ", imageOriginalName=" + imageOriginalName
				+ ", imageRename=" + imageRename + ", imagePath=" + imagePath + "]";
	}


}