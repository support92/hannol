package com.sp.coupon;

public class Coupon {
	private int listNum;
	private int giftCode;
	private String endDate;
	private String useDate;
	private String goodsName;
	private String gubunName;
	private int payCode;
	private int goodsCode;
	private int quantity;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getGiftCode() {
		return giftCode;
	}

	public void setGiftCode(int giftCode) {
		this.giftCode = giftCode;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGubunName() {
		return gubunName;
	}

	public void setGubunName(String gubunName) {
		this.gubunName = gubunName;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public int getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}