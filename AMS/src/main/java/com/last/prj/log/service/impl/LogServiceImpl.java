package com.last.prj.log.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.log.service.LogService;
import com.last.prj.log.service.LogVO;

@Service
public class LogServiceImpl implements LogService {
	@Autowired
	LogMapper dao;

	@Override
	public int insertLogger(LogVO vo) {
		return dao.insertLogger(vo);
	}
	
}
