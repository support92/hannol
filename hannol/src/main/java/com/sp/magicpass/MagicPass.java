package com.sp.magicpass;

public class MagicPass {
	private long facilityCode;
	private String name;
	private int state; // 0: 사용불가, 1: 사용중
	private String saveMainFileName;
	private long gubunCode; // 1: 놀이기구
	private long themeCode; // 1: 프린세스, 2: 토이스토리, 3:미니언즈, 5: 라이온킹, 6: 니모
	private int congestion; // 0: 혼잡, 1: 보통, 2: 원활
	private long mpCode;
	private int mgTime;
	private String mgDate;
	private int ticketCode;
	private long usersCode;

	public long getFacilityCode() {
		return facilityCode;
	}

	public void setFacilityCode(long facilityCode) {
		this.facilityCode = facilityCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getSaveMainFileName() {
		return saveMainFileName;
	}

	public void setSaveMainFileName(String saveMainFileName) {
		this.saveMainFileName = saveMainFileName;
	}

	public long getGubunCode() {
		return gubunCode;
	}

	public void setGubunCode(long gubunCode) {
		this.gubunCode = gubunCode;
	}

	public long getThemeCode() {
		return themeCode;
	}

	public void setThemeCode(long themeCode) {
		this.themeCode = themeCode;
	}

	public int getCongestion() {
		return congestion;
	}

	public void setCongestion(int congestion) {
		this.congestion = congestion;
	}

	public long getMpCode() {
		return mpCode;
	}

	public void setMpCode(long mpCode) {
		this.mpCode = mpCode;
	}

	public int getMgTime() {
		return mgTime;
	}

	public void setMgTime(int mgTime) {
		this.mgTime = mgTime;
	}

	public String getMgDate() {
		return mgDate;
	}

	public void setMgDate(String mgDate) {
		this.mgDate = mgDate;
	}

	public int getTicketCode() {
		return ticketCode;
	}

	public void setTicketCode(int ticketCode) {
		this.ticketCode = ticketCode;
	}

	public long getUsersCode() {
		return usersCode;
	}

	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}

}
