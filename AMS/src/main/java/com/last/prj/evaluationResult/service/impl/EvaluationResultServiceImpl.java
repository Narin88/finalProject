package com.last.prj.evaluationResult.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.evaluationResult.service.EvaluationResultService;
import com.last.prj.evaluationResult.service.EvaluationResultVO;

@Service
public class EvaluationResultServiceImpl implements EvaluationResultService {

	@Autowired
	EvaluationResultMapper map;

	@Override
	public int EvaluationInsert(EvaluationResultVO vo) {
		return map.EvaluationInsert(vo);
	}

	@Override
	public List<EvaluationResultVO> EvaluationResult(EvaluationResultVO vo) {
		
		return map.EvaluationResultpr(vo);
	}

	@Override
	public List<EvaluationResultVO> EvaluationQ6Result(EvaluationResultVO vo) {
		return map.EvaluationQ6Result(vo);
	}

	@Override
	public List<EvaluationResultVO> EresultSt(EvaluationResultVO vo) {
		return map.EresultSt(vo);
	}

	@Override
	public int afterLectureApplied(EvaluationResultVO vo) {
		// 수강 신청 후 자동 인서트 (evalCheck 'N')
		return map.afterLectureApplied(vo);
	}



}
