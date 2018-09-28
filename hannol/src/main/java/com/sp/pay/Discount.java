package com.sp.pay;

import java.util.List;

public class Discount {
	List<String> dcWay;
	List<Integer> dcPay;
	int payCode;

	public List<String> getDcWay() {
		return dcWay;
	}

	public void setDcWay(List<String> dcWay) {
		this.dcWay = dcWay;
	}

	public List<Integer> getDcPay() {
		return dcPay;
	}

	public void setDcPay(List<Integer> dcPay) {
		this.dcPay = dcPay;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

}
