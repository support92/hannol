package com.sp.member;

public class Member {
	private long usersCode;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private int enabled;

	private String help;
	private int isAlarm;
	private String email;
	private String birth;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String joinDate;
	private String joinPath;
	private int gradeCode;
	
	private String authority;
	
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public long getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(long usersCode) {
		this.usersCode = usersCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getHelp() {
		return help;
	}
	public void setHelp(String help) {
		this.help = help;
	}
	public int getIsAlarm() {
		return isAlarm;
	}
	public void setIsAlarm(int isAlarm) {
		this.isAlarm = isAlarm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getJoinPath() {
		return joinPath;
	}
	public void setJoinPath(String joinPath) {
		this.joinPath = joinPath;
	}
	public int getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(int gradeCode) {
		this.gradeCode = gradeCode;
	}
}
