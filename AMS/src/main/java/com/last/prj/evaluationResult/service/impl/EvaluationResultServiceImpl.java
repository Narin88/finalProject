package com.last.prj.evaluationResult.service.impl;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.last.prj.evaluationResult.service.EvaluationResultService;
import com.last.prj.evaluationResult.service.EvaluationResultVO;

@Service
public class EvaluationResultServiceImpl implements EvaluationResultService {

	@Mapper
	EvaluationResultMapper map;

	@Override
	public int EvaluationInsert(EvaluationResultVO vo) {
		return map.EvaluationResult(vo);
	}

}
