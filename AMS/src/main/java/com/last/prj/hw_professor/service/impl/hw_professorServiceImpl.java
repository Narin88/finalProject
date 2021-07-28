package com.last.prj.hw_professor.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.last.prj.hw_professor.service.hw_professorService;
import com.last.prj.hw_professor.service.hw_professorVO;

@Service
public class hw_professorServiceImpl implements hw_professorService{

	hw_professorMap map;

	@Override
	public List<hw_professorVO> hw_professorSelectList() {
		
		return map.hw_professorSelectList();
	}

	@Override
	public hw_professorVO hw_professorSelect(hw_professorVO vo) {
	
		return map.hw_professorSelect(vo);
	}

	@Override
	public int hw_professorInsert(hw_professorVO vo) {
		
		return map.hw_professorInsert(vo);
	}

	@Override
	public int hw_professorDelete(hw_professorVO vo) {
		
		return map.hw_professorDelete(vo);
	}

	@Override
	public int hw_professorUpdate(hw_professorVO vo) {
		
		return map.hw_professorUpdate(vo);
	}
	
	
}
