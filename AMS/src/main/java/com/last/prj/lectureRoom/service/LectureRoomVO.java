package com.last.prj.lectureRoom.service;

import lombok.Data;

@Data
public class LectureRoomVO {
	private String lrcode; //강의실 코드
	private String location; //강의실 건물
	private int seatnum; //강의실 좌석수
	private String lrname; //강의실 이름
}
