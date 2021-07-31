package com.last.prj.lectureRoom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.prj.lectureRoom.service.LectureRoomService;
import com.last.prj.lectureRoom.service.LectureRoomVO;

@Service
public class LectureRoomServiceImpl implements LectureRoomService{

	@Autowired
	LectureRoomMapper LRmap;
	
	@Override
	public List<LectureRoomVO> getLectureRoom() {
		return LRmap.getLectureRoom();
	}


}
