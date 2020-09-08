package com.kh.finalGudok.board.common;

import com.kh.finalGudok.board.model.vo.bPageInfo;

public class pagination2 {
	public static bPageInfo getPageInfo2(int currentPage, int listCount, int pageLimit, int boardLimit) {
		bPageInfo pi = null;
		
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)((double)listCount/boardLimit + 0.92);
		startPage = ((int)((double)(currentPage/pageLimit +0.9)-1))*pageLimit+1;
		endPage = startPage + (pageLimit -1);
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		pi = new bPageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
}
