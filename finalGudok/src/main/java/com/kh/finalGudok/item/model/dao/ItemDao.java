package com.kh.finalGudok.item.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalGudok.item.model.vo.AdminItem;
import com.kh.finalGudok.item.model.vo.BannerItem;
import com.kh.finalGudok.item.model.vo.Event;

import com.kh.finalGudok.item.model.vo.Board;
import com.kh.finalGudok.item.model.vo.Cart;
import com.kh.finalGudok.item.model.vo.Heart;

import com.kh.finalGudok.item.model.vo.Image;
import com.kh.finalGudok.item.model.vo.Item;
import com.kh.finalGudok.item.model.vo.ItemListView;
import com.kh.finalGudok.item.model.vo.PageInfo;
import com.kh.finalGudok.item.model.vo.Review;
import com.kh.finalGudok.item.model.vo.ReviewImage;
import com.kh.finalGudok.item.model.vo.ReviewView;
import com.kh.finalGudok.item.model.vo.SearchItem;

@Repository("iDao")
public class ItemDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int getItemCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.getItemCount");
	}

	public ArrayList<Item> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.getItemList", null, rowBounds);
	}

	public int detailCount(int itemNo) {
		return sqlSessionTemplate.update("itemMapper.getDetailCount", itemNo);
	}

	public ItemListView selectItem(int itemNo) {
		return sqlSessionTemplate.selectOne("itemListMapper.selectOne", itemNo);
	}

	public ArrayList<Review> selectReview(int itemNo) {
		return (ArrayList) sqlSessionTemplate.selectList("reviewMapper.selectReview", itemNo);
	}

	public int insertItem(AdminItem i) {

		return sqlSessionTemplate.insert("adminItemMapper.insertItem", i);
	}

	public int insertImage(AdminItem i) {
		return sqlSessionTemplate.insert("adminItemMapper.insertItemImage", i);
	}

	public int insertEvent(Event e) {
		return sqlSessionTemplate.insert("adminItemMapper.insertEvent", e);
	}

	public int insertEventImg(Event e) {
		return sqlSessionTemplate.insert("adminItemMapper.insertEventImg", e);
	}

	public int getEventCount() {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectEventCount");
	}

	public ArrayList<BannerItem> selectEventListA(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("adminItemMapper.selectEventList", null, rowBounds);
	}

	public ArrayList selectEventListCount(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("adminItemMapper.selectEventListCount", null, rowBounds);
	}

	public int deleteEvent(int dEventArr) {
		return sqlSessionTemplate.delete("adminItemMapper.deleteEvent", dEventArr);

	}

	public int deleteEventItem(int i) {
		return sqlSessionTemplate.delete("adminItemMapper.deleteEventItem", i);
	}

	public int deleteEventImg(int i) {
		return sqlSessionTemplate.delete("adminItemMapper.deleteEventImg", i);
	}

	public int deleteEventBannerImg(int i) {
		return sqlSessionTemplate.delete("adminItemMapper.deleteEventBannerImg", i);
	}

	public Event selectDeleteEvent(int i) {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectDeleteEvent", i);
	}

	public int updateEventStatusY(ArrayList<Event> dEventArr) {
		return sqlSessionTemplate.update("adminItemMapper.updateEventStatusY", dEventArr);
	}

	public int updateEventStatusN(ArrayList<Event> dEventArr) {
		return sqlSessionTemplate.update("adminItemMapper.updateEventStatusN", dEventArr);
	}

	public ArrayList<Review> selectAllReview(int itemNo) {
		return (ArrayList) sqlSessionTemplate.selectList("reviewMapper.selectAllReview", itemNo);
	}

	public int insertChoice(Heart h) {
		return sqlSessionTemplate.insert("heartMapper.insertChoice", h);
	}

	public int deleteChoice(Heart h) {
		return sqlSessionTemplate.delete("heartMapper.deleteChoice", h);
	}

	public int getItemLivingCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.getItemLivingCount");
	}

	public ArrayList<Item> selectLivingList(PageInfo pi) {
		int offsetL = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBoundsL = new RowBounds(offsetL, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.getItemLivingList", null, rowBoundsL);
	}

	public int getItemEventCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.getItemEventCount");
	}

	public ArrayList<Item> selectEventList(PageInfo pi) {
		int offsetE = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBoundsE = new RowBounds(offsetE, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.getItemEventList", null, rowBoundsE);
	}

	public int insertInquired(Board b) {
		return sqlSessionTemplate.insert("itemMapper.insertInquired", b);
	}

	public int insertReview(Review r) {
		return sqlSessionTemplate.insert("reviewMapper.insertReview", r);
	}

	public int getNewCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.newCount");
	}

	public ArrayList<Item> selectNewList(PageInfo pi) {
		int offsetN = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBoundsN = new RowBounds(offsetN, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectNewList", null, rowBoundsN);
	}

	public int insertCart(Cart c) {
		return sqlSessionTemplate.insert("cartMapper.insertCart", c);
	}

	public Heart detailHeart(int itemNo) {
		return sqlSessionTemplate.selectOne("heartMapper.selectHeart", itemNo);
	}

	public ArrayList<Cart> selectBasket(int memberNo) {
		return (ArrayList) sqlSessionTemplate.selectList("cartMapper.selectCart", memberNo);
	}

	public int updatePChoice(int itemNo) {
		return sqlSessionTemplate.update("itemMapper.updatePChoice", itemNo);
	}

	public int updateMChoice(int itemNo) {
		return sqlSessionTemplate.update("itemMapper.updateMChoice", itemNo);
	}

	public void deleteCart(Cart c) {
		sqlSessionTemplate.delete("cartMapper.deleteCart", c);
	}

	public int updateReviewRate(int itemNo) {
		return sqlSessionTemplate.update("reviewMapper.updateReviewRate", itemNo);
	}

	public int mListCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.mListCount");
	}

	public ArrayList<ItemListView> selectMList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectMList", null, rowBounds);
	}

	public int dListCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.dListCount");
	}

	public ArrayList<ItemListView> selectDList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectDList", null, rowBounds);
	}

	public int selectBListCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.bListCount");
	}

	public ArrayList<ItemListView> selectBList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectBList", null, rowBounds);
	}

	public int selectSListCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.sListCount");
	}

	public ArrayList<ItemListView> selectSList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectSList", null, rowBounds);
	}

	public int selectHListCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.hListCount");
	}

	public ArrayList<ItemListView> selectHList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectHList", null, rowBounds);
	}

	public int selectDiListCount() {
		return sqlSessionTemplate.selectOne("itemListMapper.diListCount");
	}

	public ArrayList<ItemListView> selectDiList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectDiList", null, rowBounds);
	}

	public ArrayList<ItemListView> selectDLists(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		HashMap<String, String> map = new HashMap<>();
		map.put("test", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectDLists", map, rowBounds);
	}

	public ArrayList<ItemListView> selectMLists(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("test", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectMLists", map, rowBounds);
	}

	public ArrayList<ItemListView> selectBLists(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("test", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectBLists", map, rowBounds);
	}

	public ArrayList<ItemListView> selectSLists(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("test", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectSLists", map, rowBounds);
	}

	public ArrayList<ItemListView> selectHLists(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("test", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectHLists", map, rowBounds);
	}

	public ArrayList<ItemListView> selectDiLists(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("test", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectDiLists", map, rowBounds);
	}

	public int insertReviewImage1(Image i) {
		return sqlSessionTemplate.insert("reviewMapper.insertReviewImage1", i);
	}

	public int insertReviewImage2(Image i) {
		return sqlSessionTemplate.insert("reviewMapper.insertReviewImage2", i);
	}

	public int insertRI(ReviewImage ri) {
		return sqlSessionTemplate.insert("reviewMapper.insertRI", ri);
	}

	public int livingCateCount(String categoryNo) {
		return sqlSessionTemplate.selectOne("itemListMapper.livingCount", categoryNo);
	}

	public ArrayList<ItemListView> livingCateList(PageInfo pi, String categoryNo, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("categoryNo", categoryNo);
		map.put("sortNo", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.livingCateList", map, rowBounds);
	}

	public ArrayList<Item> selectNewList(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("sortNo", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectSortNewList", map, rowBounds);
	}

	public ArrayList<Item> selectEventList(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("sortNo", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectSortEventList", map, rowBounds);
	}

	public ArrayList<ReviewView> selectReviewDetail(int reviewNo) {
		return (ArrayList) sqlSessionTemplate.selectList("reviewMapper.selectReviewDetail", reviewNo);
	}

	public ArrayList<Item> selectLivingList(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("sortNo", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectSortLivingList", map, rowBounds);
	}

	public ArrayList<Item> selectList(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("sortNo", sortNo);
		return (ArrayList) sqlSessionTemplate.selectList("itemListMapper.selectSortFoodList", map, rowBounds);
	}

	public int reviewUpdate(Review r) {
		return sqlSessionTemplate.update("reviewMapper.updateReview", r);
	}

	public ArrayList<ReviewView> selectAllReviewImg(int itemNo) {
		return (ArrayList) sqlSessionTemplate.selectList("reviewMapper.selectAllReviewImg", itemNo);
	}

	public int reviewDelete(int reviewNo) {
		return sqlSessionTemplate.delete("reviewMapper.reviewDelete", reviewNo);
	}

	public Item reviewItemName(int itemNo) {
		return sqlSessionTemplate.selectOne("itemMapper.reviewItemName", itemNo);
	}

	public ArrayList<ReviewView> selectDeleteReview(int reviewNo) {
		return (ArrayList) sqlSessionTemplate.selectList("reviewMapper.selectDeleteReview", reviewNo);
	}

	public int reviewImageDelete(int reviewNo) {
		return sqlSessionTemplate.delete("reviewMapper.reviewImageDelete", reviewNo);
	}

	public int imageDelete(int reviewNo) {
		return sqlSessionTemplate.delete("reviewMapper.imageDelete", reviewNo);
	}

	public int checkImage(int reviewNo) {
		return sqlSessionTemplate.selectOne("reviewMapper.checkImage", reviewNo);
	}

	public int updateReviewRate0(int itemNo) {
		return sqlSessionTemplate.update("reviewMapper.updateReviewRate0", itemNo);
	}

//	public int l1Count() {
//		return sqlSessionTemplate.selectOne("itemListMapper.l1Count");
//	}
//
//	public int l2Count() {
//		return sqlSessionTemplate.selectOne("itemListMapper.l2Count");
//	}
//
//	public int l3Count() {
//		return sqlSessionTemplate.selectOne("itemListMapper.l3Count");
//	}
//
//	public ArrayList<ItemListView> l1List(PageInfo pi, String sortNo) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		HashMap<String, String> map = new HashMap<>();
//		map.put("test",sortNo);
//		return (ArrayList)sqlSessionTemplate.selectList("itemListMapper.selectDiLists",map,rowBounds);
//	}
//
//	public ArrayList<ItemListView> l2List(PageInfo pi, String sortNo) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		HashMap<String, String> map = new HashMap<>();
//		map.put("test",sortNo);
//		return (ArrayList)sqlSessionTemplate.selectList("itemListMapper.selectDiLists",map,rowBounds);
//	}
//
//	public ArrayList<ItemListView> l3List(PageInfo pi, String sortNo) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		HashMap<String, String> map = new HashMap<>();
//		map.put("test",sortNo);
//		return (ArrayList)sqlSessionTemplate.selectList("itemListMapper.selectDiLists",map,rowBounds);
//	}

	public int selectBannerItemCount(int bi) {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectBannerItemCount", bi);
	}

	public ArrayList<BannerItem> selectBannerItem(int bi, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSessionTemplate.selectList("adminItemMapper.selectBannerList", bi, rowBounds);
	}

	public ArrayList<BannerItem> selectItemListA(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("adminItemMapper.selectItemListA", null, rowBounds);
	}

	public int deleteBannerItem(int[] itemArr) {

		return sqlSessionTemplate.delete("adminItemMapper.deleteBannerItem", itemArr);
	}

	public int updateItemStatusY(ArrayList<BannerItem> iArr) {

		return sqlSessionTemplate.update("adminItemMapper.updateItemStatusY", iArr);
	}

	public int updateItemStatusN(ArrayList<BannerItem> iArr) {

		return sqlSessionTemplate.update("adminItemMapper.updateItemStatusN", iArr);
	}

	public BannerItem selectAdminItem(int itemNo) {

		return sqlSessionTemplate.selectOne("adminItemMapper.selectAdminItem", itemNo);
	}

	public int updateitem(BannerItem i) {

		return sqlSessionTemplate.update("adminItemMapper.updateItem", i);
	}

	public int deleteEventItem(BannerItem i) {

		return sqlSessionTemplate.delete("adminItemMapper.deleteBannerItem", i);
	}

	public int updateItemImg(BannerItem i) {

		return sqlSessionTemplate.update("adminItemMapper.updateItemImg", i);
	}

	public int selectImageNo(BannerItem i) {

		return sqlSessionTemplate.selectOne("adminItemMapper.selectImageNo", i);

	}

	public int selectItemCountA() {

		return sqlSessionTemplate.selectOne("adminItemMapper.selectItemCountA");
	}

	public BannerItem selectDeleteItem(int i) {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectDeleteItem", i);
	}

	public int deleteItemA(int i) {
		return sqlSessionTemplate.delete("adminItemMapper.deleteItemA", i);
	}

	public int deleteImgA(int i) {
		return sqlSessionTemplate.delete("adminItemMapper.deleteImgA", i);
	}

	public int deleteItemImgA(int i) {
		return sqlSessionTemplate.delete("adminItemMapper.deleteItemImgA", i);
	}

	public int deleteItemEvent(int i) {
		return sqlSessionTemplate.delete("adminItemMapper.deleteItemEvent", i);
	}

	public ArrayList<BannerItem> selectEventOption() {

		return (ArrayList) sqlSessionTemplate.selectList("adminItemMapper.selectEventOption");
	}

	public ArrayList<BannerItem> selectItems(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSessionTemplate.selectList("adminItemMapper.selectItems", null, rowBounds);
	}

	public int selectNonEventItemCnt() {

		return sqlSessionTemplate.selectOne("adminItemMapper.selectNonEventItemCnt");
	}

	public int updateItemEventStatus(int i) {

		return sqlSessionTemplate.update("adminItemMapper.updateItemEventStatus", i);
	}

	public int insertEventItem(BannerItem i) {

		return sqlSessionTemplate.insert("adminItemMapper.insertEventItem", i);
	}

	public int deleteEventItemBefor(BannerItem i) {

		return sqlSessionTemplate.delete("adminItemMapper.deleteEventItemBefore", i);
	}

	public int getEventCount(String word) {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectEventCount",word);
	}

	public ArrayList<BannerItem> selectEventListA(String word, PageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("adminItemMapper.selectEventList",word,rowBounds);
	}

	public ArrayList<BannerItem> selectRecommendList() {
		return  (ArrayList)sqlSessionTemplate.selectList("adminItemMapper.selectRecommendList");
	}

	public ArrayList<BannerItem> selectItemListA(SearchItem s, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("adminItemMapper.selectItemListA",s,rowBounds);
	}

	public int selectItemCountA(SearchItem s) {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectItemCountA",s);
	}

	public ArrayList<BannerItem> selectItemImg(int itemNo) {
		return (ArrayList)sqlSessionTemplate.selectList("adminItemMapper.selectItemImg",itemNo);
	}

	public ArrayList<BannerItem> selectItems(String itemCategory, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("adminItemMapper.selectItems",itemCategory,rowBounds);
	}

	public int selectNonEventItemCnt(String itemCategory) {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectNonEventItemCnt",itemCategory);
	}

	public Integer selectItemDiscount(int eventNo) {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectItemDiscount",eventNo);
	}

	public int selectRecommendCnt() {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectRecommendCnt");
	}

	public int updateItemRecommend(String[] strArr) {
		return sqlSessionTemplate.update("adminItemMapper.updateItemRecommend",strArr);
	}

	public Integer selectEventListCount(int i) {
		return sqlSessionTemplate.selectOne("adminItemMapper.selectEventListCount",i);
	}

	public int getBestCount() {
		return sqlSessionTemplate.selectOne("itemMapper.getBestCount");
	}

	public ArrayList<Item> selectBestList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSessionTemplate.selectList("itemListMapper.getItemBestList", null, rowBounds);
	}

	public ArrayList<Item> selectBestList(PageInfo pi, String sortNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		HashMap<String, String> map = new HashMap<>();
		map.put("sortNo", sortNo);
		return (ArrayList)sqlSessionTemplate.selectList("itemListMapper.selectSortBestList", map, rowBounds);
	}

	public int insertOneInquiry() {
		return sqlSessionTemplate.insert("itemMapper.insertOneInquiry");
	}

	public int insertInquiry() {
		return sqlSessionTemplate.insert("itemMapper.insertInquiry");
	}

	public int updateItemEventStatusN(int[] dEventArr) {
		return sqlSessionTemplate.update("adminItemMapper.updateItemEventStatusN",dEventArr);
	}
}
