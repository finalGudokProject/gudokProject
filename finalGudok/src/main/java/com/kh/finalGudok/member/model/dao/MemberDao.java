package com.kh.finalGudok.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalGudok.item.model.vo.BannerItem;
import com.kh.finalGudok.item.model.vo.Item;
import com.kh.finalGudok.item.model.vo.PageInfo;
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
import com.kh.finalGudok.member.model.vo.Visitor;
import com.kh.finalGudok.member.model.vo.Withdrawal;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Member loginMember(Member m) {
		return sqlSessionTemplate.selectOne("memberMapper.selectOne", m);
	}

	// 마이페이지
	public Member confirmMember(Member m) {
		return sqlSessionTemplate.selectOne("memberMapper.memberConfirm", m);
	}

	public ArrayList<Point> selectPointList(Integer memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.pointList", memberNo);
	}

	public ArrayList<Review> selectReviewList(Integer memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.reviewList", memberNo);
	}

	public ArrayList<Exchange> selectExchangeList(Integer memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.exchangeList", memberNo);
	}

	public ArrayList<Delivery> selectDeliveryList(Integer memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.deliveryList", memberNo);
	}

	public ArrayList<Cart> selectCartList(Integer memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.cartList", memberNo);
	}

	public int insertExchange(Exchange e) {
		return sqlSessionTemplate.insert("memberMapper.insertExchange", e);
	}

	public int checkIdDup(String memberId) {
		return sqlSessionTemplate.selectOne("memberMapper.idCheck", memberId);
	}

	public int insertMember(Member m) {
		return sqlSessionTemplate.insert("memberMapper.insertMember", m);
	}

	public int emailDupCheck(String email) {
		return sqlSessionTemplate.selectOne("memberMapper.emailDupCheck", email);
	}

	public String findId(Member m) {
		return sqlSessionTemplate.selectOne("memberMapper.findId", m);
	}

	public int checkMember(Member m) {

		return sqlSessionTemplate.selectOne("memberMapper.checkMember", m);
	}

	public int changePwd(Member m) {

		return sqlSessionTemplate.update("memberMapper.changePwd", m);
	}

	public int updateSubscribe(int subscribeNo) {
		return sqlSessionTemplate.update("memberMapper.updateSubscribe", subscribeNo);
	}

	public Review selectReview(int reviewNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectReview", reviewNo);
	}

	public int deleteReview(Integer reviewNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteReview", reviewNo);
	}

	public int updateMember(Member m) {
		return sqlSessionTemplate.update("memberMapper.updateMember", m);
	}

	public int insertSecession(Withdrawal w) {
		return sqlSessionTemplate.insert("memberMapper.insertSecession", w);
	}

	public int updateMemberStatus(int memberNo) {
		return sqlSessionTemplate.update("memberMapper.updateMemberStatus", memberNo);
	}

	public ArrayList<Inquiry> selectInquiryList(Integer memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectInquiryList", memberNo);
	}

	public ArrayList<Heart> selectHeartList(Integer memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectHeartList", memberNo);
	}

	public int deleteHeart(DeleteHeart dh) {
		return sqlSessionTemplate.delete("memberMapper.deleteHeart", dh);
	}

	public Item selectItem(int itemNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectItem", itemNo);
	}

	public int addCart(HashMap map) {
		return sqlSessionTemplate.insert("memberMapper.insertCart", map);
	}

	public Reply selectReply(Integer boardNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectReply", boardNo);
	}

	public int deleteCart(HashMap map) {
		return sqlSessionTemplate.delete("memberMapper.deleteCart", map);
	}

	public int updatePassword(Member m) {
		return sqlSessionTemplate.update("memberMapper.updatePassword", m);
	}

	public ArrayList<Grade> selectGradeList() {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectGradeList");
	}

	public int selectMemberCnt() {
		return sqlSessionTemplate.selectOne("memberMapper.selectMemberCnt");
	}

	public ArrayList<AdminMember> selectMemberN(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectMemberN", null, rowBounds);
	}

	public ArrayList<AdminSecession> selectMemberSecession(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectMemberSecession", null, rowBounds);
	}

	public ArrayList<Subscribe> selectSubscribeList(Integer memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectSubscribeList", memberNo);
	}

	public int changeCycle(Subscribe subscribe) {
		return sqlSessionTemplate.update("memberMapper.changeCycle", subscribe);
	}

	public int insertCancle(Cancle c) {
		return sqlSessionTemplate.update("memberMapper.insertCancle", c);
	}

	public int updateSubscribeStatus(int subscribeNo) {
		return sqlSessionTemplate.update("memberMapper.subscribeStatus", subscribeNo);
	}

	public int subscribeCount(int memberNo) {
		return sqlSessionTemplate.selectOne("memberMapper.subscribeCount", memberNo);
	}

	public int cartCount(int memberNo) {
		return sqlSessionTemplate.selectOne("memberMapper.cartCount", memberNo);
	}

	public int pointCount(int memberNo) {
		return sqlSessionTemplate.selectOne("memberMapper.pointCount", memberNo);
	}

	public int selectMemberCnt(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMemberCnt", s);
	}

	public Integer selectGradeCnt(int i) {
		return sqlSessionTemplate.selectOne("memberMapper.selectGradeCnt", i);
	}

	public ArrayList<AdminMember> selectMemberN(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectMemberN", s, rowBounds);
	}

	public int updateGradeRate(ArrayList<Grade> g) {
		return sqlSessionTemplate.update("memberMapper.updateGradeRate", g);
	}

	public int updateGradeMin(ArrayList<Grade> g) {
		return sqlSessionTemplate.update("memberMapper.updateGradeMin", g);
	}

	public AdminMember selectOneMember(int memberNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectOneMember", memberNo);
	}

	public ArrayList<AdminPayment> selectMemberPay(int memberNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectMemberPay", memberNo, rowBounds);
	}

	public int selectMemberPayCnt(int memberNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMemberPayCnt", memberNo);
	}

	public Integer selectTotalPay(int i) {
		return sqlSessionTemplate.selectOne("memberMapper.selectTotalPay", i);
	}

	public int updateMemberA(AdminMember m) {
		return sqlSessionTemplate.update("memberMapper.updateMemberA", m);
	}

	public int deleteMemberA(Integer memberNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteMemberA", memberNo);
	}

	public int deleteMemberSecession(Integer memberNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteMemberSecession", memberNo);
	}

	public int deleteMemberBoard(Integer memberNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteMemberBoard", memberNo);
	}

	public int deleteMemberHeart(Integer memberNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteMemberHeart", memberNo);
	}

	public int deleteMemberCart(Integer memberNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteMemberCart", memberNo);
	}

	public int deleteMemberReview(Integer memberNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteMemberReview", memberNo);
	}

	public int deleteMemberPayment(Integer memberNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteMemberPayment", memberNo);
	}

	public int deleteMemberSubscribe(Integer memberNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteMemberSubscribe", memberNo);
	}

	public Integer selectSecessionCnt(AdminSecession s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectSecessionCnt", s);
	}

	public Integer selectMemberSecessionCnt(AdminSecession s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMemberSecessionCnt", s);
	}

	public ArrayList<AdminSecession> selectMemberSecession(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectMemberSecession", s, rowBounds);
	}

	public ArrayList<AdminSubscribe> selectOrderList(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectOrderList", s, rowBounds);
	}

	public int selectOrderCnt(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectOrderCnt", s);
	}

	public int updateDelivery(ArrayList<AdminSubscribe> dArr) {
		return sqlSessionTemplate.update("memberMapper.updateDelivery", dArr);
	}

	public AdminSubscribe selectOrder(int subscribeNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectOrder", subscribeNo);
	}

	public AdminPayment selectPayment(int subscribeNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectPayment", subscribeNo);
	}

	public int selectTotalPayment(int subscribeNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectTotalPayment", subscribeNo);
	}

	public int selectItemTotalP(int subscribeNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectItemTotalP", subscribeNo);
	}

	public int updateSubscribeA(Integer subscribeNo) {
		return sqlSessionTemplate.update("memberMapper.updateSubscribeA", subscribeNo);
	}

	public Integer selectExchangChart(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectExchangeChart", s);
	}

	public ArrayList<AdminExchange> selectExchangeList(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectExchangeList", s, rowBounds);
	}

	public int updateExchange(ArrayList<AdminExchange> dArr) {
		return sqlSessionTemplate.update("memberMapper.updateExchangeStatus", dArr);
	}

	public ArrayList<String> selectDateList(Search s) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectDateList", s);
	}

	public ArrayList<AdminPayment> selectPaymentList(ArrayList<String> pArr, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentList", pArr, rowBounds);
	}

	public ArrayList<AdminPayment> selectPaymentList(ArrayList<String> pArr) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentList", pArr);
	}

	public int selectSalesCnt(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectSalesCnt", s);
	}

	public ArrayList<String> selecYearList(Search s) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectYearList", s);
	}

	public int selectYearCnt(ArrayList<String> pArr) {
		return sqlSessionTemplate.selectOne("memberMapper.selectSalesYearCnt", pArr);
	}

	public ArrayList<AdminPayment> selectPaymentYearsList(ArrayList<String> pArr, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentYearsList", pArr, rowBounds);
	}

	public ArrayList<AdminPayment> selectPaymentYearsList(ArrayList<String> pArr) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentYearsList", pArr);
	}

	public int selectMonthsCnt(ArrayList<String> pArr) {
		return sqlSessionTemplate.selectOne("memberMapper.selectSalesMonthsCnt", pArr);
	}

	public ArrayList<AdminPayment> selectPaymentMonthsList(ArrayList<String> pArr, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentMonthsList", pArr, rowBounds);
	}

	public ArrayList<AdminPayment> selectPaymentMonthsList(ArrayList<String> pArr) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentMonthsList", pArr);
	}

	public ArrayList<String> selecMonthList(Search s) {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectMonthList", s);
	}

	public int selectMemberCntY(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMemberCntY", s);
	}

	public AdminPayment selectPaymentCategoryList(Search cat) {
		return sqlSessionTemplate.selectOne("memberMapper.selectPaymentCategoryList", cat);
	}

	public int selectSalesDetailCnt(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectSalesDetailCnt", s);
	}

	public int selectSalesDetailCntM(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectSalesDetailCntM", s);
	}

	public int selectSalesDetailCntY(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectSalesDetailCntY", s);
	}

	public ArrayList<AdminPayment> selectPaymentDetail(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentDetail", s, rowBounds);
	}

	public ArrayList<AdminPayment> selectPaymentDetailM(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentDetailM", s, rowBounds);
	}

	public ArrayList<AdminPayment> selectPaymentDetailY(Search s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectPaymentDetailY", s, rowBounds);
	}

	public int insertVisitor(Visitor vo) {
		return sqlSessionTemplate.insert("memberMapper.insertVisitor", vo);
	}

	public int getVisitTodayCount() {
		return sqlSessionTemplate.selectOne("memberMapper.getVisitTodayCount");
	}

	public int getVisitTotalCount() {
		return sqlSessionTemplate.selectOne("memberMapper.getVisitTotalCount");
	}

	public int selectTodayMember(String s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectTodayMember", s);
	}

	public int selectTodayVisitor(String s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectTodayVisitor", s);
	}

	public AdminPayment selectPaymentMainList(String s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectPaymentMainList", s);
	}

	public ArrayList<AdminExchange> selectExchangeMain() {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectExchangeMain");
	}

	public ArrayList<AdminSubscribe> selectDeliveryMain() {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectDeliveryMain");
	}

	public ArrayList<AdminBoard> selectBoardMain() {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectBoardMain");
	}

	public ArrayList<AdminBoard> selectNoticeMain() {
		return (ArrayList) sqlSessionTemplate.selectList("memberMapper.selectNoticeMain");
	}

	public ArrayList<BannerItem> selectEventMain() {
		return (ArrayList) sqlSessionTemplate.selectList("adminItemMapper.selectEventMain");
	}

	public int selectExchangeCnt(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectExchangeCnt");
	}

	public ArrayList<AdminSecession> selectMemberSecessionCnt(Search s) {
		return sqlSessionTemplate.selectOne("memberMapper.selectMemberSecessionCnt", s);
	}


	public int deleteReviewImage(int reviewNo) {
		return sqlSessionTemplate.delete("memberMapper.deleteReviewImage", reviewNo);
	}

	public int checkImage(int reviewNo) {
		return sqlSessionTemplate.selectOne("memberMapper.checkImage", reviewNo);
	}

	public int imageDelete(int reviewNo) {
		return sqlSessionTemplate.delete("memberMapper.imageDelete", reviewNo);
	}

	public int updateItemCmStatus(ArrayList<AdminSubscribe> dArr) {
		return sqlSessionTemplate.update("memberMapper.updateItemCmStatus",dArr);
	}

	public int updateMemberPoint(AdminSubscribe adminSubscribe) {
		return sqlSessionTemplate.update("memberMapper.updateMemberPoint",adminSubscribe);
	}

	public int selectPoint(int subscribeNo) {
		return sqlSessionTemplate.selectOne("memberMapper.selectPoint",subscribeNo);
	}
}