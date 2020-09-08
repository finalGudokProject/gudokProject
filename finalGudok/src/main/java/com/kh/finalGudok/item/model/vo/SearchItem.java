package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;

public class SearchItem implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4786078029661621149L;
	
	private String categoryNo; //카테고리(대분류)
	private String itemName;
	private String itemNo;
	private String wordS;	//문자 검색어
	private int wordI;	//숫자 검색어
	
	public SearchItem() {}

	public SearchItem(String categoryNo, String itemName, String itemNo, String wordS, int wordI) {
		super();
		this.categoryNo = categoryNo;
		this.itemName = itemName;
		this.itemNo = itemNo;
		this.wordS = wordS;
		this.wordI = wordI;
	}

	public String getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

	public String getWordS() {
		return wordS;
	}

	public void setWordS(String wordS) {
		this.wordS = wordS;
	}

	public int getWordI() {
		return wordI;
	}

	public void setWordI(int wordI) {
		this.wordI = wordI;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SearchItem [categoryNo=" + categoryNo + ", itemName=" + itemName + ", itemNo=" + itemNo + ", wordS="
				+ wordS + ", wordI=" + wordI + "]";
	}

	

	
}
