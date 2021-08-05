package com.last.prj.log.service.impl;

import java.util.List;

import com.last.prj.log.service.LogVO;

public interface LogMapper {
	void insertLogger(LogVO vo);
	
	List<LogVO> selectListLogger();
}
