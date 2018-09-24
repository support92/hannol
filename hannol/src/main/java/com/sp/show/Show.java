package com.sp.show;

import java.util.List;

public class Show {
	private int showCode;
	private int facilityCode;
	private int gubunCode;
	private int showInfoCode;

	private String showName;
	private String memo;
	private String saveFilename;
	private String name;	// facility
	private List<String> showTime;
	
	private String startDate;
	private String endDate;
	private String runningTime;
	private String saveLocFilename;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}
	public String getSaveLocFilename() {
		return saveLocFilename;
	}
	public void setSaveLocFilename(String saveLocFilename) {
		this.saveLocFilename = saveLocFilename;
	}
	public int getShowCode() {
		return showCode;
	}
	public void setShowCode(int showCode) {
		this.showCode = showCode;
	}
	public int getFacilityCode() {
		return facilityCode;
	}
	public void setFacilityCode(int facilityCode) {
		this.facilityCode = facilityCode;
	}
	public int getGubunCode() {
		return gubunCode;
	}
	public void setGubunCode(int gubunCode) {
		this.gubunCode = gubunCode;
	}
	public int getShowInfoCode() {
		return showInfoCode;
	}
	public void setShowInfoCode(int showInfoCode) {
		this.showInfoCode = showInfoCode;
	}
	public String getShowName() {
		return showName;
	}
	public void setShowName(String showName) {
		this.showName = showName;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<String> getShowTime() {
		return showTime;
	}
	public void setShowTime(List<String> showTime) {
		this.showTime = showTime;
	} 
}
