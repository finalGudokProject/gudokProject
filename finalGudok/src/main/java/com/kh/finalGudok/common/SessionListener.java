package com.kh.finalGudok.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import com.kh.finalGudok.member.model.dao.MemberDao;
import com.kh.finalGudok.member.model.vo.Visitor;

public class SessionListener implements HttpSessionListener {

	/*
	 * private static final Map<String, HttpSession> sessions = new
	 * ConcurrentHashMap<>();
	 */

	@Override
	public void sessionCreated(HttpSessionEvent se) {

		if (se.getSession().isNew()) {

			HttpSession session = se.getSession();
			System.out.println("세션에서 담아온 거" + session);

			MemberDao mDao = new MemberDao();
			/* sessions.put(se.getSession().getId(), se.getSession()); */

			int todayCount = 0;
			int totalCount = 0;

			try {

				// 객체에 정보 담기

				/*
				 * ServletWebRequest servletContainer =
				 * (ServletWebRequest)RequestContextHolder.getRequestAttributes();
				 * System.out.println("첫번째는"+servletContainer); HttpServletRequest
				 * req=servletContainer.getRequest(); System.out.println("두번째는"+req);
				 */
				Visitor vo = new Visitor();
//				
//				  vo.setVisitIp(req.getRemoteAddr()); //IP주소
//				  vo.setVisitAgent(req.getHeader("User-Agent"));//브라우저 정보
//				  vo.setVisitRefer(req.getHeader("referer"));//접속 전 사이트 정보
				
				vo.setVisitIp("3"); //IP주소
				  vo.setVisitAgent("2");//브라우저 정보
				  vo.setVisitRefer("3");//접속 전 사이트 정보
				 

				System.out.println("세션리스너에 있는 vo" + vo);

				// 객체에 넣기
				int result = mDao.insertVisitor(vo);

				// 오늘 방문자 수
				todayCount = mDao.getVisitTodayCount();

				// 전체 방문자 수
				totalCount = mDao.getVisitTotalCount();

			} catch (Exception e) {
				e.printStackTrace();
			}

			// 세션 속성에 담아준다.
			session.setAttribute("totalCount", totalCount); // 전체 방문자 수
			session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {

	}
}
