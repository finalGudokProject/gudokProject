package com.kh.finalGudok.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reply implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5625026094737365573L;
	
	private int reply_no;
	private String reply_content;
	private Date reply_createDate;
	private Date reply_modifyDate;
	private int rBoard_no;
	private int rMember_no;
	private String reply_writer;
	private String rEmail;
	
	public Reply() {
	}

	public Reply(int reply_no, String reply_content, Date reply_createDate, Date reply_modifyDate, int rBoard_no,
			int rMember_no, String reply_writer, String rEmail) {
		this.reply_no = reply_no;
		this.reply_content = reply_content;
		this.reply_createDate = reply_createDate;
		this.reply_modifyDate = reply_modifyDate;
		this.rBoard_no = rBoard_no;
		this.rMember_no = rMember_no;
		this.reply_writer = reply_writer;
		this.rEmail = rEmail;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_createDate() {
		return reply_createDate;
	}

	public void setReply_createDate(Date reply_createDate) {
		this.reply_createDate = reply_createDate;
	}

	public Date getReply_modifyDate() {
		return reply_modifyDate;
	}

	public void setReply_modifyDate(Date reply_modifyDate) {
		this.reply_modifyDate = reply_modifyDate;
	}

	public int getrBoard_no() {
		return rBoard_no;
	}

	public void setrBoard_no(int rBoard_no) {
		this.rBoard_no = rBoard_no;
	}

	public int getrMember_no() {
		return rMember_no;
	}

	public void setrMember_no(int rMember_no) {
		this.rMember_no = rMember_no;
	}

	public String getReply_writer() {
		return reply_writer;
	}

	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}

	public String getrEmail() {
		return rEmail;
	}

	public void setrEmail(String rEmail) {
		this.rEmail = rEmail;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Reply [reply_no=" + reply_no + ", reply_content=" + reply_content + ", reply_createDate="
				+ reply_createDate + ", reply_modifyDate=" + reply_modifyDate + ", rBoard_no=" + rBoard_no
				+ ", rMember_no=" + rMember_no + ", reply_writer=" + reply_writer + ", rEmail=" + rEmail + "]";
	}

	
}
