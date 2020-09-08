package com.kh.finalGudok.board.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.finalGudok.board.model.vo.Board;
import com.kh.finalGudok.board.model.vo.EventBoard;
import com.kh.finalGudok.board.model.vo.Inquiry;
import com.kh.finalGudok.board.model.vo.Search;
import com.kh.finalGudok.board.model.vo.bPageInfo;
import com.kh.finalGudok.board.model.vo.secret;

public interface BoardService {

	// Notice 리스트
	int getListCountNotice();

	ArrayList<Board> selectListNotice(bPageInfo pi);
	
	// FAQ 리스트
	int getListCountFAQ();
	
	ArrayList<Board> selectListFAQ(bPageInfo pi);
	
	// productProposal 리스트
	int getListCountProductProposal();
	
	ArrayList<Board> selectListProductProposal(bPageInfo pi);
	
	// inquiry 리스트
	int getListCountInquiry();

	ArrayList<Board> selectListInquiry1(bPageInfo pi);
	ArrayList<secret> selectListInquiry2(bPageInfo pi);
	ArrayList<Inquiry> selectListInquiry3(bPageInfo pi);
	
	

	// Event 리스트
	int getListCountEvent();

	ArrayList<Board> selectListEvent1(bPageInfo pi);
	ArrayList<EventBoard> selectListEvent2(bPageInfo pi);
	
	// Count 조회수 기능
	int addReadCount(int bBoard_no);

	// Insert 글 등록
	int insertImage(Board b);
	
	int insertNotice(Board b);

	int insertFAQ(Board b);
	
	int insertProductProposal(Board b);
	
	int insertInquiry1(Board b);

	int insertInquiry2(secret s);
	
	int insertInquiry3(Inquiry i);
	
	int insertEvent1(Board b);

	int insertEvent2(EventBoard e);
	
	// Detail 글 세부
	Board selectDetail (int bBoard_no);	
	
	Board selectIDetail (int bBoard_no);
	
	Board selectOIDetail1(int bBoard_no);

	secret selectOIDetail2(int bBoard_no);
	
	Inquiry selectOIDetail3(int bBoard_no);
	
	EventBoard selectEDetail(int bBoard_no);
	
	// Update 글 수정
	int updateImage(Board b);

	int updateBoard(Board b);
	
	int updateOneInquiry(secret s);

	int updateInquiry(Inquiry i);

	int updateInquiryAnswer1(Inquiry i);
	// Delete글 삭제
	int deleteImage(Integer bBoard_no);

	int deleteBoardImage(Integer bBoard_no);

	int deleteBoard(Integer bBoard_no);

	int deleteOneInquiryBoard(Integer bBoard_no);

	int deleteInquiryBoard(Integer bBoard_no);

	int deleteEventBoard(Integer bBoard_no);

	// 비밀글 패스워드 일치
	String selectInquiryPwd(int bBoard_no);

	// 이벤트 게시물 게시, 중지, 삭제
	int updateEventStatusY(ArrayList<EventBoard> eventArr);

	int updateEventStatusN(ArrayList<EventBoard> eventArr);

	Board selectDeleteBoard(int i);

	// 검색
	// notice
	ArrayList<Board> selectSearchListNotice(bPageInfo pi, Search search);

	// FAQ
	ArrayList<Board> selectSearchListFAQ(bPageInfo pi, Search search);

	// productProposal	
	ArrayList<Board> selectSearchListProductProposal(bPageInfo pi, Search search);

	// inquiry
	ArrayList<Board> selectSearchListInquiry1(bPageInfo pi, Search search);

	ArrayList<secret> selectSearchListInquiry2(bPageInfo pi, Search search);
	
	ArrayList<Inquiry> selectSearchListInquiry3(bPageInfo pi, Search search);
	
	// inquiry serviceCenter
	ArrayList<Board> selectSearchListsInquiry1(bPageInfo pi, Search search);

	ArrayList<secret> selectSearchListsInquiry2(bPageInfo pi, Search search);

	ArrayList<Inquiry> selectSearchListsInquiry3(bPageInfo pi, Search search);
	
	// event
	ArrayList<Board> selectSearchListEvent1(bPageInfo pi, Search search);

	ArrayList<EventBoard> selectSearchListEvent2(bPageInfo pi, Search search);

	int getListCountEventSearch();

	


	
	

	

	

	

	

	

	

	

	
	

	

	

	


}
