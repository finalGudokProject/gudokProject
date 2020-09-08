package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AdminMember implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1465096400896381037L;
	private int memberNo;
	private String memberId;
	private String email;
	private String memberPwd;
	private String memberName;
	private String address1;
	private String address2;
	private String address3;
	private String gender;
	private Date enrollDate;
	private Date modifyDate;
	private String memberStatus;
	private String emailStatus;	
	private int point;
	private int gradeNo;
	private int totalPay; //총 결제금액
	private Date secessionDate;
	private String secessionContent;
	
	
	
	
	public AdminMember() {}




	public AdminMember(int memberNo, String memberId, String email, String memberPwd, String memberName,
			String address1, String address2, String address3, String gender, Date enrollDate, Date modifyDate,
			String memberStatus, String emailStatus, int point, int gradeNo, int totalPay, Date secessionDate,
			String secessionContent) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.email = email;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.memberStatus = memberStatus;
		this.emailStatus = emailStatus;
		this.point = point;
		this.gradeNo = gradeNo;
		this.totalPay = totalPay;
		this.secessionDate = secessionDate;
		this.secessionContent = secessionContent;
	}




	public int getMemberNo() {
		return memberNo;
	}




	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}




	public String getMemberId() {
		return memberId;
	}




	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getMemberPwd() {
		return memberPwd;
	}




	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}




	public String getMemberName() {
		return memberName;
	}




	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}




	public String getAddress1() {
		return address1;
	}




	public void setAddress1(String address1) {
		this.address1 = address1;
	}




	public String getAddress2() {
		return address2;
	}




	public void setAddress2(String address2) {
		this.address2 = address2;
	}




	public String getAddress3() {
		return address3;
	}




	public void setAddress3(String address3) {
		this.address3 = address3;
	}




	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	public Date getEnrollDate() {
		return enrollDate;
	}




	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}




	public Date getModifyDate() {
		return modifyDate;
	}




	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}




	public String getMemberStatus() {
		return memberStatus;
	}




	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}




	public String getEmailStatus() {
		return emailStatus;
	}




	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}




	public int getPoint() {
		return point;
	}




	public void setPoint(int point) {
		this.point = point;
	}




	public int getGradeNo() {
		return gradeNo;
	}




	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}




	public int getTotalPay() {
		return totalPay;
	}




	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}




	public Date getSecessionDate() {
		return secessionDate;
	}




	public void setSecessionDate(Date secessionDate) {
		this.secessionDate = secessionDate;
	}




	public String getSecessionContent() {
		return secessionContent;
	}




	public void setSecessionContent(String secessionContent) {
		this.secessionContent = secessionContent;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	@Override
	public String toString() {
		return "AdminMember [memberNo=" + memberNo + ", memberId=" + memberId + ", email=" + email + ", memberPwd="
				+ memberPwd + ", memberName=" + memberName + ", address1=" + address1 + ", address2=" + address2
				+ ", address3=" + address3 + ", gender=" + gender + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", memberStatus=" + memberStatus + ", emailStatus=" + emailStatus + ", point=" + point
				+ ", gradeNo=" + gradeNo + ", totalPay=" + totalPay + ", secessionDate=" + secessionDate
				+ ", secessionContent=" + secessionContent + "]";
	}

}