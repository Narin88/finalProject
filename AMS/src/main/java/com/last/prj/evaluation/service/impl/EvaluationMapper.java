package com.last.prj.evaluation.service.impl;

import java.util.List;

import com.last.prj.evaluation.service.EvaluationVO;

public interface EvaluationMapper {
	/*
	 * List<EvaluationVO> question(EvaluationVO vo);
	 */

  
	public List< EvaluationVO>Evaluation( EvaluationVO vo);
	EvaluationVO selectone(EvaluationVO vo);
}
