package com.kh.finalGudok.board.model.vo;

import java.io.Serializable;
import java.sql.Date;


public class Board implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5093762690289456321L;

	private int bMember_no;		// 게시한 회원 번호
	private String bMember_id;		// 게시한 회원 아이디
	private String bEmail;			// 게시한 회원 이메일
	private String bBoard_code;		// 게시물 코드
	private int bBoard_no;			// 게시물 번호
	private String bTitle;			// 제목
	private String bContent;		// 내용
	private int bRead_num;			// 조회수
	private String originalFileName;// 이미지 원래이름
	private String renameFileName;	// 이미지 수정이름
	private String imagePath;		// 이미지 경로
	private int bItem_no;			// 상품번호
	private int rownum;				// 게시물 번호 순서를 위한 rownum
	
	private Date bWrite_date;		// 작성일자

	public Board() {
	}

	public Board(int bMember_no, String bMember_id, String bEmail, String bBoard_code, int bBoard_no, String bTitle,
			String bContent, Date bWrite_date, int bRead_num, String originalFileName, String renameFileName,
			String imagePath, int bItem_no, int rownum) {
		this.bMember_no = bMember_no;
		this.bMember_id = bMember_id;
		this.bEmail = bEmail;
		this.bBoard_code = bBoard_code;
		this.bBoard_no = bBoard_no;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWrite_date = bWrite_date;
		this.bRead_num = bRead_num;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.imagePath = imagePath;
		this.bItem_no = bItem_no;
		this.rownum = rownum;
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

	public String getbEmail() {
		return bEmail;
	}

	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}

	public String getbBoard_code() {
		return bBoard_code;
	}

	public void setbBoard_code(String bBoard_code) {
		this.bBoard_code = bBoard_code;
	}

	public int getbBoard_no() {
		return bBoard_no;
	}

	public void setbBoard_no(int bBoard_no) {
		this.bBoard_no = bBoard_no;
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

	public int getbRead_num() {
		return bRead_num;
	}

	public void setbRead_num(int bRead_num) {
		this.bRead_num = bRead_num;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getbItem_no() {
		return bItem_no;
	}

	public void setbItem_no(int bItem_no) {
		this.bItem_no = bItem_no;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [bMember_no=" + bMember_no + ", bMember_id=" + bMember_id + ", bEmail=" + bEmail
				+ ", bBoard_code=" + bBoard_code + ", bBoard_no=" + bBoard_no + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", bWrite_date=" + bWrite_date + ", bRead_num=" + bRead_num + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + ", imagePath=" + imagePath + ", bItem_no="
				+ bItem_no + ", rownum=" + rownum + "]";
	}
	
	
	
}