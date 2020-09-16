package com.kh.finalGudok.item.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import com.kh.finalGudok.member.model.vo.Subscribe;

public interface ItemService {

	int getItemCount();

	ArrayList<Item> selectList(PageInfo pi);

	int detailCount(int itemNo);

	ItemListView selectItem(int itemNo);

	ArrayList<Review> selectReview(int itemNo);

	int insertItem(AdminItem i);

	int insertImage(AdminItem i);

	int insertEvent(Event e);

	int insertEventImg(Event e);

	int getEventCount();

	ArrayList<BannerItem> selectEventListA(PageInfo pi);

	ArrayList selectEventListCount(PageInfo pi);

	int deleteEvent(int dEventArr);

	int deleteEventItem(int i);

	int deleteEventImg(int i);

	int deleteEventBannerImg(int i);

	Event selectDeleteEvent(int i);

	int updateEventStatusY(ArrayList<Event> dEventArr);

	ArrayList<Review> selectAllReview(int itemNo);

	int insertChoice(Heart h);

	int deleteChoice(Heart h);

	int getItemLivingCount();

	ArrayList<Item> selectLivingList(PageInfo pi);

	int getItemEventCount();

	ArrayList<Item> selectEventList(PageInfo pi);

	int insertInquired(Board b);

	int insertReview(Review r);

	int getNewCount();

	ArrayList<Item> selectNewList(PageInfo pi);

	int insertCart(Cart c);

	Heart detailHeart(int itemNo);

	ArrayList<Cart> selectBasket(int memberNo);

	int updatePChoice(int itemNo);

	int updateMChoice(int itemNo);

	public void deleteCart(Cart c);

	int updateReviewRate(int itemNo);

	int dListCount();
	
	ArrayList<ItemListView> selectDList(PageInfo pi);
	
	int mListCount();

	ArrayList<ItemListView> selectMList(PageInfo pi);

	int bListCount();
	
	ArrayList<ItemListView> selectBList(PageInfo pi);
	
	int sListCount();

	ArrayList<ItemListView> selectSList(PageInfo pi);
	
	int hListCount();

	ArrayList<ItemListView> selectHList(PageInfo pi);
	
	int diListCount();

	ArrayList<ItemListView> selectDiList(PageInfo pi);

	ArrayList<ItemListView> selectDLists(PageInfo pi,String sortNo);

	ArrayList<ItemListView> selectMLists(PageInfo pi, String sortNo);

	ArrayList<ItemListView> selectBLists(PageInfo pi, String sortNo);

	ArrayList<ItemListView> selectSLists(PageInfo pi, String sortNo);

	ArrayList<ItemListView> selectHLists(PageInfo pi, String sortNo);

	ArrayList<ItemListView> selectDiLists(PageInfo pi, String sortNo);

	int insertReviewImage1(Image i);

	int insertReviewImage2(Image i);

	int insertRI(ReviewImage ri);

	int livingCateCount(String catecoryNo);

	ArrayList<ItemListView> livingCateList(PageInfo pi, String categoryNo, String sortNo);

	ArrayList<Item> selectNewList(PageInfo pi, String sortNo);

	ArrayList<Item> selectEventList(PageInfo pi, String sortNo);

	ArrayList<ReviewView> selectReviewDetail(int reviewNo);

	ArrayList<Item> selectLivingList(PageInfo pi, String sortNo);

	ArrayList<Item> selectList(PageInfo pi, String sortNo);

	int reviewUpdate(Review r);

	ArrayList<ReviewView> selectAllReviewImg(int itemNo);

	int reviewDelete(int reviewNo);

	Item reviewItemName(int itemNo);

	ArrayList<ReviewView> selectDeleteReview(int reviewNo);

	int reviewImageDelete(int reviewNo);

	int imageDelete(int reviewNo);

	int checkImage(int reviewNo);

	int updateReviewRate0(int itemNo);
	
	int updateEventStatusN(ArrayList<Event> dEventArr);

	int getbannerItemCount(int eventNo);

	ArrayList<BannerItem> selectBannerItem(int eventNo, PageInfo pi);

	ArrayList<BannerItem> selectItemListA(PageInfo pi);

	int deleteBannerItem(int[] dEventArr);

	int updateItemStatusY(ArrayList<BannerItem> iArr);

	int updateItemStatusN(ArrayList<BannerItem> iArr);

	BannerItem selectAdminItem(int itemNo);

	int updateItem(BannerItem i);

	int deleteEventItem(BannerItem i);

	int updateItemImg(BannerItem i);

	int selectImageNo(BannerItem i);

	int getItemCountA();

	BannerItem selectDeleteItem(int i);

	int deleteItemA(int i);

	int deleteImgA(int i);

	int deleteItemImgA(int i);

	int deleteItemEvent(int i);

	ArrayList<BannerItem> selectEventOption();

	ArrayList<BannerItem> selectItems(PageInfo pi);

	int getNonEventItemCnt();

	int updateItemEventStatus(int i);

	int insertEventItem(BannerItem i);

	int deleteEventItemBefore(BannerItem i);

	int getEventCount(String word);

	ArrayList<BannerItem> selectEventListA(String word, PageInfo pi);

	Integer selectEventListCount(int eventNo);

	ArrayList<BannerItem> selectRecommendList();

	ArrayList<BannerItem> selectItemListA(SearchItem s, PageInfo pi);

	int getItemCountA(SearchItem s);

	ArrayList<BannerItem> selectItemImg(int itemNo);

	ArrayList<BannerItem> selectItems(String itemCategory, PageInfo pi);

	int getNonEventItemCnt(String itemCategory);

	Integer selectItemDiscount(int eventNo);

	int selectRecommendCnt();

	int updateItemRecommend(String[] strArr);

	int getBestCount();

	ArrayList<Item> selectBestList(PageInfo pi);

	ArrayList<Item> selectBestList(PageInfo pi, String sortNo);

	int insertOneInquiry();

	int insertInquiry();
	
	ArrayList<ItemListView> selectPN(Integer memberNo);

	int selectCart(Cart c);

	int selectDelChk(Subscribe scb);

	int selectReviewChk(Subscribe scb);

	int selectDelStatus(Subscribe scb);
	
	int updateItemEventStatusN(int[] dEventArr);

	int updateRecommendStatusN(Integer itemNo);

	int selectRecommendChk(String string);
	
	int checkDiscount(int no);

	int insertFirstPayment(PaymentInfo payInfo);

	int selectItemPrice(int itemNo);

	int insertSubScribeInfo(HashMap<String, Object> map);

	ArrayList<Subscribe> selectSubscribeStatus(String customerUid);
	
	int updateUsePoint(Map<String, Object> pointMap);

	int deleteCartList(HashMap<String, Object> map);

	int selectSubList(Integer no);

	ArrayList<Item> selectBestList();

	ArrayList<Item> selectnewList();

	ArrayList<Item> selectHomeRecommendList();
	
	double selectPointRate(int memberNo);

	int updateItemBannerStatus(int i);

	ArrayList<Item> selectHomeRecommendCList();
	
	ArrayList<Item> selectHomeRecommendFList();
	
	ArrayList<Item> selectHomeRecommendMList();

	ArrayList<Item> selecthotList();


	int insertRecommend();

	int deleteRecommend(int i);
	
	
	
	//------------------------------

	int selectBannerItemCount(String eventNo);

	ArrayList<Item> selectBannerItemList(PageInfo pi, String eventNo);

	BannerItem selectItemDetailImage(int i);

	
	ArrayList<Item> selectHotList();
	
	String selectCustomerUid(int subNo);

	int selectSubCount(String customerUid);

	int selectDeliveryCount(String customerUid);

	int selectCancleCount(String customerUid);
	
	int selectSubNo(Subscribe subInfo);
	
	int selectCycle(int cycleNo);
	
	int selectSubPrice(int subNo);
	
	int genderCount(Map<String, Object> map);
	

}
