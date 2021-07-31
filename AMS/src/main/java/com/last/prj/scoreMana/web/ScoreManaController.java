package com.last.prj.scoreMana.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.last.prj.lecture.service.LectureVO;

@Controller
public class ScoreManaController {

	@RequestMapping("EnrolmentList")
	public List<LectureVO> EnrolmentList(){
		
		return null;
	}
}
