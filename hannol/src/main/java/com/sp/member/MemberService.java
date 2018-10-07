package com.sp.member;

public interface MemberService {
	public Member loginMember(String userId);
	public Member readMember(String userId);
	public int updateLastLogin(long usersCode) throws Exception;
	
	// 패스워드 시험용
	public int updatePwd(Member dto) throws Exception;
	
	public long userSeq() throws Exception;
	public int insertMember(Member dto) throws Exception; // Member에 usersCode 포함
	
	// 회원가입
	public Member readMemberByEmail(String email);
	
}
