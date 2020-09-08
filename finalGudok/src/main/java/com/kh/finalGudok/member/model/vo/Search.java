package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;

public class Search implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3185016167516573005L;

	private String startDay;	 //검색기간 처음
	private String lastDay; 	//검색기간 마지막 
	private String category1;
	private String category2;
	private String word;	//검색어
	private String searchDate;
	private int temp1; //count용
	private int temp2; //count용
	private String memberId;
	private String memberName;
	private String memberNo;
	private String categoryNo;
	private String itemName;
	private String subscribeNo;
	private String itemNo;
	

	
	
	public Search() {}




	public Search(String startDay, String lastDay, String category1, String category2, String word, String searchDate,
			int temp1, int temp2, String memberId, String memberName, String memberNo, String categoryNo,
			String itemName, String subscribeNo, String itemNo) {
		super();
		this.startDay = startDay;
		this.lastDay = lastDay;
		this.category1 = category1;
		this.category2 = category2;
		this.word = word;
		this.searchDate = searchDate;
		this.temp1 = temp1;
		this.temp2 = temp2;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.categoryNo = categoryNo;
		this.itemName = itemName;
		this.subscribeNo = subscribeNo;
		this.itemNo = itemNo;
	}




	public String getStartDay() {
		return startDay;
	}




	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}




	public String getLastDay() {
		return lastDay;
	}




	public void setLastDay(String lastDay) {
		this.lastDay = lastDay;
	}




	public String getCategory1() {
		return category1;
	}




	public void setCategory1(String category1) {
		this.category1 = category1;
	}




	public String getCategory2() {
		return category2;
	}




	public void setCategory2(String category2) {
		this.category2 = category2;
	}




	public String getWord() {
		return word;
	}




	public void setWord(String word) {
		this.word = word;
	}




	public String getSearchDate() {
		return searchDate;
	}




	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}




	public int getTemp1() {
		return temp1;
	}




	public void setTemp1(int temp1) {
		this.temp1 = temp1;
	}




	public int getTemp2() {
		return temp2;
	}




	public void setTemp2(int temp2) {
		this.temp2 = temp2;
	}




	public String getMemberId() {
		return memberId;
	}




	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}




	public String getMemberName() {
		return memberName;
	}




	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}




	public String getMemberNo() {
		return memberNo;
	}




	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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




	public String getSubscribeNo() {
		return subscribeNo;
	}




	public void setSubscribeNo(String subscribeNo) {
		this.subscribeNo = subscribeNo;
	}




	public String getItemNo() {
		return itemNo;
	}




	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	@Override
	public String toString() {
		return "Search [startDay=" + startDay + ", lastDay=" + lastDay + ", category1=" + category1 + ", category2="
				+ category2 + ", word=" + word + ", searchDate=" + searchDate + ", temp1=" + temp1 + ", temp2=" + temp2
				+ ", memberId=" + memberId + ", memberName=" + memberName + ", memberNo=" + memberNo + ", categoryNo="
				+ categoryNo + ", itemName=" + itemName + ", subscribeNo=" + subscribeNo + ", itemNo=" + itemNo + "]";
	}





	

	
	

}
