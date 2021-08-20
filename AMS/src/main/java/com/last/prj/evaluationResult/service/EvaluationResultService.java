package com.last.prj.evaluationResult.service;

import java.util.List;


public interface EvaluationResultService {

	int EvaluationInsert(EvaluationResultVO vo); // 학생 참여
	
	List<EvaluationResultVO> EvaluationResult(EvaluationResultVO vo); //결과값 받아오기
	List<EvaluationResultVO> EvaluationQ6Result(EvaluationResultVO vo); //문제7번 답변
	
	List<EvaluationResultVO> EresultSt(EvaluationResultVO vo); //학생결과 받아오기
	int afterLectureApplied(EvaluationResultVO vo);	// 수강 신청 후 자동 인서트 (evalCheck 'N')
}
