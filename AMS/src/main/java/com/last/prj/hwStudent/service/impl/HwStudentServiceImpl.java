package com.last.prj.hwStudent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.hwStudent.service.HwStudentService;
import com.last.prj.hwStudent.service.HwStudentVO;

@Service
public class HwStudentServiceImpl implements HwStudentService{
	
	@Autowired
	HwStudentMap map;

	@Override
	public List<HwStudentVO> hw_studentSelectList() {

		return map.hw_studentSelectList();
	}

	@Override
	public HwStudentVO hw_studentSelect(HwStudentVO vo) {
	
		return map.hw_studentSelect(vo);
	}

	@Override
	public int hw_studentInsert(HwStudentVO vo) {

		return map.hw_studentInsert(vo);
	}

	@Override
	public int hw_studentUpdate(HwStudentVO vo) {
		
		return map.hw_studentUpdate(vo);
	}

	@Override
	public List<Map<String, Object>> hwSLectureList(HwStudentVO vo) {
		
		return map.hwSLectureList(vo);
	}

	@Override
	public List<Map<String, Object>> hwsSelectList(HwStudentVO vo) {
	
		return map.hwsSelectList(vo);
	}

	@Override
	public List<Map<String, Object>> hwSOneSelect(HwStudentVO vo) {
	
		return map.hwSOneSelect(vo);
	}

	@Override
	public int hwSSubmit(HwStudentVO vo) {
	
		return map.hwSSubmit(vo);
	}

	@Override
	public int deleteHwS(HwStudentVO vo) {

		return map.deleteHwS(vo);
	}

	@Override
	public List<Map<String, Object>> hwSAllList(HwStudentVO vo) {
	
		return map.hwSAllList(vo);
	}
	
	
}
