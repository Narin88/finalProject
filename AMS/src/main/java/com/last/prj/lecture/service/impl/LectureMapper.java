package com.last.prj.lecture.service.impl;

import java.util.List;

import com.last.prj.lecture.service.LectureVO;

public interface LectureMapper {
	int LectureInsert(LectureVO vo);
	List<LectureVO> LectureList(String id);
	int LectureUpdate(LectureVO vo);
	int LectureDelete(LectureVO vo);
}
