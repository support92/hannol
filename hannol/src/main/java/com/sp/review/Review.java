package com.sp.review;

public class Review {
	private int reviewCode;
	private int usersCode;
	private String content;
	private String reviewDate;	// 방문일자
	
	
	public int getReviewCode() {
		return reviewCode;
	}
	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}
	public int getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(int usersCode) {
		this.usersCode = usersCode;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
}
