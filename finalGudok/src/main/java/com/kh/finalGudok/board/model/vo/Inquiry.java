package com.kh.finalGudok.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Inquiry implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -369409540221247231L;

	private int iBoard_no;				// 게시물 번호
	private String iInquiry_yn;			// 답변 여부 
	private Date iInquiry_date;			// 답변 날짜
	private String iInquiry_content;	// 답변 내용
	private String iBoard_type;			// 문의 유형
	private String iInquiry_name;		// 문의명
	
	public Inquiry() {
	}

	public Inquiry(int iBoard_no, String iInquiry_yn, Date iInquiry_date, String iInquiry_content, String iBoard_type,
			String iInquiry_name) {
		this.iBoard_no = iBoard_no;
		this.iInquiry_yn = iInquiry_yn;
		this.iInquiry_date = iInquiry_date;
		this.iInquiry_content = iInquiry_content;
		this.iBoard_type = iBoard_type;
		this.iInquiry_name = iInquiry_name;
	}

	public int getiBoard_no() {
		return iBoard_no;
	}

	public void setiBoard_no(int iBoard_no) {
		this.iBoard_no = iBoard_no;
	}

	public String getiInquiry_yn() {
		return iInquiry_yn;
	}

	public void setiInquiry_yn(String iInquiry_yn) {
		this.iInquiry_yn = iInquiry_yn;
	}

	public Date getiInquiry_date() {
		return iInquiry_date;
	}

	public void setiInquiry_date(Date iInquiry_date) {
		this.iInquiry_date = iInquiry_date;
	}

	public String getiInquiry_content() {
		return iInquiry_content;
	}

	public void setiInquiry_content(String iInquiry_content) {
		this.iInquiry_content = iInquiry_content;
	}

	public String getiBoard_type() {
		return iBoard_type;
	}

	public void setiBoard_type(String iBoard_type) {
		this.iBoard_type = iBoard_type;
	}

	public String getiInquiry_name() {
		return iInquiry_name;
	}

	public void setiInquiry_name(String iInquiry_name) {
		this.iInquiry_name = iInquiry_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Inquiry [iBoard_no=" + iBoard_no + ", iInquiry_yn=" + iInquiry_yn + ", iInquiry_date=" + iInquiry_date
				+ ", iInquiry_content=" + iInquiry_content + ", iBoard_type=" + iBoard_type + ", iInquiry_name="
				+ iInquiry_name + "]";
	}

	
	
}
