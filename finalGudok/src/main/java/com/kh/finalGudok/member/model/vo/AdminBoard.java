package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminBoard implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8691394804821478594L;
	private int bBoard_no;			// 게시물 번호
	private int bMember_no;		// 게시한 회원 번호
	private String bMember_id;		// 게시한 회원 아이디
	private String bTitle;			// 제목
	private String bContent;		// 내용
	private Date bWrite_date;		// 작성일자
	private int bItem_no;			// 상품번호
	private String iInquiary_yn;			// 답변 여부 

	
	
	public AdminBoard() {}



	public AdminBoard(int bBoard_no, int bMember_no, String bMember_id, String bTitle, String bContent,
			Date bWrite_date, int bItem_no, String iInquiary_yn) {
		super();
		this.bBoard_no = bBoard_no;
		this.bMember_no = bMember_no;
		this.bMember_id = bMember_id;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWrite_date = bWrite_date;
		this.bItem_no = bItem_no;
		this.iInquiary_yn = iInquiary_yn;
	}



	public int getbBoard_no() {
		return bBoard_no;
	}



	public void setbBoard_no(int bBoard_no) {
		this.bBoard_no = bBoard_no;
	}



	public int getbMember_no() {
		return bMember_no;
	}



	public void setbMember_no(int bMember_no) {
		this.bMember_no = bMember_no;
	}



	public String getbMember_id() {
		return bMember_id;
	}



	public void setbMember_id(String bMember_id) {
		this.bMember_id = bMember_id;
	}



	public String getbTitle() {
		return bTitle;
	}



	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}



	public String getbContent() {
		return bContent;
	}



	public void setbContent(String bContent) {
		this.bContent = bContent;
	}



	public Date getbWrite_date() {
		return bWrite_date;
	}



	public void setbWrite_date(Date bWrite_date) {
		this.bWrite_date = bWrite_date;
	}



	public int getbItem_no() {
		return bItem_no;
	}



	public void setbItem_no(int bItem_no) {
		this.bItem_no = bItem_no;
	}



	public String getiInquiary_yn() {
		return iInquiary_yn;
	}



	public void setiInquiary_yn(String iInquiary_yn) {
		this.iInquiary_yn = iInquiary_yn;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "AdminBoard [bBoard_no=" + bBoard_no + ", bMember_no=" + bMember_no + ", bMember_id=" + bMember_id
				+ ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWrite_date=" + bWrite_date + ", bItem_no="
				+ bItem_no + ", iInquiary_yn=" + iInquiary_yn + "]";
	}



	
}
