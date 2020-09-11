package com.kh.finalGudok.board.model.vo;

import java.io.Serializable;

public class Search implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4139913332687099218L;
	private String searchType;
	private String post_yn;
	private String keyword;
	private String inquiry_yn;
	
	public Search() {
		
	}

	public Search(String searchType, String post_yn, String keyword, String inquiry_yn) {
		this.searchType = searchType;
		this.post_yn = post_yn;
		this.keyword = keyword;
		this.inquiry_yn = inquiry_yn;
	}
	

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getPost_yn() {
		return post_yn;
	}

	public void setPost_yn(String post_yn) {
		this.post_yn = post_yn;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getInquiry_yn() {
		return inquiry_yn;
	}

	public void setInquiry_yn(String inquiry_yn) {
		this.inquiry_yn = inquiry_yn;
	}

	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", post_yn=" + post_yn + ", keyword=" + keyword + ", inquiry_yn="
				+ inquiry_yn + "]";
	}
	
	
}
