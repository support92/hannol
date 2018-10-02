package com.sp.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("question.questionService")
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	CommonDAO dao;
	
	@Override
	public int insertQuestion(Question dto) throws Exception {
		int result= 0;
		try {
			result = dao.insertData("question.insertQuestion", dto);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

}
