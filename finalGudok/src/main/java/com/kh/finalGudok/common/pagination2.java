package com.kh.finalGudok.common;

import com.kh.finalGudok.item.model.vo.PageInfo;

public class pagination2 {
	public static PageInfo getPageInfo2(int currentPage, int listCount, int pageLimit, int boardLimit) {
		PageInfo pi = null;
		
		
		int maxPage;
		int startPage;
		int endPage;
	
		
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = ((int)((double)(currentPage/pageLimit +0.9)-1))*pageLimit+1;
		endPage = startPage + (pageLimit - 1);
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
}
