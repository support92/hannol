package com.sp.member;

public interface MemberService {
	public Member loginMember(String userId);
	
	public int userSeq() throws Exception;
	public int insertMember(Member dto) throws Exception; // Member에 usersCode 포함
	
}
