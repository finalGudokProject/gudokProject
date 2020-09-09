package com.kh.finalGudok.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.finalGudok.member.model.dao.MemberDao;
import com.kh.finalGudok.member.model.vo.Visitor;


public class SessionListener extends HttpSessionEventPublisher{
	

	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session=event.getSession();
		
		 WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
			
         //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
//			MemberDao mDao=(MemberDao)wac.getBean("mDao");
		MemberDao mDao=new MemberDao();
		
		        int todayCount = 0;
		        int totalCount = 0;
//		        HttpServletRequest req=((HttpServletRequest)(((ServletWebRequest) RequestContextHolder.getRequestAttributes()).getRequest())); 
		        // 전체 방문자 수 +1
		        Visitor vo = new Visitor();
//		        vo.setVisitIp(req.getRemoteAddr()); //IP주소
//				vo.setVisitAgent(req.getHeader("User-Agent"));//브라우저 정보
//				vo.setVisitRefer(req.getHeader("referer"));//접속 전 사이트 정보
				vo.setVisitIp("1"); //IP주소
				vo.setVisitAgent("1");//브라우저 정보
				vo.setVisitRefer("1");//접속 전 사이트 정보
		        
				System.out.println(vo);
		        try {
		        	
		        	int result = mDao.insertVisitor(vo);
		        	// 오늘 방문자 수
					todayCount = mDao.getVisitTodayCount();
					
					// 전체 방문자 수
					totalCount = mDao.getVisitTotalCount();
		        } catch (Exception e) {
		               // TODO Auto-generated catch block
		               e.printStackTrace();
		          }
		        
		     
		        
		        // 세션 속성에 담아준다.
		        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
		        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
		    }
		
	
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		
		
		
		
		
	}
	
	
}


