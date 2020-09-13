package com.kh.finalGudok.common;

import com.kh.finalGudok.item.model.vo.PageInfo;

public class pagination2 {
	public static PageInfo getPageInfo2(int currentPage, int listCount, int pageLimit, int boardLimit) {
		PageInfo pi = null;
		
		
		int maxPage;
		int startPage;
		int endPage;
	
		
		maxPage = (int)((double)listCount/boardLimit + 0.99);
		startPage = ((int)((double)(currentPage/pageLimit +0.9)-1))*pageLimit+1;
		endPage = startPage + (pageLimit - 1);
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		System.out.println("맥스페이지는"+maxPage);
		System.out.println("스타트페이지는"+startPage);
		System.out.println("엔드페이지는"+endPage);
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi;
	}
}
