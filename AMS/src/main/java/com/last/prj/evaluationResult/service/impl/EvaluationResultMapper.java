package com.last.prj.evaluationResult.service.impl;

import java.util.List;

import com.last.prj.evaluationResult.service.EvaluationResultVO;

public interface EvaluationResultMapper {
	int EvaluationInsert(EvaluationResultVO vo); // 
	List<EvaluationResultVO> EvaluationResultpr(EvaluationResultVO vo); //결과값 받아오기
	List<EvaluationResultVO> EvaluationQ6Result(EvaluationResultVO vo); //문제6번 답변
	List<EvaluationResultVO> EresultSt(EvaluationResultVO vo); //학생결과 받아오기
	int afterLectureApplied(EvaluationResultVO vo);	// 수강 신청 후 자동 인서트 (evalCheck 'N')
}
