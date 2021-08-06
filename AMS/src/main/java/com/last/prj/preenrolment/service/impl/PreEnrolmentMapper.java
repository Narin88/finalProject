package com.last.prj.preenrolment.service.impl;

import java.util.List;

import com.last.prj.preenrolment.service.PreEnrolmentVO;
import com.last.prj.students.service.StudentsVO;

public interface PreEnrolmentMapper {
	StudentsVO PreStudentSelect(String sId);
	List<PreEnrolmentVO> preLectureList(StudentsVO vo);
}
