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

	@Override
	public List<PreEnrolmentVO> preDepartments() {
		return Pmap.preDepartments();
	}

	@Override
	public List<PreEnrolmentVO> getMajorList(PreEnrolmentVO vo) {
		return Pmap.getMajorList(vo);
	}

	@Override
	public List<PreEnrolmentVO> enrolmentpackage(String sid) {
		return Pmap.enrolmentpackage(sid);
	}

	@Override
	public int preEnrolmentlimitCheck(String sid) {
		return Pmap.preEnrolmentlimitCheck(sid);
	}

	@Override
	public int preEnrolmentinsert(List<PreEnrolmentVO> vo) {
		int count = 0;
		System.out.println("================2번"+vo);
		for(int i=0; i<vo.size();i++) {
			Pmap.preEnrolmentinsert(vo.get(i));
			count++;
		}
		
		return count;
	}

	@Override
	public int preEnrolmentdelete(List<PreEnrolmentVO> vo) {
		int count = 0;
		for(int i=0; i<vo.size();i++) {
			Pmap.preEnrolmentdelete(vo.get(i));
			count++;
		}
		return count;
	}
	

}
