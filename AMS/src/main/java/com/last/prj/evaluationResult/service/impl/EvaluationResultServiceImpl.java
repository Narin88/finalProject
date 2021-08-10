package com.last.prj.evaluationResult.service.impl;

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
		return map.EvaluationResult(vo);
	}


}
