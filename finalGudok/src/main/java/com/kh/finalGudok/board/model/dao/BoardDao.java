package com.kh.finalGudok.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalGudok.board.model.vo.Board;
import com.kh.finalGudok.board.model.vo.EventBoard;
import com.kh.finalGudok.board.model.vo.Inquiry;
import com.kh.finalGudok.board.model.vo.Search;
import com.kh.finalGudok.board.model.vo.bPageInfo;
import com.kh.finalGudok.board.model.vo.secret;

@Repository("bDao")
public class BoardDao {

	// Notice
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int getListCountNotice() {
		return sqlSessionTemplate.selectOne("boardMapper.getListCountNotice");
	}

	public ArrayList<Board> selectListNotice(bPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardListNotice", null, rowBounds);
	}

	// FAQ
	
		public int getListCountFAQ() {
			return sqlSessionTemplate.selectOne("boardMapper.getListCountFAQ");
		}

		public ArrayList<Board> selectListFAQ(bPageInfo pi) {
			int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardListFAQ", null, rowBounds);
		}
		
		
	// ProductProposal
		public int getListCountProductProposal() {
			return sqlSessionTemplate.selectOne("boardMapper.getListCountProductProposal");
		}

		public ArrayList<Board> selectListProductProposal(bPageInfo pi) {
			int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardListProductProposal", null, rowBounds);
		}
	
	// inquiry
		public int getListCountInquiry() {
			return sqlSessionTemplate.selectOne("boardMapper.getListCountInquiry");
		}

		public ArrayList<Board> selectListInquiry1(bPageInfo pi) {
			int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardListInquiry1", null, rowBounds);
		}
		
		public ArrayList<secret> selectListInquiry2(bPageInfo pi) {
			int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardListInquiry2", null, rowBounds);
		}
		
		public ArrayList<Inquiry> selectListInquiry3(bPageInfo pi) {
			int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardListInquiry3", null, rowBounds);
		}
		

		
	// Event
		public int getListCountEvent() {
			return sqlSessionTemplate.selectOne("boardMapper.getListCountEvent");
		}
		
		public ArrayList<Board> selectListEvent1(bPageInfo pi) {
			int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardListEvent1", null, rowBounds);
		}

		public ArrayList<EventBoard> selectListEvent2(bPageInfo pi) {
			int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			
			return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardListEvent2", null, rowBounds);
		}

		
		
	// Count
	public int addReadCount(int bBoard_no) {
		return sqlSessionTemplate.update("boardMapper.updateCount", bBoard_no);
	}

	// Insert
	public int insertImage(Board b) {
		return sqlSessionTemplate.insert("boardMapper.insertImage", b);
	}

	public int insertNotice(Board b) {
		return sqlSessionTemplate.insert("boardMapper.insertNotice", b);
	}

	public int insertFAQ(Board b) {
		return sqlSessionTemplate.insert("boardMapper.insertFAQ",b);
	}

	public int insertProductProposal(Board b) {
		return sqlSessionTemplate.insert("boardMapper.insertProductProposal", b);
	}
	
	public int insertInquiry1(Board b) {
		return sqlSessionTemplate.insert("boardMapper.insertInquiry1", b);
	}
	
	public int insertInquiry2(secret s) {
		return sqlSessionTemplate.insert("boardMapper.insertInquiry2", s);
	}
	
	public int insertInquiry3(Inquiry i) {
		return sqlSessionTemplate.insert("boardMapper.insertInquiry3", i);
	}
	
	public int insertEvent1(Board b) {
		return sqlSessionTemplate.insert("boardMapper.insertEvent1", b);
	}

	public int insertEvent2(EventBoard e) {
		return sqlSessionTemplate.insert("boardMapper.insertEvent2", e);
	}

	
	// Detail 세부내용
	public Board selectDetail(int bBoard_no) {
		return sqlSessionTemplate.selectOne("boardMapper.selectDetail", bBoard_no);
	}

	public Board selectIDetail(int bBoard_no) {
		return sqlSessionTemplate.selectOne("boardMapper.selectIDetail", bBoard_no);
	}
	
	public Board selectOIDetail1(int bBoard_no) {
		return sqlSessionTemplate.selectOne("boardMapper.selectOIDetail1", bBoard_no);
	}

	public secret selectOIDetail2(int bBoard_no) {
		return sqlSessionTemplate.selectOne("boardMapper.selectOIDetail2", bBoard_no);
	}
	
	public Inquiry selectOIDetail3(int bBoard_no) {
		return sqlSessionTemplate.selectOne("boardMapper.selectOIDetail3", bBoard_no);
	}

	public EventBoard selectEDetail(int bBoard_no) {
		return sqlSessionTemplate.selectOne("boardMapper.selectEDetail", bBoard_no);
	}

	
	// Update 수정

	public int updateImage(Board b) {
		return sqlSessionTemplate.update("boardMapper.updateImage", b);
	}

	public int updateBoard(Board b) {
		return sqlSessionTemplate.update("boardMapper.updateBoard", b);
	}
	
	public int updateOneInquiry(secret s) {
		return sqlSessionTemplate.update("boardMapper.updateOneInquiry", s);
	}

	public int updateInquiry(Inquiry i) {
		return sqlSessionTemplate.update("boardMapper.updateInquiry", i);
	}
	
	public int updateInquiryAnswer1(Inquiry i) {
		return sqlSessionTemplate.insert("boardMapper.updateInquiryAnswer1", i);
	}

	// Delete 삭제
	public int deleteImage(Integer bBoard_no) {
		return sqlSessionTemplate.delete("boardMapper.deleteImage",bBoard_no);
	}
	
	public int deleteBoardImage(Integer bBoard_no) {
		return sqlSessionTemplate.delete("boardMapper.deleteBoardImage",bBoard_no);
	}
	
	public int deleteBoard(Integer bBoard_no) {
		return sqlSessionTemplate.delete("boardMapper.deleteBoard",bBoard_no);
	}

	public int deleteOneInquiryBoard(Integer bBoard_no) {
		return sqlSessionTemplate.delete("boardMapper.deleteOneInquiryBoard",bBoard_no);
	}

	public int deleteInquiryBoard(Integer bBoard_no) {
		return sqlSessionTemplate.delete("boardMapper.deleteInquiryBoard",bBoard_no);
	}

	public int deleteEventBoard(Integer bBoard_no) {
		return sqlSessionTemplate.delete("boardMapper.deleteEventBoard",bBoard_no);
	}

	// 비밀글 비밀번호 일치 여부
	public String selectInquiryPwd(int bBoard_no) {
		return sqlSessionTemplate.selectOne("boardMapper.selectInquiryPwd", bBoard_no);
	}

	// 이벤트 게시판 게시
	public int updateEventStatusY(ArrayList<EventBoard> eventArr) {
		return sqlSessionTemplate.update("boardMapper.updateEventStatusY", eventArr);
	}

	public int updateEventStatusN(ArrayList<EventBoard> eventArr) {
		return sqlSessionTemplate.update("boardMapper.updateEventStatusN", eventArr);
	}

	public Board selectDeleteBoard(int i) {
		return sqlSessionTemplate.selectOne("boardMapper.selectDeleteBoard", i);
	}

	// 검색
	// notice
	public ArrayList<Board> selectSearchListNotice(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListNotice", search, rowBounds);
	}

	// FAQ
	public ArrayList<Board> selectSearchListFAQ(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListFAQ", search, rowBounds);
	}
	
	// ProductProposal
	public ArrayList<Board> selectSearchListProductProposal(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListProductProposal", search, rowBounds);
	}
	
	// Inquiry
	public ArrayList<Board> selectSearchListInquiry1(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListInquiry1", search, rowBounds);
	}

	public ArrayList<secret> selectSearchListInquiry2(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListInquiry2", search, rowBounds);
	}

	public ArrayList<Inquiry> selectSearchListInquiry3(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListInquiry3", search, rowBounds);
	}
	
	// Inquiry ServiceCenter
	public ArrayList<Board> selectSearchListsInquiry1(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListsInquiry1", search, rowBounds);
	}
	public ArrayList<secret> selectSearchListsInquiry2(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListsInquiry2", search, rowBounds);
	}
	public ArrayList<Inquiry> selectSearchListsInquiry3(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListsInquiry3", search, rowBounds);
	}

	
	
	// event
	public ArrayList<Board> selectSearchListEvent1(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListEvent1", search, rowBounds);
	}

	public ArrayList<EventBoard> selectSearchListEvent2(bPageInfo pi, Search search) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectSearchListEvent2", search, rowBounds);
	}


	public int getListCountEventSearch() {
		return sqlSessionTemplate.selectOne("boardMapper.getListCountEventSearch");
	}

	

	
	

	



	
	

	



	
	



}
