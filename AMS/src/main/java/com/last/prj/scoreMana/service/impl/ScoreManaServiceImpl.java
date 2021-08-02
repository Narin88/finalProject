package com.last.prj.scoreMana.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.lecture.service.impl.LectureMapper;
import com.last.prj.scoreMana.service.ScoreManaService;
import com.last.prj.scoreMana.service.ScoreManaVO;
import com.last.prj.students.service.StudentsVO;

@Service
public class ScoreManaServiceImpl implements ScoreManaService{
	@Autowired
	ScoreManaMapper SMmap;

	@Override
	public List<LectureVO> EnrolmentList(int grade) {
		return SMmap.EnrolmentList(grade);
	}

	@Override
	public ScoreManaVO OverlapCheck(ScoreManaVO vo) {
		return SMmap.OverlapCheck(vo);
	}

	@Override
	public int AjaxEnrolmentDelete(ScoreManaVO vo) {
		return SMmap.AjaxEnrolmentDelete(vo);
	}

	@Override
	public StudentsVO StudentSelectinfo(String sId) {
		return SMmap.StudentSelectinfo(sId);
	}

	@Override
	public int AjaxEnrolmentInsert(ScoreManaVO vo) {
		return SMmap.AjaxEnrolmentInsert(vo);
	}
	
}
