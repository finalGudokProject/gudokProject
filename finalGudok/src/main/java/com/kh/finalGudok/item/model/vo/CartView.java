package com.kh.finalGudok.item.model.vo;

import java.io.Serializable;

public class CartView implements Serializable {

   /**
    * 
    */
   private static final long serialVersionUID = 5068488124937767276L;
   private int cartNo;
   private int itemNo;
   private int memberNo;
   private int itemPrice;
   private int itemDiscount;
   private int cartCount;
   private String itemName;
   private String itemRename;
   private String cartSubs;
   private String itemDpStatus;
   public CartView() {
      // TODO Auto-generated constructor stub
   }
   public CartView(int cartNo, int itemNo, int memberNo, int itemPrice, int itemDiscount, int cartCount,
         String itemName, String itemRename, String cartSubs, String itemDpStatus) {
      super();
      this.cartNo = cartNo;
      this.itemNo = itemNo;
      this.memberNo = memberNo;
      this.itemPrice = itemPrice;
      this.itemDiscount = itemDiscount;
      this.cartCount = cartCount;
      this.itemName = itemName;
      this.itemRename = itemRename;
      this.cartSubs = cartSubs;
      this.itemDpStatus = itemDpStatus;
   }
   public int getCartNo() {
      return cartNo;
   }
   public void setCartNo(int cartNo) {
      this.cartNo = cartNo;
   }
   public int getItemNo() {
      return itemNo;
   }
   public void setItemNo(int itemNo) {
      this.itemNo = itemNo;
   }
   public int getMemberNo() {
      return memberNo;
   }
   public void setMemberNo(int memberNo) {
      this.memberNo = memberNo;
   }
   public int getItemPrice() {
      return itemPrice;
   }
   public void setItemPrice(int itemPrice) {
      this.itemPrice = itemPrice;
   }
   public int getItemDiscount() {
      return itemDiscount;
   }
   public void setItemDiscount(int itemDiscount) {
      this.itemDiscount = itemDiscount;
   }
   public int getCartCount() {
      return cartCount;
   }
   public void setCartCount(int cartCount) {
      this.cartCount = cartCount;
   }
   public String getItemName() {
      return itemName;
   }
   public void setItemName(String itemName) {
      this.itemName = itemName;
   }
   public String getItemRename() {
      return itemRename;
   }
   public void setItemRename(String itemRename) {
      this.itemRename = itemRename;
   }
   public String getCartSubs() {
      return cartSubs;
   }
   public void setCartSubs(String cartSubs) {
      this.cartSubs = cartSubs;
   }
   public String getItemDpStatus() {
      return itemDpStatus;
   }
   public void setItemDpStatus(String itemDpStatus) {
      this.itemDpStatus = itemDpStatus;
   }
   public static long getSerialversionuid() {
      return serialVersionUID;
   }
   @Override
   public String toString() {
      return "CartView [cartNo=" + cartNo + ", itemNo=" + itemNo + ", memberNo=" + memberNo + ", itemPrice="
            + itemPrice + ", itemDiscount=" + itemDiscount + ", cartCount=" + cartCount + ", itemName=" + itemName
            + ", itemRename=" + itemRename + ", cartSubs=" + cartSubs + ", itemDpStatus=" + itemDpStatus + "]";
   }
   
   
   
}