package com.last.prj.lecture.service.impl;

import java.util.List;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.scoreMana.service.ScoreManaVO;

public interface LectureMapper {
	int LectureInsert(LectureVO vo);
	List<LectureVO> LectureList(String id);
	int LectureUpdate(LectureVO vo);
	int LectureDelete(LectureVO vo);
	List<ScoreManaVO> ScoreStudentList(String opennum);
	List<LectureVO> LectureListed(String id);
}
