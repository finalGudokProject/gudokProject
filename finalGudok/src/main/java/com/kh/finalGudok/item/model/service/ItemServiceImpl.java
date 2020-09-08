package com.kh.finalGudok.item.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalGudok.item.model.dao.ItemDao;
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
import com.kh.finalGudok.item.model.vo.Review;

import com.kh.finalGudok.item.model.vo.ReviewImage;
import com.kh.finalGudok.item.model.vo.ReviewView;
import com.kh.finalGudok.item.model.vo.SearchItem;
import com.kh.finalGudok.member.model.vo.Member;

@Service("iService")
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	ItemDao iDao;

	@Override
	public int getItemCount() {
		return iDao.getItemCount();
	}
	
	@Override
	public int getNewCount() {
		return iDao.getNewCount();
	}
	
	@Override
	public ArrayList<Item> selectList(PageInfo pi) {
		return iDao.selectList(pi);
	}

	@Override
	public int detailCount(int itemNo) {
		return iDao.detailCount(itemNo);
	}

	@Override
	public ItemListView selectItem(int itemNo) {
		return iDao.selectItem(itemNo);
	}

	@Override
	public ArrayList<Review> selectReview(int itemNo) {
		return iDao.selectReview(itemNo);
	}

	@Override

	public int insertItem(AdminItem i) {
		return iDao.insertItem(i);
	}

	@Override
	public int insertImage(AdminItem i) {
		return iDao.insertImage(i);
	}

	@Override
	public int insertEvent(Event e) {
		return iDao.insertEvent(e);
	}

	@Override
	public int insertEventImg(Event e) {
		return iDao.insertEventImg(e);
	}

	@Override
	public int getEventCount() {
		return iDao.getEventCount();
	}

	@Override


	public ArrayList<BannerItem> selectEventListA(PageInfo pi) {

		return iDao.selectEventListA(pi);
	}

	@Override
	public ArrayList selectEventListCount(PageInfo pi) {
		return iDao.selectEventListCount(pi);
	}


	@Override
	public int deleteEvent(int dEventArr) {
		return iDao.deleteEvent(dEventArr);
	}

	@Override
	public int deleteEventItem(int i) {
		return iDao.deleteEventItem(i);
	}

	@Override
	public int deleteEventImg(int i) {
		return iDao.deleteEventImg(i);
	}

	@Override
	public int deleteEventBannerImg(int i) {
		return iDao.deleteEventBannerImg(i);
	}

	@Override
	public Event selectDeleteEvent(int i) {
		return iDao.selectDeleteEvent(i);
	}

	
	public ArrayList<Review> selectAllReview(int itemNo) {
		return iDao.selectAllReview(itemNo);
	}

	@Override
	public int insertChoice(Heart h) {
		return iDao.insertChoice(h);
	}

	@Override
	public int deleteChoice(Heart h) {
		return iDao.deleteChoice(h);
	}

	@Override
	public int getItemLivingCount() {
		return iDao.getItemLivingCount();
	}

	@Override
	public ArrayList<Item> selectLivingList(PageInfo pi) {
		return iDao.selectLivingList(pi);
	}

	@Override
	public int getItemEventCount() {
		return iDao.getItemEventCount();
	}

	@Override
	public ArrayList<Item> selectEventList(PageInfo pi) {
		return iDao.selectEventList(pi);
	}

	@Override
	public int insertInquired(Board b) {
		return iDao.insertInquired(b);
	}

	@Override
	public int insertReview(Review r) {
		return iDao.insertReview(r);
	}

	@Override
	public ArrayList<Item> selectNewList(PageInfo pi) {
		return iDao.selectNewList(pi);
	}

	@Override
	public int insertCart(Cart c) {
		return iDao.insertCart(c);
	}

	@Override
	public Heart detailHeart(int itemNo) {
		return iDao.detailHeart(itemNo);
	}

	@Override
	public ArrayList<Cart> selectBasket(int memberNo) {
		return iDao.selectBasket(memberNo);
	}

	@Override
	public int updatePChoice(int itemNo) {
		return iDao.updatePChoice(itemNo);
	}

	@Override
	public int updateMChoice(int itemNo) {
		return iDao.updateMChoice(itemNo);
	}

	@Override
	public void deleteCart(Cart c) {
		iDao.deleteCart(c);
	}

	@Override
	public int updateReviewRate(int itemNo) {
		return iDao.updateReviewRate(itemNo);
	}

	@Override
	public int mListCount() {
		return iDao.mListCount();
	}

	@Override
	public ArrayList<ItemListView> selectMList(PageInfo pi) {
		return iDao.selectMList(pi);
	}

	@Override
	public int dListCount() {
		return iDao.dListCount();
	}

	@Override
	public ArrayList<ItemListView> selectDList(PageInfo pi) {
		return iDao.selectDList(pi);
	}

	@Override
	public int bListCount() {
		return iDao.selectBListCount();
	}

	@Override
	public int sListCount() {
		return iDao.selectSListCount();
	}

	@Override
	public int hListCount() {
		return iDao.selectHListCount();
	}

	@Override
	public int diListCount() {
		return iDao.selectDiListCount();
	}

	@Override
	public ArrayList<ItemListView> selectBList(PageInfo pi) {
		return iDao.selectBList(pi);
	}

	@Override
	public ArrayList<ItemListView> selectSList(PageInfo pi) {
		return iDao.selectSList(pi);
	}

	@Override
	public ArrayList<ItemListView> selectHList(PageInfo pi) {
		return iDao.selectHList(pi);
	}

	@Override
	public ArrayList<ItemListView> selectDiList(PageInfo pi) {
		return iDao.selectDiList(pi);
	}

	@Override
	public ArrayList<ItemListView> selectDLists(PageInfo pi,String sortNo) {
		return iDao.selectDLists(pi,sortNo);
	}

	@Override
	public ArrayList<ItemListView> selectMLists(PageInfo pi, String sortNo) {
		return iDao.selectMLists(pi, sortNo);
	}

	@Override
	public ArrayList<ItemListView> selectBLists(PageInfo pi, String sortNo) {
		return iDao.selectBLists(pi, sortNo);
	}

	@Override
	public ArrayList<ItemListView> selectSLists(PageInfo pi, String sortNo) {
		return iDao.selectSLists(pi, sortNo);
	}

	@Override
	public ArrayList<ItemListView> selectHLists(PageInfo pi, String sortNo) {
		return iDao.selectHLists(pi, sortNo);
	}

	@Override
	public ArrayList<ItemListView> selectDiLists(PageInfo pi, String sortNo) {
		return iDao.selectDiLists(pi, sortNo);
	}

	@Override
	public int insertReviewImage1(Image i) {
		return iDao.insertReviewImage1(i);
	}

	@Override
	public int insertReviewImage2(Image i) {
		return iDao.insertReviewImage2(i);
	}
	
	@Override
	public int insertRI(ReviewImage ri) {
		return iDao.insertRI(ri);
	}

	@Override
	public int livingCateCount(String categoryNo) {
		return iDao.livingCateCount(categoryNo);
	}

	@Override
	public ArrayList<ItemListView> livingCateList(PageInfo pi, String categoryNo, String sortNo) {
		return iDao.livingCateList(pi, categoryNo, sortNo);
	}

	@Override
	public ArrayList<Item> selectNewList(PageInfo pi, String sortNo) {
		return iDao.selectNewList(pi, sortNo);
	}

	@Override
	public ArrayList<Item> selectEventList(PageInfo pi, String sortNo) {
		return iDao.selectEventList(pi, sortNo);
	}

	@Override
	public ArrayList<ReviewView> selectReviewDetail(int reviewNo) {
		return iDao.selectReviewDetail(reviewNo);
	}

	@Override
	public ArrayList<Item> selectLivingList(PageInfo pi, String sortNo) {
		return iDao.selectLivingList(pi, sortNo);
	}

	@Override
	public ArrayList<Item> selectList(PageInfo pi, String sortNo) {
		return iDao.selectList(pi, sortNo);
	}

	@Override
	public int reviewUpdate(Review r) {
		return iDao.reviewUpdate(r);
	}

	@Override
	public ArrayList<ReviewView> selectAllReviewImg(int itemNo) {
		return iDao.selectAllReviewImg(itemNo);
	}

	@Override
	public int reviewDelete(int reviewNo) {
		return iDao.reviewDelete(reviewNo);
	}

	@Override
	public Item reviewItemName(int itemNo) {
		return iDao.reviewItemName(itemNo);
	}

	@Override
	public ArrayList<ReviewView> selectDeleteReview(int reviewNo) {
		return iDao.selectDeleteReview(reviewNo);
	}

	@Override
	public int reviewImageDelete(int reviewNo) {
		return iDao.reviewImageDelete(reviewNo);
	}

	@Override
	public int imageDelete(int reviewNo) {
		return iDao.imageDelete(reviewNo);
	}

	@Override
	public int checkImage(int reviewNo) {
		return iDao.checkImage(reviewNo);
	}

	@Override
	public int updateReviewRate0(int itemNo) {
		return iDao.updateReviewRate0(itemNo);
	}


//	@Override
//	public int l1Count() {
//		return iDao.l1Count();
//	}
//
//	@Override
//	public int l2Count() {
//		return iDao.l2Count();
//	}
//
//	@Override
//	public int l3Count() {
//		return iDao.l3Count();
//	}
//
//	@Override
//	public ArrayList<ItemListView> l1List(PageInfo pi, String sortNo) {
//		return iDao.l1List(pi, sortNo);
//	}
//
//	@Override
//	public ArrayList<ItemListView> l2List(PageInfo pi, String sortNo) {
//		return iDao.l2List(pi, sortNo);
//	}
//
//	@Override
//	public ArrayList<ItemListView> l3List(PageInfo pi, String sortNo) {
//		return iDao.l3List(pi, sortNo);
//	}
	
	@Override
	public int updateEventStatusN(ArrayList<Event> dEventArr) {
		return iDao.updateEventStatusN(dEventArr);
	}
	
	@Override
	public int updateEventStatusY(ArrayList<Event> dEventArr) {
		return iDao.updateEventStatusY(dEventArr);
	}



	@Override
	public int getbannerItemCount(int eventNo) {
		
		return iDao.selectBannerItemCount(eventNo);
	}

	@Override
	public ArrayList<BannerItem> selectBannerItem(int eventNo, PageInfo pi) {
		
		return iDao.selectBannerItem(eventNo,pi);
	}

	@Override
	public ArrayList<BannerItem> selectItemListA(PageInfo pi) {
		return iDao.selectItemListA(pi);
	}

	@Override
	public int deleteBannerItem(int[] dEventArr) {
		
		return iDao.deleteBannerItem(dEventArr);
	}


	@Override
	public int updateItemStatusY(ArrayList<BannerItem> iArr) {

		return iDao.updateItemStatusY(iArr);
	}

	@Override
	public int updateItemStatusN(ArrayList<BannerItem> iArr) {

		return iDao.updateItemStatusN(iArr);
	}

	@Override
	public BannerItem selectAdminItem(int itemNo) {
		
		return iDao.selectAdminItem(itemNo);
	}

	@Override
	public int updateItem(BannerItem i) {
		
		return iDao.updateitem(i);
	}

	@Override
	public int deleteEventItem(BannerItem i) {
		
		return iDao.deleteEventItem(i);
	}

	@Override
	public int updateItemImg(BannerItem i) {
		
		return iDao.updateItemImg(i);
	}

	@Override
	public int selectImageNo(BannerItem i) {
		return iDao.selectImageNo(i);
	}

	@Override
	public int getItemCountA() {
		
		return iDao.selectItemCountA();
	}

	@Override
	public BannerItem selectDeleteItem(int i) {
		
		return iDao.selectDeleteItem(i);
	}

	@Override
	public int deleteItemA(int i) {
		
		return iDao.deleteItemA(i);
	}

	@Override
	public int deleteImgA(int i) {
		return iDao.deleteImgA(i);
	}

	@Override
	public int deleteItemImgA(int i) {
		return iDao.deleteItemImgA(i);
	}

	@Override
	public int deleteItemEvent(int i) {

		return iDao.deleteItemEvent(i);
	}

	@Override
	public ArrayList<BannerItem> selectEventOption() {
		return iDao.selectEventOption();
	}

	@Override
	public ArrayList<BannerItem> selectItems(PageInfo pi) {
		return iDao.selectItems(pi);
	}

	@Override
	public int getNonEventItemCnt() {
		return iDao.selectNonEventItemCnt();
	}

	@Override
	public int updateItemEventStatus(int i) {
		return iDao.updateItemEventStatus(i);
	}

	@Override
	public int insertEventItem(BannerItem i) {

		return iDao.insertEventItem(i);
	}

	@Override
	public int deleteEventItemBefore(BannerItem i) {
	
		return iDao.deleteEventItemBefor(i);
	}

	@Override
	public int getEventCount(String word) {
		return iDao.getEventCount(word);
	}

	@Override
	public ArrayList<BannerItem> selectEventListA(String word, PageInfo pi) {
		return iDao.selectEventListA(word,pi);
	}

	@Override
	public Integer selectEventListCount(int i) {
		return iDao.selectEventListCount(i);
	}

	@Override
	public ArrayList<BannerItem> selectRecommendList() {
		return iDao.selectRecommendList();
	}

	@Override
	public ArrayList<BannerItem> selectItemListA(SearchItem s, PageInfo pi) {
		return iDao.selectItemListA(s,pi);
	}

	@Override
	public int getItemCountA(SearchItem s) {
		return iDao.selectItemCountA(s);
	}

	@Override
	public ArrayList<BannerItem> selectItemImg(int itemNo) {
		return iDao.selectItemImg(itemNo);
	}

	@Override
	public ArrayList<BannerItem> selectItems(String itemCategory, PageInfo pi) {
		return iDao.selectItems(itemCategory,pi);
	}

	@Override
	public int getNonEventItemCnt(String itemCategory) {
		return iDao.selectNonEventItemCnt(itemCategory);
	}

	@Override
	public Integer selectItemDiscount(int eventNo) {
		return iDao.selectItemDiscount(eventNo);
	}

	@Override
	public int selectRecommendCnt() {
		return iDao.selectRecommendCnt();
	}

	@Override
	public int updateItemRecommend(String[] strArr) {
		return iDao.updateItemRecommend(strArr);
	}

	@Override
	public int getBestCount() {
		return iDao.getBestCount();
	}

	@Override
	public ArrayList<Item> selectBestList(PageInfo pi) {
		return iDao.selectBestList(pi);
	}

	@Override
	public ArrayList<Item> selectBestList(PageInfo pi, String sortNo) {
		return iDao.selectBestList(pi, sortNo);
	}

	@Override
	public int insertOneInquiry() {
		return iDao.insertOneInquiry();
	}

	@Override
	public int insertInquiry() {
		return iDao.insertInquiry();
	}

	@Override
	public int updateItemEventStatusN(int[] dEventArr) {
		return iDao.updateItemEventStatusN(dEventArr);
	}

}
