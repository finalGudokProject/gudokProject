package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Point implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7260609782857913410L;
	
	private int pointNo;
	private int subscribeNo;
	private Date subscribeDate;
	private String itemName;
	private int point;
	
	public Point() {}

	public Point(int pointNo, int subscribeNo, Date subscribeDate, String itemName, int point) {
		this.pointNo = pointNo;
		this.subscribeNo = subscribeNo;
		this.subscribeDate = subscribeDate;
		this.itemName = itemName;
		this.point = point;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getSubscribeNo() {
		return subscribeNo;
	}

	public void setSubscribeNo(int subscribeNo) {
		this.subscribeNo = subscribeNo;
	}

	public Date getSubscribeDate() {
		return subscribeDate;
	}

	public void setSubscribeDate(Date subscribeDate) {
		this.subscribeDate = subscribeDate;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "Point [pointNo=" + pointNo + ", subscribeNo=" + subscribeNo + ", subscribeDate=" + subscribeDate
				+ ", itemName=" + itemName + ", point=" + point + "]";
	}
}
