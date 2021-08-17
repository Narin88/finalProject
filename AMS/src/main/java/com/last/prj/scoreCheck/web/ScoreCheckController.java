package com.last.prj.scoreCheck.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.scoreCheck.service.ScoreCheckService;
import com.last.prj.scoreMana.service.ScoreManaVO;
@Controller
public class ScoreCheckController {
@Autowired
ScoreCheckService dao;

//과목 리스트 출력
@RequestMapping("ScoreCheckLectureList")
public String ScoreCheckLectureList(Model model, HttpSession session,LectureVO vo) {
	vo.setPid((String)session.getAttribute("id"));
	
	model.addAttribute("lectures",dao.ScoreCheckLectureList(vo));
	List<LectureVO> vo2 = dao.ScoreCheckLectureList(vo);
		
//	System.out.println("============================="+vo2);
	return "scoreCheck/scoreCheckLectureList.tiles";
		}

// 컬럼 정보 하나씩 가져오기
@RequestMapping("collectresult")
public String selectresult(Model model, LectureVO vo,HttpSession session) {
	vo.setPid((String)session.getAttribute("id"));
	model.addAttribute("cc", dao.collectresult(vo));
	
	return "scoreCheck/scoreCheckLectureList.tiles";
}

//과제 점수 가져오기
@RequestMapping("AvgChcek")
public String AvgChcek(Model model, ScoreManaVO vo, HttpSession session) {
	model.addAttribute("avg", dao.AvgChcek(vo));
	return null;
}



//과목별 학생 리스트 출력
@RequestMapping("ScoreCheckLectureStudent")
public String ScoreCheckLectureStudent(Model model, HttpSession session, ScoreManaVO vo, @RequestParam("opennum") int open_num) {
	vo.setPid((String)session.getAttribute("id"));
	System.out.println(vo);
	model.addAttribute("lectures",dao.ScoreCheckLectureStudent(vo));
	return "scoreCheck/ScoreAjax.tiles";
}


@RequestMapping(value = "ScoreInsert", method = RequestMethod.POST)
public String ScoreInsert(ScoreManaVO vo, RedirectAttributes red) {
	System.out.println(vo);
	int result = dao.ScoreInsert(vo);
	red.addAttribute("opennum", vo.getOpennum());
	System.out.println("결과====================" +result);
	return "redirect:ScoreCheckLectureStudent";
}


// 아직 구현 못함.
/*
 * @ResponseBody
 * 
 * @RequestMapping(value="ScoreInsert", method = RequestMethod.PUT) public int
 * ScoreInsert(@RequestBody ScoreManaVO vo, HttpSession session) {
 * vo.setPid((String)session.getAttribute("id")); System.out.println(vo);
 * dao.ScoreInsert(vo); return 0; }
 */

}
