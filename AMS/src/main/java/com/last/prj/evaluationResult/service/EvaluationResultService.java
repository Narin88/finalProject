package com.last.prj.evaluationResult.service;

import java.util.List;


public interface EvaluationResultService {

	int EvaluationInsert(EvaluationResultVO vo); // 학생 참여
	
	List<EvaluationResultVO> EvaluationResult(EvaluationResultVO vo); //결과값 받아오기
}