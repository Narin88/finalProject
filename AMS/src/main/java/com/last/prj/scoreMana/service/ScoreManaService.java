package com.last.prj.scoreMana.service;

import java.util.List;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.preenrolment.service.PreEnrolmentVO;
import com.last.prj.students.service.StudentsVO;

public interface ScoreManaService {
	StudentsVO EnrolmentStudent(StudentsVO vo); 
	List<LectureVO> EnrolmentList(LectureVO vo);
	//ScoreManaVO OverlapCheck(ScoreManaVO vo);
	//int AjaxEnrolmentDelete(ScoreManaVO vo);
	StudentsVO StudentSelectinfo(String sId);
	int AjaxEnrolmentInsert(ScoreManaVO vo);
	String RetakeChek(ScoreManaVO vo);
	int AjaxCreditCheck(String sId);
	List<LectureVO> scoreList(String sid);
	int deletescore(List<ScoreManaVO> vo);
	List<PreEnrolmentVO> getpreenrolment(String sid);
	
	//modal창 내용
	LectureVO oneselectLecture(LectureVO vo); 
	int AjaxPreEnrolmentdelete(LectureVO vo);
}
