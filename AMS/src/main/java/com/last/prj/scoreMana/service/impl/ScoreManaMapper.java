package com.last.prj.scoreMana.service.impl;

import java.util.List;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.scoreMana.service.ScoreManaVO;
import com.last.prj.students.service.StudentsVO;

public interface ScoreManaMapper {
	List<LectureVO> EnrolmentList(int grade);
	ScoreManaVO OverlapCheck(ScoreManaVO vo);
	int AjaxEnrolmentDelete(ScoreManaVO vo);
	StudentsVO StudentSelectinfo(String sId);
	int AjaxEnrolmentInsert(ScoreManaVO vo);
	String RetakeChek(ScoreManaVO vo);

}
