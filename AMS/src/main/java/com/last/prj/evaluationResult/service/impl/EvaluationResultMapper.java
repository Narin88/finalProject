package com.last.prj.evaluationResult.service.impl;

import java.util.List;

import com.last.prj.evaluationResult.service.EvaluationResultVO;

public interface EvaluationResultMapper {
	int EvaluationInsert(EvaluationResultVO vo); // 
	List<EvaluationResultVO> EvaluationResultpr(EvaluationResultVO vo); //결과값 받아오기

}
