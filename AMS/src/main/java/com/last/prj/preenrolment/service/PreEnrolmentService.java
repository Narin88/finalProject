package com.last.prj.preenrolment.service;

import java.util.List;

import com.last.prj.students.service.StudentsVO;

public interface PreEnrolmentService {
	StudentsVO PreStudentSelect(String sId);
	List<PreEnrolmentVO> preLectureList(StudentsVO vo);
	List<PreEnrolmentVO> preDepartments();
	List<PreEnrolmentVO> getMajorList(PreEnrolmentVO vo);
	List<PreEnrolmentVO> enrolmentpackage(String sid);
 }
