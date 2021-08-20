package com.last.prj.scoreCheck.service;

import java.util.List;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.scoreMana.service.ScoreManaVO;

public interface ScoreCheckService {

	int ScoreInsert(ScoreManaVO vo); //성적 등록
	List<LectureVO> ScoreCheckLectureList(LectureVO vo); // 리스트 출력
	int ScoreUpdate(ScoreManaVO vo);//성적 수정

	List<ScoreManaVO>ScoreCheckLectureStudent(ScoreManaVO vo);//수강 학생 리스트
	public LectureVO collectresult(LectureVO vo);// 값 하나 받아오기
	
	public ScoreManaVO AvgChcek(ScoreManaVO vo); // 과제 점수 
	
	int finalScoreUpdate(ScoreManaVO vo); // 기말고사 점수 등록
}
