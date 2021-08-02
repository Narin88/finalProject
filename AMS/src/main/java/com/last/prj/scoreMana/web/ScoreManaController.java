package com.last.prj.scoreMana.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.last.prj.scoreMana.service.ScoreManaService;

@Controller
public class ScoreManaController {
@Autowired
	ScoreManaService SMdao;
	
	@RequestMapping("ScoreManaPage")
	public String ScoreManaPage() {
		return "scoreMana/Enrolment.tiles";
	}

	@RequestMapping("EnrolmentList")
	@ResponseBody
	public Map<String, Object> EnrolmentList(){
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", SMdao.EnrolmentList());
		data.put("data", datas);
		return data;
	}
}
