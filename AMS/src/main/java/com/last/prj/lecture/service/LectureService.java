package com.last.prj.lecture.service;

import java.util.List;

public interface LectureService {
	int LectureInsert(LectureVO vo);
	List<LectureVO> LectureList(String id);
	int LectureUpdate(LectureVO vo);
	int LectureDelete(LectureVO vo);
}
