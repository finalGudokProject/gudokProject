package com.kh.finalGudok.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import com.kh.finalGudok.member.model.dao.MemberDao;
import com.kh.finalGudok.member.model.vo.Visitor;

public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		 MemberDao mDao = new MemberDao();
	        
	        int todayCount = 0;
	        int totalCount = 0;
	        
	   
	        try {
	        	
	        	//객체에 정보 담기
	        	Visitor vo=new Visitor();
	        	ServletWebRequest servletContainer = (ServletWebRequest)RequestContextHolder.getRequestAttributes();
	        	HttpServletRequest req=servletContainer.getRequest();
	        	 vo.setVisitIp(req.getRemoteAddr()); //IP주소
	             vo.setVisitAgent(req.getHeader("User-Agent"));//브라우저 정보
	             vo.setVisitRefer(req.getHeader("referer"));//접속 전 사이트 정보
	        	
	             //객체에 넣기
	            int result=mDao.insertVisitor(vo); 		
	        	 
	             // 오늘 방문자 수
	             todayCount = mDao.getVisitTodayCount();
	          
	             // 전체 방문자 수
	             totalCount = mDao.getVisitTotalCount();
	         
	             
	             
	        } catch (Exception e) {
	               e.printStackTrace();
	          }
	        
	        
	        HttpSession session = se.getSession();
	        
	        // 세션 속성에 담아준다.
	        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
	        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
