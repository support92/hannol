package com.sp.question;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	public int insertQuestion(Question dto) throws Exception;
	public int dataCount(int usersCode) throws Exception;
	public List<Question> list(Map<String, Object> map) throws Exception; 
	public Question readQuestion(int num) throws Exception;

}
