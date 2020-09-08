package com.kh.finalGudok.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalGudok.board.model.dao.BoardDao;
import com.kh.finalGudok.board.model.vo.Board;
import com.kh.finalGudok.board.model.vo.EventBoard;
import com.kh.finalGudok.board.model.vo.Inquiry;
import com.kh.finalGudok.board.model.vo.Search;
import com.kh.finalGudok.board.model.vo.bPageInfo;
import com.kh.finalGudok.board.model.vo.secret;

@Service("bService")
public class BoardSerivceImpl implements BoardService {
	@Autowired
	BoardDao bDao;

	// 리스트 불러오기
	// notice
	@Override
	public int getListCountNotice() {
		return bDao.getListCountNotice();
	}

	@Override
	public ArrayList<Board> selectListNotice(bPageInfo pi) {
		return bDao.selectListNotice(pi);
	}

	// FAQ
	@Override
	public int getListCountFAQ() {
		return bDao.getListCountFAQ();
	}

	@Override
	public ArrayList<Board> selectListFAQ(bPageInfo pi) {
		return bDao.selectListFAQ(pi);
	}

	// ProductProposal
	@Override
	public int getListCountProductProposal() {
		return bDao.getListCountProductProposal();
	}

	@Override
	public ArrayList<Board> selectListProductProposal(bPageInfo pi) {
		return bDao.selectListProductProposal(pi);
	}

	// inquiry
	@Override
	public int getListCountInquiry() {
		return bDao.getListCountInquiry();
	}

	@Override
	public ArrayList<Board> selectListInquiry1(bPageInfo pi) {
		return bDao.selectListInquiry1(pi);
	}

	@Override
	public ArrayList<secret> selectListInquiry2(bPageInfo pi) {
		return bDao.selectListInquiry2(pi);
	}

	@Override
	public ArrayList<Inquiry> selectListInquiry3(bPageInfo pi) {
		return bDao.selectListInquiry3(pi);
	}

	
	
	// Event
	@Override
	public int getListCountEvent() {
		return bDao.getListCountEvent();
	}
	
	@Override
	public ArrayList<Board> selectListEvent1(bPageInfo pi) {
		return bDao.selectListEvent1(pi);
	}

	@Override
	public ArrayList<EventBoard> selectListEvent2(bPageInfo pi) {
		return bDao.selectListEvent2(pi);
	}
	
	// Count
	@Override
	public int addReadCount(int bBoard_no) {
		return bDao.addReadCount(bBoard_no);
	}

	// Insert 글 등록
	@Override
	public int insertImage(Board b) {
		return bDao.insertImage(b);
	}

	@Override
	public int insertNotice(Board b) {
		return bDao.insertNotice(b);
	}

	@Override
	public int insertFAQ(Board b) {
		return bDao.insertFAQ(b);
	}

	@Override
	public int insertProductProposal(Board b) {
		return bDao.insertProductProposal(b);
	}

	@Override
	public int insertInquiry1(Board b) {
		return bDao.insertInquiry1(b);
	}
	
	@Override
	public int insertInquiry2(secret s) {
		return bDao.insertInquiry2(s);
	}
	
	@Override
	public int insertInquiry3(Inquiry i) {
		return bDao.insertInquiry3(i);
	}
	
	@Override
	public int insertEvent1(Board b) {
		return bDao.insertEvent1(b);
	}

	@Override
	public int insertEvent2(EventBoard e) {
		return bDao.insertEvent2(e);
	}
	
	
	// Detail 세부내용
	@Override
	public Board selectDetail(int bBoard_no) {
		return bDao.selectDetail(bBoard_no);
	}

	@Override
	public Board selectIDetail(int bBoard_no) {
		return bDao.selectIDetail(bBoard_no);
	}

	@Override
	public Board selectOIDetail1(int bBoard_no) {
		return bDao.selectOIDetail1(bBoard_no);
	}
	
	@Override
	public secret selectOIDetail2(int bBoard_no) {
		return bDao.selectOIDetail2(bBoard_no);
	}

	@Override
	public Inquiry selectOIDetail3(int bBoard_no) {
		return bDao.selectOIDetail3(bBoard_no);
	}
	
	@Override
	public EventBoard selectEDetail(int bBoard_no) {
		return bDao.selectEDetail(bBoard_no);
	}

	
	// Update 수정
	@Override
	public int updateImage(Board b) {
		return bDao.updateImage(b);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(b);
	}
	
	@Override
	public int updateOneInquiry(secret s) {
		return bDao.updateOneInquiry(s);
	}

	@Override
	public int updateInquiry(Inquiry i) {
		return bDao.updateInquiry(i);
	}
	
	@Override
	public int updateInquiryAnswer1(Inquiry i) {
		return bDao.updateInquiryAnswer1(i);
	}

	// Delete 삭제
	@Override
	public int deleteImage(Integer bBoard_no) {
		return bDao.deleteImage(bBoard_no);
	}

	@Override
	public int deleteBoardImage(Integer bBoard_no) {
		return bDao.deleteBoardImage(bBoard_no);
	}

	@Override
	public int deleteBoard(Integer bBoard_no) {
		return bDao.deleteBoard(bBoard_no);
	}

	@Override
	public int deleteOneInquiryBoard(Integer bBoard_no) {
		return bDao.deleteOneInquiryBoard(bBoard_no);
	}

	@Override
	public int deleteInquiryBoard(Integer bBoard_no) {
		return bDao.deleteInquiryBoard(bBoard_no);
	}

	@Override
	public int deleteEventBoard(Integer bBoard_no) {
		return bDao.deleteEventBoard(bBoard_no);
	}

	
	// 비밀글 비밀번호 밍치
	@Override
	public String selectInquiryPwd(int bBoard_no) {
		return bDao.selectInquiryPwd(bBoard_no);
	}

	// 이벤트 게시물 게시, 중지
	@Override
	public int updateEventStatusY(ArrayList<EventBoard> eventArr) {
		return bDao.updateEventStatusY(eventArr);
	}

	@Override
	public int updateEventStatusN(ArrayList<EventBoard> eventArr) {
		return bDao.updateEventStatusN(eventArr);
	}

	@Override
	public Board selectDeleteBoard(int i) {
		return bDao.selectDeleteBoard(i);
	}

	// 검색

	// Notice
	@Override
	public ArrayList<Board> selectSearchListNotice(bPageInfo pi, Search search) {
		return bDao.selectSearchListNotice(pi, search);
	}
	
	// FAQ
	@Override
	public ArrayList<Board> selectSearchListFAQ(bPageInfo pi, Search search) {
		return bDao.selectSearchListFAQ(pi, search);
	}
	
	// ProductProposal
	@Override
	public ArrayList<Board> selectSearchListProductProposal(bPageInfo pi, Search search) {
		return bDao.selectSearchListProductProposal(pi, search);
	}

	// Inquiry
	@Override
	public ArrayList<Board> selectSearchListInquiry1(bPageInfo pi, Search search) {
		return bDao.selectSearchListInquiry1(pi, search);
	}

	@Override
	public ArrayList<secret> selectSearchListInquiry2(bPageInfo pi, Search search) {
		return bDao.selectSearchListInquiry2(pi, search);
	}

	@Override
	public ArrayList<Inquiry> selectSearchListInquiry3(bPageInfo pi, Search search) {
		return bDao.selectSearchListInquiry3(pi, search);
	}
	
	// Inquiry ServiceCenter
	@Override
	public ArrayList<Board> selectSearchListsInquiry1(bPageInfo pi, Search search) {
		return bDao.selectSearchListsInquiry1(pi, search);
	}

	@Override
	public ArrayList<secret> selectSearchListsInquiry2(bPageInfo pi, Search search) {
		return bDao.selectSearchListsInquiry2(pi, search);
	}

	@Override
	public ArrayList<Inquiry> selectSearchListsInquiry3(bPageInfo pi, Search search) {
		return bDao.selectSearchListsInquiry3(pi, search);
	}

	// Event

	@Override
	public int getListCountEventSearch() {
		return bDao.getListCountEventSearch();
	}

	@Override
	public ArrayList<Board> selectSearchListEvent1(bPageInfo pi,  Search search) {
		return bDao.selectSearchListEvent1(pi, search);
	}

	@Override
	public ArrayList<EventBoard> selectSearchListEvent2(bPageInfo pi,  Search search) {
		return bDao.selectSearchListEvent2(pi, search);
	}

	

	

	


	

	


	

	

	

	

	

	

	

	

	

	

	
	
	
	

}
