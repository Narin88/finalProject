package com.last.prj.lecture.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.lecture.service.LectureService;
import com.last.prj.lecture.service.LectureVO;

@Service
public class LectureServiceImpl implements LectureService{
	@Autowired
	LectureMapper Ldao;
	
	@Override
	public int LectureInsert(LectureVO vo) {
		return Ldao.LectureInsert(vo);
	}

}
