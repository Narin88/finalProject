package com.last.prj.hw_student.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.hw_student.service.hw_studentService;
import com.last.prj.hw_student.service.hw_studentVO;

@Service
public class hw_studentServiceImpl implements hw_studentService{
	
	@Autowired
	hw_studentMap map;

	@Override
	public List<hw_studentVO> hw_studentSelectList() {

		return map.hw_studentSelectList();
	}

	@Override
	public hw_studentVO hw_studentSelect(hw_studentVO vo) {
	
		return map.hw_studentSelect(vo);
	}

	@Override
	public int hw_studentInsert(hw_studentVO vo) {

		return map.hw_studentInsert(vo);
	}

	@Override
	public int hw_studentUpdate(hw_studentVO vo) {
		
		return map.hw_studentUpdate(vo);
	}
	
	
}
