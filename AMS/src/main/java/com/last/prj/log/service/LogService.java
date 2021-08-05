package com.last.prj.log.service;

import java.util.List;

public interface LogService {
	// 자동 로그 인서트
	void insertLogger(LogVO vo);
	
	// 로그 리스트 불러오기
	List<LogVO> selectListLogger();
}
