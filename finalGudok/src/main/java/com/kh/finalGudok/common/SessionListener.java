package com.kh.finalGudok.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.finalGudok.member.model.dao.MemberDao;
import com.kh.finalGudok.member.model.vo.Visitor;


public class SessionListener extends HttpSessionEventPublisher{
	



	@Override
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session=event.getSession();
	
         //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
		MemberDao mDao = getMemberDao(event);
		SqlSessionTemplate sqlsessiontemplate = getSessionTemplate(event);
		
		        int todayCount = 0;
		        int totalCount = 0;
		        int totalMember = 0;

		        // 전체 방문자 수 +1
		        Visitor vo = new Visitor();
		   
		    
		        vo.setVisitIp(event.getSession().getId()); //IP주소
			
		        
				System.out.println(vo);
		        try {
		        	
		        	int result = mDao.insertVisitor(vo, sqlsessiontemplate);
		        	// 오늘 방문자 수
					todayCount = mDao.getVisitTodayCount(sqlsessiontemplate);
					
					// 전체 방문자 수
					totalCount = mDao.getVisitTotalCount(sqlsessiontemplate);
					
					totalMember = mDao.getMemberCount(sqlsessiontemplate);
					System.out.println(totalMember+"명은");
					
		        } catch (Exception e) {
		  
		               e.printStackTrace();
		          }
		        
		        System.out.println("totalCount"+totalCount);
		        System.out.println("todayCount"+todayCount);
		        // 세션 속성에 담아준다.
		        session.setAttribute("totalCount", totalCount); // 전체 방문자 수
		        session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
		        session.setAttribute("totalMember", totalMember); // 전체 가입자수
		    }
		
	
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		
		
	}
	
	

	
	private MemberDao getMemberDao(HttpSessionEvent se) {
	    WebApplicationContext context = 
	      WebApplicationContextUtils.getWebApplicationContext(se.getSession().getServletContext());
	    return (MemberDao) context.getBean("mDao");
	  } 
	
	private SqlSessionTemplate getSessionTemplate(HttpSessionEvent se) {
	    WebApplicationContext context = 
	      WebApplicationContextUtils.getWebApplicationContext(se.getSession().getServletContext());
	    return (SqlSessionTemplate) context.getBean("sqlSessionTemplate");
	  } 
}


