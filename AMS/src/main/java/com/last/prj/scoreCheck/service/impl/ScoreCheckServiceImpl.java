package com.last.prj.scoreCheck.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.scoreCheck.service.ScoreCheckService;
import com.last.prj.scoreMana.service.ScoreManaVO;

@Service
public class ScoreCheckServiceImpl implements ScoreCheckService{
	@Autowired
	ScoreCheckMapper map;

	@Override
	public int ScoreInsert(ScoreManaVO vo) {
		return map.ScoreInsert(vo);
	}

	@Override
	public List<LectureVO> ScoreCheckLectureList(LectureVO vo) {
		return map.ScoreCheckLectureList(vo);
	}

	@Override
	public int ScoreUpdate(ScoreManaVO vo) {
		return map.ScoreUpdate(vo);
	}

	@Override
	public List<ScoreManaVO> ScoreCheckLectureStudent(ScoreManaVO vo) {
		return map.ScoreCheckLectureStudent(vo);
	}

	@Override
	public LectureVO collectresult(LectureVO vo) {
		return null;
	}
}
