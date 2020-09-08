package com.kh.finalGudok.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalGudok.item.model.vo.BannerItem;
import com.kh.finalGudok.item.model.vo.Item;
import com.kh.finalGudok.item.model.vo.PageInfo;

import com.kh.finalGudok.member.model.dao.MemberDao;
import com.kh.finalGudok.member.model.vo.AdminBoard;
import com.kh.finalGudok.member.model.vo.AdminExchange;
import com.kh.finalGudok.member.model.vo.AdminMember;
import com.kh.finalGudok.member.model.vo.AdminPayment;
import com.kh.finalGudok.member.model.vo.AdminSecession;
import com.kh.finalGudok.member.model.vo.AdminSubscribe;
import com.kh.finalGudok.member.model.vo.Cancle;
import com.kh.finalGudok.member.model.vo.Cart;
import com.kh.finalGudok.member.model.vo.DeleteHeart;
import com.kh.finalGudok.member.model.vo.Delivery;
import com.kh.finalGudok.member.model.vo.Exchange;
import com.kh.finalGudok.member.model.vo.Grade;
import com.kh.finalGudok.member.model.vo.Heart;
import com.kh.finalGudok.member.model.vo.Inquiry;
import com.kh.finalGudok.member.model.vo.Member;
import com.kh.finalGudok.member.model.vo.Point;
import com.kh.finalGudok.member.model.vo.Reply;
import com.kh.finalGudok.member.model.vo.Review;
import com.kh.finalGudok.member.model.vo.Search;
import com.kh.finalGudok.member.model.vo.Subscribe;
import com.kh.finalGudok.member.model.vo.Withdrawal;

@Service("mService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(m);
	}

	// 마이페이지
	@Override
	public Member confirmMember(Member m) {
		return mDao.confirmMember(m);
	}

	@Override
	public ArrayList<Point> selectPointList(Integer memberNo) {
		return mDao.selectPointList(memberNo);
	}

	@Override
	public ArrayList<Review> selectReviewList(Integer memberNo) {
		return mDao.selectReviewList(memberNo);
	}

	@Override
	public ArrayList<Exchange> selectExchangeList(Integer memberNo) {
		return mDao.selectExchangeList(memberNo);
	}

	@Override
	public int checkIdDup(String memberId) {
		return mDao.checkIdDup(memberId);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public int emailDupCheck(String email) {

		return mDao.emailDupCheck(email);
	}

	@Override
	public ArrayList<Delivery> selectDeliveryList(Integer memberNo) {
		return mDao.selectDeliveryList(memberNo);
	}

	@Override
	public ArrayList<Cart> selectCartList(Integer memberNo) {
		return mDao.selectCartList(memberNo);
	}

	@Override
	public int insertExchange(Exchange e) {
		return mDao.insertExchange(e);
	}

	@Override
	public int updateSubscribe(int subscribeNo) {
		return mDao.updateSubscribe(subscribeNo);
	}

	@Override
	public Review selectReview(int reviewNo) {
		return mDao.selectReview(reviewNo);
	}

	@Override
	public int deleteReview(Integer reviewNo) {
		return mDao.deleteReview(reviewNo);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public int updateMemberStatus(int memberNo) {
		return mDao.updateMemberStatus(memberNo);
	}

	@Override
	public int insertSecession(Withdrawal w) {
		return mDao.insertSecession(w);
	}

	@Override
	public ArrayList<Heart> selectHeartList(Integer memberNo) {
		return mDao.selectHeartList(memberNo);
	}

	@Override
	public int deleteHeart(DeleteHeart dh) {
		return mDao.deleteHeart(dh);
	}

	@Override
	public Item selectItem(int itemNo) {
		return mDao.selectItem(itemNo);
	}

	@Override
	public int addCart(HashMap map) {
		return mDao.addCart(map);
	}

	@Override
	public Reply selectReply(Integer boardNo) {
		return mDao.selectReply(boardNo);
	}

	@Override
	public int deleteCart(HashMap map) {
		return mDao.deleteCart(map);
	}

	@Override
	public int updatePassword(Member m) {
		return mDao.updatePassword(m);
	}

	public String findId(Member m) {

		return mDao.findId(m);
	}

	@Override
	public int checkMember(Member m) {

		return mDao.checkMember(m);
	}

	public ArrayList<Grade> selectGradeList() {
		return mDao.selectGradeList();
	}

	@Override
	public int getMemberCnt() {
		return mDao.selectMemberCnt();
	}

	@Override
	public ArrayList<AdminMember> selectMemberN(PageInfo pi) {
		return mDao.selectMemberN(pi);
	}

	@Override
	public Integer selectGradeCnt(int i) {
		return mDao.selectGradeCnt(i);
	}

	@Override
	public int updateGradeRate(ArrayList<Grade> g) {
		return mDao.updateGradeRate(g);
	}

	@Override
	public int updateGradeMin(ArrayList<Grade> g) {
		return mDao.updateGradeMin(g);
	}

	@Override
	public AdminMember selectOneMember(int memberNo) {
		return mDao.selectOneMember(memberNo);
	}

	@Override
	public ArrayList<AdminPayment> selectMemberPay(int memberNo, PageInfo pi) {
		return mDao.selectMemberPay(memberNo, pi);
	}

	@Override
	public int getMemberPayCnt(int memberNo) {
		return mDao.selectMemberPayCnt(memberNo);
	}

	@Override
	public Integer selectTotalPay(int i) {
		return mDao.selectTotalPay(i);
	}

	@Override
	public int updateMemberA(AdminMember m) {
		return mDao.updateMemberA(m);
	}

	@Override
	public int deleteMemberA(Integer memberNo) {
		return mDao.deleteMemberA(memberNo);
	}

	@Override
	public int deleteMemberSecession(Integer memberNo) {
		return mDao.deleteMemberSecession(memberNo);
	}

	@Override
	public int deleteMemberBoard(Integer memberNo) {
		return mDao.deleteMemberBoard(memberNo);
	}

	@Override
	public int deleteMemberHeart(Integer memberNo) {
		return mDao.deleteMemberHeart(memberNo);
	}

	@Override
	public int deleteMemberCart(Integer memberNo) {
		return mDao.deleteMemberCart(memberNo);
	}

	@Override
	public int deleteMemberReview(Integer memberNo) {
		return mDao.deleteMemberReview(memberNo);
	}

	@Override
	public int deleteMemberPayment(Integer memberNo) {
		return mDao.deleteMemberPayment(memberNo);
	}

	@Override
	public int deleteMemberSubscribe(Integer memberNo) {
		return mDao.deleteMemberSubscribe(memberNo);
	}

	@Override
	public Integer selectSecessionCnt(AdminSecession s) {
		return mDao.selectSecessionCnt(s);
	}

	@Override
	public Integer selectMemberSecessionCnt(AdminSecession s) {
		return mDao.selectMemberSecessionCnt(s);
	}

	@Override
	public ArrayList<AdminSecession> selectMemberSecession(PageInfo pi) {
		return mDao.selectMemberSecession(pi);
	}

	@Override
	public int changePwd(Member m) {

		return mDao.changePwd(m);
	}

	@Override
	public ArrayList<Inquiry> selectInquiryList(Integer memberNo) {
		return mDao.selectInquiryList(memberNo);
	}

	@Override
	public ArrayList<Subscribe> selectSubscribeList(Integer memberNo) {
		return mDao.selectSubscribeList(memberNo);
	}

	@Override
	public int cycleChange(Subscribe subscribe) {
		return mDao.changeCycle(subscribe);
	}

	@Override
	public int insertCancle(Cancle c) {
		return mDao.insertCancle(c);
	}

	@Override
	public int updateSubscribeStatus(int subscribeNo) {
		return mDao.updateSubscribeStatus(subscribeNo);
	}

	@Override
	public int subscribeCount(int memberNo) {
		return mDao.subscribeCount(memberNo);
	}

	@Override
	public int cartCount(int memberNo) {
		return mDao.cartCount(memberNo);
	}

	@Override
	public int pointCount(int memberNo) {
		return mDao.pointCount(memberNo);
	}

	@Override
	public int getMemberCnt(Search s) {
		return mDao.selectMemberCnt(s);
	}

	@Override
	public ArrayList<AdminMember> selectMemberN(Search s, PageInfo pi) {
		return mDao.selectMemberN(s, pi);
	}

	@Override
	public ArrayList<AdminSecession> selectMemberSecession(Search s, PageInfo pi) {
		return mDao.selectMemberSecession(s,pi);
	}

	@Override
	public int getMemberCntY(Search s) {
		return mDao.selectMemberCntY(s);
	}

	@Override
	public int getOrderCnt(Search s) {
		return mDao.selectOrderCnt(s);
	}

	@Override
	public ArrayList<AdminSubscribe> selectOrderList(Search s, PageInfo pi) {
		return mDao.selectOrderList(s, pi);
	}

	@Override
	public int updateDelivery(ArrayList<AdminSubscribe> dArr) {
		return mDao.updateDelivery(dArr);
	}

	@Override
	public AdminSubscribe selectOrder(Integer subscribeNo) {
		return mDao.selectOrder(subscribeNo);
	}

	@Override
	public int selectItemTotalP(Integer subscribeNo) {
		return mDao.selectItemTotalP(subscribeNo);
	}

	@Override
	public AdminPayment selectPayment(Integer subscribeNo) {
		return mDao.selectPayment(subscribeNo);
	}

	@Override
	public int selectTotalPayment(Integer subscribeNo) {
		return mDao.selectTotalPayment(subscribeNo);
	}

	@Override
	public Integer selectExchangeChart(Search search) {
		return mDao.selectExchangChart(search);
	}

	@Override
	public int updateSubscribeA(Integer subscribeNo) {
		return mDao.updateSubscribeA(subscribeNo);
	}

	@Override
	public ArrayList<AdminExchange> selectExchange(Search s, PageInfo pi) {
		return mDao.selectExchangeList(s, pi);
	}

	@Override
	public int updateExchange(ArrayList<AdminExchange> dArr) {
		return mDao.updateExchange(dArr);
	}

	@Override
	public ArrayList<String> selectDateList(Search s) {
		return mDao.selectDateList(s);
	}

	@Override
	public ArrayList<AdminPayment> selectPaymentList(ArrayList<String> pArr, PageInfo pi) {
		return mDao.selectPaymentList(pArr, pi);
	}

	@Override
	public ArrayList<AdminPayment> selectPaymentList(ArrayList<String> pArr) {
		return mDao.selectPaymentList(pArr);
	}

	@Override
	public int getSalesCnt(Search s) {
		return mDao.selectSalesCnt(s);
	}

	@Override
	public ArrayList<String> selectYearList(Search s) {
		return mDao.selecYearList(s);
	}

	@Override
	public int getSalesYearCnt(ArrayList<String> pArr) {
		return mDao.selectYearCnt(pArr);
	}

	@Override
	public ArrayList<AdminPayment> selectPaymentYearsList(ArrayList<String> pArr, PageInfo pi) {
		return mDao.selectPaymentYearsList(pArr, pi);
	}

	@Override
	public ArrayList<AdminPayment> selectPaymentYearsList(ArrayList<String> pArr) {
		return mDao.selectPaymentYearsList(pArr);
	}

	@Override
	public int getSalesMonthsCnt(ArrayList<String> pArr) {
		return mDao.selectMonthsCnt(pArr);
	}

	@Override
	public ArrayList<AdminPayment> selectPaymentMonthsList(ArrayList<String> pArr, PageInfo pi) {
		return mDao.selectPaymentMonthsList(pArr, pi);
	}

	@Override
	public ArrayList<AdminPayment> selectPaymentMonthsList(ArrayList<String> pArr) {
		return mDao.selectPaymentMonthsList(pArr);
	}

	@Override
	public ArrayList<String> selectMonthList(Search s) {
		return mDao.selecMonthList(s);
	}

	@Override
	public AdminPayment selectPaymentCategoryList(Search cat) {
		return mDao.selectPaymentCategoryList(cat);
	}

	@Override
	public int getSalesDetailCnt(Search s) {
		return mDao.selectSalesDetailCnt(s);
	}

	@Override
	public ArrayList<AdminPayment> selectPaymentDetail(Search s, PageInfo pi) {
		return mDao.selectPaymentDetail(s, pi);
	}

	@Override
	public int selectTodayMember(String s) {
		return mDao.selectTodayMember(s);
	}

	@Override
	public int selectTodayVisitor(String s) {
		return mDao.selectTodayVisitor(s);
	}

	@Override
	public AdminPayment selectPaymentMainList(String s) {
		return mDao.selectPaymentMainList(s);
	}

	@Override
	public ArrayList<AdminExchange> selectExchangeMain() {
		return mDao.selectExchangeMain();
	}

	@Override
	public ArrayList<AdminBoard> selectBoardMain() {
		return mDao.selectBoardMain();
	}

	@Override
	public ArrayList<AdminBoard> selectNoticeMain() {
		return mDao.selectNoticeMain();
	}

	@Override
	public ArrayList<BannerItem> selectEventMain() {
		return mDao.selectEventMain();
	}

	@Override
	public int getExchangeCnt(Search s) {
		return mDao.selectExchangeCnt(s);
	}

	@Override
	public ArrayList<AdminSubscribe> selectDeliveryMain() {
		return mDao.selectDeliveryMain();
	}

	@Override
	public int deleteReviewImage(int reviewNo) {
		return mDao.deleteReviewImage(reviewNo);
	}

	@Override
	public int checkImage(int reviewNo) {
		return mDao.checkImage(reviewNo);
	}

	@Override
	public int imageDelete(int reviewNo) {
		return mDao.imageDelete(reviewNo);
	}

	@Override
	public int updateItemCmStatus(ArrayList<AdminSubscribe> dArr) {
		return mDao.updateItemCmStatus(dArr);
	}

	@Override
	public int updateMemberPoint(AdminSubscribe adminSubscribe) {
		return mDao.updateMemberPoint(adminSubscribe);
	}

	@Override
	public int selectPoint(int subscribeNo) {
		return mDao.selectPoint(subscribeNo);
	}



}
