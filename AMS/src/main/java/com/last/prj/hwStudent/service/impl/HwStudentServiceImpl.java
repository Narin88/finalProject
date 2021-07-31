package com.last.prj.hwStudent.service.impl;

import java.util.List;

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
	
	
}
