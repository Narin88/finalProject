package com.last.prj.scoreCheck.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.scoreCheck.service.ScoreCheckService;
import com.last.prj.scoreMana.service.ScoreManaVO;
import com.last.prj.stuyplan.service.StudyplanJoinVO;
@Controller
public class ScoreCheckController {
@Autowired
ScoreCheckService dao;

//과목 리스트 출력
@RequestMapping("ScoreCheckLectureList")
public String ScoreCheckLectureList(Model model, HttpSession session,LectureVO vo) {
	vo.setPId((String)session.getAttribute("id"));
	
	model.addAttribute("lectures",dao.ScoreCheckLectureList(vo));
	System.out.println("============================="+vo);
	return "scoreCheck/scoreCheckLectureList.tiles";
		}

// 컬럼 정보 하나씩 가져오기
@RequestMapping("collectresult")
public String selectresult(Model model, LectureVO vo) {
	model.addAttribute("cc", dao.collectresult(vo));
	
	return null;
}

//과목별 학생 리스트 출력
@RequestMapping("ScoreCheckLectureStudent")
public String ScoreCheckLectureStudent(Model model, HttpSession session, ScoreManaVO vo) {
	vo.setPid((String)session.getAttribute("id"));
	model.addAttribute("lectures",dao.ScoreCheckLectureStudent(vo));
	System.out.println(vo+"============student===========");
	return "scoreCheck/ScoreCheckLectureStudent.tiles";
}

@RequestMapping("ScoreScoreInsert")
public String ScoreInsert(Model model, HttpSession session, ScoreManaVO vo) {
	vo.setPid((String)session.getAttribute("id"));
	model.addAttribute("lectures",dao.ScoreInsert(vo));
	System.out.println(vo+"============student===========");
	return "scoreCheck/ScoreCheckLectureStudent.tiles";
}

}
