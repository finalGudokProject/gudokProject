package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;

public class Image implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2212780829174069787L;
	private int imageNo;
	private String imagePath;
	private String imageOriginalName;
	private String imageRename;
	
	public Image() {
		// TODO Auto-generated constructor stub
	}
	public Image(int imageNo, String imagePath, String imageOriginalName, String imageRename) {
		super();
		this.imageNo = imageNo;
		this.imagePath = imagePath;
		this.imageOriginalName = imageOriginalName;
		this.imageRename = imageRename;
	}
	
	

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
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
		return "Image [imageNo=" + imageNo + ", imagePath=" + imagePath + ", imageOriginalName=" + imageOriginalName
				+ ", imageRename=" + imageRename + "]";
	}
	
}
