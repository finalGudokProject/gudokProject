package com.kh.finalGudok.member.controller;

import static com.kh.finalGudok.common.pagination2.getPageInfo2;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.finalGudok.item.model.vo.BannerItem;
import com.kh.finalGudok.item.model.vo.Item;
import com.kh.finalGudok.item.model.vo.PageInfo;
import com.kh.finalGudok.member.model.exception.MemberException;
import com.kh.finalGudok.member.model.service.MemberService;
import com.kh.finalGudok.member.model.vo.AdminBoard;
import com.kh.finalGudok.member.model.vo.AdminExchange;
import com.kh.finalGudok.member.model.vo.AdminMember;
import com.kh.finalGudok.member.model.vo.AdminPayment;
import com.kh.finalGudok.member.model.vo.AdminSecession;
import com.kh.finalGudok.member.model.vo.AdminSubscribe;
import com.kh.finalGudok.member.model.vo.Cancle;
import com.kh.finalGudok.member.model.vo.Cart;
import com.kh.finalGudok.member.model.vo.Chart;
import com.kh.finalGudok.member.model.vo.DeleteHeart;
import com.kh.finalGudok.member.model.vo.Delivery;
import com.kh.finalGudok.member.model.vo.Exchange;
import com.kh.finalGudok.member.model.vo.Grade;
import com.kh.finalGudok.member.model.vo.Heart;
import com.kh.finalGudok.member.model.vo.Inquiry;
import com.kh.finalGudok.member.model.vo.Member;
import com.kh.finalGudok.member.model.vo.Point;
import com.kh.finalGudok.member.model.vo.Reply;
import com.kh.finalGudok.member.model.vo.Review;
import com.kh.finalGudok.member.model.vo.Search;
import com.kh.finalGudok.member.model.vo.Subscribe;
import com.kh.finalGudok.member.model.vo.Tempkey;
import com.kh.finalGudok.member.model.vo.Withdrawal;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private Member m;

	@RequestMapping("moveToLogin.do")
	public String moveTologin() {
		return "member/login";
	}

	@RequestMapping("moveToSignUp.do")
	public String moveTosignUp() {
		return "member/signUp";
	}

	@RequestMapping("moveToFind.do")
	public String findId() {
		return "member/find";
	}

	@RequestMapping("payment.do")
	public String payment() {
		return "items/payment";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(Member m, HttpSession session, ModelAndView mv) {

		Member loginUser = mService.loginMember(m);

		System.out.println(loginUser);

		int subscribeCount = mService.subscribeCount(loginUser.getMemberNo());
		int cartCount = mService.cartCount(loginUser.getMemberNo());
		int pointCount = mService.pointCount(loginUser.getMemberNo());

		System.out.println("구독" + subscribeCount);
		System.out.println("장바구니" + cartCount);
		System.out.println("포인트" + pointCount);

		if (bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("subscribeCount", subscribeCount);
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("pointCount", pointCount);

			if (loginUser.getMemberId().equalsIgnoreCase("admin")) {
				mv.setViewName("admin/main");
			} else {
				mv.setViewName("home");
			}

		} else {
			throw new MemberException("로그인 실패");
		}
		return mv;
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(SessionStatus status) {
		status.setComplete();
		return "home";
	}

	@RequestMapping(value = "signUp.do", method = RequestMethod.POST)
	@ResponseBody
	public String signUp(@RequestBody String param) throws ParseException {

		JSONParser parser = new JSONParser();
		JSONObject jobj = (JSONObject) parser.parse(param);

		String id = (String) jobj.get("id");
		String pwd = (String) jobj.get("pwd");
		String name = (String) jobj.get("name");
		String email = (String) jobj.get("email");
		String address1 = (String) jobj.get("address1");
		String address2 = (String) jobj.get("address2");
		String address3 = (String) jobj.get("address3");
		String gender = (String) jobj.get("gender");

		// web.xml에 한글 깨짐 방지를 위해 필터 등록
		// bCrypt로 암호화 처리 -> 관련 라이브러리 추가, xml만들어서 bean 설정
		// @Autowired 선언
		String encPwd = bcryptPasswordEncoder.encode(pwd);

		// Member객체에 담기
		m.setMemberId(id);
		m.setMemberPwd(encPwd);
		m.setMemberName(name);
		m.setEmail(email);
		m.setAddress1(address1);
		m.setAddress2(address2);
		m.setAddress3(address3);
		m.setGender(gender);

//		System.out.println(m);

		int result = mService.insertMember(m);

		if (result > 0) {
			return "success";
		} else {
			throw new MemberException("회원가입 실패");
		}

	}

	@RequestMapping("dupId.do")
	public void idDuplicateCheck(HttpServletResponse response, String memberId) throws IOException {
		boolean idCheckResult = mService.checkIdDup(memberId) == 0 ? true : false;

		PrintWriter out = response.getWriter();
		out.print(idCheckResult);
		out.flush();
		out.close();
	}
	
	@RequestMapping("emailDupCheck.do")
	public ModelAndView emailDupCheck(ModelAndView mv, String email) {

		boolean emailCheckResult = mService.emailDupCheck(email) == 0 ? true : false;
//		System.out.println(emailCheckResult);
		String user = "p.jaemyung91@gmai.com";

		Map map = new HashMap();

		int random = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
		String authCode = String.valueOf(random);

		map.put("emailCheckResult", emailCheckResult);

		if (emailCheckResult == true) {
			MimeMessage msg = mailSender.createMimeMessage();

			try {

//      MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
				MimeMessageHelper messageHelper = new MimeMessageHelper(msg, "UTF-8");
				messageHelper.setSubject("이메일 인증");
				messageHelper.setText("인증번호는" + authCode + "입니다.");
				msg.setFrom(new InternetAddress(user, "Goose"));
				messageHelper.setTo(email);
				msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}

			mailSender.send(msg);
			map.put("authCode", authCode);
		}

		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "findId.do", method = RequestMethod.POST)
	public ModelAndView findId(ModelAndView mv, String name, String email) {

//		System.out.println(name);
//		System.out.println(email);

		m.setEmail(email);
		m.setMemberName(name);

		Map map = new HashMap();
		String id = mService.findId(m);
//		System.out.println(id);

		map.put("id", id);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;

	}

	@RequestMapping(value = "findPwd.do", method = RequestMethod.POST)
	public ModelAndView findPwd(ModelAndView mv, String name, String email, String id) {

		Map map = new HashMap();

		// Tempkey 클래스 사용해서 난수생성(영어, 숫자, 특수문자 조합)
		String authCode = new Tempkey().generateKey(10); // 인증키 생성
		System.out.println("authCode : " + authCode);

		m.setMemberId(id);
		m.setEmail(email);
		m.setMemberName(name);
		int result = mService.checkMember(m);
		if (result > 0) { // 사용자가 입력한 값과 일치하는 회원이 존재하면 메일 발송

			String user = "p.jaemyung91@gmai.com";
			MimeMessage msg = mailSender.createMimeMessage();

			try {

//		      	MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
				MimeMessageHelper messageHelper = new MimeMessageHelper(msg, "UTF-8");
				messageHelper.setSubject("임시 비밀번호 발급");
				messageHelper.setText("임시 비밀번호는" + authCode + "입니다.");
				msg.setFrom(new InternetAddress(user, "Goose"));
				messageHelper.setTo(email);
				msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}

			mailSender.send(msg);
			String encPwd = bcryptPasswordEncoder.encode(authCode);

			m.setMemberPwd(encPwd);
			int result2 = mService.changePwd(m);

			if (result2 > 0) { // 업데이트 성공 시
				map.put("msg", "success");
				mv.addAllObjects(map);
				mv.setViewName("jsonView");
			}

		}
		return mv;
	}

	// ------------------------------ 마이페이지 ----------------------------------------------

	// 마이페이지 이동
	@RequestMapping("mypage.do")
	public String mypageView() {
		return "mypage/subscribe";
	}

	// 회원정보 확인 전 본인 확인
	@RequestMapping("myInfo.do")
	public String myInfoView() {
		return "mypage/memberConfirm";
	}

	// 회원 탈퇴 페이지
	@RequestMapping("myWithdrawal.do")
	public String withdrawalView() {
		return "mypage/memberWithdrawal";
	}

	// 찜 목록 페이지
	@RequestMapping("heartView.do")
	public String heartView() {
		return "mypage/heart";
	}

	@RequestMapping("gradeView.do")
	public String gradeView() {
		return "mypage/gradeInfo";
	}

	// 구독 목록 페이지
	@RequestMapping("subscribeView.do")
	public String subscribeView() {
		return "mypage/subscribe";
	}

	// 장바구니 목록 페이지
	@RequestMapping("cartView.do")
	public String cartView() {
		return "mypage/cart";
	}

	// 구독 조회
	@RequestMapping("subscribeList.do")
	@ResponseBody
	public void subscribeList(HttpServletResponse response, Integer memberNo) throws JsonIOException, IOException { // 민지

		ArrayList<Subscribe> list = mService.selectSubscribeList(memberNo);

		System.out.println("구독 내역  : " + list);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	}

	// 찜 목록 불러오기(ajax)
	@RequestMapping("heartList.do")
	@ResponseBody
	public void heartList(HttpServletResponse response, Integer memberNo) throws JsonIOException, IOException {
		ArrayList<Heart> list = mService.selectHeartList(memberNo);

		System.out.println("찜 내역  : " + list);

		response.setContentType("application/json;charset=utf-8");

		new Gson().toJson(list, response.getWriter());
	}

	// 본인 확인
	@RequestMapping(value = "memberConfirm.do", method = RequestMethod.POST)
	public String memberConfirm(Member m, HttpSession session, Model model) { // 민지
		Member loginUser = mService.loginMember(m);

		System.out.println(m);
		System.out.println(loginUser);

		// 내부적으로 복호화 처리가 이루어진다. (암호화된 회원만 로그인 가능)
		if (bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) { // 로그인 할 멤버 객체가 조회 되었을 시
			model.addAttribute("loginUser", loginUser);
			return "mypage/memberInfoView";
		} else { // 로그인 실패시
			throw new MemberException("본인확인 실패");
			// 예외를 발생시켜서 에러페이지로 넘어갈 껀데
			// 우선 예외 클래스는 RuntimeException을 상속 받아
			// 예외 처리가 따로 필요 없다.

			// 그리고 예외가 발생 했을 때 common에 있는 errorPage에서
			// 처리될 수 있도록 web.xml에 공용 에러 페이지를 등록하러 가자!
		}

	}

	// 회원 정보 수정
	@RequestMapping(value = "memberModify.do", method = RequestMethod.POST)
	public String memberModify(Member m, Model model) { // 민지

		int result = mService.updateMember(m);

		System.out.println("회원정보 수정 후  : " + m);

		if (result > 0) {
			// 회원정보가 수정되면 현재 로그인 한 사람의 정보를
			// 업데이트 시키기 위해 session에 수정된 객체를 담아줘야 된다.
			// @SessionAttribute("loginUser")를 클래스 위에 달아줬기 때문에
			// model에 수정된 회원 객체를 담자
			model.addAttribute("loginUser", m);
		} else {
			throw new MemberException("수정 실패!");
		}

		return "mypage/memberInfoView";
	}

	// 적립금 내역
	@RequestMapping(value = "pointList.do")
	public ModelAndView pointList(ModelAndView mv, Integer memberNo) { // 민지
		ArrayList<Point> list = mService.selectPointList(memberNo);

		System.out.println("적립금 내역  : " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("mypage/pointList");
		} else {
			throw new MemberException("적립금내역 리스트 불러오기 실패");
		}

		return mv;
	}

	// 리뷰 목록
	@RequestMapping(value = "reviewList.do")
	public ModelAndView reviewList(ModelAndView mv, Integer memberNo) { // 민지
		ArrayList<Review> list = mService.selectReviewList(memberNo);

		System.out.println("리뷰 내역  : " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("mypage/review");
		} else {
			throw new MemberException("리뷰 리스트 불러오기 실패");
		}

		return mv;
	}

	// 문의 내역
	@RequestMapping(value = "inquiryList.do")
	public ModelAndView inquiryList(ModelAndView mv, Integer memberNo) {
		ArrayList<Inquiry> list = mService.selectInquiryList(memberNo);

		System.out.println("1:1 문의 내역 : " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("mypage/inquiry");
		} else {
			throw new MemberException("1:1 리스트 불러오기 실패");
		}

		return mv;
	}

	// 교환 내역
	@RequestMapping(value = "exchangeList.do")
	public ModelAndView exchangeList(ModelAndView mv, Integer memberNo) { // 민지
		ArrayList<Exchange> list = mService.selectExchangeList(memberNo);

		System.out.println("교환 내역 : " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("mypage/exchange");
		} else {
			throw new MemberException("교환 리스트 불러오기 실패");
		}

		return mv;
	}

	// 배송 내역
	@RequestMapping(value = "deliveryList.do")
	public ModelAndView deliveryList(ModelAndView mv, Integer memberNo) { // 민지
		ArrayList<Delivery> list = mService.selectDeliveryList(memberNo);

		System.out.println("배송 내역 : " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("mypage/delivery");
		} else {
			throw new MemberException("배송 리스트 불러오기 실패");
		}

		return mv;
	}

	// 장바구니 내역
	@RequestMapping("cartList.do")
	@ResponseBody
	public void cartList(HttpServletResponse response, Integer memberNo) throws JsonIOException, IOException { // 민지
		ArrayList<Cart> list = mService.selectCartList(memberNo);

		System.out.println("장바구니 내역 : " + list);

		response.setContentType("application/json;charset=utf-8");

		new Gson().toJson(list, response.getWriter());
	}

	// 교환 신청
	@RequestMapping("exchangeInsert.do")
	public String exchangeInsert(HttpServletRequest request, Exchange e) { // 민지

		if (e.getExchangeCategory() == 1) {
			e.setExchangeContent("품질불량");
		} else if (e.getExchangeCategory() == 2) {
			e.setExchangeContent("오배송");
		}

		System.out.println("교환 내용 : " + e);

		int result = mService.insertExchange(e);
		int result2 = mService.updateSubscribe(e.getSubscribeNo());

		if (result > 0 && result2 > 0) {
			return "redirect:exchangeList.do";
		} else {
			throw new MemberException("교환 신청 실패");
		}
	}

	

	// 탈퇴하기
	@RequestMapping("withdrawalInsert.do")
	public String withdrawalInsert(HttpServletRequest request, Withdrawal w) {
		if (w.getSecessionCategory() == 1) {
			w.setSecessionContent("서비스가 마음에 들지 않음");
		} else if (w.getSecessionCategory() == 2) {
			w.setSecessionContent("가격이 비쌈");
		} else if (w.getSecessionCategory() == 3) {
			w.setSecessionContent("원하는 상품이 없음");
		} else if (w.getSecessionCategory() == 4) {
			w.setSecessionContent("개인정보보호를 위해");
		}

		System.out.println("탈퇴 내용 : " + w);

		int result = mService.insertSecession(w);
		int result2 = mService.updateMemberStatus(w.getMemberNo());

		if (result > 0 && result2 > 0) {
			return "home";
		} else {
			throw new MemberException("탈퇴 실패");
		}
	}

	// 리뷰 삭제
	@RequestMapping("mreviewDelete.do")
	public String reviewDelete(HttpServletRequest request, int reviewNo) {// 민지
		
		System.out.println(reviewNo);
		
		int chkImg = mService.checkImage(reviewNo);
		System.out.println("ReviewImage 조회 되나? : " + chkImg);
		if (chkImg > 0) {
			int imResult = mService.imageDelete(reviewNo);
			
			if (imResult > 0) {
				mService.deleteReviewImage(reviewNo);
				System.out.println("reviewimage테이블 삭제");
			}
		}

		int result = mService.deleteReview(reviewNo);

		if (result > 0) {
			return "redirect:reviewList.do";
		} else {
			throw new MemberException("리뷰 삭제 실패");
		}
	}

	// 구독주기 변경
	@RequestMapping("cycleChange.do")
	public String cycleChange(HttpServletRequest request, Subscribe subscribe) {
		System.out.println("구독번호 : " + subscribe.getSubscribeNo());
		System.out.println("변경할 구독주기 : " + subscribe.getCycleNo());

		if (subscribe.getCycleNo() == 1) {
			subscribe.setCycleNo(1);
		} else if (subscribe.getCycleNo() == 2) {
			subscribe.setCycleNo(2);
		} else if (subscribe.getCycleNo() == 3) {
			subscribe.setCycleNo(3);
		} else {
			subscribe.setCycleNo(4);
		}

		System.out.println("주기 변경 : " + subscribe);

		int result = mService.cycleChange(subscribe);

		if (result > 0) {
			return "mypage/subscribe";
		} else {
			throw new MemberException("구독주기변경 실패");
		}
	}

	// 찜 삭제
	@RequestMapping("heartDelete.do")
	@ResponseBody
	public String heartDelete(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "checkArr[]") List<String> heartList) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("선택삭제 실행됨");

		System.out.println(heartList);

		DeleteHeart dh = new DeleteHeart();

		int heartNo;
		int memberNo = loginUser.getMemberNo();

		int result = 0;

		for (int i = 0; i < heartList.size(); i++) {
			heartNo = Integer.parseInt(heartList.get(i));
			dh.setHeartNo(heartNo);
			dh.setMemberNo(memberNo);
			result = mService.deleteHeart(dh);
			result += result;
		}

		if (result > 0) {
			return "success";
		} else {
			throw new MemberException("찜 삭제 실패");
		}
	}

	// 구독취소
	@RequestMapping("subscribeCancle.do")
	public String subscribeCancle(HttpServletRequest request, Cancle c) { // 민지

		if (c.getCancleCategory() == 1) {
			c.setCancleContent("상품이 불필요");
		} else if (c.getCancleCategory() == 2) {
			c.setCancleContent("가격이 비쌈");
		}

		System.out.println("취소 내용 : " + c);

		int result = mService.insertCancle(c);
		int result2 = mService.updateSubscribeStatus(c.getSubscribeNo());

		if (result > 0 && result2 > 0) {
			return "mypage/subscribe";
		} else {
			throw new MemberException("취소 신청 실패");
		}
	}

	// 장바구니 삭제
	@RequestMapping("cartDelete.do")
	@ResponseBody
	public String cartDelete(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "checkArr[]") List<String> cartList) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("선택삭제 실행됨");

		System.out.println(cartList);

		DeleteHeart dh = new DeleteHeart();

		int cartNo;

		int memberNo = loginUser.getMemberNo();

		int result = 0;

		for (int i = 0; i < cartList.size(); i++) {
			cartNo = Integer.parseInt(cartList.get(i));

			HashMap map = new HashMap<Integer, Integer>();

			map.put("cartNo", cartNo);
			map.put("memberNo", memberNo);

			result = mService.deleteCart(map);

			result += result;

		}

		if (result > 0) {
			return "success";
		} else {
			throw new MemberException("장바구니 삭제 실패");
		}
	}

	// 장바구니 추가
	@RequestMapping("addCart.do")
	@ResponseBody
	public String addCart(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "checkArr[]") List<String> cartList) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		System.out.println("장바구니 추가");

		int itemNo;
		int result = 0;

		for (int i = 0; i < cartList.size(); i++) {
			itemNo = Integer.parseInt(cartList.get(i));
			Item item = mService.selectItem(itemNo);

			HashMap map = new HashMap<Object, Object>();

			System.out.println("선택한 찜 상품 : " + item);

			if (item != null) {
				map.put("item", item);
				map.put("member", loginUser);
				result = mService.addCart(map);
			}
			result += result;
		}

		if (result > 0) {
			return "success";
		} else {
			throw new MemberException("장바구니 추가 실패");
		}
	}

	// 1:1문의 답변
	@RequestMapping("inquiryReply.do")
	@ResponseBody
	public void inquiryReply(HttpServletResponse response, HttpServletRequest request, Integer boardNo)
			throws JsonIOException, IOException {

		Reply reply = mService.selectReply(boardNo);

		System.out.println("답변 내역  : " + reply);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(reply, response.getWriter());
	}

	// 비밀번호 변경
	@RequestMapping("modifyPassword.do")
	public String modifyPassword(Member m, Model model,
			@RequestParam(value = "changeMemberPwd") String changeMemberPwd) {
		Member loginUser = mService.loginMember(m);

		System.out.println(m);
		System.out.println(loginUser);

		if (bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {

			String encPwd = bcryptPasswordEncoder.encode(changeMemberPwd);

			m.setMemberPwd(encPwd);

			int result = mService.updatePassword(m);

			System.out.println("비밀번호 변경 후 : " + m);

			if (result > 0) {
				model.addAttribute("loginUser", m);
			} else {
				throw new MemberException("수정 실패!");
			}

			model.addAttribute("loginUser", loginUser);

			return "mypage/memberInfoView";
		} else {
			throw new MemberException("본인확인 실패");
		}
	}
	
	// ------------------------------ 마이페이지 ----------------------------------------------
	
	// ------------------------------ 관리자 ----------------------------------------------
	// 관리자 등급 & 회원 리스트 보기-admin
	@RequestMapping("gradeList.do")
	public ModelAndView selectGradeList(ModelAndView mv, Integer page,
			@RequestParam(value = "categoryNo", required = false) String categoryNo,
			@RequestParam(value = "word", required = false) String word) {

		if (categoryNo == "") {
			categoryNo = null;
		}
		if (word == "") {
			word = null;
		}
		System.out.println(categoryNo);

		Search s = new Search();

		if (categoryNo == null) {
			s.setMemberNo(word);
			s.setMemberName(word);
			s.setMemberId(word);
		} else if (categoryNo.equalsIgnoreCase("memberNo")) {
			s.setMemberNo(word);
		} else if (categoryNo.equalsIgnoreCase("memberId")) {
			s.setMemberId(word);
		} else if (categoryNo.equalsIgnoreCase("memberName")) {
			s.setMemberName(word);
		}

		System.out.println("오떻게 가나 보자" + s);

		// 현재 등급정보
		ArrayList<Grade> gList = mService.selectGradeList();

		// 등급별 회원 수 주입
		for (int i = 0; i < gList.size(); i++) {
			Integer cnt = mService.selectGradeCnt(gList.get(i).getGradeNo());

			if (cnt == null) {
				cnt = 0;
			}

			gList.get(i).setTotal(cnt);
			gList.get(i).setGradeRate(gList.get(i).getGradeRate() * 100);

		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getMemberCnt(s);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		// 탈퇴하지 않은 회원 리스트
		ArrayList<AdminMember> mList = mService.selectMemberN(s, pi);

		// 회원별 총 구매금액 주입
		for (int i = 0; i < mList.size(); i++) {

			
			Integer cnt = mService.selectTotalPay(mList.get(i).getMemberNo());

			if (cnt == null) {
				cnt = 0;
			}

			mList.get(i).setTotalPay(cnt);
		}

		if (gList != null && mList != null) {
			mv.addObject("gList", gList).addObject("word", word).addObject("categoryNo", categoryNo)
					.addObject("mList", mList).addObject("pi", pi).setViewName("admin/userList");
			return mv;
		} else {
			throw new MemberException("회원 리스트 확인 실패!");
		}

	}

	// 등급별 적립율 변경-admin
	@RequestMapping("gradeRateInfoChang.do")
	@ResponseBody
	public String updateGradeRate(String sendGradeArr, String sendRateArr) {

		System.out.println(sendGradeArr);
		System.out.println(sendRateArr);

		String[] gArr = sendGradeArr.split(",");
		String[] rArr = sendRateArr.split(",");

		ArrayList<Grade> g = new ArrayList<>();
		int result = 0;

		for (int k = 0; k < gArr.length; k++) {

			Grade grade = new Grade();

			grade.setGradeNo(Integer.valueOf(gArr[k]));
			grade.setGradeRate(Double.valueOf(rArr[k]) / 100);

			g.add(grade);
		}

		result = mService.updateGradeRate(g);
		System.out.println(result);

		System.out.println(result);

		if (result < 0) {
			return "success";

		} else {
			throw new MemberException("적립율 변경 실패!");

		}
	}

	// 등급별 최소 금액 변경-admin
	@RequestMapping("gradeMinInfoChang.do")
	@ResponseBody
	public String updateGradeMin(String sendGradeMinArr, String sendGradeArr) {

		System.out.println(sendGradeArr);
		System.out.println(sendGradeMinArr);

		String[] gArr = sendGradeArr.split(",");
		String[] rArr = sendGradeMinArr.split(",");

		ArrayList<Grade> g = new ArrayList<>();
		int result = 0;

		for (int k = 0; k < gArr.length; k++) {

			Grade grade = new Grade();

			grade.setGradeNo(Integer.valueOf(gArr[k]));
			grade.setGradeMin(Integer.valueOf(rArr[k]));

			g.add(grade);
		}

		result = mService.updateGradeMin(g);

		if (result < 0) {
			return "success";

		} else {
			throw new MemberException("적립율 변경 실패!");

		}
	}

	// ajax 후 리스트 갱신-admin
	@RequestMapping("gListChange.do")
	public void updateGradeList(HttpServletResponse response, ModelAndView mv, Integer page,
			@RequestParam(value = "categoryNo", required = false) String categoryNo,
			@RequestParam(value = "word", required = false) String word) throws IOException {

		if (categoryNo == "") {
			categoryNo = null;
		}
		if (word == "") {
			word = null;
		}

		Search s = new Search();
		
		if(categoryNo==null) {
			s.setMemberNo(word);
			s.setMemberName(word);
			s.setMemberId(word);
			
		} else if (categoryNo.equalsIgnoreCase("memberNo")) {
			s.setMemberNo(word);
		} else if (categoryNo.equalsIgnoreCase("memberId")) {
			s.setMemberId(word);
		} else if (categoryNo.equalsIgnoreCase("memberName")) {
			s.setMemberName(word);
		} 

		// 현재 등급정보
		ArrayList<Grade> gList = mService.selectGradeList();

		// 등급별 회원 수 주입
		for (int i = 0; i < gList.size(); i++) {
			Integer cnt = mService.selectGradeCnt(gList.get(i).getGradeNo());

			if (cnt == null) {
				cnt = 0;
			}

			gList.get(i).setTotal(cnt);
			gList.get(i).setGradeRate(gList.get(i).getGradeRate() * 100);
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getMemberCnt(s);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		// 탈퇴하지 않은 회원 리스트
		ArrayList<AdminMember> mList = mService.selectMemberN(s, pi);

		response.setContentType("application/json;charset=utf-8");

		if (gList != null && mList != null) {

			JSONArray jarr = new JSONArray();

			for (int i = 0; i < gList.size(); i++) {
				JSONObject jList = new JSONObject();

				jList.put("gradeNo", gList.get(i).getGradeNo());
				jList.put("gradeName", gList.get(i).getGradeName());
				jList.put("gradeMin", gList.get(i).getGradeMin());
				jList.put("total", gList.get(i).getTotal());
				jList.put("gradeRate", gList.get(i).getGradeRate());
				jList.put("categoryNo", categoryNo);
				jList.put("word", word);

				jarr.add(jList);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("list", jarr);
			System.out.println(jarr);

			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		} else {
			throw new MemberException("이벤트 전체 조회 실패!");
		}

	}

	// 등급정보변경 -admin
	@RequestMapping("rListChang.do")
	public void updateRateList(HttpServletResponse response, ModelAndView mv, Integer page,
			@RequestParam(value = "categoryNo", required = false) String categoryNo,
			@RequestParam(value = "word", required = false) String word) throws IOException {

		if (categoryNo == "") {
			categoryNo = null;
		}
		if (word == "") {
			word = null;
		}

		Search s = new Search();
		if (categoryNo.equalsIgnoreCase("memberNo")) {
			s.setMemberNo(word);
		} else if (categoryNo.equalsIgnoreCase("memberId")) {
			s.setMemberId(word);
		} else if (categoryNo.equalsIgnoreCase("memberName")) {
			s.setMemberName(word);
		} else {
			s.setMemberNo(word);
			s.setMemberName(word);
			s.setMemberId(word);
		}

		// 현재 등급정보
		ArrayList<Grade> gList = mService.selectGradeList();

		// 등급별 회원 수 주입
		for (int i = 0; i < gList.size(); i++) {
			Integer cnt = mService.selectGradeCnt(gList.get(i).getGradeNo());

			if (cnt == null) {
				cnt = 0;
			}

			gList.get(i).setTotal(cnt);
			gList.get(i).setGradeRate(gList.get(i).getGradeRate() * 100);
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getMemberCnt(s);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		// 탈퇴하지 않은 회원 리스트
		ArrayList<AdminMember> mList = mService.selectMemberN(s, pi);

		response.setContentType("application/json;charset=utf-8");

		if (gList != null && mList != null) {

			JSONArray jarr = new JSONArray();

			for (int i = 0; i < gList.size(); i++) {
				JSONObject jList = new JSONObject();

				jList.put("gradeNo", gList.get(i).getGradeNo());
				jList.put("gradeName", gList.get(i).getGradeName());
				jList.put("gradeMin", gList.get(i).getGradeMin());
				jList.put("total", gList.get(i).getTotal());
				jList.put("gradeRate", gList.get(i).getGradeRate());

				jarr.add(jList);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("list", jarr);
			System.out.println(jarr);

			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		} else {
			throw new MemberException("이벤트 전체 조회 실패!");
		}

	}

	// ★ 회원 정보 상세보기-admin
	@RequestMapping("mDetail.do")
	public ModelAndView selectOneMember(ModelAndView mv, Integer page, int memberNo, Integer detailPage, String type) {

		// 상세 페이지로 이동하기전, 회원 리스트의 페이지 번호
		int beforePage = page;

		// 하단 결제 페이지의 페이지 번호
		int currentPage = 1;

		if (detailPage != null) {
			currentPage = detailPage;
		}

		int listCount = mService.getMemberPayCnt(memberNo);

		// 상세 페이지 내 결제 페이지의 정보
		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		// 해당 회원 정보
		AdminMember m = mService.selectOneMember(memberNo);

		// 회원별 결제리스트
		ArrayList<AdminPayment> pList = mService.selectMemberPay(memberNo, pi);
		Integer totalPayment = mService.selectTotalPay(memberNo);
		if (totalPayment == null) {
			totalPayment = 0;
		}

		System.out.println(m);
		System.out.println("pList는" + pList);

		if (m != null) {
			mv.addObject("pList", pList).addObject("totalPayment", totalPayment).addObject("memberNo", memberNo)
					.addObject("m", m).addObject("pi", pi).addObject("beforePage", beforePage).addObject("type", type)
					.setViewName("admin/userDetail");
			return mv;
		} else {
			throw new MemberException("회원 상세 확인 실패!");
		}

	}

	// 회원 정보 수정(관리자)-admin
	@RequestMapping("mUpdateA.do")
	public ModelAndView updateMemberA(ModelAndView mv, AdminMember m, Integer beforePage) {

		System.out.println(m);
		int result = mService.updateMemberA(m);

		if (result > 0) {
			mv.addObject("page", beforePage).setViewName("redirect:gradeList.do");
			return mv;

		} else {
			throw new MemberException("회원 정보 수정 실패!");
		}
	}

	// 회원 삭제-admin
	@RequestMapping("deleteM.do")
	public ModelAndView deleteMemberA(ModelAndView mv, Integer memberNo, Integer beforePage) {

		System.out.println("도차쿠");

		System.out.println(m);
		int result = mService.deleteMemberA(memberNo);
		int result1 = mService.deleteMemberSecession(memberNo);
		int result2 = mService.deleteMemberBoard(memberNo);
		int result3 = mService.deleteMemberHeart(memberNo);
		int result7 = mService.deleteMemberCart(memberNo);
		int result4 = mService.deleteMemberReview(memberNo);
		int result5 = mService.deleteMemberPayment(memberNo);
		int result6 = mService.deleteMemberSubscribe(memberNo);

		System.out.println(result);

		if (result > 0) {
			mv.addObject("page", beforePage).setViewName("redirect:gradeList.do");
			return mv;

		} else {
			throw new MemberException("회원 삭제 실패!");
		}

	}

	// 탈퇴회원 리스트 -admin
	@RequestMapping("sList.do")
	public ModelAndView selectSecessionList(ModelAndView mv, Integer page,
			@RequestParam(value = "categoryNo", required = false) String categoryNo,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "word", required = false) String word) {

		if (categoryNo == "") {
			categoryNo = null;
		}
		if (type == "") {
			type = null;
		}
		if (word == "") {
			word = null;
		}

		System.out.println("카테고리는" + categoryNo);
		System.out.println("타입은" + type);
		System.out.println("단어는" + word);

		Search s = new Search();
		if (categoryNo != null) {
			s.setCategory1(categoryNo); // secessionCategory
		}

		if (type != null) {
			if (type.equalsIgnoreCase("memberId")) {
				s.setMemberId(word);
			} else if (type.equalsIgnoreCase("memberNo")) {
				s.setMemberNo(word);
			} else if (type.equalsIgnoreCase("memberName")) {
				s.setMemberName(word);
			} else {
				s.setCategory2(word); // sessionContent
			}
		}

		if (categoryNo == null && type == null) {
			s.setMemberId(word);
			s.setMemberNo(word);
			s.setMemberName(word);
			s.setCategory2(word);
		}

		System.out.println("s눈" + s);

		// 탈퇴 사유별 비율 보여줄 리스트

		ArrayList<AdminSecession> sList = new ArrayList<>();

		for (int i = 1; i < 6; i++) {
			AdminSecession as = new AdminSecession();
			as.setSecessionCategory(i);
			Integer t = mService.selectSecessionCnt(as);
			if (t == null) {
				t = 0;
			}
			as.setTotal(t);
			sList.add(as);
		}

		// 등급별 탈퇴 인원

		ArrayList<AdminSecession> mList = new ArrayList<>();

		for (int i = 1; i < 5; i++) {
			AdminSecession as = new AdminSecession();
			as.setGradeNo(i);
			Integer t = mService.selectMemberSecessionCnt(as);
			if (t == null) {
				t = 0;
			}
			as.setTotal(t);
			mList.add(as);
		}

		System.out.println("mList" + mList);

		// 탈퇴 회원들 리스트

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		// 탈퇴회원 세기
		int listCount = mService.getMemberCntY(s);

		System.out.println("몇명 가져온거야" + listCount);
		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<AdminSecession> msList = mService.selectMemberSecession(s, pi);

		System.out.println("msList" + msList);

		if (sList != null && mList != null && msList != null) {
			mv.addObject("sList", sList).addObject("word", word).addObject("type", type)
					.addObject("categoryNo", categoryNo).addObject("mList", mList).addObject("msList", msList)
					.addObject("pi", pi).setViewName("admin/secessionList");
			return mv;
		} else {
			throw new MemberException("탈퇴 내역 확인 실패!");
		}
	}

	// 주문 상품 리스트-admin
	@RequestMapping("oList.do")
	public ModelAndView selectOrderList(ModelAndView mv, Integer page,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "word", required = false) String word,
			@RequestParam(value = "type", required = false) String type) {

		System.out.println(category);
		System.out.println(word);
		System.out.println(type);

		if (category == "") {
			category = null;
		}

		if (word == "") {
			word = null;
		}

		if (type == "") {
			type = null;
		}

		Search s = new Search();
		s.setCategory1(category);

		if (type == null) {
			s.setSubscribeNo(word);
			s.setItemName(word);

		} else if (type.equalsIgnoreCase("subscribeNo")) {
			s.setSubscribeNo(word);

		} else if (type.equalsIgnoreCase("itemName")) {
			s.setItemName(word);
		} else if (type.equalsIgnoreCase("memberId")) {
			s.setMemberId(word);
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getOrderCnt(s);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<AdminSubscribe> oList = mService.selectOrderList(s, pi);
		System.out.println(oList);
		System.out.println(listCount);

		if (oList != null) {

			mv.addObject("pi", pi).addObject("oList", oList).addObject("type", type).addObject("category", category)
					.addObject("word", word).setViewName("admin/orderList");

			return mv;
		} else {
			throw new MemberException("주문 내역 확인 실패!");
		}

	}

	// 관리자 배송 상태 변경-admin
	@RequestMapping("updateDelivery.do")
	@ResponseBody
	public String updateDelivery(String sendArr, String deliveryStatus) {

		String[] strArr = sendArr.split(",");

		ArrayList<AdminSubscribe> dArr = new ArrayList<>();

		for (int i = 0; i < strArr.length; i++) {
			AdminSubscribe e = new AdminSubscribe();
			e.setSubscribeNo(Integer.valueOf(strArr[i]));
			e.setDeliveryStatus(deliveryStatus);
			dArr.add(e);
		}

		System.out.println(dArr);

		//배송상태 변경
		int result = mService.updateDelivery(dArr);
		
		
		//배송 완료일 경우 
		if(deliveryStatus.equalsIgnoreCase("Y")) {
		
			//판매량 +1 
			int result2=mService.updateItemCmStatus(dArr);
			
			for(int i=0;i<dArr.size();i++) {
			//포인트 뽑아오기 
			int point=mService.selectPoint(dArr.get(i).getSubscribeNo());
			dArr.get(i).setPoint(point);
			System.out.println(dArr);
			//회원에게 적립금 부여
			int result3=mService.updateMemberPoint(dArr.get(i));
			
			}
			
		}
		
		System.out.println("결과는" + result);
		if (result < 0) {
			

			return "success";

		} else {
			throw new MemberException("상태 변경 실패!");
		}
	}

	// 주문상태변경 -admin
	@RequestMapping("oListChange.do")
	public void changeOrderList(HttpServletResponse response, Integer page,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "word", required = false) String word,
			@RequestParam(value = "type", required = false) String type) throws IOException {

		System.out.println("여기 제발 와랑");

		if (category == "") {
			category = null;
		}

		if (word == "") {
			word = null;
		}

		if (type == "") {
			type = null;
		}

		Search s = new Search();
		s.setCategory1(category);

		if (type == null) {
			s.setSubscribeNo(word);
			s.setItemName(word);

		} else if (type.equalsIgnoreCase("subscribeNo")) {
			s.setSubscribeNo(word);

		} else if (type.equalsIgnoreCase("itemName")) {
			s.setItemName(word);
		} else if (type.equalsIgnoreCase("memberId")) {
			s.setMemberId(word);
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getOrderCnt(s);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<AdminSubscribe> oList = mService.selectOrderList(s, pi);

		for (int i = 0; i < oList.size(); i++) {
			if (oList.get(i).getDeliveryStatus().equalsIgnoreCase("N")) {
				oList.get(i).setDeliveryStatus("배송 대기");
			} else if (oList.get(i).getDeliveryStatus().equalsIgnoreCase("D")) {
				oList.get(i).setDeliveryStatus("배송중");
			} else {
				oList.get(i).setDeliveryStatus("배송 완료");
			}

		}

		System.out.println("여기 제발 와랑2");

		response.setContentType("application/json;charset=utf-8");

		JSONArray jarr = new JSONArray();

		for (int i = 0; i < oList.size(); i++) {
			JSONObject jList = new JSONObject();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			jList.put("subscribeNo", oList.get(i).getSubscribeNo());
			jList.put("subscribeDate", sdf.format(oList.get(i).getSubscribeDate()));
			jList.put("itemNo", oList.get(i).getItemNo());
			jList.put("itemName", oList.get(i).getItemName());
			jList.put("amount", oList.get(i).getAmount());
			jList.put("memberId", oList.get(i).getMemberId());
			jList.put("deliveryStatus", oList.get(i).getDeliveryStatus());
			jList.put("category", category);
			jList.put("word", word);
			jList.put("type", type);

			jarr.add(jList);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);

		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();

	}

	// 구독내역 상세보기 -admin
	@RequestMapping("oDetail.do")
	public ModelAndView selectOrderDetail(ModelAndView mv, Integer page, Integer subscribeNo, String type) {

		System.out.println("타입은???" + type);
		// 구독 상세 내역 조회
		AdminSubscribe sc = mService.selectOrder(subscribeNo);

		System.out.println("sc" + sc);
		// 총 금액(할인 전 금액)
		int total = mService.selectItemTotalP(subscribeNo);
		System.out.println("total" + total);

		// 결제 내역 조회
		AdminPayment p = mService.selectPayment(subscribeNo);

		p.setTotalPayment(mService.selectTotalPayment(subscribeNo));

		System.out.println("p" + p);

		System.out.println("페이지는여" + page);

		if (sc != null && p != null) {

			mv.addObject("sc", sc).addObject("p", p).addObject("page", page).addObject("type", type)
					.addObject("total", total).setViewName("admin/orderDetail");

			return mv;
		} else {
			throw new MemberException("상태 변경 실패!");
		}

	}

	// 구독 내용 변경 -admin
	@RequestMapping("updateSubscribe.do")
	public ModelAndView updateSubscribeA(ModelAndView mv, Integer page, Integer subscribeNo) {

		int result = mService.updateSubscribeA(subscribeNo);

		System.out.println("번호는" + subscribeNo + "페이지는" + page + "결과는!!!" + result);

		if (result > 0) {
			mv.addObject("page", page).setViewName("redirect:oList.do");
			return mv;
		} else {
			throw new MemberException("구독 취소 실패!");
		}
	}

	// 교환 리스트 -admin
	@RequestMapping("exchangList.do")
	public ModelAndView exchangeListView(ModelAndView mv, Integer page,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "word", required = false) String word,
			@RequestParam(value = "type", required = false) String type) {
		// 주간 교환 사유별 비율을 조회하기 위한 날짜 수집
		Calendar start = Calendar.getInstance(); // 현재 시간
		Date startDate = new Date(start.getTimeInMillis()); // Date형으로 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startDay = sdf.format(startDate);

		start.add(Calendar.DATE, -7);
		Date lastDate = new Date(start.getTimeInMillis());
		String lastDay = sdf.format(lastDate); // 7일전
		System.out.println(startDay);
		System.out.println(lastDay);

		// 차트용 리스트
		ArrayList<Search> list = new ArrayList<>();

		for (int i = 1; i < 4; i++) {
			Search s = new Search();
			s.setStartDay(startDay);
			s.setLastDay(lastDay);
			s.setTemp1(i);
			list.add(s);

			Integer temp = mService.selectExchangeChart(list.get(i - 1));

			if (temp == null) {
				temp = 0;
			}
			s.setTemp2(temp);

			System.out.println(list.get(i - 1).getTemp2());
		}

		// 교환리스트

		System.out.println("카테고리는 " + category);
		System.out.println("타입은 " + type);
		System.out.println("검색어는 " + word);

		if (category == "") {
			category = null;
		}

		if (word == "") {
			word = null;
		}

		if (type == "") {
			type = null;
		}

		Search s = new Search();
		s.setCategory1(category);

		System.out.println("카테고리 잘 왔나"+category);
		if (type == null) {
			s.setSubscribeNo(word);
			s.setWord(word);
			s.setMemberId(word);

		} else if (type.equalsIgnoreCase("subscribeNo")) {
			s.setSubscribeNo(word);

		} else if (type.equalsIgnoreCase("exchangeContent")) {
			s.setWord(word);
		} else if (type.equalsIgnoreCase("memberId")) {
			s.setMemberId(word);
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		System.out.println("s는" + s);
		int listCount = mService.getExchangeCnt(s);

		System.out.println("몇개?" + listCount);
		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<AdminExchange> eList = mService.selectExchange(s, pi);

		for (int i = 0; i < eList.size(); i++) {
			if (eList.get(i).getExchangeStatus().equalsIgnoreCase("N")) {
				eList.get(i).setExchangeStatus("교환 대기");
			} else {
				eList.get(i).setExchangeStatus("교환 완료");
			}

		}

		if (list != null && eList != null) {

			mv.addObject("list", list).addObject("pi", pi).addObject("eList", eList).addObject("category", category)
					.addObject("word", word).addObject("type", type).addObject("pi", pi)
					.setViewName("admin/exchangeList");

			return mv;
		} else {
			throw new MemberException("교환 내역 조회 실패!");
		}
	}

	// 교환 상태 변경-admin
	@RequestMapping("eChange.do")
	@ResponseBody
	public String exchangeChange(Integer page, String type, String sendArr) {

		System.out.println(page);
		System.out.println(type);

		String[] strArr = sendArr.split(",");

		ArrayList<AdminExchange> dArr = new ArrayList<>();

		for (int i = 0; i < strArr.length; i++) {
			AdminExchange e = new AdminExchange();
			e.setExchangeNo(Integer.valueOf(strArr[i]));
			e.setExchangeStatus(type);
			dArr.add(e);
		}

		int result = mService.updateExchange(dArr);

		if (result < 0) {
			return "success";

		} else {
			throw new MemberException("교환 상태 변경 실패!");
		}
	}

	// 교환 상태변경 후 리스트 가져오기-admin
	@RequestMapping("exchangeListChange.do")
	public void selectChangedExchangeList(HttpServletResponse response, Integer page,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "word", required = false) String word,
			@RequestParam(value = "type", required = false) String type) throws IOException {

		// 교환리스트
		if (category == "") {
			category = null;
		}

		if (word == "") {
			word = null;
		}

		if (type == "") {
			type = null;
		}
		Search s = new Search();
		s.setCategory1(category);

		if (type == null) {
			s.setSubscribeNo(word);
			s.setItemName(word);
			s.setMemberId(word);

		} else if (type.equalsIgnoreCase("subscribeNo")) {
			s.setSubscribeNo(word);

		} else if (type.equalsIgnoreCase("exchangeContent")) {
			s.setItemName(word);
		} else if (type.equalsIgnoreCase("memberId")) {
			s.setMemberId(word);
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getExchangeCnt(s);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<AdminExchange> eList = mService.selectExchange(s, pi);

		for (int i = 0; i < eList.size(); i++) {
			if (eList.get(i).getExchangeStatus().equalsIgnoreCase("N")) {
				eList.get(i).setExchangeStatus("교환 대기");
			} else {
				eList.get(i).setExchangeStatus("교환 완료");
			}

		}

		response.setContentType("application/json;charset=utf-8");

		if (!eList.isEmpty()) {

			JSONArray jarr = new JSONArray();

			for (int i = 0; i < eList.size(); i++) {
				JSONObject jList = new JSONObject();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				jList.put("exchangeNo", eList.get(i).getExchangeNo());
				jList.put("exchangeDate", sdf.format(eList.get(i).getExchangeDate()));
				jList.put("exchangeContent", eList.get(i).getExchangeContent());
				jList.put("subscribeNo", eList.get(i).getSubscribeNo());
				jList.put("itemName", eList.get(i).getItemName());
				jList.put("memberId", eList.get(i).getMemberId());
				jList.put("itemPrice", eList.get(i).getItemPrice());
				jList.put("exchangeStatus", eList.get(i).getExchangeStatus());
				jList.put("category", category);
				jList.put("word", word);
				jList.put("type", type);

				jarr.add(jList);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("list", jarr);

			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		} else {
			throw new MemberException("이벤트 전체 조회 실패!");
		}

	}

	// 기간별 통계-admin
	@RequestMapping("sDateList.do")
	public ModelAndView selectSalesDate(ModelAndView mv, Integer page, String type,
			@RequestParam(value = "startD", required = false) String startD,
			@RequestParam(value = "lastD", required = false) String lastD) {

		System.out.println("타입은?" + type);
		System.out.println("첫날은?" + startD);
		System.out.println("끝날은?" + lastD);

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		// 공통 변수

		Calendar last = Calendar.getInstance(); // 현재 시간
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfy = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy-MM");
		String lastDay = "";
		String startDay = "";
		int sumTotalP = 0; // 총 매출
		int sumTotalC = 0; // 총 건 수

		ArrayList<String> pArr = new ArrayList<>();
		Search s = new Search();
		PageInfo pi = new PageInfo();
		ArrayList<AdminPayment> pList = new ArrayList<>();

		// 기본 첫 화면 (N) --> 해당년도의 1월 1일부터 검색
		if (type.equalsIgnoreCase("N")) {

			lastDay = sdf.format(last.getTime());
			startDay = lastDay.substring(0, 4).concat("-01-01");

			// 검색할 날짜 뽑아오기

			s.setLastDay(lastDay); // 마지막 날짜
			s.setStartDay(startDay); // 처음 날짜
			System.out.println(s);
			pArr = mService.selectDateList(s);

			// 화면에 노출될 매출 리스트 만들기
			int listCount = mService.getSalesCnt(s);
			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			pList = mService.selectPaymentList(pArr, pi);

			// 검색한 값의 총 합계
			ArrayList<AdminPayment> tot = mService.selectPaymentList(pArr);

			for (int i = 0; i < tot.size(); i++) {
				int c = tot.get(i).getTotalCount();
				int p = tot.get(i).getTotalPayment();
				sumTotalC += c;
				sumTotalP += p;
			}

			// 오늘 검색(T)
		} else if (type.equalsIgnoreCase("T")) {

			lastDay = sdf.format(last.getTime());
			startDay = lastDay;

			// 검색할 날짜 뽑아오기

			s.setLastDay(lastDay); // 마지막 날짜
			s.setStartDay(startDay); // 처음 날짜
			System.out.println(s);
			pArr = mService.selectDateList(s);

			// 화면에 노출될 매출 리스트 만들기
			int listCount = mService.getSalesCnt(s);
			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			pList = mService.selectPaymentList(pArr, pi);

			// 검색한 값의 총 합계
			ArrayList<AdminPayment> tot = mService.selectPaymentList(pArr);

			for (int i = 0; i < tot.size(); i++) {
				int c = tot.get(i).getTotalCount();
				int p = tot.get(i).getTotalPayment();
				sumTotalC += c;
				sumTotalP += p;
			}

			// 일주일 검색(W)
		} else if (type.equalsIgnoreCase("W")) {

			lastDay = sdf.format(last.getTime());
			last.add(Calendar.DATE, -7);
			Date lastDate = new Date(last.getTimeInMillis());
			startDay = sdf.format(lastDate); // 7일전

			// 검색할 날짜 뽑아오기

			s.setLastDay(lastDay); // 마지막 날짜
			s.setStartDay(startDay); // 처음 날짜
			System.out.println(s);
			pArr = mService.selectDateList(s);

			// 화면에 노출될 매출 리스트 만들기
			int listCount = mService.getSalesCnt(s);
			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			pList = mService.selectPaymentList(pArr, pi);

			// 검색한 값의 총 합계
			ArrayList<AdminPayment> tot = mService.selectPaymentList(pArr);

			for (int i = 0; i < tot.size(); i++) {
				int c = tot.get(i).getTotalCount();
				int p = tot.get(i).getTotalPayment();
				sumTotalC += c;
				sumTotalP += p;
			}

			// 한달 검색 (O)
		} else if (type.equalsIgnoreCase("O")) {

			lastDay = sdf.format(last.getTime());
			last.add(Calendar.MONTH, -1);
			Date lastDate = new Date(last.getTimeInMillis());
			startDay = sdf.format(lastDate); // 1달전
			System.out.println(lastDay);
			System.out.println(startDay);

			// 검색할 날짜 뽑아오기

			s.setLastDay(lastDay); // 마지막 날짜
			s.setStartDay(startDay); // 처음 날짜
			System.out.println(s);
			pArr = mService.selectDateList(s);

			// 화면에 노출될 매출 리스트 만들기
			int listCount = mService.getSalesCnt(s);
			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			pList = mService.selectPaymentList(pArr, pi);

			// 검색한 값의 총 합계
			for (int i = 0; i < pList.size(); i++) {
				int p = pList.get(i).getTotalPayment();
				sumTotalP += p;
				int c = pList.get(i).getTotalCount();
				sumTotalC += c;
			}

			// 연도별 검색 (Y)
		} else if (type.equalsIgnoreCase("Y")) {

			System.out.println(startD);
			System.out.println(lastD);
			startDay = startD.substring(0, 4);
			lastDay = lastD.substring(0, 4);
			System.out.println(startDay);
			System.out.println(lastDay);

			s.setLastDay(lastDay); // 마지막 날짜
			s.setStartDay(startDay); // 처음 날짜
			System.out.println(s);
			pArr = mService.selectYearList(s); // 사이 기간 뽑아오기

			// 화면에 노출될 매출 리스트 만들기
			int listCount = mService.getSalesYearCnt(pArr);
			System.out.println("리스트카운트느으으은" + listCount);
			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			pList = mService.selectPaymentYearsList(pArr, pi);
			for (int i = 0; i < pList.size(); i++) {
				String d = sdfy.format(pList.get(i).getPaymentDate());
				pList.get(i).setItemName(d);
			}

			System.out.println(pList);

			// 검색한 값의 총 합계
			ArrayList<AdminPayment> tot = mService.selectPaymentYearsList(pArr);

			for (int i = 0; i < tot.size(); i++) {
				int c = tot.get(i).getTotalCount();
				int p = tot.get(i).getTotalPayment();
				sumTotalC += c;
				sumTotalP += p;
			}

			// 월별 검색 (M)
		} else if (type.equalsIgnoreCase("M")) {

			System.out.println(startD);
			System.out.println(lastD);
			startDay = startD.substring(0, 7);
			lastDay = lastD.substring(0, 7);
			System.out.println(startDay);
			System.out.println(lastDay);

			s.setLastDay(lastDay); // 마지막 날짜
			s.setStartDay(startDay); // 처음 날짜
			System.out.println(s);
			pArr = mService.selectMonthList(s); // 사이 기간 뽑아오기
			System.out.println(pArr);

			// 화면에 노출될 매출 리스트 만들기
			int listCount = mService.getSalesMonthsCnt(pArr);
			System.out.println("리스트카운트느으으은" + listCount);
			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			pList = mService.selectPaymentMonthsList(pArr, pi);
			for (int i = 0; i < pList.size(); i++) {
				String d = sdfm.format(pList.get(i).getPaymentDate());
				pList.get(i).setItemName(d);
			}

			System.out.println(pList);

			// 검색한 값의 총 합계
			ArrayList<AdminPayment> tot = mService.selectPaymentMonthsList(pArr);

			for (int i = 0; i < tot.size(); i++) {
				int c = tot.get(i).getTotalCount();
				int p = tot.get(i).getTotalPayment();
				sumTotalC += c;
				sumTotalP += p;
			}

			// 일별 검색 (D)
		} else if (type.equalsIgnoreCase("D")) {

			lastDay = lastD;
			startDay = startD;

			// 검색할 날짜 뽑아오기

			s.setLastDay(lastDay); // 마지막 날짜
			s.setStartDay(startDay); // 처음 날짜
			System.out.println(s);
			pArr = mService.selectDateList(s);

			// 화면에 노출될 매출 리스트 만들기
			int listCount = mService.getSalesCnt(s);
			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			pList = mService.selectPaymentList(pArr, pi);

			// 검색한 값의 총 합계
			ArrayList<AdminPayment> tot = mService.selectPaymentList(pArr);

			for (int i = 0; i < tot.size(); i++) {
				int c = tot.get(i).getTotalCount();
				int p = tot.get(i).getTotalPayment();
				sumTotalC += c;
				sumTotalP += p;
			}
		}

		mv.addObject("pList", pList).addObject("pi", pi).addObject("type", type).addObject("lastDay", lastDay)
				.addObject("startDay", startDay).addObject("sumTotalP", sumTotalP).addObject("sumTotalC", sumTotalC)
				.setViewName("admin/salesDateList");
		return mv;
	}

	// 카테고리별 리스트 -admin
	@RequestMapping("sCategoryList.do")
	public ModelAndView selectSalesCategory(ModelAndView mv, String type,
			@RequestParam(value = "startD", required = false) String startD,
			@RequestParam(value = "lastD", required = false) String lastD) {

		System.out.println("타입은?" + type);

		// 공통 변수

		Calendar last = Calendar.getInstance(); // 현재 시간
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfy = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy-MM");
		Search sc = new Search();
		String lastDay = "";
		String startDay = "";
		int sumTotalP = 0; // 총 매출
		int sumTotalC = 0; // 총 건 수

		ArrayList<AdminPayment> pList = new ArrayList<>();
		ArrayList<Double> ratio = new ArrayList<>();
		ArrayList<Search> cat = new ArrayList<>();
		String[] ct = { "F1", "F2", "F3", "F4", "F5", "F6", "L1", "L2", "L3" };

		for (int i = 0; i < ct.length; i++) {
			Search s = new Search();
			s.setCategory1(ct[i]);
			cat.add(s);
		}

		// 기본 첫 화면 (N) --> 해당년도의 1월 1일부터 검색
		if (type.equalsIgnoreCase("N")) {

			lastDay = sdf.format(last.getTime());
			startDay = lastDay.substring(0, 4).concat("-01-01");

			for (int i = 0; i < cat.size(); i++) {
				cat.get(i).setStartDay(startDay);
				cat.get(i).setLastDay(lastDay);
			}

			// 화면에 노출될 매출 리스트 만들기

			for (int i = 0; i < cat.size(); i++) {

				AdminPayment p = mService.selectPaymentCategoryList(cat.get(i));

				if (p == null) {
					AdminPayment np = new AdminPayment();
					np.setCategoryNo(cat.get(i).getCategory1());
					np.setTotalPayment(0);
					np.setTotalCount(0);
					pList.add(np);
				} else {
					pList.add(p);
				}

			}

			// 검색한 값의 총 합계
			for (int i = 0; i < pList.size(); i++) {
				int p = pList.get(i).getTotalPayment();
				sumTotalP += p;

				int c = pList.get(i).getTotalCount();
				sumTotalC += c;
			}

			// 카테고리별 비율

			for (int i = 0; i < pList.size(); i++) {
				System.out.println(pList.get(i).getTotalPayment());
				System.out.println(sumTotalP);

				double r = 0;
				if (sumTotalP != 0) {
					r = (pList.get(i).getTotalPayment() * 100) / sumTotalP;
					System.out.println(r);
				}
				ratio.add(r);
			}

			System.out.println(ratio);

			// 오늘 검색(T)
		} else if (type.equalsIgnoreCase("T")) {

			lastDay = sdf.format(last.getTime());
			startDay = lastDay;
			for (int i = 0; i < cat.size(); i++) {
				cat.get(i).setStartDay(startDay);
				cat.get(i).setLastDay(lastDay);
			}

			// 화면에 노출될 매출 리스트 만들기

			for (int i = 0; i < cat.size(); i++) {

				AdminPayment p = mService.selectPaymentCategoryList(cat.get(i));

				if (p == null) {
					AdminPayment np = new AdminPayment();
					np.setCategoryNo(cat.get(i).getCategory1());
					np.setTotalPayment(0);
					np.setTotalCount(0);
					pList.add(np);
				} else {
					pList.add(p);
				}

			}

			// 검색한 값의 총 합계
			for (int i = 0; i < pList.size(); i++) {
				int p = pList.get(i).getTotalPayment();
				sumTotalP += p;
				int c = pList.get(i).getTotalCount();
				sumTotalC += c;
			}

			// 카테고리별 비율

			for (int i = 0; i < pList.size(); i++) {
				System.out.println(pList.get(i).getTotalPayment());
				System.out.println(sumTotalP);

				double r = 0;
				if (sumTotalP != 0) {
					r = (pList.get(i).getTotalPayment() * 100) / sumTotalP;
					System.out.println(r);
				}

				ratio.add(r);

			}

			// 일주일 검색(W)
		} else if (type.equalsIgnoreCase("W")) {

			lastDay = sdf.format(last.getTime());
			last.add(Calendar.DATE, -7);
			Date lastDate = new Date(last.getTimeInMillis());
			startDay = sdf.format(lastDate); // 7일전
			for (int i = 0; i < cat.size(); i++) {
				cat.get(i).setStartDay(startDay);
				cat.get(i).setLastDay(lastDay);
			}

			// 화면에 노출될 매출 리스트 만들기

			for (int i = 0; i < cat.size(); i++) {

				AdminPayment p = mService.selectPaymentCategoryList(cat.get(i));

				if (p == null) {
					AdminPayment np = new AdminPayment();
					np.setCategoryNo(cat.get(i).getCategory1());
					np.setTotalPayment(0);
					np.setTotalCount(0);
					pList.add(np);
				} else {
					pList.add(p);
				}

			}
			// 검색한 값의 총 합계
			for (int i = 0; i < pList.size(); i++) {
				int p = pList.get(i).getTotalPayment();
				sumTotalP += p;
				int c = pList.get(i).getTotalCount();
				sumTotalC += c;
			}
			// 카테고리별 비율

			for (int i = 0; i < pList.size(); i++) {
				System.out.println(pList.get(i).getTotalPayment());
				System.out.println(sumTotalP);

				double r = 0;
				if (sumTotalP != 0) {
					r = (pList.get(i).getTotalPayment() * 100) / sumTotalP;
					System.out.println(r);
				}

				ratio.add(r);

			}

			// 한달 검색 (O)
		} else if (type.equalsIgnoreCase("O")) {

			lastDay = sdf.format(last.getTime());
			last.add(Calendar.MONTH, -1);
			Date lastDate = new Date(last.getTimeInMillis());
			startDay = sdf.format(lastDate); // 1달전
			System.out.println(lastDay);
			System.out.println(startDay);
			for (int i = 0; i < cat.size(); i++) {
				cat.get(i).setStartDay(startDay);
				cat.get(i).setLastDay(lastDay);
			}

			// 화면에 노출될 매출 리스트 만들기

			for (int i = 0; i < cat.size(); i++) {

				AdminPayment p = mService.selectPaymentCategoryList(cat.get(i));

				if (p == null) {
					AdminPayment np = new AdminPayment();
					np.setCategoryNo(cat.get(i).getCategory1());
					np.setTotalPayment(0);
					np.setTotalCount(0);
					pList.add(np);
				} else {
					pList.add(p);
				}

			}

			// 검색한 값의 총 합계
			for (int i = 0; i < pList.size(); i++) {
				int p = pList.get(i).getTotalPayment();
				sumTotalP += p;
				int c = pList.get(i).getTotalCount();
				sumTotalC += c;
			}
			// 카테고리별 비율

			for (int i = 0; i < pList.size(); i++) {
				System.out.println(pList.get(i).getTotalPayment());
				System.out.println(sumTotalP);

				double r = 0;
				if (sumTotalP != 0) {
					r = (pList.get(i).getTotalPayment() * 100) / sumTotalP;
					System.out.println(r);
				}
				ratio.add(r);
			}

			// 일별 검색 (D)
		} else if (type.equalsIgnoreCase("D")) {

			lastDay = lastD;
			startDay = startD;
			for (int i = 0; i < cat.size(); i++) {
				cat.get(i).setStartDay(startDay);
				cat.get(i).setLastDay(lastDay);
			}

			// 화면에 노출될 매출 리스트 만들기

			for (int i = 0; i < cat.size(); i++) {

				AdminPayment p = mService.selectPaymentCategoryList(cat.get(i));

				if (p == null) {
					AdminPayment np = new AdminPayment();
					np.setCategoryNo(cat.get(i).getCategory1());
					np.setTotalPayment(0);
					np.setTotalCount(0);
					pList.add(np);
				} else {
					pList.add(p);
				}
			}
			// 검색한 값의 총 합계
			for (int i = 0; i < pList.size(); i++) {
				int p = pList.get(i).getTotalPayment();
				sumTotalP += p;
				int c = pList.get(i).getTotalCount();
				sumTotalC += c;
			}
			// 카테고리별 비율

			for (int i = 0; i < pList.size(); i++) {
				System.out.println(pList.get(i).getTotalPayment());
				System.out.println(sumTotalP);

				double r = 0;
				if (sumTotalP != 0) {
					r = (pList.get(i).getTotalPayment() * 100) / sumTotalP;
					System.out.println(r);
				}
				ratio.add(r);
			}
		}

		mv.addObject("pList", pList).addObject("type", type).addObject("lastDay", lastDay).addObject("ratio", ratio)
				.addObject("startD", startD).addObject("startDay", startDay).addObject("sumTotalP", sumTotalP)
				.addObject("sumTotalC", sumTotalC).setViewName("admin/salesCategoryList");
		return mv;

	}

	// 결제 상세리스트 -admin
	@RequestMapping("sDetail.do")
	public ModelAndView selectSalesDetail(ModelAndView mv, Integer beforePage, Integer page, String startD,
			String startDay, String lastDay, String type, String type2,
			@RequestParam(value = "lastD", required = false) String lastD,
			@RequestParam(value = "categoryNo", required = false) String categoryNo,
			@RequestParam(value = "word", required = false) String word,
			@RequestParam(value = "category", required = false) String category) throws java.text.ParseException {

		// 공통 변수

		ArrayList<AdminPayment> pList = new ArrayList<>();
		// 페이지
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		PageInfo pi = new PageInfo();
		String start = "";
		String last = "";

		System.out.println("전달받은 타입은!!!!!!" + type);
		System.out.println("startD는" + startD);
		System.out.println("lastD는" + lastD);
		System.out.println(category);

		if (type2.equals("date")) {

			if (word == "") {
				word = null;
			}

			if (categoryNo == "") {
				categoryNo = null;
			}

			// 일별 검색일때
			if (startD.length() == 10) {

				start = startD;

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar st = Calendar.getInstance();
				st.setTime(sdf.parse(startD));
				st.add(Calendar.DATE, +1);
				Date lastDate = new Date(st.getTimeInMillis());
				last = sdf.format(lastDate); // 하루 뒤

			} else if (startD.length() == 7) { // 월별 검색일때

				start = startD.concat("-01");

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
				Calendar st = Calendar.getInstance();
				st.setTime(sdf.parse(startD));
				st.add(Calendar.MONTH, +1);
				Date lastDate = new Date(st.getTimeInMillis());
				last = sdf.format(lastDate).concat("-01"); // 하루 뒤

			} else if (startD.length() == 4) { // 연별 검색일때

				start = startD.concat("-01-01");

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				Calendar st = Calendar.getInstance();
				st.setTime(sdf.parse(startD));
				st.add(Calendar.YEAR, +1);
				Date lastDate = new Date(st.getTimeInMillis());
				last = sdf.format(lastDate).concat("-01-01"); // 하루 뒤

				System.out.println("4개짜리일때");

			}

			if (category == null || category == "") {
				category = "N";
			}

			System.out.println("카카카테고리는" + category);

			Search s = new Search();
			s.setStartDay(start); // 검색 날짜
			s.setLastDay(last);
			s.setCategoryNo(categoryNo); // 카테고리
			s.setCategory1(category);

			if (category.equalsIgnoreCase("subscribeNo")) {
				s.setSubscribeNo(word);
			} else if (category.equalsIgnoreCase("itemNo")) {
				s.setItemNo(word);

			} else if (category.equalsIgnoreCase("itemName")) {
				s.setItemName(word);

			} else if (category.equalsIgnoreCase("memberId")) {
				s.setMemberId(word);
			} else {

				s.setSubscribeNo(word);
				s.setItemNo(word);
				s.setItemName(word);
				s.setMemberId(word);

			}

			System.out.println(s);

			int listCount = mService.getSalesDetailCnt(s);
			System.out.println("갯수는" + listCount);

			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			// 리스트 가져오기 (총 결제금액 제외)
			pList = mService.selectPaymentDetail(s, pi);
			System.out.println(pList.size());

			// 카테고리에서 왔으면
		} else {

			if (word == "") {
				word = null;
			}

			start = startDay;
			last = lastDay;

			if (category == null || category == "") {
				category = "N";
			}

			System.out.println("카카카테고리는" + category);

			Search s = new Search();
			s.setStartDay(start); // 검색 날짜
			s.setLastDay(last);
			s.setCategoryNo(categoryNo); // 카테고리
			s.setCategory1(category);

			if (category.equalsIgnoreCase("subscribeNo")) {
				s.setSubscribeNo(word);
			} else if (category.equalsIgnoreCase("itemNo")) {
				s.setItemNo(word);

			} else if (category.equalsIgnoreCase("itemName")) {
				s.setItemName(word);

			} else if (category.equalsIgnoreCase("memberId")) {
				s.setMemberId(word);
			} else {

				s.setSubscribeNo(word);
				s.setItemNo(word);
				s.setItemName(word);
				s.setMemberId(word);

			}

			System.out.println(s);

			int listCount = mService.getSalesDetailCnt(s);
			System.out.println("갯수는" + listCount);

			int pageLimit = 10; // 보여질 페이지 총 갯수
			int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
			pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

			// 리스트 가져오기 (총 결제금액 제외)
			pList = mService.selectPaymentDetail(s, pi);
			System.out.println(pList.size());

		}

		mv.addObject("pList", pList).addObject("beforePage", beforePage).addObject("startDay", startDay)
				.addObject("lastDay", lastDay).addObject("startD", startD).addObject("categoryNo", categoryNo)
				.addObject("pi", pi).addObject("type", type).addObject("type2", type2).setViewName("admin/salesDetail");
		return mv;
	}

	// 관리자메인---admin
	@RequestMapping("aMain.do")
	public ModelAndView selectAdminMain(ModelAndView mv) {

		// 방문 가입 통계 차트

		Calendar last = Calendar.getInstance(); // 현재 시간
		Date startDate = new Date(last.getTimeInMillis()); // Date형으로 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String lastDay = sdf.format(startDate);

		last.add(Calendar.DATE, -7);
		Date lastDate = new Date(last.getTimeInMillis());
		String startDay = sdf.format(lastDate); // 7일전

		Search s = new Search();
		s.setLastDay(lastDay);// 최근 날짜
		s.setStartDay(startDay); // 7일전 날짜

		// 7일의 날짜 데이터 뽑아오기
		ArrayList<String> dArr = mService.selectDateList(s);

		ArrayList<Chart> cArr = new ArrayList<>();

		// 방문&가입 차트 만들기
		for (int i = 0; i < dArr.size(); i++) {
			Chart c = new Chart();
			System.out.println("i번째 dArr은?" + dArr.get(i));
			int mCnt = mService.selectTodayMember(dArr.get(i));
			int vCnt = mService.selectTodayVisitor(dArr.get(i));
			String vDay = dArr.get(i).substring(5, 10).replace("-", "/");

			c.setVisitorNum(vCnt);
			c.setvDay(vDay);
			c.setMemberNum(mCnt);
			cArr.add(c);
		}

		// 주간 매출현황 차트
		int sumTotalP = 0; // 총 매출
		int sumTotalC = 0; // 총 건 수

		// 화면에 노출될 매출 리스트 만들기

		ArrayList<AdminPayment> pList = new ArrayList<>();

		for (int i = dArr.size() - 1; i >= 0; i--) {

			AdminPayment p = mService.selectPaymentMainList(dArr.get(i));
			System.out.println(p);
			if (p == null) {
				AdminPayment p2 = new AdminPayment();
				p2.setCategoryNo(dArr.get(i));
				p2.setTotalPayment(0);
				p2.setTotalCount(0);
				pList.add(p2);
			} else {
				p.setCategoryNo(dArr.get(i));
				pList.add(p);
			}

		}

		System.out.println("pList는" + pList);
		System.out.println("pList길이는" + pList.size());

		for (int i = 0; i < pList.size(); i++) {
			int c = pList.get(i).getTotalCount();
			int p = pList.get(i).getTotalPayment();
			sumTotalC += c;
			sumTotalP += p;
		}

		// 교환 대기 리스트
		ArrayList<AdminExchange> exList = mService.selectExchangeMain();

		// 배송 대기 리스트
		ArrayList<AdminSubscribe> dList = mService.selectDeliveryMain();

		// 미답변 문의 리스트
		ArrayList<AdminBoard> bList = mService.selectBoardMain();

		// 공지사항 리스트
		ArrayList<AdminBoard> nList = mService.selectNoticeMain();

		// 이벤트 리스트
		ArrayList<BannerItem> eList = mService.selectEventMain();
		System.out.println(eList);

		mv.addObject("cArr", cArr).addObject("pList", pList).addObject("exList", exList).addObject("dList", dList)
				.addObject("bList", bList).addObject("eList", eList).addObject("nList", nList)
				.setViewName("admin/main");
		return mv;
	}

	// ------------------------------ 관리자 ----------------------------------------------
	
	
}