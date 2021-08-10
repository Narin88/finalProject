package com.last.prj.scoreMana.service.impl;

import java.util.List;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.preenrolment.service.PreEnrolmentVO;
import com.last.prj.scoreMana.service.ScoreManaVO;
import com.last.prj.students.service.StudentsVO;

public interface ScoreManaMapper {
	StudentsVO EnrolmentStudent(StudentsVO vo);
	List<LectureVO> EnrolmentList(LectureVO vo);
	//ScoreManaVO OverlapCheck(ScoreManaVO vo);
	//int AjaxEnrolmentDelete(ScoreManaVO vo);
	StudentsVO StudentSelectinfo(String sId);
	int AjaxEnrolmentInsert(ScoreManaVO vo);
	String RetakeChek(ScoreManaVO vo);
	int AjaxCreditCheck(String sId);
	List<LectureVO> scoreList(String sid);
	int deletescore(ScoreManaVO ScoreManaVO);
	List<PreEnrolmentVO> getpreenrolment(String sid);
	
	
	//모달창 처리내역
	LectureVO oneselectLecture(LectureVO vo); 
	int AjaxPreEnrolmentdelete(LectureVO vo);
}
