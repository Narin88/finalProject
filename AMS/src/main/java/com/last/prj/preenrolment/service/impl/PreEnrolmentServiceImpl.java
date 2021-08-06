package com.last.prj.preenrolment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.preenrolment.service.PreEnrolmentService;
import com.last.prj.preenrolment.service.PreEnrolmentVO;
import com.last.prj.students.service.StudentsVO;

@Service
public class PreEnrolmentServiceImpl implements PreEnrolmentService{
	@Autowired
	PreEnrolmentMapper Pmap;
	
	@Override
	public StudentsVO PreStudentSelect(String sId) {
		return Pmap.PreStudentSelect(sId);
	}

	@Override
	public List<PreEnrolmentVO> preLectureList(StudentsVO vo) {
		return Pmap.preLectureList(vo);
	}
	

}
