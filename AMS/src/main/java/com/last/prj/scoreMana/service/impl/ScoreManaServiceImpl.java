package com.last.prj.scoreMana.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.lecture.service.impl.LectureMapper;
import com.last.prj.scoreMana.service.ScoreManaService;

@Service
public class ScoreManaServiceImpl implements ScoreManaService{
	@Autowired
	ScoreManaMapper SMmap;

	@Override
	public List<LectureVO> EnrolmentList() {
		return SMmap.EnrolmentList();
	}
	
}
