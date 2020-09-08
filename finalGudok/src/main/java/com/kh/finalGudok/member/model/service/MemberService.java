package com.kh.finalGudok.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalGudok.item.model.vo.Item;
import com.kh.finalGudok.item.model.vo.PageInfo;
import com.kh.finalGudok.member.model.vo.Cart;
import com.kh.finalGudok.member.model.vo.DeleteHeart;
import com.kh.finalGudok.member.model.vo.Delivery;
import com.kh.finalGudok.member.model.vo.Exchange;
import com.kh.finalGudok.member.model.vo.Grade;
import com.kh.finalGudok.member.model.vo.Heart;
import com.kh.finalGudok.member.model.vo.Member;
import com.kh.finalGudok.member.model.vo.Point;
import com.kh.finalGudok.member.model.vo.Reply;
import com.kh.finalGudok.member.model.vo.Review;
import com.kh.finalGudok.member.model.vo.Search;
import com.kh.finalGudok.member.model.vo.Subscribe;
import com.kh.finalGudok.member.model.vo.Withdrawal;
import com.kh.finalGudok.member.model.vo.AdminBoard;
import com.kh.finalGudok.item.model.vo.BannerItem;
import com.kh.finalGudok.member.model.vo.AdminExchange;
import com.kh.finalGudok.member.model.vo.AdminMember;
import com.kh.finalGudok.member.model.vo.AdminPayment;
import com.kh.finalGudok.member.model.vo.AdminSecession;
import com.kh.finalGudok.member.model.vo.AdminSubscribe;
import com.kh.finalGudok.member.model.vo.Cancle;
import com.kh.finalGudok.member.model.vo.Inquiry;

public interface MemberService {

	Member loginMember(Member m);

	// 마이페이지
	Member confirmMember(Member m);

	ArrayList<Point> selectPointList(Integer memberNo);

	ArrayList<Review> selectReviewList(Integer memberNo);

	ArrayList<Exchange> selectExchangeList(Integer memberNo);

	ArrayList<Delivery> selectDeliveryList(Integer memberNo);

	ArrayList<Cart> selectCartList(Integer memberNo);

	int insertExchange(Exchange e);

	int checkIdDup(String id);

	int insertMember(Member m);

	int emailDupCheck(String email);

	int updateSubscribe(int subscribeNo);

	Review selectReview(int reviewNo);

	int deleteReview(Integer reviewNo);

	int updateMember(Member m);

	int insertSecession(Withdrawal w);

	int updateMemberStatus(int memberNo);

	ArrayList<Inquiry> selectInquiryList(Integer memberNo);

	ArrayList<Heart> selectHeartList(Integer memberNo);

	int deleteHeart(DeleteHeart dh);

	Item selectItem(int itemNo);

	int addCart(HashMap map);

	Reply selectReply(Integer boardNo);

	int deleteCart(HashMap map);

	int updatePassword(Member m);

	ArrayList<Grade> selectGradeList();

	int getMemberCnt();

	Integer selectGradeCnt(int i);

	ArrayList<AdminMember> selectMemberN(PageInfo pi);

	int updateGradeRate(ArrayList<Grade> g);

	int updateGradeMin(ArrayList<Grade> g);

	AdminMember selectOneMember(int memberNo);

	ArrayList<AdminPayment> selectMemberPay(int memberNo, PageInfo pi);

	int getMemberPayCnt(int memberNo);

	Integer selectTotalPay(int i);

	int updateMemberA(AdminMember m);

	int deleteMemberA(Integer memberNo);

	int deleteMemberSecession(Integer memberNo);

	int deleteMemberBoard(Integer memberNo);

	int deleteMemberHeart(Integer memberNo);

	int deleteMemberCart(Integer memberNo);

	int deleteMemberReview(Integer memberNo);

	int deleteMemberPayment(Integer memberNo);

	int deleteMemberSubscribe(Integer memberNo);

	Integer selectSecessionCnt(AdminSecession s);

	Integer selectMemberSecessionCnt(AdminSecession s);

	ArrayList<AdminSecession> selectMemberSecession(PageInfo pi);

	String findId(Member m);

	int checkMember(Member m);

	int changePwd(Member m);

	ArrayList<Subscribe> selectSubscribeList(Integer memberNo);

	int cycleChange(Subscribe subscribe);

	int insertCancle(Cancle c);

	int updateSubscribeStatus(int subscribeNo);

	int subscribeCount(int memberNo);

	int cartCount(int memberNo);

	int pointCount(int memberNo);

	int getMemberCnt(Search s);

	ArrayList<AdminMember> selectMemberN(Search s, PageInfo pi);

	ArrayList<AdminSecession> selectMemberSecession(Search s, PageInfo pi);

	int getMemberCntY(Search s);

	int getOrderCnt(Search s);

	ArrayList<AdminSubscribe> selectOrderList(Search s, PageInfo pi);

	int updateDelivery(ArrayList<AdminSubscribe> dArr);

	AdminSubscribe selectOrder(Integer subscribeNo);

	int selectItemTotalP(Integer subscribeNo);

	AdminPayment selectPayment(Integer subscribeNo);

	int selectTotalPayment(Integer subscribeNo);

	Integer selectExchangeChart(Search search);

	int updateSubscribeA(Integer subscribeNo);

	ArrayList<AdminExchange> selectExchange(Search s, PageInfo pi);

	int getExchangeCnt(Search s);

	int updateExchange(ArrayList<com.kh.finalGudok.member.model.vo.AdminExchange> dArr);

	ArrayList<String> selectDateList(Search s);

	int getSalesCnt(Search s);

	ArrayList<AdminPayment> selectPaymentList(ArrayList<String> pArr, PageInfo pi);

	ArrayList<AdminPayment> selectPaymentList(ArrayList<String> pArr);

	ArrayList<String> selectYearList(Search s);

	int getSalesYearCnt(ArrayList<String> pArr);

	ArrayList<AdminPayment> selectPaymentYearsList(ArrayList<String> pArr, PageInfo pi);

	ArrayList<AdminPayment> selectPaymentYearsList(ArrayList<String> pArr);

	ArrayList<String> selectMonthList(Search s);

	int getSalesMonthsCnt(ArrayList<String> pArr);

	ArrayList<AdminPayment> selectPaymentMonthsList(ArrayList<String> pArr, PageInfo pi);

	ArrayList<AdminPayment> selectPaymentMonthsList(ArrayList<String> pArr);

	AdminPayment selectPaymentCategoryList(Search search);

	int getSalesDetailCnt(Search s);

	ArrayList<AdminPayment> selectPaymentDetail(Search s, PageInfo pi);

	int selectTodayMember(String string);

	int selectTodayVisitor(String string);

	AdminPayment selectPaymentMainList(String string);

	ArrayList<AdminExchange> selectExchangeMain();

	ArrayList<AdminSubscribe> selectDeliveryMain();

	ArrayList<AdminBoard> selectBoardMain();

	ArrayList<AdminBoard> selectNoticeMain();

	ArrayList<BannerItem> selectEventMain();

	int deleteReviewImage(int reviewNo);

	int checkImage(int reviewNo);

	int imageDelete(int reviewNo);

	int updateItemCmStatus(ArrayList<AdminSubscribe> dArr);

	int updateMemberPoint(AdminSubscribe adminSubscribe);

	int selectPoint(int subscribeNo);

}