package com.last.prj.scoreMana.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.lecture.service.impl.LectureMapper;
import com.last.prj.preenrolment.service.PreEnrolmentVO;
import com.last.prj.scoreMana.service.ScoreManaService;
import com.last.prj.scoreMana.service.ScoreManaVO;
import com.last.prj.students.service.StudentsVO;

@Service
public class ScoreManaServiceImpl implements ScoreManaService{
	@Autowired
	ScoreManaMapper SMmap;

	@Override
	public List<LectureVO> EnrolmentList(LectureVO vo) {
		return SMmap.EnrolmentList(vo);
	}

	/*
	 * @Override public ScoreManaVO OverlapCheck(ScoreManaVO vo) { return
	 * SMmap.OverlapCheck(vo); }
	 * 
	 * @Override public int AjaxEnrolmentDelete(ScoreManaVO vo) { return
	 * SMmap.AjaxEnrolmentDelete(vo); }
	 */

	@Override
	public StudentsVO StudentSelectinfo(String sId) {
		return SMmap.StudentSelectinfo(sId);
	}

	@Override
	public int AjaxEnrolmentInsert(ScoreManaVO vo) {
		return SMmap.AjaxEnrolmentInsert(vo);
	}

	@Override
	public String RetakeChek(ScoreManaVO vo) {
		return SMmap.RetakeChek(vo);
	}

	@Override
	public int AjaxCreditCheck(String sId) {
		return SMmap.AjaxCreditCheck(sId);
	}

	@Override
	public StudentsVO EnrolmentStudent(StudentsVO vo) {
		return SMmap.EnrolmentStudent(vo);
	}

	@Override
	public List<LectureVO> scoreList(String sid) {
		return SMmap.scoreList(sid);
	}

	@Override
	public int deletescore(List<ScoreManaVO> vo) {
		int count = 0;
		for(int i=0; i<vo.size();i++) {
			SMmap.deletescore(vo.get(i));
			count++;
		}
		return count;
	}

	@Override
	public List<PreEnrolmentVO> getpreenrolment(String sid) {
		return SMmap.getpreenrolment(sid);
	}

	@Override
	public LectureVO oneselectLecture(LectureVO vo) {
		return SMmap.oneselectLecture(vo);
	}

	@Override
	public int AjaxPreEnrolmentdelete(LectureVO vo) {
		return SMmap.AjaxPreEnrolmentdelete(vo);
	}
	
}
