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
	public List<EvaluationResultVO> EvaluationQ7Result(EvaluationResultVO vo) {
		return map.EvaluationQ7Result(vo);
	}

	@Override
	public List<EvaluationResultVO> EresultSt(EvaluationResultVO vo) {
		return map.EresultSt(vo);
	}



}
