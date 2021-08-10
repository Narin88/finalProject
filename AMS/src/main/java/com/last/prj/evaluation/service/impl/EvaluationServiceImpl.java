package com.last.prj.evaluation.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.evaluation.service.EvaluationService;
import com.last.prj.evaluation.service.EvaluationVO;

@Service
public class EvaluationServiceImpl implements EvaluationService {


	@Autowired
	EvaluationMapper map;

	/*
	 * @Override public List<EvaluationVO> question(EvaluationVO vo) { return
	 * map.question(vo); }
	 */
	@Override
	public List<EvaluationVO> Evaluation(EvaluationVO vo) {
		return map.Evaluation(vo);
	}

	@Override
	public EvaluationVO selectone(EvaluationVO vo) {
		return map.selectone(vo);
	}


	
}
