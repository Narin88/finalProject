package com.last.prj.preenrolment.service.impl;

import java.util.List;

import com.last.prj.preenrolment.service.PreEnrolmentVO;
import com.last.prj.students.service.StudentsVO;

public interface PreEnrolmentMapper {
	StudentsVO PreStudentSelect(String sId);
	List<PreEnrolmentVO> preLectureList(StudentsVO vo);
	List<PreEnrolmentVO> preDepartments();
	List<PreEnrolmentVO> getMajorList(PreEnrolmentVO vo);
	List<PreEnrolmentVO> enrolmentpackage(String sid);
	int preEnrolmentlimitCheck(String sid);
	int preEnrolmentinsert(PreEnrolmentVO preEnrolmentVO);
	int preEnrolmentdelete(PreEnrolmentVO preEnrolmentVO);
}
