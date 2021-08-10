package com.last.prj.evaluation.service;

import java.util.List;


public interface EvaluationService {
	/*
	 * List<EvaluationVO> question(EvaluationVO vo);
	 */

	public List<EvaluationVO>Evaluation(EvaluationVO vo);
	EvaluationVO selectone(EvaluationVO vo);
}
