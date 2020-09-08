package com.kh.finalGudok.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1771769292145577467L;
	
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
	private String emailStatus;	// 이메일 인증 시 인증상태 확인
	private int point;
	private int gradeNo;
	
	public Member() {}

	public Member(int memberNo, String memberId, String email, String memberPwd, String memberName, String address1,
			String address2, String address3, String gender, Date enrollDate, Date modifyDate, String memberStatus,
			String emailStatus, int point, int gradeNo) {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", email=" + email + ", memberPwd="
				+ memberPwd + ", memberName=" + memberName + ", address1=" + address1 + ", address2=" + address2
				+ ", address3=" + address3 + ", gender=" + gender + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", memberStatus=" + memberStatus + ", emailStatus=" + emailStatus + ", point=" + point
				+ ", gradeNo=" + gradeNo + "]";
	}

}