package com.sp.pay;

import java.util.List;

public class Pay {
	// 받아올 데이터
	private int gubunCode;
	private int goodsCode;
	private String goodsName;
	private int goodsPrice;
	private int quantity;
	private String gubunName;
	private int parentCode;
	// 결재 정보 저장용
	private int price; // 할인전
	private int dcPrice;
	private int payPrice; // 할인후
	private String payWay;
	// 카드 결제 정보
	private String cardCo;
	private String cardNum;
	private String cardNum1;
	private String cardNum2;
	private String cardNum4;
	private String state;
	private String paySection;
	private int payCode;
	private long usersCode;
	
	private List<Pay> plist;
	public List<Pay> getPlist() {
		return plist;
	}

	public void setPlist(List<Pay> plist) {
		this.plist = plist;
	}

	public String getCardNum1() {
		return cardNum1;
	}

	public void setCardNum1(String cardNum1) {
		this.cardNum1 = cardNum1;
	}

	public String getCardNum2() {
		return cardNum2;
	}

	public void setCardNum2(String cardNum2) {
		this.cardNum2 = cardNum2;
	}

	public String getCardNum4() {
		return cardNum4;
	}

	public void setCardNum4(String cardNum4) {
		this.cardNum4 = cardNum4;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public long getUsersCode() {
		return usersCode;
	}

	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}

	public int getGubunCode() {
		return gubunCode;
	}

	public void setGubunCode(int gubunCode) {
		this.gubunCode = gubunCode;
	}

	public int getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getGubunName() {
		return gubunName;
	}

	public void setGubunName(String gubunName) {
		this.gubunName = gubunName;
	}

	public int getParentCode() {
		return parentCode;
	}

	public void setParentCode(int parentCode) {
		this.parentCode = parentCode;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDcPrice() {
		return dcPrice;
	}

	public void setDcPrice(int dcPrice) {
		this.dcPrice = dcPrice;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public String getPayWay() {
		return payWay;
	}

	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}

	public String getCardCo() {
		return cardCo;
	}

	public void setCardCo(String cardCo) {
		this.cardCo = cardCo;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPaySection() {
		return paySection;
	}

	public void setPaySection(String paySection) {
		this.paySection = paySection;
	}
}
