package com.last.prj.hwProfessor.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.hwProfessor.service.HwProfessorService;
import com.last.prj.hwProfessor.service.HwProfessorVO;

@Service
public class HwProfessorServiceImpl implements HwProfessorService{

	@Autowired
	HwProfessorMap map;

	@Override
	public List<Map<String, Object>> hw_professorSelectList(HwProfessorVO vo) {
		
		return map.hw_professorSelectList(vo);
	}

	@Override
	public HwProfessorVO hw_professorSelect(HwProfessorVO vo) {
	
		return map.hw_professorSelect(vo);
	}

	

	@Override
	public int hw_professorDelete(HwProfessorVO vo) {
		
		return map.hw_professorDelete(vo);
	}

	@Override
	public int hw_professorUpdate(HwProfessorVO vo) {
		
		return map.hw_professorUpdate(vo);
	}

	@Override
	public List<Map<String, Object>> hw_submitList(HwProfessorVO vo) {
		
		return map.hw_submitList(vo);
	}


	@Override
	public List<Map<String, Object>> hw_ySelect(HwProfessorVO vo) {
	
		return map.hw_ySelect(vo);
	}

	@Override
	public List<Map<String, Object>> hwLname(HwProfessorVO vo) {
		
		return map.hwLname(vo);
	}

	@Override
	public List<Map<String, Object>> hwSearchList(HwProfessorVO vo) {
		
		return map.hwSearchList(vo);
	}

	
	
	@Override
	public List<Map<String, Object>> hwPfInsertSelect(HwProfessorVO vo) {
		return map.hwPfInsertSelect(vo);
	}

	@Override
	public int hwPfInsert(HwProfessorVO vo) {
	
		return map.hwPfInsert(vo);
	}

	@Override
	public int hwSubmitDel(HwProfessorVO vo) {
		for(int i=0;i<vo.getDeletedRows().size();i++) {
			map.hwSubmitDel(vo.getDeletedRows().get(i));
		}
		
		
		return 0;
	}

	
	
	@Override
	public int hwScoreIn(HwProfessorVO vo) {
		int count = 0;
		for(int i=0;i<vo.getUpdatedRows().size();i++) {
			map.hwScoreIn(vo.getUpdatedRows().get(i));
			count++;
		}
		
		return count;
	}
	@Override
	public int submitDelAll(HwProfessorVO vo) {
		
		return map.submitDelAll(vo);
	}

	@Override
	public int hwPfDelete(HwProfessorVO vo) {
		
		return map.hwPfDelete(vo);
	}

	@Override
	public int hwUpdate(HwProfessorVO vo) {
	
		return map.hwUpdate(vo);
	}



	@Override
	public int hwAvgUpdate(HwProfessorVO vo) {
		int count =0;
		for(int i=0;i<vo.getUpdatedRows().size();i++) {
			map.hwAvgUpdate(vo.getUpdatedRows().get(i));
			count++;
		}
		
		return count;
	}

	
	
}
