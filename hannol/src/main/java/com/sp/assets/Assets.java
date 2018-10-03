package com.sp.assets;

import java.util.List;

public class Assets {
	private int listNum; // 리스트번호
	private int bookCode; // 예약코드
	private String bookDate; // 예약날짜
	private String useDate; // 사용예정일
	private int bookTime; // 예약시간(오후/종일)
	private int state; // 상태(예약/반납완료/대여중/기간만료)
	private String name; // 이름 (예약자)
	private String tel; // 전화번호(예약자)
	private String tel1;
	private String tel2;
	private String tel3;

	private long usersCode; // 유저코드
	private int assetsCode; // 자산코드
	private int facilityCode; // 시설코드
	private String facName; // 시설이름

	private List<Integer> bookCodes;

	public List<Integer> getBookCodes() {
		return bookCodes;
	}

	public void setBookCodes(List<Integer> bookCodes) {
		this.bookCodes = bookCodes;
	}

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getBookCode() {
		return bookCode;
	}

	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

	public int getBookTime() {
		return bookTime;
	}

	public void setBookTime(int bookTime) {
		this.bookTime = bookTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public long getUsersCode() {
		return usersCode;
	}

	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}

	public int getAssetsCode() {
		return assetsCode;
	}

	public void setAssetsCode(int assetsCode) {
		this.assetsCode = assetsCode;
	}

	public int getFacilityCode() {
		return facilityCode;
	}

	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
	}

	public String getFacName() {
		return facName;
	}

	public void setFacName(String facName) {
		this.facName = facName;
	}
}
