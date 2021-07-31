package com.last.prj.scoreMana.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.lecture.service.LectureVO;
import com.last.prj.scoreMana.service.ScoreManaService;

@Controller
public class ScoreManaController {
@Autowired
	ScoreManaService SMdao;
	
	@RequestMapping("EnrolmentList")
	public List<LectureVO> EnrolmentList(){
		
		return SMdao.EnrolmentList();
	}
}
