package com.kh.finalGudok.item.controller;

import static com.kh.finalGudok.common.pagination.getPageInfo;
import static com.kh.finalGudok.common.pagination2.getPageInfo2;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalGudok.item.model.exception.ItemException;
import com.kh.finalGudok.item.model.service.ItemService;
import com.kh.finalGudok.item.model.vo.AdminItem;
import com.kh.finalGudok.item.model.vo.BannerItem;
import com.kh.finalGudok.item.model.vo.Board;
import com.kh.finalGudok.item.model.vo.Cart;
import com.kh.finalGudok.item.model.vo.Event;
import com.kh.finalGudok.item.model.vo.Heart;
import com.kh.finalGudok.item.model.vo.Image;
import com.kh.finalGudok.item.model.vo.Item;
import com.kh.finalGudok.item.model.vo.ItemListView;
import com.kh.finalGudok.item.model.vo.PageInfo;
import com.kh.finalGudok.item.model.vo.PaymentInfo;
import com.kh.finalGudok.item.model.vo.Review;
import com.kh.finalGudok.item.model.vo.ReviewImage;
import com.kh.finalGudok.item.model.vo.ReviewView;
import com.kh.finalGudok.item.model.vo.SearchItem;
import com.kh.finalGudok.member.model.service.MemberService;
import com.kh.finalGudok.member.model.vo.Member;
import com.kh.finalGudok.member.model.vo.Subscribe;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.AgainPaymentData;
import com.siot.IamportRestClient.request.ScheduleData;
import com.siot.IamportRestClient.request.ScheduleEntry;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.Schedule;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SessionAttributes("cartCount")
@Controller
public class ItemController {

	@Autowired
	ItemService iService;
	@Autowired
	private MemberService mService;

	// 신상품 페이지
	@RequestMapping("itemNew.do")
	private ModelAndView itemNew(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String sortNo) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = iService.getNewCount();
		System.out.println("newListCount : " + listCount);
		PageInfo pi = getPageInfo(currentPage, listCount);
		
		// 정렬을 적용하지 않았을 경우
		if (sortNo == null) {
			ArrayList<Item> list = iService.selectNewList(pi);
			mv.addObject("list", list).addObject("pi", pi).setViewName("items/itemNew");
			System.out.println("itemNew list : " + list);
		// 정렬을 적용한 경우
		} else if (sortNo != null) {
			ArrayList<Item> list = iService.selectNewList(pi, sortNo);
			mv.addObject("list", list).addObject("pi", pi).addObject("sortNo", sortNo).setViewName("items/itemNew");
			System.out.println("itemNew list : " + list);
		}
		return mv;
	}

	// 베스트 상품 페이지
	@RequestMapping("itemBest.do")
	private ModelAndView itemBest(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String sortNo) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = iService.getBestCount();
		System.out.println("bestListCount : " + listCount);
		PageInfo pi = getPageInfo(currentPage, listCount);
		
		// 정렬을 적용하지 않았을 경우
		if (sortNo == null) {
			ArrayList<Item> list = iService.selectBestList(pi);
			mv.addObject("list", list).addObject("pi", pi).setViewName("items/itemBest");
			System.out.println("itemBest list : " + list);
		// 정렬을 적용한 경우
		} else if (sortNo != null) {
			ArrayList<Item> list = iService.selectBestList(pi, sortNo);
			mv.addObject("list", list).addObject("pi", pi).addObject("sortNo", sortNo).setViewName("items/itemBest");
			System.out.println("itemBest list : " + list);
		}
		return mv;
	}

	// 푸드(대분류) 페이지
	@RequestMapping("itemFood.do")
	public ModelAndView itemList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String sortNo) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = iService.getItemCount();
//		System.out.println("listCount : " + listCount);

		PageInfo pi = getPageInfo(currentPage, listCount);
		
		// 푸드(대분류) 정렬을 적용하지 않았을 경우
		if (sortNo == null) {
			ArrayList<Item> list = iService.selectList(pi);
//			System.out.println("ArrayList : " + list);
			mv.addObject("list", list).addObject("pi", pi).setViewName("items/itemFood");
		// 푸드(대분류) 정렬을 적용한 경우
		} else if (sortNo != null) {
			ArrayList<Item> list = iService.selectList(pi, sortNo);
			mv.addObject("list", list).addObject("pi", pi).addObject("sortNo", sortNo).setViewName("items/itemFood");
		}

		return mv;
	}

	// 푸드(대분류) 페이지 중분류를 정렬하는 기능
	@RequestMapping("foodSort.do")
	public ModelAndView foodSort(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String categoryNo) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		// 중분류 카테고리 리스트 정렬을 적용한 경우(mybatis 활용이 제대로 안된 코드)
		if (categoryNo.equals("F1")) {
			int dListCount = iService.dListCount();
//			System.out.println("음료 Count : " + dListCount);
			PageInfo pi = getPageInfo(currentPage, dListCount);
			ArrayList<ItemListView> dList = iService.selectDList(pi);
			
			// addObject에 임의의 변수를 담아서 보낼 수 있다.
			mv.addObject("list", dList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F2")) {
			int mListCount = iService.mListCount();
//			System.out.println("유제품 Count : " + mListCount);
			PageInfo pi = getPageInfo(currentPage, mListCount);
			ArrayList<ItemListView> mList = iService.selectMList(pi);
			mv.addObject("list", mList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F3")) {
			int bListCount = iService.bListCount();
//			System.out.println("베이커리 Count : " + bListCount);
			PageInfo pi = getPageInfo(currentPage, bListCount);
			ArrayList<ItemListView> bList = iService.selectBList(pi);
			mv.addObject("list", bList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F4")) {
			int sListCount = iService.sListCount();
//			System.out.println("간편 Count : " + sListCount);
			PageInfo pi = getPageInfo(currentPage, sListCount);
			ArrayList<ItemListView> sList = iService.selectSList(pi);
			mv.addObject("list", sList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F5")) {
			int hListCount = iService.hListCount();
//			System.out.println("건강 Count : " + hListCount);
			PageInfo pi = getPageInfo(currentPage, hListCount);
			ArrayList<ItemListView> hList = iService.selectHList(pi);
			mv.addObject("list", hList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F6")) {
			int diListCount = iService.diListCount();
//			System.out.println("다이어트 Count : " + diListCount);
			PageInfo pi = getPageInfo(currentPage, diListCount);
			ArrayList<ItemListView> diList = iService.selectDiList(pi);
			mv.addObject("list", diList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).setViewName("items/itemFood");
		}

		return mv;
	}
	
	// 리빙(대분류) 페이지 중분류를 정렬하거나 소분류로 정렬하는 기능
	@RequestMapping("livingSort.do")
	public ModelAndView livingSort(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String categoryNo, @RequestParam(value = "sortNo", required = false) String sortNo) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		// 중분류 카테고리 리스트 정렬을 적용한 경우(mybatis 활용이 제대로 된 코드)
		if (categoryNo != null) {
			int livingCateCount = iService.livingCateCount(categoryNo);
			System.out.println("리빙 Count : " + livingCateCount);
			PageInfo pi = getPageInfo(currentPage, livingCateCount);
			
			// 2개 이상의 값을 보내는 경우 Dao에서 HashMap에 값들을 담아서 활용할 수 있다.
			ArrayList<ItemListView> livingCateList = iService.livingCateList(pi, categoryNo, sortNo);
			mv.addObject("list", livingCateList).addObject("pi", pi).addObject("livingChk", "L0")
					.addObject("categoryNo", categoryNo).addObject("sortNo", sortNo).setViewName("items/itemLiving");
		}
		return mv;
	}

	// 푸드(대분류) 페이지 중분류를 소분류로 정렬하는 기능
	@RequestMapping("fSort.do")
	public ModelAndView foodSort(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String categoryNo, @RequestParam("sortNo") String sortNo) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		System.out.println("sortNo : " + sortNo);
		
		// 중분류 카테고리 리스트 정렬을 적용한 상태로 소분류 정렬을 적용한 경우(mybatis 활용이 제대로 안된 코드)
		if (categoryNo.equals("F1") && sortNo != null) {
			int dListCounts = iService.dListCount();
			PageInfo pi = getPageInfo(currentPage, dListCounts);
			ArrayList<ItemListView> dLists = iService.selectDLists(pi, sortNo);
			mv.addObject("list", dLists).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).addObject("sortNo", sortNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F2") && sortNo != null) {
			int mListCount = iService.mListCount();
			PageInfo pi = getPageInfo(currentPage, mListCount);
			ArrayList<ItemListView> mList = iService.selectMLists(pi, sortNo);
			mv.addObject("list", mList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).addObject("sortNo", sortNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F3") && sortNo != null) {
			int bListCount = iService.bListCount();
			PageInfo pi = getPageInfo(currentPage, bListCount);
			ArrayList<ItemListView> bList = iService.selectBLists(pi, sortNo);
			mv.addObject("list", bList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).addObject("sortNo", sortNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F4") && sortNo != null) {
			int sListCount = iService.sListCount();
			PageInfo pi = getPageInfo(currentPage, sListCount);
			ArrayList<ItemListView> sList = iService.selectSLists(pi, sortNo);
			mv.addObject("list", sList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).addObject("sortNo", sortNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F5") && sortNo != null) {
			int hListCount = iService.hListCount();
			PageInfo pi = getPageInfo(currentPage, hListCount);
			ArrayList<ItemListView> hList = iService.selectHLists(pi, sortNo);
			mv.addObject("list", hList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).addObject("sortNo", sortNo).setViewName("items/itemFood");
		} else if (categoryNo.equals("F6") && sortNo != null) {
			int diListCount = iService.diListCount();
			PageInfo pi = getPageInfo(currentPage, diListCount);
			ArrayList<ItemListView> diList = iService.selectDiLists(pi, sortNo);
			mv.addObject("list", diList).addObject("pi", pi).addObject("foodChk", "F0")
					.addObject("categoryNo", categoryNo).addObject("sortNo", sortNo).setViewName("items/itemFood");
		}
		return mv;
	}

	// 리빙(대분류) 페이지
	@RequestMapping("itemLiving.do")
	public ModelAndView itemLivingList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String sortNo) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = iService.getItemLivingCount();
//		System.out.println("listCount : " + listCount);

		PageInfo pi = getPageInfo(currentPage, listCount);

		// 중분류 카테고리 리스트 정렬을 적용한 상태로 소분류 정렬을 적용한 경우(mybatis 활용이 제대로 된 코드)
		if (sortNo == null) {
			ArrayList<Item> list = iService.selectLivingList(pi);
//			System.out.println("ArrayList : " + list);
			mv.addObject("list", list).addObject("pi", pi).setViewName("items/itemLiving");
		} else if (sortNo != null) {
			ArrayList<Item> list = iService.selectLivingList(pi, sortNo);
			mv.addObject("list", list).addObject("pi", pi).addObject("sortNo", sortNo).setViewName("items/itemLiving");
		}

		return mv;
	}

	// 할인 상품 페이지
	@RequestMapping("itemEvent.do")
	public ModelAndView itemEventList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			String sortNo) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = iService.getItemEventCount();
//		System.out.println("listCount : " + listCount);

		PageInfo pi = getPageInfo(currentPage, listCount);
		
		// 정렬을 적용하지 않았을 경우
		if (sortNo == null) {
			ArrayList<Item> list = iService.selectEventList(pi);
//			System.out.println("ArrayList : " + list);
			mv.addObject("list", list).addObject("pi", pi).setViewName("items/itemEvent");
		// 정렬을 적용한 경우
		} else if (sortNo != null) {
			ArrayList<Item> list = iService.selectEventList(pi, sortNo);
			mv.addObject("list", list).addObject("pi", pi).addObject("sortNo", sortNo).setViewName("items/itemEvent");
		}
		return mv;
	}

	// 상품 상세 페이지
	@RequestMapping("idetail.do")
	public ModelAndView itemDetailPage(ModelAndView mv, Integer itemNo, @RequestParam("page") Integer page,
			Integer memberNo) {
//		System.out.println("itemNo : " + itemNo + ", page : " + page);
		int currentPage = page;
		
		// 해당 상품의 조회수 증가
		int result = iService.detailCount(itemNo);
//		System.out.println("증가함? : " + result);
		
		// 조회수가 증가했다면
		if (result > 0) {
			
			// DB의 ItemListView를 조회해 온다.
			ItemListView ilv = iService.selectItem(itemNo);
			
			// 상품이 존재한다면
			if (ilv != null) {
				mv.addObject("ilv", ilv).addObject("currentPage", currentPage).setViewName("items/itemDetail");
			// 상품이 존재하지 않는다면
			} else {
				throw new ItemException("조회 실패");
			}

			// 해당 상품의 상품평 조회
			ArrayList<Review> review = iService.selectReview(itemNo);
//			System.out.println("review 확인 : " + review);
			
			// 상품평이 존재한다면
			if (review != null) {
				
				// 해당 상품평의 이미지를 조회해서 화면단으로 넘겨준다.
				ArrayList<ReviewView> reviewImg = iService.selectAllReviewImg(itemNo);
				mv.addObject("review", review).addObject("img", reviewImg).setViewName("items/itemDetail");
			}
			
			// 찜 리스트를 조회(페이지 벗어났다가 다시 들어갈 시 itemDetail의 하트색 유지)해서 화면단으로 넘겨준다.
			Heart hResult = iService.detailHeart(itemNo);
			System.out.println("hResult : " + hResult);
			mv.addObject("hResult", hResult).setViewName("items/itemDetail");

		} else {
			throw new ItemException("조회수 증가 실패");
		}
		return mv;
	}
	
	// 전체 상품평 페이지
	@RequestMapping("itemReview.do")
	public ModelAndView reviewPage(ModelAndView mv, int itemNo) {
		
		// 전체 상품평을 조회
		ArrayList<Review> review = iService.selectAllReview(itemNo);
		
		// 상품평이 존재한다면
		if (review != null) {
			
			// 상품평의 이미지를 조회하고
			ArrayList<ReviewView> reviewImg = iService.selectAllReviewImg(itemNo);
			
			// 상품평의 itemNo로 Item을 조회해서 화면단으로 넘긴다.
			Item i = iService.reviewItemName(itemNo);
			mv.addObject("review", review).addObject("img", reviewImg).addObject("item", i)
					.setViewName("items/itemReview");
		}
		return mv;
	}

	@RequestMapping("iInsertView.do")
	public String itemRegisterPage() {
		return "admin/itemRegister";
	}

	@RequestMapping("eInsertView.do")
	public String eventPage() {
		return "admin/bannerRegister";
	}

	// 찜리스트 추가 버튼
	@RequestMapping("choice.do")
	@ResponseBody
	public String choiceInsert(HttpServletRequest request, Heart h, Integer itemNo) {
		
		// 찜 리스트에 추가하고
		int result = iService.insertChoice(h);
//		System.out.println("찜 확인 : " + result);
		
		// Item 테이블의 ITEM_CHOICE를 1증가시킨 후 화면단으로 돌아간다.
		int result2 = iService.updatePChoice(itemNo);
		if (result > 0 && result2 > 0) {
			return "success";
		} else {
			throw new ItemException("찜 실패");
		}
	}

	// 찜리스트 삭제 버튼
	@RequestMapping("choiceDel.do")
	@ResponseBody
	public String choiceDelete(HttpServletRequest request, Heart h, Integer itemNo) {
		
		// 찜 리스트에서 삭제하고
		int result = iService.deleteChoice(h);
//		System.out.println("찜 삭제 확인 : " + result);
		
		// Item 테이블의 ITEM_CHOICE를 1감소시킨 후 화면단으로 돌아간다.
		int result2 = iService.updateMChoice(itemNo);
		if (result > 0 && result2 > 0) {
			return "success";
		} else {
			throw new ItemException("찜 삭제 실패");
		}
	}

	// 장바구니 선택 리스트 삭제
	@ResponseBody
	@RequestMapping(value = "basketDel.do", method = RequestMethod.POST)
	public String cartDelete(HttpSession session, HttpServletRequest request, Model model,
			@RequestParam(value = "checkboxArr[]") List<String> checkArr, Cart c) {
		Member member = (Member) session.getAttribute("loginUser");
		String memberId = member.getMemberId();

		int cartNo = 0;

		
		if (member != null) {
			c.setMemberId(memberId);
			// forEach문을 돌려 memberId와 일치하는 선택한 리스트들을 지운다.
			for (String i : checkArr) {
				cartNo = Integer.parseInt(i);
				c.setCartNo(cartNo);
				iService.deleteCart(c);
				int cartCount = mService.cartCount(member.getMemberNo());
				System.out.println("장바구니 갯수 : " + cartCount);
				model.addAttribute("cartCount", cartCount);
			}
		}
		return "success";

	}

	// 장바구니 추가
	@RequestMapping("basket.do")
	@ResponseBody
	public String insertCart(HttpSession session, HttpServletRequest request, Cart c, Model model) {
		Member member = (Member) session.getAttribute("loginUser");

		// 장바구니에 이미 존재하는 상품인지 확인하고
		int search = iService.selectCart(c);
		System.out.println("search : " + search);
		
		// 상품이 존재하지 않다면
		if(search == 0) {
			// 장바구니에 추가한다.
			iService.insertCart(c);
			int cartCount = mService.cartCount(member.getMemberNo());
			System.out.println("장바구니 갯수 : " + cartCount);
			model.addAttribute("cartCount", cartCount);
			return "success";
		} else {
			return "fail";
		}
	}

	// 장바구니 페이지 리스트 불러오기
	@RequestMapping("basketPage.do")
	public ModelAndView basketPage(ModelAndView mv, Integer memberNo) {
		
		// 장바구니를 조회해서 화면단으로 넘겨준다.
		ArrayList<Cart> list = iService.selectBasket(memberNo);
		mv.addObject("list", list).setViewName("order/basket");
//			System.out.println("basketList : " + list);
		return mv;
	}

	// 상세 페이지 상품 문의
	@RequestMapping("inquire.do")
	@ResponseBody
	public String itemInquire(HttpServletRequest request, Board b) {
		
		// BOARD 테이블에 문의 사항을 insert하고
		int result = iService.insertInquired(b);
		
		// insert가 성공했다면
		if (result > 0) {
			
			// ONE_INQUIRY테이블과 INQUIRY 테이블에 필요한 값을 추가한다.
			iService.insertOneInquiry();
			iService.insertInquiry();
			return "success";
		} else {
			return "fail";
		}
	}

	// 리뷰 상세보기
	@RequestMapping("reviewDetail.do")
	public ModelAndView reviewDetail(ModelAndView mv, @RequestParam("reviewNo") int reviewNo) {
		
		// 해당 리뷰를 조회해서 화면단으로 넘겨준다.
		ArrayList<ReviewView> rv = iService.selectReviewDetail(reviewNo);
//		System.out.println("detail : " + rv);
		mv.addObject("rv", rv).setViewName("items/reviewUpdate");
		return mv;

	}

	private String saveFile(HttpServletRequest request, MultipartFile file) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		
		if (!folder.exists()) {
			folder.mkdir();
		}
		
		int random = (int) (Math.random() * 100000 + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + random + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String filePath = folder + "\\" + renameFileName;
		
		

		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return renameFileName;

	}

	// 상품등록-admin
	@RequestMapping("iInsert.do")
	public String itemInsert(HttpServletRequest request, AdminItem i,
			@RequestParam(value = "uploadFile1") MultipartFile uploadFile1,
			@RequestParam(value = "uploadFile2") MultipartFile uploadFile2) {

		int result1 = 0;
		int result2 = 0;

		String renameFileName = saveFile(request, uploadFile1);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		i.setImageOriginalName(uploadFile1.getOriginalFilename());
		i.setImageRename(renameFileName);
		i.setImagePath(savePath);

		result1 = iService.insertItem(i);

		String renameFileName2 = saveFile(request, uploadFile2);
		String root2 = request.getSession().getServletContext().getRealPath("resources");
		String savePath2 = root2 + "\\uploadFiles";

		i.setImageOriginalName(uploadFile2.getOriginalFilename());
		i.setImageRename(renameFileName2);
		i.setImagePath(savePath2);

		result2 = iService.insertImage(i);

		System.out.println(result1);
		System.out.println(result2);

		if (result1 > 0 && result2 > 0) {

			return "redirect:iInsertView.do";

		} else {
			throw new ItemException("상품 등록 실패");
		}

	}

	// 배너 이벤트 등록-admin
	@RequestMapping("eInsert.do")
	public String insertEvent(HttpServletRequest request, Event e, @RequestParam("uploadFile") MultipartFile file) {

		System.out.println("이벤트 등록 도착");
		String renameFileName = saveFile(request, file);
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		e.setImageOriginalName(file.getOriginalFilename());
		e.setImageRename(renameFileName);
		e.setImagePath(savePath);

		int result1 = iService.insertEvent(e);
		int result2 = iService.insertEventImg(e);

		if (result1 > 0 && result2 > 0) {
			return "redirect:eList.do";
		} else {
			throw new ItemException("배너 등록 실패!");
		}

	}

	// 이벤트 등록 페이지 가기
	@RequestMapping("eRegisterView.do")
	public String eventRegisterView() {
		return "admin/bannerRegister";
	}

	// 이벤트 리스트 보기-admin
	@RequestMapping("eList.do")
	public ModelAndView selectEvent(ModelAndView mv, Integer page,
			@RequestParam(value = "word", required = false) String word) {

		if (word == "") {
			word = null;
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = iService.getEventCount(word);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 14; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<BannerItem> list = iService.selectEventListA(word, pi); // 이벤트 리스트
		ArrayList<Integer> eCountList = new ArrayList<>();

		for (int i = 0; i < list.size(); i++) {

			Integer s = iService.selectEventListCount(list.get(i).getEventNo()); // 이벤트당 상품갯수
			if (s == null) {
				s = 0;
			}
			eCountList.add(s);
		}

		System.out.println(list);
		System.out.println(eCountList);

		if (list != null && eCountList != null) {
			mv.addObject("list", list);
			mv.addObject("eCountList", eCountList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/bannerList");

		} else {
			throw new ItemException("이벤트 전체 조회 실패!");
		}
		return mv;
	}

	// 이벤트 삭제-admin
	@RequestMapping("eDelete.do")
	public String deleteEvent(HttpServletRequest request, String sendArr) {

		String[] strArr = sendArr.split(",");

		int[] dEventArr = new int[strArr.length];

		for (int i = 0; i < strArr.length; i++) {
			dEventArr[i] = Integer.valueOf(strArr[i]);
			System.out.println("선택된 값:" + strArr[i]);
		}

		int result1 = 0; // 이벤트 삭제
		int result2 = 0; // 연결된 상품 삭제
		int result3 = 0; // 배너 이미지 삭제
		int result4 = 0; // 이미지 삭제
		int result5 = 0; // 이벤트에 속했던 아이템의 status 변경

		for (int k = 0; k < dEventArr.length; k++) {

			Event e = iService.selectDeleteEvent(dEventArr[k]);
			System.out.println("이게 뭐길래"+e);

			if (e.getImageOriginalName() != null) {
				deleteFile(e.getImageRename(), request);
			}

			result1 = iService.deleteEvent(dEventArr[k]);
			result5 = iService.updateItemBannerStatus(dEventArr[k]);
			result2 = iService.deleteEventItem(dEventArr[k]);
			result3 = iService.deleteEventImg(dEventArr[k]);
			result4 = iService.deleteEventBannerImg(dEventArr[k]);
		}

		if (result1 > 0 && result3 > 0 && result4 > 0) {

			return "redirect:eList.do";

		} else {
			throw new ItemException("이벤트 삭제 실패!");
		}

	}

	// 이벤트 게시-admin
	@RequestMapping("eChangeY.do")
	@ResponseBody
	public String updateEventStatusY(String sendArr) {

		System.out.println("y컨트롤러옴");
		System.out.println(sendArr);

		String[] strArr = sendArr.split(",");
		System.out.println(strArr[0].toString());
		System.out.println(strArr.length);

		ArrayList<Event> dEventArr = new ArrayList<>();
		Event e = new Event();

		for (int i = 0; i < strArr.length; i++) {
			e = new Event(Integer.valueOf(strArr[i]));
			dEventArr.add(e);

			System.out.println(dEventArr.get(i).getEventNo());
		}

		System.out.println("dEventArr길이" + dEventArr.size());
		System.out.println("확인할것" + dEventArr.toString());

		int result = 0;

		result = iService.updateEventStatusY(dEventArr);

		System.out.println("변경된 갯수" + result);

		if (result > 0) {

			return "success";

		} else {
			throw new ItemException("이벤트 게시 변경 실패!");
		}
	}

	// 이벤트 중지-admin
	@RequestMapping("eChangeN.do")
	@ResponseBody
	public String updateEventStatusN(String sendArr) {

		System.out.println("y컨트롤러옴");
		System.out.println(sendArr);

		String[] strArr = sendArr.split(",");
		System.out.println(strArr[0].toString());
		System.out.println(strArr.length);

		ArrayList<Event> dEventArr = new ArrayList<>();
		Event e = new Event();

		for (int i = 0; i < strArr.length; i++) {
			e = new Event(Integer.valueOf(strArr[i]));
			dEventArr.add(e);

			System.out.println(dEventArr.get(i).getEventNo());
		}

		System.out.println("dEventArr길이" + dEventArr.size());
		System.out.println("확인할것" + dEventArr.toString());

		int result = 0;

		result = iService.updateEventStatusN(dEventArr);

		System.out.println("변경된 갯수" + result);

		if (result > 0) {

			return "success";

		} else {
			throw new ItemException("이벤트 게시 변경 실패!");
		}
	}

	// 상품평 수정
	@RequestMapping("reviewUpdate.do")
	public ModelAndView reviewUpdate(Review r, ModelAndView mv, @RequestParam("itemNo") int itemNo) {
//			System.out.println("Review : " + r);
		
		// 상품평을 수정하고
		int result = iService.reviewUpdate(r);
//			System.out.println("itemNo 확인 : " + itemNo);
//			System.out.println("review update 결과 : " + result);
		
		// 상품평이 수정되었다면
		if (result > 0) {
			// ITEM 테이블의 ITEM_RATE 값을 갱신한다.
			int rateResult = iService.updateReviewRate(itemNo);
//				System.out.println("평균 update 확인 : " + rateResult);
			mv.setViewName("redirect:itemReview.do?itemNo=" + itemNo);
		}
		return mv;
	}

	// 상품평 삭제
	@RequestMapping("reviewDelete.do")
	public ModelAndView reviewDelete(HttpServletRequest request, ModelAndView mv, int reviewNo, int itemNo) {
//			System.out.println("reviewNo 넘어 옴? : " + reviewNo);
		
		// 상품평의 이미지를 조회해 오고
		ArrayList<ReviewView> rv = iService.selectDeleteReview(reviewNo);
		// uploadFiles에 있는 파일 이름과 조회해온 rename이 일치하는 이미지를 삭제한다.
		for (ReviewView r : rv) {
			if (r.getImageOriginalName() != null) {
				deleteFile(r.getImageRename(), request);
			}
		}
		
		// 이미지가 있는지 조회하고
		int chkImg = iService.checkImage(reviewNo);
		System.out.println("ReviewImage 조회 되나? : " + chkImg);
		
		// 이미지가 있다면
		if (chkImg > 0) {
			// IMAGE 테이블과 REVIEW_IMAGE 테이블에 있는 일치하는 값을 삭제한다.
			int imResult = iService.imageDelete(reviewNo);
			if (imResult > 0) {
				iService.reviewImageDelete(reviewNo);
			}
		}
		
		// 마지막으로 REVIEW 테이블에 있는 값을 삭제한다.
		int result = iService.reviewDelete(reviewNo);

		// 마지막 값까지 삭제가 완료되었다면
		if (result > 0) {
			
			// 해당 ITEM의 REVIEW 테이블을 조회해 오고
			ArrayList<Review> review = iService.selectAllReview(itemNo);
			
			// 해당 ITEM의 상품평이 존재하지 않는다면
			if (review.size() == 0) {
				// ITEM 테이블의 ITEM_RATE를 0으로 바꿔준다.
				int count0 = iService.updateReviewRate0(itemNo);
				mv.setViewName("redirect:itemReview.do?itemNo=" + itemNo);
			// 해당 ITEM의 상품평이 존재한다면
			} else {
				// ITEM 테이블의 ITEM_RATE 값을 갱신한다.
				iService.updateReviewRate(itemNo);
				mv.setViewName("redirect:itemReview.do?itemNo=" + itemNo);
			}
		}
		return mv;
	}

	// 상품평 이미지 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\iuploadFiles";
		File f1 = new File(savePath + "\\" + fileName);
		if (f1.exists()) {
			f1.delete();
		}
	}

	// 상품평 쓰기
	@RequestMapping(value = "reviewInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String reviewInsert(Review r, Image i, ReviewImage ri, HttpServletRequest request,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "memberNo", required = false) int memberNo,
			@RequestParam(value = "itemNo", required = false) int itemNo,
			@RequestParam(value = "uploadFile1", required = false) MultipartFile file1,
			@RequestParam(value = "uploadFile2", required = false) MultipartFile file2) {
		Subscribe scb = new Subscribe();
		scb.setMemberNo(memberNo);
		scb.setItemNo(itemNo);
		int currentPage = page;
		System.out.println("memberNo : " + memberNo + ", itemNo : " + itemNo);
		
		// 배송 상태를 확인하고
		int deliveryChk = iService.selectDelChk(scb);
		// 상품평이 이미 존재하는지 확인한 후
		int reviewChk = iService.selectReviewChk(scb);
		System.out.println("del값 확인 : " + deliveryChk);
		
		// 배송 상태가 Y이면서 상품평을 쓰지 않았다면
		if(deliveryChk > 0 && reviewChk == 0) {
			
			// 상품평을 등록하고
			int result = iService.insertReview(r);
			// ITEM 테이블의 ITEM_RATE 값을 갱신한다
			int updateResult = iService.updateReviewRate(itemNo);
			
			// 상품평 등록 시 이미지1이 있다면
			if (!file1.getOriginalFilename().equals("")) {
				String renameFileName1 = saveFile(file1, request);
				i.setImageOriginalName(file1.getOriginalFilename());
				i.setImageRename(renameFileName1);
				
				// REVIEW_IMAGE 테이블에 REVIEW의 마지막 REVIEW_NO와 일치하는 값을 insert하고
				int imgResult1 = iService.insertReviewImage1(i);
				if (imgResult1 > 0) {
					// IMAGE 테이블에 마지막 REVIEW_IMAGE_NO와 일치하는 값을 insert한다.
					iService.insertRI(ri);
				}
			}else {
				
			}
			
			// 상품평 등록 시 이미지2가 있다면
			if (!file2.getOriginalFilename().equals("")) {
				String renameFileName2 = saveFile(file2, request);
				i.setImageOriginalName(file2.getOriginalFilename());
				i.setImageRename(renameFileName2);
				
				// REVIEW_IMAGE 테이블에 REVIEW의 마지막 REVIEW_NO와 일치하는 값을 insert하고
				int imgResult2 = iService.insertReviewImage2(i);
				if (imgResult2 > 0) {
					// IMAGE 테이블에 마지막 REVIEW_IMAGE_NO와 일치하는 값을 insert한다.
					iService.insertRI(ri);
				}
			}else {
				
			}
	
			System.out.println("review result : " + result);
			if (result > 0 && updateResult > 0) {
				return "success";
			} else {
				throw new ItemException("리뷰 등록 실패");
			}
		}else {
			// 배송 상태가 Y가 아니라면
			if(deliveryChk == 0) {
				// 배송 상태를 조회해 오고
				int delStatus = iService.selectDelStatus(scb);
				// 배송 상태가 없다면
				if(delStatus == 0) {
					// "상품평 쓰기 권한이 없습니다."를 출력
					return "noDelFail";
				// 배송 상태가 있다면
				}else {
					// "배송 완료된 상품이 아닙니다."를 출력
					return "delFail";
				}
			// 배송 상태는 Y지만 REVIEW 테이블에 이미 해당 상품의 상품평이 존재한다면
			}else {
				// "이미 등록된 상품평이 존재합니다."를 출력
				return "reviewFail";
			}
		}
	}

	// 파일 업로드(경로 저장, 파일 rename)
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		// root에 resources의 경로를 담아주고
		String root = request.getSession().getServletContext().getRealPath("resources");
		// savePath경로에 iuploadFiles를 추가한다.
		String savePath = root + "\\iuploadFiles";
		// folder에 savePath 경로를 담고
		File folder = new File(savePath);
		// 경로에 uploadFiles가 존재하지 않는다면 생성한다.
		if (!folder.exists()) {
			folder.mkdirs();
		}

//			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//			String originFileName = file.getOriginalFilename();
//			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + 
//			originFileName.substring(originFileName.lastIndexOf(".")+1);

		// 날짜와 임의의 난수를 더해 rename을 지정한다.
		int random = (int) (Math.random() * 100000 + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + random + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String filePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return renameFileName;
	}

	// 이벤트 리스트 보기-admin
	@RequestMapping("eListChange.do")
	public void selectEventChange(HttpServletResponse response, Integer page,
			@RequestParam(value = "itemCategory", required = false) String itemCategory) throws IOException {

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = iService.getEventCount(itemCategory);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 14; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<BannerItem> list = iService.selectEventListA(itemCategory, pi); // 이벤트 리스트
		ArrayList<Integer> eCountList = new ArrayList<>();

		for (int i = 0; i < list.size(); i++) {

			Integer s = iService.selectEventListCount(list.get(i).getEventNo()); // 이벤트당 상품갯수
			if (s == null) {
				s = 0;
			}
			eCountList.add(s);
		}

		response.setContentType("application/json;charset=utf-8");

		if (list != null && eCountList != null) {

			System.out.println(list);
			System.out.println(eCountList);
			JSONArray jarr = new JSONArray();

			for (int i = 0; i < list.size(); i++) {
				JSONObject jList = new JSONObject();

				jList.put("eventNo", list.get(i).getEventNo());
				jList.put("eventName", list.get(i).getEventName());
				jList.put("eventCnt", eCountList.get(i));
				jList.put("eventStatus", list.get(i).getEventStatus());

				jarr.add(jList);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("bannerList", jarr);

			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		} else {
			throw new ItemException("이벤트 전체 조회 실패!");
		}

	}

	// 이벤트 검색-admin
	@RequestMapping("searchEventA.do")
	public String searchEventA(String word) {

		Event e = new Event();
		e.setEventName(word);
		System.out.println("도착?" + word);

		return null;

	}

	// 판매 상품 전체 보기-admin
	@RequestMapping("itemListA.do")
	public ModelAndView selectItemListA(ModelAndView mv, Integer page,
			@RequestParam(value = "categoryNo", required = false) String categoryNo,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "word", required = false) String word) throws IOException {

		if (type == "") {
			type = null;
		}
		if (categoryNo == "") {
			categoryNo = null;
		}
		if (word == "") {
			word = null;
		}

		System.out.println(categoryNo);
		System.out.println(type);
		System.out.println(word);

		SearchItem s = new SearchItem();
		s.setCategoryNo(categoryNo);

		if (type == null) {
			s.setItemNo(word);
			s.setItemName(word);

		} else {
			System.out.println("있는 경우");
			if (type.equalsIgnoreCase("itemNo")) {
				System.out.println("넘버에 단어 저장");
				s.setItemNo(word);
			} else {
				System.out.println("이름에 단어 저장");
				s.setItemName(word);
			}
		}

		System.out.println(s);

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = iService.getItemCountA(s);
		System.out.println("갯수우?" + listCount);
		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 10; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<BannerItem> rList = iService.selectRecommendList();

		ArrayList<BannerItem> list = iService.selectItemListA(s, pi);
		System.out.println(list);

		mv.addObject("list", list);
		mv.addObject("rList", rList);
		mv.addObject("pi", pi);
		mv.addObject("categoryNo", categoryNo);
		mv.addObject("type", type);
		mv.addObject("word", word);
		mv.setViewName("admin/itemList");

		return mv;

	}

	// 같은 이벤트 번호를 지닌 아이템들 리스트 보기-admin
	@RequestMapping("bannerDetail.do")
	public ModelAndView bannerDetail(ModelAndView mv, Integer eventNo, Integer page) throws IOException {

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		Event ev = new Event();
		ev.setEventNo(eventNo);

		int listCount = iService.getbannerItemCount(eventNo);

		PageInfo pi = new PageInfo();
		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수

		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<BannerItem> biList = iService.selectBannerItem(eventNo, pi);
		mv.addObject("list", biList);
		mv.addObject("pi", pi);
		mv.addObject("ev", ev);
		mv.setViewName("admin/bannerDetail");
		return mv;
	}

	// 이벤트 상품 제외-admin
	@RequestMapping("bannerItemDelete.do")
	@ResponseBody
	public String deleteBannerItem(HttpServletRequest request, String sendArr) {

		String[] strArr = sendArr.split(",");

		int[] dEventArr = new int[strArr.length];

		for (int i = 0; i < strArr.length; i++) {
			dEventArr[i] = Integer.valueOf(strArr[i]);
			System.out.println(dEventArr[i]);

		}

		int result = iService.deleteBannerItem(dEventArr);
		int result2 = iService.updateItemEventStatusN(dEventArr);

		if (result > 0) {

			return "success";

		} else {
			throw new ItemException("이벤트 삭제 실패!");
		}

	}

	// 배너 상품 제외 ajax용 -admin
	@RequestMapping("biChange.do")

	public void biChange(int eventNo, HttpServletResponse response, Integer page) throws IOException {

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		Event ev = new Event();
		ev.setEventNo(eventNo);

		int listCount = iService.getbannerItemCount(eventNo);

		PageInfo pi = new PageInfo();
		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수

		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<BannerItem> biList = iService.selectBannerItem(eventNo, pi);

		response.setContentType("application/json;charset=utf-8");

		if (biList != null) {

			System.out.println(biList);
			JSONArray jarr = new JSONArray();

			for (int i = 0; i < biList.size(); i++) {
				JSONObject jList = new JSONObject();

				jList.put("eventNo", biList.get(i).getEventNo());
				jList.put("itemNo", biList.get(i).getItemNo());
				jList.put("itemName", biList.get(i).getItemName());
				jList.put("itemPrice", biList.get(i).getItemPrice());
				jList.put("itemDpStatus", biList.get(i).getItemDpStatus());

				jarr.add(jList);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("list", jarr);

			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		} else {
			throw new ItemException("이벤트별 상품 조회 실패!");
		}

	}

	// 아이템 게시-admin
	@RequestMapping("iChangeY.do")
	@ResponseBody
	public String updateItemStatusY(String sendArr) {

		System.out.println("중지 컨트롤러");
		System.out.println(sendArr);

		String[] strArr = sendArr.split(",");
		System.out.println(strArr[0].toString());
		System.out.println(strArr.length);

		ArrayList<BannerItem> iArr = new ArrayList<>();

		for (int i = 0; i < strArr.length; i++) {

			BannerItem item = new BannerItem();
			item.setItemNo(Integer.valueOf(strArr[i]));
			iArr.add(item);

			System.out.println(iArr.get(i).getItemNo());
		}

		System.out.println("iArr길이" + iArr.size());
		System.out.println("확인할것" + iArr.toString());

		int result = 0;

		result = iService.updateItemStatusY(iArr);

		System.out.println("변경된 갯수" + result);

		if (result > 0) {

			return "success";

		} else {
			throw new ItemException("이벤트 게시 변경 실패!");
		}
	}

	// 아이템 게시 중지-admin
	@RequestMapping("iChangeN.do")
	@ResponseBody
	public String updateItemStatusN(String sendArr) {

		System.out.println("중지 컨트롤러");
		System.out.println(sendArr);

		String[] strArr = sendArr.split(",");
		System.out.println(strArr[0].toString());
		System.out.println(strArr.length);

		ArrayList<BannerItem> iArr = new ArrayList<>();

		for (int i = 0; i < strArr.length; i++) {

			BannerItem item = new BannerItem();
			item.setItemNo(Integer.valueOf(strArr[i]));
			iArr.add(item);

			System.out.println(iArr.get(i).getItemNo());
		}

		System.out.println("iArr길이" + iArr.size());
		System.out.println("확인할것" + iArr.toString());

		int result = 0;

		result = iService.updateItemStatusN(iArr);

		System.out.println("변경된 갯수" + result);

		if (result > 0) {

			return "success";

		} else {
			throw new ItemException("이벤트 게시 변경 실패!");
		}
	}

	// 상태 변경 후 상품 리스트 보기-admin
	@RequestMapping("iListChange.do")
	public void selectItemChange(HttpServletResponse response, Integer page,
			@RequestParam(value = "categoryNo", required = false) String categoryNo,
			@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "word", required = false) String word) throws IOException {

		if (type == "") {
			type = null;
		}
		if (categoryNo == "") {
			categoryNo = null;
		}
		if (word == "") {
			word = null;
		}

		System.out.println(categoryNo);
		System.out.println(type);
		System.out.println(word);

		SearchItem s = new SearchItem();
		s.setCategoryNo(categoryNo);

		if (type == null) {
			s.setItemNo(word);
			s.setItemName(word);

		} else {

			if (type.equalsIgnoreCase("itemNo")) {
				s.setItemNo(word);
			} else {
				s.setItemName(word);
			}
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = iService.getItemCountA(s);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 10; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		ArrayList<BannerItem> list = iService.selectItemListA(s, pi);

		response.setContentType("application/json;charset=utf-8");

		if (list != null) {

			System.out.println(list);

			JSONArray jarr = new JSONArray();

			for (int i = 0; i < list.size(); i++) {
				JSONObject jList = new JSONObject();

				jList.put("itemNo", list.get(i).getItemNo());
				jList.put("itemName", list.get(i).getItemName());
				jList.put("itemPrice", list.get(i).getItemPrice());
				jList.put("itemDiscount", list.get(i).getItemDiscount());
				jList.put("itemDpStatus", list.get(i).getItemDpStatus());

				jarr.add(jList);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("list", jarr);

			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		} else {
			throw new ItemException("이벤트 전체 조회 실패!");
		}

	}

	// 상품 상세보기 -admin
	@RequestMapping("itemDetail.do")

	public ModelAndView selectItemDetail(ModelAndView mv, int itemNo, @RequestParam(value="itemCategory",required=false) String itemCategory, @RequestParam(value="eventNo",required=false) Integer eventNo,Integer page, String type
			, @RequestParam(value="type2",required=false)String type2, @RequestParam(value="categoryNo",required=false)String categoryNo, @RequestParam(value="word",required=false)String word) {

		System.out.println("아이템 디테일" + type);

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		BannerItem i = iService.selectAdminItem(itemNo); // 상품 정보
		ArrayList<BannerItem> m = iService.selectItemImg(itemNo); // 이미지 정보
		System.out.println(m);

		mv.addObject("i", i);
		mv.addObject("m", m);
		mv.addObject("type", type);
		mv.addObject("eventNo", eventNo);
		mv.addObject("categoryNo", categoryNo);
		mv.addObject("type2", type);
		mv.addObject("word", word);
		mv.addObject("page", currentPage).addObject("itemCategory",itemCategory);
		mv.setViewName("admin/itemModify");

		return mv;
	}

	// 상품 정보 수정
	@RequestMapping("itemUpdate.do")
	public ModelAndView updateItem(ModelAndView mv, HttpServletRequest request, BannerItem i,
			@RequestParam("page") Integer page, @RequestParam(value = "uploadFile1") MultipartFile uploadFile1,
			@RequestParam(value = "uploadFile2") MultipartFile uploadFile2) {

		int imgNo = iService.selectImageNo(i); // 이미지 번호 가져오기

		System.out.println(imgNo);
		String renameFileName = "";
		int result1 = 0;
		
		
		// 상세 이미지 파일 삭제
		if (!uploadFile2.getOriginalFilename().equals("")) {
			if (i.getImageOriginalName() != null) {
				deleteFile(i.getImageRename(), request);
			}
			
			//새로운 상세 이미지 파일 저장,db에도 저장
			renameFileName = saveFile(request, uploadFile2);

			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles";

			i.setImageOriginalName(uploadFile2.getOriginalFilename());
			i.setImageRename(renameFileName);
			i.setImagePath(savePath);
			i.setItemNo(imgNo);

			result1 = iService.updateItemImg(i); // 이미지 파일명 DB정보 변경
			
		}
			
		
		//메인이미지 파일저장,db변경
		if (!uploadFile1.getOriginalFilename().equals("")) {
			if (i.getImageOriginalName() != null) {
				System.out.println("실행됨?");
				deleteFile(i.getImageRename(), request);
			
			}
			
			String renameFileName2 = saveFile(request, uploadFile1);
			String root2 = request.getSession().getServletContext().getRealPath("resources");
			String savePath2 = root2 + "\\uploadFiles";

			i.setImageOriginalName(uploadFile1.getOriginalFilename());
			i.setImageRename(renameFileName2);
			i.setImagePath(savePath2);
			i.setItemNo(imgNo);

			
			}
		

		System.out.println("111i"+i);
		int result2 = iService.updateItem(i); // item테이블 정보 수정
//			int result3=iService.deleteEventItem(i); //이벤트 등록 테이블에서 상품 삭제

		if (result1 > 0 || result2 > 0) {

			mv.addObject("page", page).setViewName("redirect:itemListA.do");

		} else {
			throw new ItemException("상품 정보 수정 실패!");
		}

		return mv;

	}

	// 상품 삭제-admin
	@RequestMapping("iDelete.do")
	public ModelAndView deleteItemA(ModelAndView mv, HttpServletRequest request, String sendArr, Integer page) {

		
		String[] strArr = sendArr.split(",");

		int[] dEventArr = new int[strArr.length];
		
		
		

		for (int i = 0; i < strArr.length; i++) {
			dEventArr[i] = Integer.valueOf(strArr[i]);
			System.out.println("선택된 값:" + strArr[i]);
		}

		int result1 = 0; // 상품 삭제
		int result2 = 0; // 상품 이미지 삭제
		int result3 = 0; // 상품 이미지 삭제
		int result4 = 0; // 상품 이미지 삭제

		// 선택한 상품의 정보를 객체에 담아 각각의 테이블에 있는 값을 삭제
		for (int k = 0; k < dEventArr.length; k++) {

			BannerItem b = iService.selectDeleteItem(dEventArr[k]);
			System.out.println(b.toString());

			if (b.getImageOriginalName() != null) {
				deleteFile(b.getImageRename(), request);
			}
			System.out.println("나와랏" + dEventArr[k]);

			result1 = iService.deleteImgA(dEventArr[k]);
			result2 = iService.deleteItemImgA(dEventArr[k]);
			result3 = iService.deleteItemEvent(dEventArr[k]);
			result4 = iService.deleteItemA(dEventArr[k]);

		}

		System.out.println("시작" + result1);
		System.out.println(result2);
		System.out.println(result3);
		System.out.println(result4);

		if (result4 > 0) {

			mv.addObject("page", page).setViewName("redirect:itemListA.do");
			return mv;

		} else {
			throw new ItemException("이벤트 삭제 실패!");
		}

	}

	// 이벤트 상품 등록-admin
	@RequestMapping("iEventInsertView.do")
	public ModelAndView itemEventInsertView(ModelAndView mv, Integer page,
			@RequestParam(value = "itemCategory", required = false) String itemCategory) {

		if (itemCategory == "") {
			itemCategory = null;
		}
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = iService.getNonEventItemCnt(itemCategory);
		

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 9; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		// 이벤트 목록
		ArrayList<BannerItem> eArr = iService.selectEventOption();

		// 이벤트 등록이 안된 상품 리스트
		ArrayList<BannerItem> list = iService.selectItems(itemCategory, pi);

		
		
		if (eArr != null && list != null) {

			mv.addObject("eArr", eArr);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("itemCategory", itemCategory);

			mv.setViewName("admin/itemEvent");
			return mv;

		} else {
			throw new ItemException("이벤트 삭제 실패!");
		}

	}

	// 아이템 이벤트에 등록 -admin
	@RequestMapping("eventItemInsert.do")
	@ResponseBody
	public String eventItemInsert(HttpServletRequest request, int eventNo, int itemDiscount, String sendArr,
			Integer page) {

		String[] strArr = sendArr.split(",");

		int[] iArr = new int[strArr.length];

		for (int i = 0; i < strArr.length; i++) {
			iArr[i] = Integer.valueOf(strArr[i]);

		}

		int result1 = 0;
		int result2 = 0;
		int result3 = 0;

		for (int k = 0; k < iArr.length; k++) {

			// 아이템 테이블에서 스테이터스 y로 바꿔주기
			result1 = iService.updateItemEventStatus(iArr[k]);

			// 이벤트 상품에 상품번호, 할인율, 이벤트 번호로 테이블 채우기 (기존 자료는 삭제)
			BannerItem i = new BannerItem();
			i.setItemNo(iArr[k]);
			i.setEventNo(eventNo);
			i.setItemDiscount(itemDiscount);

			System.out.println(i.getEventNo());
			System.out.println(i.getItemDiscount());

			result2 = iService.deleteEventItemBefore(i);
			result3 = iService.insertEventItem(i);

		}

		if (result1 > 0 && result3 > 0) {

			return "success";

		} else {
			throw new ItemException("이벤트 삭제 실패!");
		}

	}

	// 이벤트 상품 리스트 변경 -admin
	@RequestMapping("eventItemListChange.do")
	public void EventItemListChange(HttpServletResponse response, Integer page,
			@RequestParam(value = "itemCategory", required = false) String itemCategory) throws IOException {

		if (itemCategory == "") {
			itemCategory = null;
		}

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = iService.getEventCount(itemCategory);

		PageInfo pi = new PageInfo();

		int pageLimit = 10; // 보여질 페이지 총 갯수
		int boardLimit = 5; // 게시판 한 페이지에 뿌려질 게시글 수
		pi = getPageInfo2(currentPage, listCount, pageLimit, boardLimit);

		// 이벤트 등록이 안된 상품 목록

		ArrayList<BannerItem> list = iService.selectItems(itemCategory, pi);

		response.setContentType("application/json;charset=utf-8");

		if (list != null) {

			System.out.println(list);

			JSONArray jarr = new JSONArray();

			for (int i = 0; i < list.size(); i++) {
				JSONObject jList = new JSONObject();

				jList.put("itemNo", list.get(i).getItemNo());
				jList.put("itemName", list.get(i).getItemName());
				jList.put("itemPrice", list.get(i).getItemPrice());
				jList.put("itemRate", list.get(i).getItemRate());

				jarr.add(jList);
			}

			JSONObject sendJson = new JSONObject();
			sendJson.put("list", jarr);

			PrintWriter out = response.getWriter();
			out.print(sendJson);
			out.flush();
			out.close();

		} else {
			throw new ItemException("리스트 갱신 실패!");
		}

	}

	// 이벤트 할인율 조회 -admin
	@RequestMapping("selectItemDiscount.do")
	public void selectItemDiscount(HttpServletResponse response, int eventNo) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		JSONObject eNum = new JSONObject();

		System.out.println(eventNo);
		Integer d = iService.selectItemDiscount(eventNo);
		System.out.println(d);
		if (d == null) {
			d = 0;
		}

		String itemDiscount = String.valueOf(d);

		eNum.put("itemDiscount", itemDiscount);

		PrintWriter out = response.getWriter();

		out.print(eNum);
		out.flush();
		out.close();

	}

	// 추천 갯수 확인 -admin

	@RequestMapping("recommendChk.do")
	public void recommendCheck(HttpServletResponse response, Integer sendCnt, String sendArr) throws IOException {

		// 선택한 상품이 이미 추천 상품에 있다면
		String[] strArr = sendArr.split(",");
		int chk = 0;
		int result = 0;

		for (int i = 0; i < strArr.length; i++) {
			chk = iService.selectRecommendChk(strArr[i]);
			result += chk;
		}
		
		response.setContentType("application/json;charset=utf-8");
		JSONObject iNum = new JSONObject();

		
		int cnt = iService.selectRecommendCnt();

		int i = sendCnt + cnt;

		iNum.put("iNum", i);
		iNum.put("result", result);

		PrintWriter out = response.getWriter();

		out.print(iNum);
		out.flush();
		out.close();

	}

	// 추천 상품 상태변환하고 리스트가져오기-admin

	@RequestMapping("recommend.do")
	public void recommendItemString(HttpServletResponse response, String sendArr) throws IOException {

		String[] strArr = sendArr.split(",");

		int result = iService.updateItemRecommend(strArr);

		System.out.println(result);
		ArrayList<BannerItem> rList = new ArrayList<>();

		if (result > 0) {

			rList = iService.selectRecommendList();

		}

		response.setContentType("application/json;charset=utf-8");
		JSONArray jarr = new JSONArray();

		for (int i = 0; i < rList.size(); i++) {
			JSONObject jList = new JSONObject();

			jList.put("imageRename", rList.get(i).getImageRename());
			jList.put("itemName", rList.get(i).getItemName());
			jList.put("itemNo", rList.get(i).getItemNo());

			jarr.add(jList);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);

		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();

	}

	// ------------------------------결제 구현-----------------------------------------
	// 결제화면으로 이동
	@RequestMapping("moveToPayment.do")
	@ResponseBody
	public ModelAndView moveToPayment(ModelAndView mv, @RequestParam(value = "itemNo") String[] itemNo,
			@RequestParam("name") String[] name, @RequestParam("price") String[] price,
			@RequestParam("cycle") String[] cycle, @RequestParam("amount") String[] amount) {

		ArrayList<Cart> list = new ArrayList<>();
		int itemPrice = 0;
		int itemAmount = 0;
		int totalPrice = 0;
		int discount = 0;

		for (int i = 0; i < itemNo.length; i++) {
			Cart cart = new Cart();
			int no = Integer.valueOf(itemNo[i]);
			cart.setItemNo(no);
			itemPrice = Integer.valueOf(price[i]);

			discount = iService.checkDiscount(no);
//				System.out.println("할인율: " + discount);

			if (discount > 0) {
				itemPrice = itemPrice - (int) (itemPrice * (double) discount / 100);
				cart.setItemPrice(itemPrice);
			} else {
				cart.setItemPrice(itemPrice);
			}
//				System.out.println(itemPrice);
			itemAmount = Integer.valueOf(amount[i]);
			cart.setCartCount(itemAmount);
			cart.setCartSubs(cycle[i]);
			cart.setItemName(name[i]);
			list.add(cart);

			totalPrice += itemPrice * itemAmount;
		}

//			System.out.println(discount);
//			System.out.println(list);
		mv.addObject("list", list);
		mv.addObject("totalPrice", totalPrice);
		mv.setViewName("items/payment");
		return mv;
	}

	// 결제 구현
	IamportClient client = new IamportClient("3086404975484077",
			"EsAndJxwJmc8oD49ezXFzHqWyessiK4XcFlpoSW8f8hDMmN0VLFus6r1kTtDDyBQdWfCOcK4l2I7ow7j");

	@RequestMapping(value = "payment.do", method = RequestMethod.POST)
	@ResponseBody
	public String payment(HttpServletRequest request, HttpSession session, Model model)
			throws IamportResponseException, IOException {

		int itemNo = 0;
		int amount = 0;
		int price = 0;
		int cycle = 0;
		int subPrice = 0;
		int point = Integer.valueOf((String) request.getParameter("point")); // 사용 포인트
		int memberNo = Integer.valueOf(request.getParameter("memberNo")); // 회원번호

		String firstPrice = request.getParameter("finalPrice"); // 처음 결제될 금액
		String customerUid = request.getParameter("customerUid"); // 카드번호
		String email = request.getParameter("email"); // 회원 이메일
		String phone = request.getParameter("phone"); // 전화번호
		String address1 = request.getParameter("address1"); // 우편번호
		String address2 = request.getParameter("address2"); // 주소
		String address3 = request.getParameter("address3"); // 상세주소

		String[] noArr = request.getParameterValues("noArr"); // 상품번호
		String[] nameArr = request.getParameterValues("nameArr"); // 상품이름
		String[] priceArr = request.getParameterValues("priceArr"); // 상품가격
		String[] countArr = request.getParameterValues("countArr"); // 상품수량
		String[] cycleArr = request.getParameterValues("cycleArr"); // 구독주기

//			System.out.println(point);
//			System.out.println(firstPrice);

		BigDecimal firstPayPrice = new BigDecimal(firstPrice);
		String name = "최초결제";
		int firstPayResult = 0; // 최초결제정보 insert 결과 받을 변수

		String result = firstPayment(customerUid, firstPayPrice, name, point, memberNo); // 최초결제 실행결과
		String subResult = "";

		// 최초결제 실행이 성공이면
		if (result.equalsIgnoreCase("success")) {

			int insertSubResult = 0; // 결제 예약 성공여부 담을 변수

			// 최초 결제 실행 후 결제된 장바구니 품목 삭제
			int[] itemNoArr = new int[noArr.length];
			HashMap<String, Object> noMap = new HashMap<>();
			for (int i = 0; i < noArr.length; i++) {
				int no = Integer.valueOf(noArr[i]);
				itemNoArr[i] = no;
				System.out.println("삭제리스트에 담기고 있니 : " + itemNoArr[i]);
				noMap.put("itemNoArr", itemNoArr);
			}

			int deleteCartList = iService.deleteCartList(noMap); // 장바구니 삭제
			System.out.println("장바구니 삭제 결과 : " + deleteCartList);

			// 최초결제 성공 & 장바구니 삭제 후 구독정보 insert
			Subscribe subInfo = new Subscribe(); // 구독정보 담을 객체
			HashMap<String, Object> map = new HashMap<>(); // 구독정보 insert를 위한 Map

			// 반복되지 않는 변수 세팅
			subInfo.setAddress1(address1); // 우편번호
			subInfo.setAddress2(address2); // 주소
			subInfo.setAddress3(address3); // 상세주소
			subInfo.setCustomerUid(customerUid); // 카드번호(카드랑 1:1 대응되는 값)
			subInfo.setMemberNo(memberNo); // 회원번호
			subInfo.setPhone(phone); // 전화번호

			// 반복되는 변수 세팅
			for (int i = 0; i < noArr.length; i++) {
				itemNo = Integer.valueOf(noArr[i]);
				amount = Integer.valueOf(countArr[i]);
//					price = Integer.valueOf(priceArr[i]);
				cycle = Integer.valueOf(cycleArr[i]);
				name = nameArr[i];

				subInfo.setItemNo(itemNo); // 상품 번호
				subInfo.setAmount(amount); // 수량
				subInfo.setItemName(name); // 상품 이름
//					System.out.println("정기결제 정보 : " + subInfo);
				price = iService.selectItemPrice(itemNo); // 최초 결제금액은 할인률이 적용되어 있을 수 있기 때문에 구독 결제는 상품의 원래 가격을 가져와야 됨
				subPrice = price * amount; // 상품 원래가격 * 주문수량
				subInfo.setSubPrice(subPrice); // 정기결제시 결제 될 금액

				map.put("subInfo", subInfo);
				map.put("cycle", cycle); // 구독주기 -> 구독번호를 select 해야되서 따로 담음
				insertSubResult = iService.insertSubScribeInfo(map); // 구독내역, 배송내역 저장
				BigDecimal cyclePrice = new BigDecimal(subPrice); // 결제 금액 형변환
				subResult = subscriptionPayment(customerUid, cyclePrice, cycle); // 결제 예약

			}

//				// 구독내역 DB에 저장했으면
//				if(insertSubResult > 0) {
//				}else {}

			// 포인트 차감, 장바구니 삭제 후 session 갱신
			Member m = new Member();
			m.setMemberNo(memberNo);
			Member loginUser = mService.selectMember(m);
			session.setAttribute("loginUser", loginUser);
			
			int subscribeCount = mService.subscribeCount(loginUser.getMemberNo());
			model.addAttribute("subscribeCount", subscribeCount);

			return "success"; // 결제화면단으로 던질 값
//				System.out.println(loginUser);
		} else {
			return "fail";
		}

	}

	// ------------------------------즉시 결제 요청-------------------------------------

	private String firstPayment(String customerUid, BigDecimal price, String name, int point, int memberNo) {

		AgainPaymentData againData = new AgainPaymentData(customerUid, getRandomMerchantUid(), price);
		againData.setName(name);
		String firstPaymentStatus = "";
//			String impUid = "";
//			String failMessage = "";
		int firstPayResult = 0;

		// 최초 결제 실행
		IamportResponse<Payment> payment_response;
		try {
			payment_response = client.againPayment(againData); // 최초결제 호출
			firstPaymentStatus = payment_response.getResponse().getStatus(); // 결제 상태 확인
//					impUid = payment_response.getResponse().getImpUid();
		} catch (IamportResponseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (firstPaymentStatus.equalsIgnoreCase("paid")) { // 최초 결제 완료되었으면
			PaymentInfo payInfo = new PaymentInfo();
			payInfo.setMemberNo(memberNo);
			payInfo.setPoint(point);
			System.out.println("DB로 보낼 결제정보 : " + payInfo);
			firstPayResult = iService.insertFirstPayment(payInfo); // 최초결제 DB insert

			// 포인트 차감 DB update
			Map<String, Object> pointMap = new HashMap<>();
			pointMap.put("memberNo", memberNo);
			pointMap.put("point", point);
			int updatePoint = iService.updateUsePoint(pointMap);

			return "success";
		} else {
			return "fail";
		}
	}

	// ------------------------------결제 예약-----------------------------------

	private String subscriptionPayment(String customerUid, BigDecimal price, int cycle)
			throws IamportResponseException, IOException {

		// 현재시간 unixtime으로 가져오기
		long currentTime = System.currentTimeMillis() / 1000L;
		long subscriptionTime = 0;
		// 구독주기에 따라서 예약 날짜 세팅을 다르게 해야됨(unixtime으로 계산해야 됨)
		// 1주일 : 현재시간 + 604800
		// 2주일 : 현재시간 + 1209600
		// 3주일 : 현재시간 + 1814400
		// 4주일 : 현재시간 + 2419200
		String merchantUid = "";
//						subscriptionTime = currentTime + 180;
//						merchantUid = getRandomMerchantUid();
		Date date = new Date();

//						for(int i = 0 ; i<5; i++) {

		switch (cycle) {
		case 1:
			subscriptionTime = currentTime + 120;
			merchantUid = getRandomMerchantUid();
			date.setTime(subscriptionTime * 1000L);
			break;

		case 2:
			subscriptionTime = currentTime + 1209600;
			merchantUid = getRandomMerchantUid();
			date.setTime(subscriptionTime * 1000L);
			break;

		case 3:
			subscriptionTime = currentTime + 1814400;
			merchantUid = getRandomMerchantUid();
			date.setTime(subscriptionTime * 1000L);
			break;

		case 4:
			subscriptionTime = currentTime + 2419200;
			merchantUid = getRandomMerchantUid();
			date.setTime(subscriptionTime * 1000L);
			break;
		}

		ScheduleEntry schduleEntry = new ScheduleEntry(merchantUid, date, price);

		ArrayList<Subscribe> list = new ArrayList<>();

		list = iService.selectSubscribeStatus(customerUid);
		System.out.println("구독중인 상품 : " + list);

		if (list != null) {

			ScheduleData scheduleData = new ScheduleData(customerUid);

			scheduleData.addSchedule(schduleEntry);

			IamportResponse<List<Schedule>> schedule_response = client.subscribeSchedule(scheduleData); // 결제예약

			String message = schedule_response.getMessage();
			System.out.println(message);

//				List<Schedule> schedules = schedule_response.getResponse();
//						System.out.println(schedule_response.getResponse().size());
//						List<ScheduleEntry> req_schedules = scheduleData.getSchedules();

//				// 예약 시간에 결제 됐다고 가정해서 구현해 놓은 것
//				for (int i = 0; i < schedules.size(); i++) {
//					if ((schedules.get(i).getMerchantUid()).equalsIgnoreCase(merchantUid)
//							&& (schedules.get(i).getScheduleAt()).equals(date)) {
//						System.out.println("예약 결제 성공");
//				
//					}else {
//						return "fail";
//					}
//				}
			return "success";
		} else {
			return "fail";
		}
	}

	// 구독중인 상품인지 확인하는 메소드
	@RequestMapping("subscribeCheck.do")
	public void subscribeCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();

		String[] noArr = request.getParameterValues("noArr");

//			System.out.println(noArr);
		// 기존에 구독중인 상품인지 확인
		int no = 0;
		int subCount = 0;
		for (int i = 0; i < noArr.length; i++) {
			no = Integer.valueOf(noArr[i]);
			subCount += iService.selectSubList(no);
		}
//			System.out.println("같은 상품 구독중이니  : "+ subCount);
		if (subCount > 0) {
			out.append("fail");
			out.flush();
		} else {
			out.append("success");
			out.flush();
		}
		out.close();
	}

	// 결제시 필요한 결제번호 난수 생성
	private String getRandomMerchantUid() {
		DateFormat df = new SimpleDateFormat("$$hhmmssSS");
		int n = (int) (Math.random() * 100) + 1;

		return df.format(new Date()) + "_" + n;
	}

	// 추천상품 취소하기--admin
	@RequestMapping("cancelRecommend.do")
	public void cancelRecommendStatus(HttpServletResponse response, Integer itemNo) throws IOException {

		// 추천 status 변경 (R->N)
		int result = iService.updateRecommendStatusN(itemNo);

		ArrayList<BannerItem> rList = new ArrayList<>();

		// 리스트 가져오기
		if (result > 0) {

			rList = iService.selectRecommendList();

		}
		System.out.println("여기왔고" + rList);

		response.setContentType("application/json;charset=utf-8");
		JSONArray jarr = new JSONArray();

		for (int i = 0; i < rList.size(); i++) {
			JSONObject jList = new JSONObject();

			jList.put("imageRename", rList.get(i).getImageRename());
			jList.put("itemName", rList.get(i).getItemName());
			jList.put("itemNo", rList.get(i).getItemNo());

			jarr.add(jList);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);

		PrintWriter out = response.getWriter();
		out.print(sendJson);
		out.flush();
		out.close();
	}

}
